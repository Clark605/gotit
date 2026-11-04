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

  group('Start-Working Reminders Calculation & Scheduling', () {
    test(
        'schedules start-working reminder at due - effort when target time is future',
        () async {
      final now = DateTime.now();
      final futureDue = now.add(const Duration(hours: 3));
      const effortMinutes = 45;

      await database.into(database.tasksTable).insert(
            TasksTableCompanion.insert(
              id: 'task-start-1',
              title: 'Prepare presentation',
              dueDate: Value(futureDue),
              effortMinutes: const Value(effortMinutes),
              isReminderEnabled: const Value(true),
            ),
          );

      await reminderService.syncReminderSchedule(
        TaskReminderSchedule(
          taskId: 'task-start-1',
          title: 'Prepare presentation',
          dueDate: futureDue,
          effortMinutes: effortMinutes,
          isReminderEnabled: true,
          reminderLeadMinutes: 15,
        ),
      );

      final reminders = await (database.select(database.remindersTable)
            ..where((r) => r.taskId.equals('task-start-1')))
          .get();

      // Both due reminder and start-working reminder scheduled
      expect(reminders.length, equals(2));

      final startWorkingReminder =
          reminders.firstWhere((r) => r.type == 'start_working');
      expect(startWorkingReminder.leadTimeMinutes, equals(effortMinutes));
      expect(
        startWorkingReminder.scheduledTime.difference(futureDue).inMinutes,
        equals(-effortMinutes),
      );
    });

    test(
        'suppresses start-working reminder when target time is in the past',
        () async {
      final now = DateTime.now();
      // Due in 30 minutes, effort is 60 minutes -> start working was 30 minutes ago
      final futureDue = now.add(const Duration(minutes: 30));
      const effortMinutes = 60;

      await database.into(database.tasksTable).insert(
            TasksTableCompanion.insert(
              id: 'task-start-2',
              title: 'Quick review',
              dueDate: Value(futureDue),
              effortMinutes: const Value(effortMinutes),
              isReminderEnabled: const Value(true),
            ),
          );

      await reminderService.syncReminderSchedule(
        TaskReminderSchedule(
          taskId: 'task-start-2',
          title: 'Quick review',
          dueDate: futureDue,
          effortMinutes: effortMinutes,
          isReminderEnabled: true,
          reminderLeadMinutes: 15,
        ),
      );

      final reminders = await (database.select(database.remindersTable)
            ..where((r) => r.taskId.equals('task-start-2')))
          .get();

      // Only due reminder scheduled, start-working suppressed
      expect(reminders.length, equals(1));
      expect(reminders.first.type, equals('due'));
    });

    test('suppresses start-working reminder for all-day tasks', () async {
      final now = DateTime.now();
      final tomorrow = DateTime(now.year, now.month, now.day + 1);

      await database.into(database.tasksTable).insert(
            TasksTableCompanion.insert(
              id: 'task-start-3',
              title: 'Conference day',
              dueDate: Value(tomorrow),
              isAllDay: const Value(true),
              effortMinutes: const Value(120),
              isReminderEnabled: const Value(true),
            ),
          );

      await reminderService.syncReminderSchedule(
        TaskReminderSchedule(
          taskId: 'task-start-3',
          title: 'Conference day',
          dueDate: tomorrow,
          isAllDay: true,
          effortMinutes: 120,
          isReminderEnabled: true,
        ),
      );

      final reminders = await (database.select(database.remindersTable)
            ..where((r) => r.taskId.equals('task-start-3')))
          .get();

      expect(reminders.length, equals(1));
      expect(reminders.first.type, equals('due'));
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
