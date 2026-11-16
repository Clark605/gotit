# Research: Resilient Task Reminders & Notifications (Phase 2)

**Feature**: [spec.md](spec.md) | **Plan**: [plan.md](plan.md)  
**Date**: 2026-11-04

---

## 1. Notification Scheduling & Alarm Architecture

### Decision
Use `flutter_local_notifications` (^18.0.0+) paired with `timezone` (^0.10.0+) for local push alerts and exact alarm scheduling. Encapsulate all notification creation, scheduling, cancellation, and action dispatching within `ReminderService` (`lib/core/services/reminder_service.dart`).

### Rationale
- `flutter_local_notifications` is the battle-tested standard for Flutter local alarms, supporting Android channels, heads-up notifications, lock screen visibility, inline action buttons (`DarwinNotificationAction`, `AndroidNotificationAction`), exact alarms via `AlarmManager`, and device reboot receivers.
- Constitution Principle V mandates: *"All reminder scheduling logic MUST be encapsulated in a single, dedicated service covered by unit tests."*
- Decoupling `ReminderService` from UI and Blocs ensures testability and clean architecture (Rule 1 & Rule 2).

### Alternatives Considered
- `android_alarm_manager_plus`: Only handles Android alarms; requires separate iOS implementation and does not post notifications natively without extra bridge code.
- Custom MethodChannels for Kotlin AlarmManager: Unnecessary maintenance overhead and duplicates what `flutter_local_notifications` already provides cleanly with battle-tested edge-case handling.

---

## 2. Android Exact Alarm Permissions & Inexact Fallback

### Decision
Support Android 12+ (API 31+) and Android 13+ (API 33+) permission models with progressive disclosure and graceful degradation:
1. **Notification Permission (`POST_NOTIFICATIONS`)**: On Android 13+, display an educational primer screen explaining why notifications are necessary before requesting runtime permission.
2. **Exact Alarm Permission (`SCHEDULE_EXACT_ALARM`)**: Check `canScheduleExactNotifications()`.
   - If granted: Schedule with `AndroidScheduleMode.exactAllowWhileIdle`.
   - If restricted or denied: Degrade gracefully to `AndroidScheduleMode.inexactAllowWhileIdle` and present an informative banner advising that notifications may vary by a few minutes.
   - Provide a direct link button to open the OS Exact Alarm settings screen via platform intent (`ACTION_REQUEST_SCHEDULE_EXACT_ALARM`).

### Rationale
- Satisfies Constitution Principle V: *"Reminder dispatch MUST degrade gracefully when exact alarm permissions are restricted or denied by the operating system."*
- Ensures Google Play policy compliance (Google Play restricts `USE_EXACT_ALARM` to specific alarm/calendar app categories; task management apps should rely on `SCHEDULE_EXACT_ALARM` with inexact fallback).

---

## 3. Reboot Persistence & Missed Reminder Consolidation

### Decision
1. **Boot Receiver**: Enable `flutter_local_notifications`'s built-in `ScheduledNotificationBootReceiver` in `AndroidManifest.xml` with `RECEIVE_BOOT_COMPLETED`.
2. **Schedule Restoration**: Upon application bootstrap or background boot trigger:
   - Query all open tasks with active reminders from `AppDatabase`.
   - Filter future alarms and re-register them with `flutter_local_notifications`.
   - Identify alarms whose scheduled time elapsed while the device was off (within a 24-hour window).
   - Consolidate missed alarms into a single summary notification (e.g. *"Gotit: 3 missed reminders"*) using grouping and notification ID `999999`, which opens the Today view when tapped.

### Rationale
- Satisfies [FR-007](spec.md#L112) and Clarification Session 2026-11-04 (Q4 Option A).
- Prevents notification storms or loud alarm chimes when the device powers on.

---

## 4. Interactive Notification Tray Actions

### Decision
Register two quick actions for reminder notification categories:
1. **"Mark as Done" (`action_mark_done`)**:
   - Executes in the background via `@pragma('vm:entry-point')` top-level callback `notificationTapBackground`.
   - Updates `TasksTable.status = 'completed'` and `updatedAt = DateTime.now()` in `AppDatabase`.
   - Dismisses the notification and cancels any associated start-working reminders.
2. **"Snooze (15m)" (`action_snooze`)**:
   - Calculates `DateTime.now().add(const Duration(minutes: 15))` and schedules a transient local notification with ID `hash(taskId + '_snooze')`.
   - Leaves the canonical task `dueDate` unchanged.
3. **Notification Body Tap**:
   - Navigates to `RouteNames.taskDetail` passing `TaskDetailArgs(taskId: id)`.

### Rationale
- Satisfies [FR-012](spec.md#L117) and Clarification Session 2026-11-04 (Q3 Option A).
- Allows fast friction-free task management directly from lock screen or status bar without interrupting the user's active flow.

---

## 5. Battery Optimization & OEM Killer Mitigation

### Decision
Provide an accessible **Notification & Battery Help Screen** (`ReminderTroubleshootingScreen`):
- Explains background battery restrictions applied by aggressive OEM skins (MIUI/HyperOS, OneUI, EMUI, ColorOS).
- Provides actionable instructions and a one-tap button opening system battery optimization settings (`ACTION_IGNORE_BATTERY_OPTIMIZATION_SETTINGS`).
- Links to device-specific guides (e.g. dontkillmyapp.com patterns).

### Rationale
- Satisfies PRD FR-18 and spec [FR-010](spec.md#L115).
- Prevents user frustration when device OEMs silently suppress background tasks or delay exact alarms.

---

## 6. Drift Database Schema Evolution (v1 -> v2)

### Decision
Upgrade `AppDatabase` `schemaVersion` from `1` to `2`.
1. Add `RemindersTable`:
   - `id`: `TextColumn` (UUID) primary key.
   - `taskId`: `TextColumn` referencing `TasksTable.id` with `KeyAction.cascade`.
   - `type`: `TextColumn` (`'due'` or `'start_working'`).
   - `scheduledTime`: `DateTimeColumn`.
   - `leadTimeMinutes`: `IntColumn` (default 0).
   - `status`: `TextColumn` (default `'pending'`).
   - `notificationId`: `IntColumn` (32-bit integer for alarm manager).
   - `createdAt`: `DateTimeColumn`.
   - `updatedAt`: `DateTimeColumn`.
2. Add columns to `TasksTable`:
   - `reminderLeadMinutes`: `IntColumn.nullable()`
   - `isReminderEnabled`: `BoolColumn.withDefault(Constant(false))`
   - `allDayReminderTime`: `TextColumn.nullable()` (e.g., `"09:00"`)
3. Drift Migration:
   ```dart
   MigrationStrategy(
     onUpgrade: (m, from, to) async {
       if (from == 1) {
         await m.addColumn(tasksTable, tasksTable.reminderLeadMinutes);
         await m.addColumn(tasksTable, tasksTable.isReminderEnabled);
         await m.addColumn(tasksTable, tasksTable.allDayReminderTime);
         await m.createTable(remindersTable);
       }
     },
   )
   ```

### Rationale
- Direct task columns allow instant UI binding in form sheets and card badges without costly table joins.
- `RemindersTable` provides auditability, precise alarm lifecycle management, and boot-time schedule reconstruction.
- Migration preserves existing user tasks from Phase 1 without data loss.

---

## 7. Dependency Selection & Justification

| Dependency | Version | Justification (Constitution Principle VII) |
| :--- | :--- | :--- |
| `flutter_local_notifications` | `^18.0.1` | Native local push notifications, scheduled alarms, background action handlers, and boot receiver. |
| `timezone` | `^0.10.0` | Required by `flutter_local_notifications` for daylight savings and timezone-accurate `zonedSchedule`. |

Both dependencies are industry standard, widely supported, and have zero overlap with unused functionality.
