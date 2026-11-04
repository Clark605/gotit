# Feature Specification: Resilient Task Reminders & Notifications

**Feature Branch**: `002-task-reminders`

**Created**: 2026-11-04

**Status**: Draft

**Input**: User description: "Phase 2: Resilient Task Reminders & Notifications - Local notifications for due dates and start-working times, permission onboarding, boot persistence, and battery optimization guidance."

## Clarifications

### Session 2026-11-04
- Q: What should be the default reminder lead time when a task due date/time is selected? (FR-002) → A: User preference in Settings (defaults to 15 minutes before the due time, automatically applied when reminders are toggled on for a task).
- Q: At what time should reminders for all-day tasks fire? (FR-003, US1 Scenario 4) → A: User-customizable time preference (configurable in Settings with a default of 9:00 AM in the user's local timezone, customizable per task).
- Q: What interactive quick actions should appear directly on the notification in the system notification shade? (FR-012, US3 Scenario 5) → A: "Mark as Done" and "Snooze (15m)" action buttons directly actionable from the notification tray without foreground launch.
- Q: How should the system deliver missed reminders when the device powers back on after scheduled alarm times have passed during shutdown? (FR-007) → A: Bundled summary notification: Posts a single consolidated notification (e.g. "N missed reminders") tapping which opens the Today view.
- Q: Should a task support multiple custom due reminders or exactly one due reminder plus the automatic start-working reminder? (FR-001) → A: Single due reminder + start-working reminder: Each task supports one configurable due reminder plus an automatic start-working reminder (if effort estimate is set).

## User Scenarios & Testing *(mandatory)*

### User Story 1 - Due Date Reminders with Configurable Lead Times (Priority: P1)

As a user tracking time-sensitive commitments, I want to attach reminders to my tasks with selectable lead times (e.g., at due time, 10 minutes before, 1 hour before, 1 day before) and receive reliable system notifications when the scheduled time arrives, so that I never miss an important deadline.

**Why this priority**: Core value proposition. Reminders are the primary mechanism that brings users back to their commitments at the exact moment action is required.

**Independent Test**: Can be fully tested by creating a task scheduled for a specific time with a reminder set to "At due time", advancing device time or waiting for the trigger, and verifying that a notification is posted to the system notification tray with the task title and context tag, and that tapping the notification navigates directly to the task detail view.

**Acceptance Scenarios**:

1. **Given** a user creating or editing a task with a due date and time, **When** they enable the reminder option, **Then** they can select a single lead time from predefined options (At due time, 5 min, 10 min, 15 min, 30 min, 1 hour, 1 day before) or keep their configured default lead time.
2. **Given** a scheduled task with an active reminder, **When** the scheduled trigger time is reached, **Then** a system notification is posted displaying the task title, context tag, and due time.
3. **Given** an incoming reminder notification in the system notification shade, **When** the user taps the notification, **Then** the application opens directly to the corresponding task detail view.
4. **Given** an all-day task with no specific time, **When** a reminder is enabled, **Then** the notification is triggered at the user-configured all-day reminder time (defaulting to 9:00 AM in the user's local timezone) on the due date.

---

### User Story 2 - Start-Working Reminders Based on Effort Estimate (Priority: P2)

As a busy student or professional with tasks requiring significant preparation, I want the system to automatically trigger a "Start Working" reminder prior to the deadline based on the task's estimated effort, so that I begin working with sufficient lead time to finish on schedule.

**Why this priority**: Fulfills the distinctive Gotit intelligent scheduling promise from the PRD, bridging the gap between simply tracking a deadline and actually executing the work on time.

**Independent Test**: Can be fully tested by creating a task due at 4:00 PM with an effort estimate of 45 minutes, verifying that a distinct start-working notification is scheduled for 3:15 PM, and observing that when triggered, the notification clearly communicates that it is time to begin working on the task.

**Acceptance Scenarios**:

1. **Given** an open task with a due time and an effort estimate (e.g. 60 minutes), **When** reminders are active, **Then** the system automatically schedules a secondary "Start Working" notification at `due time - effort estimate`.
2. **Given** a triggered start-working reminder notification, **When** the user views it in the system tray, **Then** the notification body indicates the remaining time until the deadline and prompts the user to begin (e.g., "Start working on Submit Report - due in 60m").
3. **Given** an effort estimate that would place the start-working time in the past relative to the moment the task was created or edited, **When** reminders are evaluated, **Then** no past start-working notification is dispatched, while the due date reminder remains scheduled normally.

---

### User Story 3 - Resilient Lifecycle Synchronization & Reboot Persistence (Priority: P3)

As a user whose phone may reboot or whose schedule frequently shifts, I want my scheduled reminders to survive device restarts and automatically update or cancel whenever I edit, reschedule, or complete a task, so that I never receive phantom alarms or miss altered deadlines.

**Why this priority**: Essential reliability requirement mandated by Constitution Principle V. Unreliable reminders that trigger for completed tasks or fail after reboot destroy user trust.

**Independent Test**: Can be fully tested by scheduling a task reminder, marking the task complete (or altering its due time), and verifying that the pending system alarm is immediately cancelled or updated. Additionally testable by simulating a device reboot and verifying all future open task reminders are restored into the system alarm schedule.

**Acceptance Scenarios**:

1. **Given** an open task with scheduled reminders, **When** the user marks the task as completed, **Then** all pending due and start-working reminders for that task are immediately cancelled from the system scheduler.
2. **Given** an open task with scheduled reminders, **When** the user updates the task's due date, due time, or effort estimate, **Then** existing scheduled alarms are cancelled and new alarms are scheduled matching the revised timetable.
3. **Given** a task with scheduled reminders, **When** the user deletes the task, **Then** all pending reminders associated with that task are permanently cancelled.
4. **Given** scheduled reminders registered in the system, **When** the device is powered off and rebooted or the application package is updated, **Then** the application automatically reconstructs the schedule and re-registers all pending future alarms.
5. **Given** an active reminder notification present in the notification tray, **When** the user triggers an inline quick action ("Mark as Done" or "Snooze (15m)"), **Then** the action is processed immediately in the background without requiring a full foreground app launch.

---

### User Story 4 - Permission Onboarding & Battery Optimization Guidance (Priority: P4)

As a user on a mobile device with strict background power management and notification policies, I want clear, reassuring explanations before being prompted for notification and exact alarm permissions, and access to vendor-specific battery optimization advice, so that my reminders fire precisely on time without silent system suppression.

**Why this priority**: Required for operational delivery on modern operating systems (Android 12+, 13+, 14+). Without proper runtime permissions and battery exclusions, reminders are delayed or killed by the OS.

**Independent Test**: Can be fully tested by launching the app on a clean device state, initiating a reminder action or viewing settings, verifying that an educational primer dialog explains why permissions are needed before invoking OS dialogs, and verifying that the battery optimization help guide provides actionable instructions.

**Acceptance Scenarios**:

1. **Given** a user configuring their first reminder or navigating to notification settings, **When** notification permissions have not yet been granted, **Then** the application presents an educational rationale screen explaining the necessity of notifications before requesting system permission.
2. **Given** a device running an operating system requiring explicit permission for exact alarms, **When** exact alarm permission is not granted, **Then** the system explains why exact timing matters and directs the user to the appropriate system settings screen.
3. **Given** a user who denies exact alarm permissions, **When** a reminder is scheduled, **Then** the system gracefully falls back to standard/inexact alarm scheduling and displays an informative banner indicating that reminders may experience minor timing variance.
4. **Given** a user experiencing delayed notifications due to vendor background process limits, **When** they open the reminder help section, **Then** they see step-by-step guidance for disabling aggressive battery optimization across common device manufacturers.

---

### Edge Cases

- What happens when a user sets a reminder for a time that has already elapsed (e.g., setting a 15-minute lead time on a task due in 5 minutes)?
  The system MUST immediately clamp or notify the user that the lead time has already passed, scheduling only the at-due-time reminder if it is still in the future, or rejecting past times during entry.
- How does the system handle time zone shifts (e.g., user flies across time zones)?
  Scheduled reminders MUST evaluate based on the absolute UTC timestamp of the deadline or adapt to the new local time zone so that the alarm sounds at the intended local hour.
- What happens if the device is powered off at the exact moment a reminder is scheduled to fire?
  Upon next boot, the system MUST detect any alarms that were missed during the shutdown period (within a 24-hour threshold) and post a single consolidated summary notification (e.g., "N missed reminders") linking to the Today view, avoiding individual alarm spam.
- How does the system behave when multiple tasks share the exact same due date and time?
  The system MUST assign distinct, deterministic notification identifiers to each task and reminder type so that notifications do not overwrite or collide with each other in the notification shade.
- What happens if a user repeatedly snoozes a reminder?
  Snoozing creates a temporary transient alarm (+15 minutes) without mutating the underlying task's canonical due date.

## Requirements *(mandatory)*

### Functional Requirements

- **FR-001**: The system MUST allow users to enable or disable reminders per task with a single configurable due reminder chosen from predefined lead times (At due time, 5 minutes before, 10 minutes before, 15 minutes before, 30 minutes before, 1 hour before, 1 day before, or custom lead time), plus an automatic start-working reminder if an effort estimate is provided.
- **FR-002**: The system MUST provide a user preference in Settings for the default reminder lead time (defaulting to 15 minutes before due time), applied automatically whenever a reminder is enabled on a task.
- **FR-003**: For all-day tasks, the system MUST schedule due reminders at a user-customizable alert time (configurable in Settings with a default of 9:00 AM in the device's local timezone), which can be adjusted per task.
- **FR-004**: When a task has both a scheduled due time and an effort estimate greater than zero, the system MUST automatically calculate and schedule a secondary start-working reminder at `due time - effort estimate`.
- **FR-005**: All reminder scheduling, cancellation, and rescheduling logic MUST be encapsulated in a single, dedicated notification service that operates independently of the UI layer.
- **FR-006**: The system MUST immediately reschedule or cancel pending reminders whenever a task is edited, rescheduled, marked completed, or deleted.
- **FR-007**: Scheduled reminders MUST persist across device reboots and application updates through a boot receiver mechanism that automatically re-registers pending alarms, and consolidates any missed past alarms into a single summary notification upon boot.
- **FR-008**: The system MUST present an educational primer explaining the purpose and value of reminders prior to requesting operating system notification and exact alarm permissions.
- **FR-009**: If exact alarm permissions are restricted or denied by the operating system, the system MUST degrade gracefully by scheduling inexact alarms while alerting the user about potential delivery jitter.
- **FR-010**: The system MUST provide an accessible Help and Troubleshooting screen explaining background battery optimization settings and OEM-specific autostart/battery restrictions.
- **FR-011**: Tapping a posted reminder notification MUST launch the application and navigate directly to the specific task's detail screen.
- **FR-012**: System notifications MUST support interactive quick actions directly from the notification tray: "Mark as Done" (completes the task in the background and dismisses the notification) and "Snooze (15m)" (re-arms a temporary reminder alarm for 15 minutes later).
- **FR-013**: All reminder and notification user-facing strings (notification titles, bodies, action labels, permission primers, help guides) MUST be fully localized in both English and Arabic with full Right-to-Left (RTL) support.

### Key Entities *(include if feature involves data)*

- **Reminder**: Represents a scheduled alarm event linked to a specific task. Attributes include:
  - `id`: Unique identifier for the reminder event.
  - `taskId`: Identifier of the associated task.
  - `type`: Enum distinguishing between `dueReminder` and `startWorkingReminder`.
  - `scheduledTime`: Exact target timestamp (UTC) when the notification should fire.
  - `leadTimeMinutes`: Offset in minutes relative to the deadline (0 for at-due-time).
  - `status`: Lifecycle state (`pending`, `fired`, `cancelled`, `dismissed`).
  - `createdAt`: Timestamp when the reminder was scheduled.
  - `updatedAt`: Timestamp of last modification.
- **Task**: The primary task entity (extended from Phase 1) with direct association to its active reminder configuration (lead time preference, all-day reminder time override, and reminder toggle status).
- **ReminderPreferences**: User-level configuration stored locally:
  - `defaultLeadTimeMinutes`: Default lead time applied when creating new reminders (default: 15 minutes).
  - `defaultAllDayReminderTime`: Default time of day for all-day task reminders (default: 09:00 local time).
  - `exactAlarmFallbackAcknowledged`: Boolean tracking whether the user acknowledged inexact alarm fallback.

## Success Criteria *(mandatory)*

### Measurable Outcomes

- **SC-001**: 100% of scheduled reminders for open tasks fire within 5 seconds of the scheduled target time when exact alarm permissions are granted.
- **SC-002**: 100% of pending reminders are successfully restored and rescheduled within 30 seconds of system boot completion.
- **SC-003**: Editing, rescheduling, or completing a task updates or clears the operating system alarm scheduler in under 150 milliseconds.
- **SC-004**: Users can configure and activate a reminder in 2 taps or fewer from the task creation or edit interface.
- **SC-005**: Zero ghost notifications dispatched for tasks that have already been marked completed or deleted.
- **SC-006**: First-time permission acceptance rate reaches at least 85% through the educational pre-permission primer flow.

## Assumptions

- Target operating systems support local notification scheduling and alarm manager APIs (Android and iOS).
- Exact alarm permissions on modern Android versions (Android 12+) require explicit user authorization or system exemption; the app operates gracefully in inexact mode if denied.
- Reminders are managed locally on the device as part of the local-first architecture; network connectivity is never required to schedule, reschedule, or fire reminders.
- Sound and vibration channels will adhere to system notification channel standards, allowing users to customize alert sounds and priority through system settings.


## Design References

| Screen / Component | File Path | Spec References Covered |
| :--- | :--- | :--- |
| Reminders Section in TaskFormSheet | `design/screens/01-reminders-modal-en-light.png` | FR-001, FR-002, FR-003, FR-004, US1, US2 |
| Reminders Section (Arabic RTL) | `design/screens/01-reminders-modal-ar-light.png` | FR-001, FR-013, US1, US2 |
| Reminders Section (Dark Mode) | `design/screens/01-reminders-modal-en-dark.png` | FR-001, US1, US2 |
| Inexact Alarm Fallback Banner | `design/screens/01-reminders-modal-inexact-warning.png` | FR-009, US4 Scenario 3 |
| Permission Primer Dialog (En Light) | `design/screens/02-permission-primer-en-light.png` | FR-008, US4 Scenario 1 & 2 |
| Permission Primer Dialog (Ar RTL) | `design/screens/02-permission-primer-ar-light.png` | FR-008, FR-013, US4 Scenario 1 & 2 |
| Permission Primer Dialog (Dark Mode) | `design/screens/02-permission-primer-en-dark.png` | FR-008, US4 Scenario 1 & 2 |
| Reminder Reliability Screen (En Light) | `design/screens/03-reminder-reliability-en-light.png` | FR-010, US4 Scenario 4 |
| Reminder Reliability Screen (Ar RTL) | `design/screens/03-reminder-reliability-ar-light.png` | FR-010, FR-013, US4 Scenario 4 |
| Reminder Reliability Screen (Dark Mode) | `design/screens/03-reminder-reliability-en-dark.png` | FR-010, US4 Scenario 4 |
| Android Notification Shade (Light) | `design/screens/04-notification-cards-light.png` | FR-007, FR-011, FR-012, US1-3 |
| Android Notification Shade (Dark) | `design/screens/04-notification-cards-dark.png` | FR-007, FR-011, FR-012, US1-3 |
| TaskCard Reminder Badge (English) | `design/screens/05-task-card-reminder-en.png` | FR-001, US1 |
| TaskCard Reminder Badge (Arabic) | `design/screens/05-task-card-reminder-ar.png` | FR-001, FR-013, US1 |
