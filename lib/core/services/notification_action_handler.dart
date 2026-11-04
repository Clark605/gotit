import 'package:drift/drift.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:gotit/core/services/reminder_service.dart';
import 'package:gotit/core/storage/app_database.dart';
import 'package:gotit/core/utils/app_logger.dart';

@pragma('vm:entry-point')
void notificationTapBackground(NotificationResponse notificationResponse) async {
  WidgetsFlutterBinding.ensureInitialized();

  final actionId = notificationResponse.actionId;
  final taskId = notificationResponse.payload;

  if (taskId == null || taskId.isEmpty) return;

  try {
    final database = AppDatabase();

    if (actionId == NotificationActionIds.markDone) {
      final now = DateTime.now();
      await (database.update(database.tasksTable)
            ..where((t) => t.id.equals(taskId)))
          .write(
        TasksTableCompanion(
          status: const Value('completed'),
          updatedAt: Value(now),
        ),
      );

      // Cancel any remaining reminders for this task
      await (database.delete(database.remindersTable)
            ..where((r) => r.taskId.equals(taskId)))
          .go();
    } else if (actionId == NotificationActionIds.snooze15m) {
      // Re-arm local alarm for 15 minutes
      final notificationsPlugin = FlutterLocalNotificationsPlugin();
      final snoozeId = ReminderServiceImpl.getSnoozeNotificationId(taskId);
      final snoozeTime = DateTime.now().add(const Duration(minutes: 15));

      const details = NotificationDetails(
        android: AndroidNotificationDetails(
          NotificationActionIds.channelReminders,
          'Task Reminders',
          importance: Importance.high,
          priority: Priority.high,
          actions: [
            AndroidNotificationAction(
              NotificationActionIds.markDone,
              'Mark as Done',
              showsUserInterface: false,
              cancelNotification: true,
            ),
            AndroidNotificationAction(
              NotificationActionIds.snooze15m,
              'Snooze (15m)',
              showsUserInterface: false,
              cancelNotification: true,
            ),
          ],
        ),
        iOS: DarwinNotificationDetails(),
      );

      await notificationsPlugin.show(
        snoozeId,
        'Task Reminder',
        'Reminder snoozed for 15 minutes',
        details,
        payload: taskId,
      );
    }
  } catch (e, st) {
    AppLogger.error(
      'Error handling background notification tap',
      error: e,
      stackTrace: st,
    );
  }
}
