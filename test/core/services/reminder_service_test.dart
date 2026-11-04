import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:gotit/core/services/reminder_service.dart';
import 'package:gotit/core/storage/app_database.dart';
import 'package:gotit/core/storage/prefs_service.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  late AppDatabase database;
  late PrefsService prefs;
  late ReminderServiceImpl reminderService;

  setUp(() async {
    SharedPreferences.setMockInitialValues({});
    final sharedPrefs = await SharedPreferences.getInstance();
    prefs = PrefsService(sharedPrefs);
    database = AppDatabase.forTesting(NativeDatabase.memory());

    reminderService = ReminderServiceImpl.forTesting(
      database,
      prefs,
      notificationsPlugin: _FakeNotificationsPlugin(),
    );
  });

  tearDown(() async {
    await database.close();
  });

  group('Deterministic Notification IDs', () {
    test('generates consistent IDs for the same task', () {
      final id1 = ReminderServiceImpl.getDueNotificationId('task-123');
      final id2 = ReminderServiceImpl.getDueNotificationId('task-123');
      expect(id1, equals(id2));
      expect(id1, greaterThanOrEqualTo(0));
    });

    test('generates distinct IDs for due, start-working, and snooze', () {
      const taskId = 'task-456';
      final dueId = ReminderServiceImpl.getDueNotificationId(taskId);
      final startWorkingId =
          ReminderServiceImpl.getStartWorkingNotificationId(taskId);
      final snoozeId = ReminderServiceImpl.getSnoozeNotificationId(taskId);

      expect(dueId, isNot(equals(startWorkingId)));
      expect(dueId, isNot(equals(snoozeId)));
      expect(startWorkingId, isNot(equals(snoozeId)));
    });
  });

  group('Reminder Scheduling Logic', () {
    test('schedules due reminder in database when future specific time',
        () async {
      final now = DateTime.now();
      final futureDue = now.add(const Duration(hours: 2));

      await database.into(database.tasksTable).insert(
            TasksTableCompanion.insert(
              id: 'task-sync-1',
              title: 'Buy groceries',
              dueDate: Value(futureDue),
              isReminderEnabled: const Value(true),
            ),
          );

      await reminderService.syncReminderSchedule(
        TaskReminderSchedule(
          taskId: 'task-sync-1',
          title: 'Buy groceries',
          dueDate: futureDue,
          isReminderEnabled: true,
          reminderLeadMinutes: 15,
        ),
      );

      final reminders = await (database.select(database.remindersTable)
            ..where((r) => r.taskId.equals('task-sync-1')))
          .get();

      expect(reminders.length, equals(1));
      expect(reminders.first.type, equals('due'));
      expect(reminders.first.leadTimeMinutes, equals(15));
      // Trigger time is due minus 15 minutes
      expect(
        reminders.first.scheduledTime.difference(futureDue).inMinutes,
        equals(-15),
      );
    });

    test('schedules all-day reminder at configured alert time', () async {
      final now = DateTime.now();
      final tomorrow = DateTime(now.year, now.month, now.day + 1);

      await database.into(database.tasksTable).insert(
            TasksTableCompanion.insert(
              id: 'task-sync-2',
              title: 'Submit tax return',
              dueDate: Value(tomorrow),
              isAllDay: const Value(true),
              isReminderEnabled: const Value(true),
            ),
          );

      await reminderService.syncReminderSchedule(
        TaskReminderSchedule(
          taskId: 'task-sync-2',
          title: 'Submit tax return',
          dueDate: tomorrow,
          isAllDay: true,
          isReminderEnabled: true,
          allDayReminderTime: '08:30',
        ),
      );

      final reminders = await (database.select(database.remindersTable)
            ..where((r) => r.taskId.equals('task-sync-2')))
          .get();

      expect(reminders.length, equals(1));
      expect(reminders.first.scheduledTime.hour, equals(8));
      expect(reminders.first.scheduledTime.minute, equals(30));
    });

    test('cleans up reminders when reminder is disabled or cancelled',
        () async {
      final now = DateTime.now();
      final futureDue = now.add(const Duration(hours: 3));

      await database.into(database.tasksTable).insert(
            TasksTableCompanion.insert(
              id: 'task-sync-3',
              title: 'Clean garage',
              dueDate: Value(futureDue),
              isReminderEnabled: const Value(true),
            ),
          );

      // Schedule first
      await reminderService.syncReminderSchedule(
        TaskReminderSchedule(
          taskId: 'task-sync-3',
          title: 'Clean garage',
          dueDate: futureDue,
          isReminderEnabled: true,
        ),
      );

      var reminders = await (database.select(database.remindersTable)
            ..where((r) => r.taskId.equals('task-sync-3')))
          .get();
      expect(reminders.isNotEmpty, isTrue);

      // Now cancel
      await reminderService.cancelForTask('task-sync-3');

      reminders = await (database.select(database.remindersTable)
            ..where((r) => r.taskId.equals('task-sync-3')))
          .get();
      expect(reminders.isEmpty, isTrue);
    });
  });
}

class _FakeNotificationsPlugin extends Fake
    implements FlutterLocalNotificationsPlugin {
  @override
  Future<void> zonedSchedule(
    int id,
    String? title,
    String? body,
    dynamic scheduledDate,
    NotificationDetails? notificationDetails, {
    required AndroidScheduleMode androidScheduleMode,
    String? payload,
    DateTimeComponents? matchDateTimeComponents,
    UILocalNotificationDateInterpretation
        uiLocalNotificationDateInterpretation =
        UILocalNotificationDateInterpretation.absoluteTime,
  }) async {}

  @override
  Future<void> cancel(int id, {String? tag}) async {}
}
