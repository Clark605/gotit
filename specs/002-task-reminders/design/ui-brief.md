# UI Brief: Resilient Task Reminders & Notifications (Phase 2)

**Sources**: `specs/002-task-reminders/spec.md` (2026-11-04), `specs/002-task-reminders/plan.md` (2026-11-04), `DESIGN.md` (v0.1)

---

## Screen Inventory

| # | Screen / Component | Purpose | Spec Refs | Cubit / State (from Plan) |
|---|-------------------|---------|-----------|---------------------------|
| 1 | **TaskFormSheet (Reminders Section)** | Configure due reminder lead time and all-day alert time inside task creation/edit modal. | FR-001, FR-002, FR-003, FR-004, US1, US2 | `TaskFormCubit` / `TaskFormState` |
| 2 | **PermissionPrimerDialog** | Educational bottom sheet explaining notification & exact alarm benefits prior to OS prompt. | FR-008, FR-009, US4 | Managed via `ReminderService` / local state |
| 3 | **ReminderTroubleshootingScreen** | Full-screen guide for OEM background battery optimization and permission diagnostics. | FR-010, US4 | `BaseCubit` / Static informational route |
| 4 | **NotificationTrayCard (System Mock)** | Mobile system tray representation of active due alerts, start-working alerts, and missed bundles. | FR-007, FR-011, FR-012, US1, US2, US3 | System / Background action handler |
| 5 | **TaskCard (Reminder Indicator)** | Subtle bell indicator and lead-time chip on existing Today & All Tasks cards. | FR-001, US1 | `TasksCubit` / `TasksState` |

---

## Shared Components

- **`ReminderLeadTimeChips`**: A horizontal wrapping set of selectable pills (`At due time`, `5m`, `15m [Default]`, `30m`, `1h`, `1d`) used in `TaskFormSheet` and Settings.
- **`PermissionStatusBadge`**: Pill indicator showing `Active` (green tint), `Inexact` (amber warning), or `Disabled` (error/muted) used in `ReminderTroubleshootingScreen` and in-app banners.
- **`AppButton`**: Primary confident green action button (`#1F7A5C`) used for granting permissions and opening system settings.

---

## Screen 1: TaskFormSheet (Reminders Section)

### Purpose, Entry Points, and Exits
- **Purpose**: Allows users to toggle reminders on/off, choose a lead time, customize all-day alert time, and observe effort-derived start-working reminder schedules.
- **Entry Points**: Tapping the Add FAB (`+`) or tapping any existing task card to edit.
- **Exits**: Tap Save (submits form and schedules alarm), tap Cancel / swipe down (dismisses sheet).

### Content Shown
- **Reminder Switch Tile**: Row with bell icon (`#1F7A5C` when active, `#7D7972` when off), title *"Remind me"*, and switch control.
- **Lead Time Selector**: When switch is ON, displays horizontal pills:
  - `At due time` (0m)
  - `5m before`
  - `15m before` (Default marker)
  - `30m before`
  - `1h before`
  - `1d before`
- **All-Day Alert Picker**: Visible only when `isAllDay == true`. Displays clickable pill showing target morning time (e.g., `09:00 AM`) opening time picker.
- **Start-Working Indicator**: When `effortMinutes > 0`, renders a subtle informational container (`#F6F4F1` surface with hairline border):
  - Icon: Timer / hourglass.
  - Text: *"Start-working reminder will sound [X]m before due time."*

### Actions Available
- Toggle reminder on/off.
- Select lead time pill.
- Tap all-day alert time to open time picker.
- Select effort estimate to see dynamic start-working calculation.

### States
- **Off**: Only the "Remind me" switch tile is visible; lead time pills are collapsed.
- **On (Standard Due Date)**: Switch on, lead time pills visible, default pill preselected.
- **On (All-Day Task)**: Due date is all-day; morning time picker pill displayed.
- **On with Effort**: Informational card appears explaining start-working trigger time.
- **Disabled / Permission Blocked**: If exact alarms or notifications are blocked at OS level, a subtle warning banner appears with button *"Enable in Settings"*.

### Edge Cases
- Due time is less than chosen lead time: Pill is disabled or automatically adjusted to "At due time" with a gentle inline caption.

### Localization Notes
- Arabic RTL: Switch aligns to leading edge (right in RTL), lead time chips flow right-to-left.
- Number formatting: Digits format according to locale (e.g. `15 دقيقة`).
- Date & time formatting: 12-hour AM/PM format localized (`ص` / `م`).

### Acceptance Scenarios Covered
- US1 Scenario 1 (select lead time from predefined options)
- US1 Scenario 4 (all-day task morning reminder)
- US2 Scenario 1 (start-working notification schedule derived from effort)

---

## Screen 2: PermissionPrimerDialog

### Purpose, Entry Points, and Exits
- **Purpose**: Gentle pre-permission bottom sheet that builds user trust and explains the value of local reminders before the irreversible OS system permission dialog is summoned.
- **Entry Points**: Toggling reminder ON for the first time, or tapping the notification setup prompt.
- **Exits**: Tap *"Enable Notifications"* (invokes OS dialog), tap *"Not now"* (dismisses sheet).

### Content Shown
- **Header Illustration / Icon**: Bell inside soft green circular container (`#DDF0E7`).
- **Heading**: *"Never miss a commitment"* (IBM Plex Sans Arabic 20px / 600 weight).
- **Body Text**:
  - *"Gotit uses on-device reminders to notify you when tasks are due and when it's time to start working."*
  - *"Zero cloud tracking. Reminders run 100% locally on your phone."*
- **Android 12+ Exact Alarm Note**:
  - *"To ring at the exact second without delay, please allow exact alarms when asked."*
- **Actions**:
  - Primary Button: `[ Enable Notifications ]` (Full width, `#1F7A5C`, text `#FFFFFF`).
  - Secondary Button: `Not now` (Text button, `#5F5B54`).

### States
- **Initial**: Clean informative presentation.
- **Requesting**: Brief progress indicator while system dialog is presented.

### Localization Notes
- Arabic RTL: Centered or right-aligned copy with soothing tone in MSA (Modern Standard Arabic).
- Fonts: IBM Plex Sans Arabic.

### Acceptance Scenarios Covered
- US4 Scenario 1 (educational rationale screen prior to OS dialog)
- US4 Scenario 2 (explanation of exact alarm importance)

---

## Screen 3: ReminderTroubleshootingScreen

### Purpose, Entry Points, and Exits
- **Purpose**: Full-screen troubleshooting and battery optimization guide to ensure high notification delivery rates across aggressive Android OEM battery savers (Xiaomi, Samsung, Huawei, etc.).
- **Entry Points**: Settings > *"Reminder & Battery Settings"*, or tapped from inexact fallback warning banner.
- **Exits**: Back button (top app bar leading edge) returning to previous screen.

### Content Shown
- **Top App Bar**: Title *"Reminder Reliability"*.
- **Diagnostic Status Card**:
  - Notification Permission: `Active` (Green badge) or `Disabled` (Red badge).
  - Exact Alarm Permission: `Exact` (Green badge) or `Inexact` (Amber warning badge).
  - Battery Optimization: `Unrestricted` or `Optimized (May delay alarms)`.
- **Primary CTA**: Button `[ Open Battery Settings ]` (`#1F7A5C`) navigating directly to system settings.
- **OEM Instructions (Accordion / Cards)**:
  - **Samsung (One UI)**: Go to Battery > Background usage limits > Add Gotit to "Never sleeping apps".
  - **Xiaomi (MIUI/HyperOS)**: App info > Enable "Autostart" and set Battery Saver to "No restrictions".
  - **Huawei / Honor**: Battery > App Launch > Set Gotit to "Manage manually" (Auto-launch, Secondary launch, Run in background).
  - **Google Pixel / Stock Android**: App info > App battery usage > Select "Unrestricted".

### States
- **Healthy State**: All permissions granted, green status badges.
- **Degraded State**: Exact alarms denied, warning banner showing *"Reminders may be delayed by up to 10 minutes"*.

### Localization Notes
- Full RTL layout for Arabic. OEM setting names provided in both Arabic and English reference terms where helpful.

### Acceptance Scenarios Covered
- US4 Scenario 3 (fallback to inexact alarms with warning banner)
- US4 Scenario 4 (step-by-step guidance for OEM background battery settings)

---

## Screen 4: NotificationTrayCard (System Mock)

### Purpose, Entry Points, and Exits
- **Purpose**: Demonstrates the visual appearance of Gotit notifications in the Android notification shade and lock screen.
- **Entry Points**: System alarm trigger event.
- **Exits**: User taps action button or taps notification body.

### Content Shown
- **Notification Header**: Small Gotit icon, app name "Gotit", dot separator, timestamp (`now` or time).
- **Notification Title**: Task title (e.g. *"Physics Lab Report"*).
- **Notification Body**:
  - Due alert: Context tag (*"University"*), Due time indicator (*"Due at 4:00 PM"*).
  - Start-working alert: *"Time to start working — due in 45m"*.
  - Missed summary alert: *"Gotit — 3 missed reminders (Physics Lab, Team Sync, Dentist)"*.
- **Quick Action Buttons**:
  - `[ Mark as Done ]` (Completes task in background)
  - `[ Snooze (15m) ]` (Reschedules alarm 15m later)

### States
- **Standard Due Alert**: With Mark as Done + Snooze actions.
- **Start-Working Alert**: With Mark as Done action.
- **Consolidated Missed Reminders**: Summary text, tap opens Today screen.

### Acceptance Scenarios Covered
- US1 Scenario 2 (notification posted with title, context, due time)
- US2 Scenario 2 (start-working notification body)
- US3 Scenario 5 (tray quick actions: Mark as Done and Snooze)
- US3 Scenario 4 / FR-007 (bundled summary notification for missed reminders)

---

## Screen 5: TaskCard (Reminder Indicator)

### Purpose, Entry Points, and Exits
- **Purpose**: Enhances the existing task card to visually indicate whether a reminder is active and its lead time.
- **Entry Points**: Today view and All Tasks list.

### Content Shown
- **Existing Elements**: Circular checkbox, task title, context tag, due date/time, effort chip.
- **New Element**: Subtle reminder bell icon (`14px`, `#7D7972` slate) next to due time with small lead-time label (e.g., `🔔 15m`).

### Acceptance Scenarios Covered
- US1 Scenario 1 (clear visibility of reminder state on task cards)

---

## Open Questions

- *None*: All core behaviors, defaults (15m lead time, 9:00 AM all-day time, Mark as Done + Snooze actions, and missed summary bundling) were resolved in the clarification sessions.
