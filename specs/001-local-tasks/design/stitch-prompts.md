# Stitch Prompts: Local Foundation & Task Management (Phase 1)

> **IMPORTANT**: Always attach `DESIGN.md` (repository root) to every prompt when running in Stitch or Stitch MCP.

## Shared System Preface

Gotit is a calm, fast, automation-first task app designed mobile-first for Android (320-480dp width single column). The aesthetic is warm minimalism on a paper-toned canvas (`#FCFBF9`), with 1px hairline borders (`#E7E3DD`), restrained geometry (8px buttons, 12px cards, 20px sheet corners), and generous spacing. One deep green accent (`#1F7A5C`) is strictly reserved for confirmation moments (primary Save button, FAB, and completed checkmark). Soft pastel tints are used exclusively for context tags (Work: Sky, Home: Mint, Personal: Lavender, Custom: Peach/Rose/Yellow).

**Strict Design Rules**:
- **Zero Forbidden Effects**: NO gradients, NO glows, NO drop-shadows on flat cards, NO pill-shaped primary buttons, NO glassmorphism.
- **Strict Single Primary Button**: Exactly one primary accent green button per screen.
- **Touch Targets**: Minimum 48x48dp for all interactive elements.
- **Typography**: IBM Plex Sans Arabic (28px screen title, 22px sheet title, 16px body, 13px bold tags/headers). Line height >= 1.6 for body.
- **Dual Locale & RTL**: Designed as first-class citizens in both English (LTR) and Arabic (RTL), in Light and Dark themes.

---

## Screen 1: Today Screen (`TodayScreen`)

### Prompt:
```text
Design the primary Today screen for Gotit, a mobile task management application on Android (412x915dp).
Follow DESIGN.md strictly (paper canvas #FCFBF9, ink text #1F1E1B, hairline dividers #E7E3DD, accent green #1F7A5C).

Layout:
- Top bar: Shows the date in subtle steel caption ("Tuesday, Nov 3"), followed by a large bold screen title "Today" (28px semibold).
- List content grouped into 3 distinct sections separated by clean spacing:
  1. "Overdue · 1" section: Header text in warm amber warning color (#B45309). Contains 1 task row:
     - Checkbox: Unchecked 24px circular ring in hairline-strong (#CFCAC2).
     - Title: "Submit quarterly expense report" (16px semibold ink).
     - Metadata: Warning badge "Yesterday, 5:00 PM" in warm amber (#B45309), checklist counter "1/3", and a sky-tinted tag "Work".
  2. "Due Today · 2" section: Header text in steel caption-bold (#7D7972). Contains:
     - Task 1 (All-day task at the top): Unchecked circular ring, "Renew car insurance" (all-day badge, lavender tag "Personal").
     - Task 2 (Timed task): Unchecked circular ring, "Client strategy review", metadata "2:30 PM", mint tag "Home".
  3. "Start Today · 1" section: Header text in steel caption-bold. Contains 1 preparation task:
     - "Prepare presentation slides", metadata "Due Friday · ⏱️ 3 hrs effort", sky tag "Work".
- Floating Action Button (FAB): 56x56dp square with 12px rounded corners in accent green (#1F7A5C) with a white plus icon, positioned at bottom-right (bottom-left in RTL), 16dp above the bottom navigation.
- Bottom Navigation Bar: 64dp height with hairline top border. Two tabs: "Today" (calendar icon, highlighted in ink with small accent indicator) and "Tasks" (checklist icon, muted steel).

Produce:
- Frame 1: English LTR, Light Theme (populated state as described above).
- Frame 2: Arabic RTL, Light Theme (title "اليوم", headers "المتأخرة · ١", "اليوم · ٢", "البدء اليوم · ١", mirrored layout with checkboxes on the right and FAB on the left).
- Frame 3: Empty state in English Light Theme ("All clear for today. Take a breath or plan ahead." with a subtle single-color steel line illustration).
- Frame 4: English LTR, Dark Theme (Canvas #1C1B19, Surface #262522, Text #F1EFEC, Accent #4FBF98).
```

---

## Screen 2: All Tasks Screen (`AllTasksScreen`)

### Prompt:
```text
Design the All Tasks catalog screen for Gotit (412x915dp), matching DESIGN.md.

Layout:
- Top bar: Screen title "Tasks" (28px semibold ink).
- Horizontally scrollable context filter chips bar:
  - Active chip: "All" (ink fill #1F1E1B, white text, pill shape 36dp height).
  - Inactive chips: "Work" (with subtle sky dot), "Home" (mint dot), "Personal" (lavender dot), "Finance" (peach dot), and "+ New" ghost pill.
- Segmented status toggle control: Clean 36dp segmented pill bar with 3 segments: "Active" (selected, white surface with subtle shadow), "Completed", and "All".
- Task list:
  - Clean list of task rows separated by 1px hairline borders (#E7E3DD).
  - Include 3 active tasks and 1 completed task to show status contrast:
    - Active row: Unchecked 24px ring, title "Finalize design specifications", metadata "Nov 5 · Work".
    - Completed row: Filled accent green checkbox with white checkmark, title "Book dentist appointment" with strikethrough in muted text (#B5B0A8), metadata "Completed today · Personal".
- Floating Action Button (FAB): 56x56dp accent green button with plus icon at bottom-end.
- Bottom Navigation: "Tasks" tab active, "Today" tab inactive.

Produce:
- Frame 1: English LTR, Light Theme (Active filter with mixed tasks).
- Frame 2: English LTR, Light Theme with "Completed" filter selected (shows 3 completed tasks with strikethrough titles and filled green checks).
- Frame 3: Arabic RTL, Light Theme (Title "المهام", filters "الكل", "العمل", "المنزل", "شخصي", segmented tabs "النشطة", "المكتملة", "الكل", mirrored).
- Frame 4: English LTR, Dark Theme.
```

---

## Screen 3: Task Detail Screen (`TaskDetailScreen`)

### Prompt:
```text
Design the Task Detail screen for Gotit (412x915dp), adhering strictly to DESIGN.md.

Layout:
- Top app bar: Left back chevron (mirrored in RTL), right action icons: Edit icon (pencil) and Delete icon (trash can) in steel (#7D7972).
- Content layout (vertical scrolling):
  - Context Tag: Prominent sky-tinted pill "Work" (#DDEBF7 background, #1F4E79 text, 6px radius).
  - Title: Large 22px semibold ink title "Prepare Q4 Product Strategy Presentation" (wraps to 2 lines).
  - Schedule & Effort card: Surface background (#F6F4F1) with 8px radius:
    - Row 1: Calendar icon, "Thursday, Nov 12 at 10:00 AM" (14px slate).
    - Row 2: Clock icon, "Estimated effort: 2 hours" (14px slate).
  - Notes Section:
    - Section header "Notes" in caption-bold steel.
    - Clean body text on white surface: "Include user retention metrics from October and competitive breakdown for Q1 roadmap."
  - Checklist Section:
    - Header: "Checklist" with counter badge "2 of 4 completed" in body-sm.
    - 4 Checklist rows (48dp height each with hairline dividers):
      - Item 1: Checked accent green circle, "Review analytics dashboard" (strikethrough muted text).
      - Item 2: Checked accent green circle, "Draft executive summary slide" (strikethrough muted text).
      - Item 3: Unchecked circular ring, "Align with engineering lead on timeline" (body text ink).
      - Item 4: Unchecked circular ring, "Rehearse timing with Clark" (body text ink).
  - Metadata footer: "Created Nov 1 · Local storage" in 13px muted text.

Produce:
- Frame 1: English LTR, Light Theme.
- Frame 2: Arabic RTL, Light Theme (Title and checklist in Arabic, mirrored back button and icons).
- Frame 3: English LTR, Dark Theme.
```

---

## Screen 4: Task Form Sheet (Add / Edit Task Modal)

### Prompt:
```text
Design the modal bottom sheet for creating or editing a task in Gotit (412x915dp).
Follow DESIGN.md for bottom sheets (Surface Raised #FFFFFF, 20px top corners, level-2 shadow, 24px padding).

Layout:
- Top center drag handle (36x4dp rounded bar in hairline-strong #CFCAC2).
- Header row: Sheet title "New Task" (22px semibold ink) on the left, "Cancel" ghost button on the right.
- Form Fields (24dp vertical rhythm):
  1. Title Input: 48dp height, white fill, strong hairline border (#CFCAC2), 8px radius. Text: "Draft client proposal", focused with 2px accent green border (#1F7A5C).
  2. Date & Time Row: Surface pill showing "Tomorrow, 4:00 PM" with an X to clear, and an "All-day" toggle switch.
  3. Context Selector: Horizontal chip row ("Work" selected with sky tint border, "Home", "Personal", "+ Add").
  4. Effort Estimate: Quick selection chips: "15m", "30m", "1h" (selected in ink fill), "2h", "Custom".
  5. Notes Field: Multiline text area (3 visible lines) with placeholder "Add notes or details...".
  6. Checklist Section:
     - Row 1: Drag handle icon, text input "Scope deliverables", delete trash icon.
     - Row 2: Drag handle icon, text input "Estimate budget", delete trash icon.
     - "+ Add checklist item" ghost button row.
- Bottom Bar: Anchored primary button "Save Task" (48dp height, 8px radius, accent green fill #1F7A5C, white 15px medium text).

Produce:
- Frame 1: English LTR, Light Theme (Normal populated state).
- Frame 2: English LTR, Light Theme showing Title Validation Error (empty title, 2px red error border #C92A2A, inline error message "Title cannot be empty" in 13px caption red, Save button disabled in muted style).
- Frame 3: Arabic RTL, Light Theme (Title "مهمة جديدة", "حفظ المهمة", mirrored inputs and drag handles).
- Frame 4: English LTR, Dark Theme.
```

---

## Screen 5: Context Management Sheet (`ContextManagementSheet`)

### Prompt:
```text
Design the Context Management bottom sheet for Gotit (412x915dp), matching DESIGN.md.

Layout:
- Top center drag handle, 20px rounded top corners.
- Header: "Manage Contexts" (22px semibold ink), "Done" button on top-right.
- Current Contexts List:
  - "Work" (Sky tint tag, lock icon indicating default protected context, no delete icon).
  - "Home" (Mint tint tag, lock icon).
  - "Personal" (Lavender tint tag, lock icon).
  - "Biology 101" (Peach tint tag, trash can delete icon).
  - "Side Project" (Rose tint tag, trash can delete icon).
- Divider (1px hairline).
- "Add New Context" Form:
  - Text input: "Context name" (placeholder "e.g. Finance, Fitness").
  - Color Picker: Row of 6 pastel circles (Sky, Mint, Lavender, Peach, Rose, Yellow).
  - Primary button: "Add Context" (48dp height, 8px radius, accent green fill).

Produce:
- Frame 1: English LTR, Light Theme.
- Frame 2: Delete Confirmation Alert Modal over Frame 1 ("Delete 'Biology 101'? Tasks with this context will be kept and set to No Context." with "Cancel" and "Delete" buttons).
- Frame 3: Arabic RTL, Light Theme ("إدارة التصنيفات").
```

---

## Screen Approval & Review Checklist

Before approving screens into `specs/001-local-tasks/design/screens/`, verify:
- [ ] **Acceptance Scenarios**: Does Today view cleanly group Overdue, Due Today, and Start Today? Does All Tasks provide status filtering?
- [ ] **Accent Discipline**: Is the green accent (`#1F7A5C`) used *only* for primary actions, completion checkmarks, and selected indicators?
- [ ] **No Forbidden Effects**: Zero gradients, zero glows, zero pill primary buttons, zero heavy dropshadows on cards.
- [ ] **Touch Targets**: All checkboxes, buttons, chips, and drag handles are >= 48x48dp.
- [ ] **Typography**: IBM Plex Sans Arabic scale respected; body line height >= 1.6; titles wrap without truncation.
- [ ] **RTL Fidelity**: Chevrons mirrored; checkboxes and FAB on opposite sides; text alignment starts from right.
- [ ] **Dark Mode Integrity**: Surfaces use warm tones (`#1C1B19`, `#262522`), text `#F1EFEC`, accent `#4FBF98`.
