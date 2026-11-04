# Stitch Prompts: Resilient Task Reminders & Notifications (Phase 2)

> **Important**: Always attach `DESIGN.md` from the project root when submitting prompts to Stitch or generating screens.

---

## Shared Preface for All Prompts

Gotit is a calm, fast, automation-first task application for mobile (Android & iOS). The aesthetic is warm minimalism built upon paper-toned neutrals (`#FCFBF9` canvas, `#F6F4F1` surface), crisp hairline borders (`#E7E3DD`), restrained geometry (4px to 12px rounded corners), and exactly one confident deep green accent (`#1F7A5C`) reserved strictly for confirmed actions and active toggles. Gradients, heavy drop shadows, neon glows, and decorative illustrations are strictly prohibited. Identity comes entirely from typographic discipline (IBM Plex Sans Arabic for Arabic RTL and English LTR), balanced spacing, and high-contrast accessibility. Touch targets must be >= 48x48dp.

---

## Prompt 1: TaskFormSheet with Reminders Section

**Screen Name**: `task-form-sheet-reminders`  
**Viewport**: Mobile Portrait (390 x 844 dp)  
**Deliverables**: 4 frames (English Light, Arabic RTL Light, English Dark, Inexact Permission Warning state)

### Prompt
```text
Design the Reminders section within the Gotit Task Creation & Edit Bottom Sheet modal, following DESIGN.md.

The modal is open over a dimmed Today screen background.
The sheet has a subtle grab handle, title "New Task" (or "تعديل المهمة" in Arabic), and task fields:
- Title input: "Submit Physics Lab Report"
- Due Date picker row: "Today, 4:00 PM"
- Context selector: "University" (soft lavender tint tag)
- Effort selector: "45m" (with timer icon)

Directly below the Effort row, show the new Reminders Section:
1. "Remind me" switch tile:
   - Row with a subtle bell icon (#1F7A5C), title "Remind me" (16px, medium weight), and an active toggle switch in brand green (#1F7A5C).
2. Lead Time Chips:
   - When the toggle is active, show a horizontal wrapping row of rounded-full pills:
     - "At due time"
     - "5m before"
     - "15m before" (Selected: #DDF0E7 soft green background with #1F7A5C green border and text)
     - "30m before"
     - "1h before"
     - "1d before"
   - Unselected chips have #F6F4F1 surface and #E7E3DD hairline border with #3A3733 text.
3. Start-Working Reminder Helper Card:
   - Because the task has an effort estimate of 45m, display a gentle informational box below the chips:
     - Background: #F6F4F1, hairline border #E7E3DD, 8px radius.
     - Text: "🔔 Start-working reminder will sound at 3:15 PM (45m lead time)." in #5F5B54 slate.
4. Save Button:
   - Fixed bottom bar with a full-width primary button "Save Task" in #1F7A5C with white text.

Produce four distinct frames:
1. English LTR - Light Mode (Canvas #FCFBF9, Surface #F6F4F1).
2. Arabic RTL - Light Mode (Right-to-left layout with IBM Plex Sans Arabic typography, switch on the left/trailing edge, pills ordered RTL).
3. English LTR - Dark Mode (Canvas #161513, Surface #22201C, Accent #2FA37B).
4. English LTR - Inexact Alarm Warning State (Shows a small subtle amber pill/banner below the switch: "⚠️ Exact alarms restricted by OS. Reminders may vary by a few minutes. [Enable]").
```

---

## Prompt 2: Permission Primer Dialog

**Screen Name**: `permission-primer-dialog`  
**Viewport**: Mobile Bottom Sheet Modal (390 x 480 dp)  
**Deliverables**: 3 frames (English Light, Arabic RTL Light, English Dark)

### Prompt
```text
Design the Educational Permission Primer Bottom Sheet for Gotit, strictly adhering to DESIGN.md.

This sheet appears before Gotit triggers the operating system's native notification and exact alarm permission prompts.
It is an educational, trust-building modal with a clean, calm layout:

1. Top Grab Handle: 36x4px centered bar in #CFCAC2.
2. Centered Icon:
   - Circular container (56x56dp, 16px radius or circle) in soft green #DDF0E7.
   - Inside: A clean, minimalist outline bell icon with a small check badge in deep green #1F7A5C.
3. Typography & Messaging:
   - Screen Title: "Never miss a commitment" (IBM Plex Sans Arabic, 22px, bold 600 weight, #1F1E1B ink).
   - Body Paragraph 1: "Gotit uses local notifications to alert you when tasks are due and when it's time to start working." (15px, #5F5B54 slate, 1.5 line height).
   - Trust Highlight: A soft pill or callout container (#F6F4F1 surface, hairline border #E7E3DD, 8px radius) with:
     - "🔒 100% On-Device Privacy. No task details or notifications are ever uploaded to cloud servers."
   - Exact Alarm Notice: A small caption (13px, #7D7972 steel): "To ring at the exact second, Android requires permission for alarms."
4. Action Buttons (Stacked vertically):
   - Primary Action: Full-width button "Enable Notifications" (#1F7A5C green, #FFFFFF text, 48dp height, 8px radius).
   - Secondary Action: "Not now" text button (48dp height, #5F5B54 slate text).

Produce three frames:
1. English LTR - Light Mode.
2. Arabic RTL - Light Mode (Title: "لا تفوّت أي التزام", Arabic RTL alignment, IBM Plex Sans Arabic).
3. English LTR - Dark Mode (Dark background #22201C, soft container #1B382B, text #EAE7E2).
```

---

## Prompt 3: Reminder & Battery Optimization Help Screen

**Screen Name**: `reminder-troubleshooting-screen`  
**Viewport**: Full Screen Mobile (390 x 844 dp)  
**Deliverables**: 3 frames (English Light, Arabic RTL Light, English Dark)

### Prompt
```text
Design the full-screen "Reminder Reliability" Help & Settings screen for Gotit, following DESIGN.md.

Header / App Bar:
- Leading: Back arrow button (48x48dp touch target).
- Title: "Reminder Reliability" (18px, 600 weight, centered or leading aligned).
- Background: #FCFBF9 with bottom hairline border #E7E3DD.

Screen Content (Scrollable list, 16dp margins):
1. Status Banner:
   - Card container with #F6F4F1 surface, hairline border #E7E3DD, 12px radius.
   - Title: "System Diagnostics"
   - Three status rows with badge pills:
     - "Notifications": [ Active (Green #DCF0E4) ]
     - "Exact Alarms": [ Enabled (Green #DCF0E4) ]
     - "Battery Saver": [ Optimized (Amber #FAF0C8) ]
2. Primary Action Button:
   - Button "Open Battery Optimization Settings" (#1F7A5C with white text, 48dp height, 8px radius).
   - Caption: "Disabling battery optimization prevents your phone from killing Gotit alarms in the background."
3. Device Manufacturer Guides (Accordion / Cards with brand icons):
   - Card 1: "Samsung (One UI)"
     - Step 1: Open Settings > Battery.
     - Step 2: Tap "Background usage limits".
     - Step 3: Add Gotit to "Never sleeping apps".
   - Card 2: "Xiaomi / Redmi (MIUI & HyperOS)"
     - Step 1: Long press Gotit app icon > App Info.
     - Step 2: Toggle ON "Autostart".
     - Step 3: Set Battery Saver to "No restrictions".
   - Card 3: "Huawei / Honor (EMUI)"
     - Step 1: Settings > Battery > App Launch.
     - Step 2: Set Gotit to "Manage manually" and allow background activity.
   - Card 4: "Google Pixel & Stock Android"
     - Step 1: Settings > Apps > Gotit > Battery > Select "Unrestricted".

Produce three frames:
1. English LTR - Light Mode.
2. Arabic RTL - Light Mode (Title: "دقة التنبيهات", full Arabic RTL layout).
3. English LTR - Dark Mode.
```

---

## Prompt 4: System Tray Notification & Lock Screen Card

**Screen Name**: `notification-tray-card`  
**Viewport**: Mobile Component Frame (390 x 240 dp)  
**Deliverables**: 3 visual notification card variants

### Prompt
```text
Design the visual appearance of Gotit Android notification cards as rendered in the Android notification shade and lock screen, strictly following DESIGN.md and Material 3 notification standards.

Variant 1: Due Date Reminder (Heads-up Notification)
- App Header: Small Gotit leaf/checkmark icon in #1F7A5C, app name "Gotit" in #5F5B54, timestamp "now".
- Notification Title: "Submit Physics Lab Report" (16px bold).
- Notification Body: "Due at 4:00 PM • University" (with soft lavender context tint pill).
- Action Buttons (Horizontal layout):
  - Action 1: [ Mark as Done ] (Green text #1F7A5C, checkmark icon).
  - Action 2: [ Snooze (15m) ] (Slate text #5F5B54, clock icon).

Variant 2: Start-Working Reminder
- App Header: "Gotit • now"
- Notification Title: "Start working on Build Presentation Deck"
- Notification Body: "Due in 45m (at 5:00 PM) • Work"
- Action Button: [ Mark as Done ]

Variant 3: Consolidated Missed Reminders (Reboot recovery)
- App Header: "Gotit • 3 missed reminders"
- Notification Body: "Physics Lab, Team Sync, Dentist Appointment. Tap to open Today view."
- No action buttons (tapping opens app).

Produce in Light and Dark system shade modes.
```

---

## Prompt 5: TaskCard with Reminder Bell Indicator

**Screen Name**: `task-card-reminder-badge`  
**Viewport**: Component Frame (358 x 88 dp)  
**Deliverables**: 2 states (Due reminder active, Effort start-working active)

### Prompt
```text
Design the updated Gotit TaskCard component showing the subtle reminder indicator, following DESIGN.md.

TaskCard Layout (Card with #FFFFFF surface, #E7E3DD hairline border, 8px radius):
- Leading: 24px circular checkbox in 48x48dp touch target.
- Middle:
  - Row 1: Task Title "Submit Physics Lab Report" (16px, medium weight, #1F1E1B).
  - Row 2: Metadata tags row:
    - Context tag: "University" in lavender tint (#E8E2F4 with #4B3A87 text).
    - Due time: "Today 4:00 PM" in #5F5B54.
    - New Reminder Tag: A subtle bell icon (#7D7972, 13px) with text "15m" in a small hairline pill (#F6F4F1 surface, 4px radius).
    - Effort tag: "45m" with timer icon.
- Trailing: Subtle chevron or more options.

Produce in English LTR and Arabic RTL.
```

---

## Review Checklist for Approved Screens

Before approving any generated screen:
- [ ] Matches the corresponding User Stories and Functional Requirements.
- [ ] Accent color `#1F7A5C` used only for confirmed actions, active toggles, and primary CTA.
- [ ] No forbidden effects: zero gradients, drop shadows, or decorative glows.
- [ ] All interactive buttons and touch targets are >= 48x48dp.
- [ ] Survives 200% system text scaling without truncation or overflow.
- [ ] Dark mode maintains the same warm minimal character with proper contrast (`#161513` canvas, `#22201C` surface).
- [ ] Arabic RTL layout correctly mirrors all icons, paddings, and alignment.
