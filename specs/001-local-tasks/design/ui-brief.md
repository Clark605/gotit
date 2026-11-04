# UI Brief: Local Foundation & Task Management (Phase 1)

**Sources**: `specs/001-local-tasks/spec.md` (2026-11-03), `specs/001-local-tasks/plan.md` (2026-11-03), `DESIGN.md` (alpha), `specs/001-local-tasks/data-model.md` (2026-11-03).

---

## Screen Inventory

| # | Screen | Purpose | Spec Refs | Cubit / State (from Plan) |
|---|--------|---------|-----------|---------------------------|
| 1 | **Today Screen** (`TodayScreen`) | Focused daily dashboard grouping overdue, due today, and start today tasks | FR-003, SC-002, US2 | `TasksCubit` / `TasksState.todayTasks` |
| 2 | **All Tasks Screen** (`AllTasksScreen`) | Complete catalog filtered by context and status (Active/Completed/All) | FR-004, FR-008, US3, US4 | `TasksCubit` / `TasksState.allTasks` |
| 3 | **Task Detail Screen** (`TaskDetailScreen`) | In-depth view of task attributes, notes, and checklist progression | FR-005, FR-006, FR-007, US1, US3 | `TasksCubit` / `TaskModel` |
| 4 | **Task Form Sheet** (`TaskFormSheet`) | Fast modal form for manual task creation (<15s) and editing | FR-001, FR-006, FR-010, SC-001, US1 | `TaskFormCubit` / `TaskFormState` |
| 5 | **Contexts Dialog / Sheet** (`ContextManagementSheet`) | Add custom context categories, view protected defaults, and safe delete | FR-008, US4 | `TasksCubit` / `TasksState.contexts` |

---

## Shared Components

1. **`TaskCard` / `TaskRow`**:
   - Used by: `TodayScreen`, `AllTasksScreen`.
   - Layout: Minimum 56px height, 16px horizontal padding.
   - Elements: Leading 24px circular checkbox in 48px target; task title (16px semibold/medium, up to 3 lines); metadata line in 14px slate (due time, checklist progress e.g. "2/4", pastel context tag); 1px hairline divider between rows.
   - States: Default, Pressed/Selected (wash `{colors.accent-soft}`), Completed (accent checkmark, muted text, strikethrough).

2. **`SectionHeader`**:
   - Used by: `TodayScreen` (`Overdue`, `Due Today`, `Start Today`).
   - Layout: 13px bold in steel with item count; 20px top margin, 8px bottom margin.
   - Overdue variation: Uses warm amber `{colors.warning}`.

3. **`ContextTag`**:
   - Used by: `TaskRow`, `TaskDetailScreen`, `TaskFormSheet`.
   - Layout: Tint background paired with dark same-hue text, 6px radius, 13px bold.
   - Palette: Work (Sky), Home (Mint), Personal (Lavender), Custom (Peach, Rose, Yellow).

4. **`BottomNav`**:
   - Used by: `TodayScreen`, `AllTasksScreen`.
   - Destinations: "Today" (calendar-today icon) and "Tasks" (checklist icon).
   - Layout: 64px height, hairline top border, canvas background. Active item uses ink with accent pill indicator.

5. **`AddButton` (FAB)**:
   - Used by: `TodayScreen`, `AllTasksScreen`.
   - Layout: 56px square with 12px radius, accent green fill (`#1F7A5C`), white plus icon, 16px above bottom navigation at bottom-end corner.

6. **`EmptyStateWidget`**:
   - Used by: `TodayScreen`, `AllTasksScreen`.
   - Layout: Steel line illustration, 16px slate guidance text, primary button to add a task.

7. **`SnackbarWithUndo`**:
   - Used across all screens after deleting a task or custom context.
   - Layout: Ink background, canvas text, 8px radius, "Undo" button in accent-soft.

---

## Screen 1: Today Screen (`TodayScreen`)

- **Purpose & Entry/Exits**: Primary home screen launched on app open. Leads to `TaskDetailScreen` upon row tap, `TaskFormSheet` upon FAB tap, and `AllTasksScreen` via bottom navigation.
- **Content Shown**:
  - Top app bar: Localized date in caption steel (e.g. "Tuesday, Nov 3" / "الثلاثاء، ٣ نوفمبر"), large screen title "Today" / "اليوم" (28px semibold).
  - Grouped task list:
    - **Overdue Section** (only shown if overdue items exist): Warm amber header with count, overdue tasks displaying red/amber overdue timestamp.
    - **Due Today Section**: All-day tasks listed first (alphabetical), followed by time-specific tasks in chronological order.
    - **Start Today Section**: Preparation tasks due in the future whose `due_date - effort` is today or earlier.
- **Actions Available**:
  - Tap checkbox: Instantly completes task (<50ms) with 200ms check animation + 200ms row collapse.
  - Tap row: Navigates to `TaskDetailScreen`.
  - Tap FAB (+): Opens `TaskFormSheet`.
  - Swipe down: Pull-to-refresh (local DB sync check).
- **States**:
  - *Normal*: Tasks grouped across 1, 2, or 3 sections.
  - *Empty State*: No tasks due or overdue today. Shows calm line illustration with message: "All clear for today. Take a break or plan ahead."
  - *Midnight Roll*: Dynamic recalculation when calendar date advances past midnight.
- **Localization Notes**:
  - Full RTL layout in Arabic: FAB floats at bottom-left; checkboxes on right; text aligned right; numbers in Eastern Arabic numerals when app locale is Arabic.
- **Acceptance Scenarios Covered**: US2 (Scenarios 1, 2, 3, 4, 5), SC-002, SC-004, SC-005.

---

## Screen 2: All Tasks Screen (`AllTasksScreen`)

- **Purpose & Entry/Exits**: Comprehensive task catalog. Reached via bottom navigation tab "Tasks". Leads to `TaskDetailScreen` and `TaskFormSheet`.
- **Content Shown**:
  - App bar with title "Tasks" / "المهام".
  - Horizontally scrollable context filter chips: "All", "Work", "Home", "Personal", custom tags, "+ New Context".
  - Segmented status toggle: "Active", "Completed", "All".
  - Task list separated by hairline dividers.
- **Actions Available**:
  - Tap context chip: Filters tasks instantly by context.
  - Switch status toggle: Toggles between active tasks, completed tasks, and all tasks.
  - Tap checkbox on completed task: Reopens task back to active status immediately.
  - Tap "+ New Context": Opens `ContextManagementSheet`.
  - Tap FAB: Opens `TaskFormSheet` prefilled with selected context.
- **States**:
  - *Active filter*: Lists open tasks.
  - *Completed filter*: Lists finished tasks with strikethrough styling and completed timestamps.
  - *Empty filter*: "No tasks in this context."
- **Localization Notes**:
  - Filter chips scroll horizontally in RTL starting from right edge.
- **Acceptance Scenarios Covered**: US3 (Scenario 5), US4 (Scenarios 1, 2), FR-004, FR-008.

---

## Screen 3: Task Detail Screen (`TaskDetailScreen`)

- **Purpose & Entry/Exits**: Comprehensive view of task details and checklist sub-steps. Reached by tapping any task row. Exits via back chevron.
- **Content Shown**:
  - App bar with Back button, Edit action button (pencil), and Delete action button (trash).
  - Context tag pill with icon.
  - Large task title (22px semibold ink).
  - Due date & time badge (with clock/calendar icon) or "All-day" badge.
  - Effort estimate indicator (e.g. "⏱️ 1 hr 30 mins").
  - Notes card: Clean multiline body text on surface background.
  - Checklist section:
    - Header: "Checklist" with progress indicator ("2 of 4").
    - Checklist items: 48px rows with circular check control, text content.
- **Actions Available**:
  - Tap checklist item check: Checks/unchecks individual sub-item independently of main task status (FR-005).
  - Tap Edit: Opens `TaskFormSheet` pre-populated with task data.
  - Tap Delete: Prompts delete confirmation dialog ("Delete this task?"). On confirm, soft-deletes task, returns to previous screen, and displays Snackbar with Undo.
- **Acceptance Scenarios Covered**: US1 (Scenario 2), US3 (Scenarios 1, 3, 4), FR-005, FR-006, FR-007.

---

## Screen 4: Task Form Sheet (`TaskFormSheet`)

- **Purpose & Entry/Exits**: Fast task creation and editing modal bottom sheet.
- **Content Shown**:
  - Top grab handle, sheet title ("New Task" / "مهمة جديدة" or "Edit Task"), Cancel ghost button.
  - Title input field: 48px height, auto-focused, strong hairline border, 8px radius.
  - Date & Time trigger row: shows selected date or "Add due date", with all-day switch.
  - Context chip selector: single-select pills for Work, Home, Personal, custom, + New.
  - Effort estimate selector: quick chips (`15m`, `30m`, `1h`, `2h`, `Custom`).
  - Notes field: multiline input that grows with content.
  - Checklist editor: dynamic list of checklist rows with drag handle, text field, remove button, and "+ Add item" ghost button.
  - Primary button: "Save" (Accent green, 48px tall, 8px radius), anchored at the bottom above the keyboard.
- **Validation & Errors**:
  - Empty title validation: Shows inline error message in red `{colors.error}` below field and disables submission.
- **Localization Notes**:
  - RTL inputs: Text direction matches user typing language (Arabic or English).
- **Acceptance Scenarios Covered**: US1 (Scenarios 1, 2, 3), FR-001, FR-010, SC-001.

---

## Screen 5: Context Management Sheet (`ContextManagementSheet`)

- **Purpose & Entry/Exits**: Modal bottom sheet for creating and managing custom contexts.
- **Content Shown**:
  - Sheet title: "Contexts" / "التصنيفات".
  - Existing contexts list:
    - Predefined defaults (`Work`, `Home`, `Personal`) marked with lock icon ("Default").
    - Custom contexts with delete action button.
  - "Add Context" form section:
    - Name text input with placeholder ("e.g. Finance, Health").
    - Pastel color palette selector (Peach, Rose, Yellow, Sky, Mint, Lavender).
    - Save button.
- **Validation**:
  - Case-insensitive unique validation: Entering "work" or existing custom name displays error: `"Context already exists"`.
- **Delete Warning**:
  - Tapping delete on a custom context shows alert: `"Delete context? Associated tasks will be kept and set to No Context."`
- **Acceptance Scenarios Covered**: US4 (Scenarios 2, 3, 4), FR-008.

---

## Open Questions

*None. All 5 critical questions were resolved during `/speckit-clarify` and integrated into `spec.md` and `plan.md`.*
