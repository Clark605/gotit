# Quickstart & Verification Guide: Resilient Task Reminders (Phase 2)

**Feature**: [spec.md](spec.md) | **Plan**: [plan.md](plan.md)  
**Date**: 2026-11-04

This guide provides runnable scenarios to validate Phase 2 end-to-end against the [Feature Specification](spec.md) and [Constitution](../../.specify/memory/constitution.md).

---

## 1. Prerequisites & Setup

### Environment & Dependencies
```bash
# Verify environment and flavors
dart run tool/setup_env.dart

# Run code generation for Drift and Freezed
dart run build_runner build --delete-conflicting-outputs

# Format and analysis
dart format .
flutter analyze
dart run tool/check_architecture.dart
```

---

## 2. Automated Test Execution

Run the complete test suite covering the reminder service, unit tests, and lifecycle synchronization:

```bash
# Run unit tests for reminder calculation, timezone offsets, and scheduling
flutter test test/core/services/reminder_service_test.dart

# Run database migration tests (v1 -> v2)
flutter test test/core/storage/migration_test.dart

# Run task repository reminder orchestration tests
flutter test test/features/tasks/data/repositories/task_repository_reminders_test.dart

# Run UI widget tests for Reminder section in TaskFormSheet and ReminderTroubleshootingScreen
flutter test test/features/tasks/ui/widgets/task_form_sheet_reminders_test.dart
flutter test test/features/tasks/ui/reminder_troubleshooting_screen_test.dart
```

---

## 3. Manual Device Validation Scenarios

### Scenario A: Due Date Reminder Scheduling & Tray Notification
1. Launch app on an Android device or emulator running Android 13+:
   ```bash
   flutter run --flavor dev --dart-define-from-file=env/dev.json
   ```
2. Tap `+` (Add Task) button to open the `TaskFormSheet`.
3. Enter title: *"Physics Lab Report"*.
4. Select a due time 2 minutes into the future.
5. Toggle the **Reminder** switch to **ON**.
6. Verify lead time defaults to *"15m before"* (or select *"At due time"* for the 2-minute test).
7. Tap **Save**.
8. Lock device or put app into background. Wait for the scheduled time.
9. **Expected**: System posts a heads-up notification with title *"Physics Lab Report"*, due time, and two action buttons: `Mark as Done` and `Snooze (15m)`.

### Scenario B: Notification Quick Actions (Mark as Done & Snooze)
1. In the notification from Scenario A, tap **Mark as Done**.
2. **Expected**: Notification dismisses immediately. Open Gotit; verify *"Physics Lab Report"* is marked completed in the database and does not appear in the active Today view.
3. Create a second task with a reminder, trigger it, and tap **Snooze (15m)**.
4. **Expected**: Notification is dismissed and a new transient notification is scheduled 15 minutes in the future.

### Scenario C: Start-Working Reminder with Effort Estimate
1. Create a task: *"Build Presentation Deck"*.
2. Set due time to 1 hour from now.
3. Select Effort Estimate: **45 minutes**.
4. Enable Reminder.
5. **Expected**: Two reminders are scheduled:
   - Start-working reminder fires 45 minutes before deadline (15 minutes from now) with body *"Time to start working on Build Presentation Deck - due in 45m"*.
   - Due reminder fires at the deadline.

### Scenario D: Task Modification & Rescheduling
1. Edit an existing task with an active reminder: change its due time to tomorrow at 10:00 AM.
2. Tap Save.
3. **Expected**: The previous alarms are cancelled immediately; new alarms are registered for tomorrow at 10:00 AM. Zero duplicate notifications.

### Scenario E: Device Reboot Restoration & Missed Reminder Bundling
1. Create a task with a reminder due in 10 minutes.
2. Power off or restart the Android device/emulator:
   ```bash
   adb reboot
   ```
3. After reboot completes:
   - If the reminder time is still in the future: verify `adb shell dumpsys alarm | grep gotit` shows the alarm re-registered.
   - If device remained off past the reminder deadline: upon booting, verify a consolidated notification *"Gotit: 1 missed reminder"* appears in the shade.

### Scenario F: Permissions & Battery Optimization Screen
1. On fresh install, verify educational primer dialog appears explaining notification importance before requesting OS permission.
2. Open Settings > *Notification & Battery Help*.
3. Verify step-by-step guidance for disabling OEM battery restrictions is cleanly rendered in English and Arabic (RTL).
