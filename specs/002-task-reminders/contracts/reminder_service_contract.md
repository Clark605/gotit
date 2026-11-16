# Contracts: Reminder Service & Handlers (Phase 2)

**Feature**: [spec.md](../spec.md) | **Plan**: [plan.md](../plan.md)  
**Date**: 2026-11-04

---

## 1. `IReminderService` Interface (`lib/core/services/reminder_service.dart`)

The central service responsible for all notification channel setup, permission requests, scheduling, cancellation, and boot-time restoration.

```dart
abstract class IReminderService {
  /// Initializes local notification plugins, channels, and intent listeners.
  Future<void> initialize();

  /// Checks if notification permissions are granted (Android 13+ / iOS).
  Future<bool> hasNotificationPermission();

  /// Requests notification runtime permissions.
  Future<bool> requestNotificationPermission();

  /// Checks if exact alarm permissions are granted (Android 12+).
  Future<bool> hasExactAlarmPermission();

  /// Requests exact alarm permission by directing user to system settings.
  Future<void> requestExactAlarmPermission();

  /// Schedules all appropriate reminders (due and start-working) for a given task.
  /// Cancels existing alarms for this task before re-scheduling.
  Future<void> syncRemindersForTask(TaskModel task);

  /// Cancels all pending alarms (due and start-working) for a task.
  Future<void> cancelForTask(String taskId);

  /// Snoozes a reminder for the given task by scheduling an alert 15 minutes in the future.
  Future<void> snoozeReminder(String taskId, {int minutes = 15});

  /// Called upon system boot or app startup to restore all future alarms from the database
  /// and bundle any missed notifications into a single summary notification.
  Future<void> restoreAndReconcileSchedule();
}
```

---

## 2. Notification Action Identifier Contracts

```dart
abstract class NotificationActionIds {
  static const String markDone = 'action_mark_done';
  static const String snooze15m = 'action_snooze_15m';
  static const String channelReminders = 'gotit_reminders_channel';
  static const String channelMissed = 'gotit_missed_reminders_channel';
  static const int missedSummaryNotificationId = 999999;
}
```

---

## 3. Background Notification Tap Callback Contract

```dart
/// Top-level callback registered for background notification actions.
/// Must be marked with @pragma('vm:entry-point').
@pragma('vm:entry-point')
void notificationTapBackground(NotificationResponse notificationResponse);
```

- When `notificationResponse.actionId == NotificationActionIds.markDone`:
  - Directly opens SQLite database (`AppDatabase`) and marks task completed (`status = 'completed'`).
- When `notificationResponse.actionId == NotificationActionIds.snooze15m`:
  - Invokes `reminderService.snoozeReminder(taskId, minutes: 15)`.
- When action is default tap:
  - Launches Flutter engine; `app_router` handles navigation to `RouteNames.taskDetail` using `payload: taskId`.
