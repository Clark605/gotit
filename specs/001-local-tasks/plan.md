# Implementation Plan: Local Foundation & Task Management (Phase 1)

**Branch**: `001-local-tasks` | **Date**: 2026-11-03 | **Spec**: [specs/001-local-tasks/spec.md](spec.md)

**Input**: Feature specification from `/specs/001-local-tasks/spec.md`

## Summary

Phase 1 establishes the foundational local architecture for Gotit: a type-safe, reactive SQLite database powered by Drift (`lib/core/storage/app_database.dart`), complete local task and checklist CRUD operations with soft deletion, context categorization with protected defaults and case-insensitive uniqueness, and the primary Today view that automatically groups tasks into Overdue, Due Today, and Start Today (derived from `dueDate - effort`). All functionality is 100% offline-first, strictly adhering to the 8 Golden Rules and the Gotit Constitution.

## Technical Context

**Language/Version**: Dart 3.11+ / Flutter 3.41.1

**Primary Dependencies**: `flutter_bloc` (^9.1.1), `drift` (^2.24.2), `drift_flutter` (^0.2.4), `freezed_annotation` (^3.1.0), `injectable` (^3.0.0), `uuid` (^4.5.1)

**Storage**: Local SQLite via Drift (`AppDatabase`), with reactive queries, foreign keys (`ON DELETE SET NULL` for contexts, `ON DELETE CASCADE` for checklist items), and compound indexes

**Testing**: `flutter_test`, `bloc_test`, `drift/native.dart` in-memory database testing

**Target Platform**: Android (primary, SDK 26+) and cross-platform Flutter mobile

**Project Type**: Mobile Application (single codebase, feature-first architecture)

**Performance Goals**: Today view render in < 100ms (SC-002); task status toggle response in < 50ms (SC-004); task creation in < 15 seconds (SC-001)

**Constraints**: 100% offline capability (Principle III, SC-003); zero raw text sent to cloud; touch targets >= 48px; full English and Arabic (RTL) localization (Principle VIII); zero architecture violations

**Scale/Scope**: 3 core screens (`TodayScreen`, `AllTasksScreen`, `TaskDetailScreen`) + 1 modal form (`TaskFormSheet`); 3 entities (`Task`, `ChecklistItem`, `Context`); zero network calls

## Constitution Check

*GATE: Must pass before Phase 0 research. Re-check after Phase 1 design.*

| Principle / Gate | Requirement | Status | Verification / Justification |
|------------------|-------------|--------|------------------------------|
| **I. Purpose and Scope** | Traced directly to Gotit PRD v1; simpler solution wins | **PASS** | Implements PRD Section 6.1 (FR-3 manual add) & 6.3 (FR-11, FR-12 Today view). Scope cleanly bounded to local foundation. |
| **II. Absolute Privacy** | No raw text logged or uploaded; zero secrets in client | **PASS** | 100% local SQLite storage. No remote sync, no analytics logging of titles/notes, no client API keys. |
| **III. Local-First Data** | Drift database is source of truth; UI reads only local | **PASS** | UI reads exclusively from Drift streams via `TaskRepository`. Fully operational offline. |
| **IV. Reliable AI Extraction** | Task schema validation | **PASS** | N/A for Phase 1 (AI extraction starts Phase 3; Phase 1 defines the target schema). |
| **V. Resilient Reminders** | Reminders decoupled | **PASS** | Reminder scheduling decoupled to Phase 2 per PRD and spec assumptions. |
| **VI. Architecture Boundaries** | Template `lib/features/<name>/` structure; no domain layer; Freezed states with `LoadStatus`; thin screens | **PASS** | Implemented under `lib/features/tasks/` (`data/`, `cubit/`, `ui/`). Cubits depend on `TaskRepository` interface. States use Freezed with `LoadStatus`. |
| **VII. Code Quality & Testing** | Unit tests for date logic and schema; dependency hygiene | **PASS** | Dependencies `drift`, `drift_flutter`, `drift_dev`, `uuid` justified. Full test suite specified. |
| **VIII. Localization & A11y** | Dual locale (en + ar), RTL, >= 48px touch targets, design tokens | **PASS** | All copy in `app_en.arb` and `app_ar.arb`. RTL layout verified. Design tokens used throughout. |
| **IX. Git Workflow** | Feature branch, atomic commits, conventional messages | **PASS** | Developing on isolated branch `001-local-tasks`. |
| **X. Spec-Driven Lifecycle** | Specify -> Clarify -> Plan -> Tasks -> Implement | **PASS** | Follows Spec Kit sequence; 5 clarification questions resolved; plan artifacts generated. |
| **XI. Explainable Code** | Human comprehension | **PASS** | Simple, maintainable, idiomatic Dart/Flutter code. |

## Project Structure

### Documentation (`specs/001-local-tasks/`)

```text
specs/001-local-tasks/
├── spec.md              # Feature specification with 5 clarified decisions
├── plan.md              # This implementation plan
├── research.md          # Phase 0: Drift ORM, dynamic start time, and Today view sorting
├── data-model.md        # Phase 1: Drift tables, Freezed models, lifecycle states
├── quickstart.md        # Phase 1: Runnable end-to-end validation scenarios
├── contracts/           # Phase 1: Interfaces and contracts
│   ├── task-repository-contract.md
│   ├── task-local-data-source-contract.md
│   └── task-ui-contracts.md
└── tasks.md             # Phase 2 output (/speckit-tasks command)
```

### Source Code (`lib/`)

```text
lib/
├── core/
│   ├── routes/
│   │   ├── app_router.dart            # Register /today, /tasks, /task-detail
│   │   ├── route_names.dart           # Define today, allTasks, taskDetail routes
│   │   └── route_providers.dart       # Route providers assembly root
│   └── storage/
│       ├── app_database.dart          # Drift database: TasksTable, ContextsTable, ChecklistItemsTable
│       └── app_database.g.dart        # Generated Drift code
└── features/
    └── tasks/
        ├── data/
        │   ├── datasources/
        │   │   ├── task_local_data_source.dart        # Interface
        │   │   └── task_local_data_source_impl.dart   # Drift implementation
        │   ├── models/
        │   │   ├── checklist_item_model.dart          # Freezed model
        │   │   ├── context_model.dart                 # Freezed model
        │   │   └── task_model.dart                    # Freezed model
        │   └── repositories/
        │       ├── task_repository.dart               # Interface
        │       └── task_repository_impl.dart          # Implementation
        ├── cubit/
        │   ├── task_form_cubit.dart                   # Creation/edit Cubit
        │   ├── task_form_state.dart                   # Freezed state with LoadStatus
        │   ├── tasks_cubit.dart                       # Today view & All Tasks Cubit
        │   └── tasks_state.dart                       # Freezed state with LoadStatus
        └── ui/
            ├── all_tasks_screen.dart                  # All tasks with status & context filters
            ├── task_detail_args.dart                  # Typed navigation arguments
            ├── task_detail_screen.dart                # Task detail & checklist view
            ├── today_screen.dart                      # Primary Today screen (Overdue, Due Today, Start Today)
            └── widgets/
                ├── context_filter_bar.dart            # Context chips + add context
                ├── status_segmented_button.dart       # Active / Completed / All filter
                ├── task_card.dart                     # Reusable task item tile
                ├── task_form_sheet.dart               # Quick-add modal bottom sheet
                └── today_section_header.dart          # Localized section header with badge
```

## UI Design

The UI design has been reconciled and approved against the [DESIGN.md](../../DESIGN.md) system and Stitch Project `394000620935131887`. Approved visual mockups reside in `specs/001-local-tasks/design/screens/`.

### 1. Screen-to-Widget Breakdown

#### A. Today Screen (`TodayScreen`)
- **File**: `lib/features/tasks/ui/today_screen.dart`
- **State Management**: `TasksCubit` (`lib/features/tasks/cubit/tasks_cubit.dart`) listening to `TasksState.todayTasks`.
- **Widgets**:
  - `TodayAppBar`: Date caption ("Tuesday, Nov 3" / "الثلاثاء، ٣ نوفمبر"), screen title "Today" (28px semibold ink), search icon.
  - `TodaySectionHeader`: Localized header with item count (`Overdue` in warm amber `#B45309`, `Due Today`, `Start Today`).
  - `TaskCard`: Row widget with 24px circular checkbox in 48dp touch target, title (16px semibold, up to 3 lines), metadata badges (due time, effort estimate, checklist counter "1/3", pastel context tag), 1px hairline divider.
  - `EmptyStateWidget`: Single-color steel line illustration, guidance text ("All clear for today"), and "Add a task" button.
  - `AddButton`: 56x56dp square with 12px rounded corners in accent green (`#1F7A5C`) floating 16dp above bottom nav.
  - `BottomNavBar`: Persistent two-tab navigation ("Today" active with ink & accent dot, "Tasks" inactive).

#### B. All Tasks Screen (`AllTasksScreen`)
- **File**: `lib/features/tasks/ui/all_tasks_screen.dart`
- **State Management**: `TasksCubit` driving `TasksState.allTasks`, `selectedContextId`, and `selectedStatusFilter`.
- **Widgets**:
  - `TasksAppBar`: Title "Tasks" (28px semibold ink).
  - `ContextFilterBar`: Horizontally scrollable chip row ("All", "Work", "Home", "Personal", custom tags, "+ New").
  - `StatusSegmentedButton`: Segmented pill control (`Active`, `Completed`, `All`).
  - `TaskCard`: List of task rows. Completed tasks show filled accent green checkbox, strikethrough muted title, and completion date.
  - `DailyProgressBanner`: Optional progress card showing daily completion ratio (e.g. "1 of 4 completed (25%)").
  - `AddButton` & `BottomNavBar`.

#### C. Task Detail Screen (`TaskDetailScreen`)
- **File**: `lib/features/tasks/ui/task_detail_screen.dart`
- **Arguments**: `TaskDetailArgs` (`lib/features/tasks/ui/task_detail_args.dart`).
- **State Management**: `TasksCubit` for task data and status/checklist mutations.
- **Widgets**:
  - `TaskDetailAppBar`: Back chevron (mirrored in RTL), Edit pencil action, Delete trash action.
  - `ContextTag`: Prominent pastel pill tag with dark text.
  - `TaskScheduleCard`: Surface container (`#F6F4F1`) with calendar icon, due date/time, and effort estimate.
  - `TaskNotesCard`: Multiline body text container with markdown support.
  - `ChecklistSection`: Header with progress indicator ("2 of 4 completed"), followed by 48dp checklist item rows with independent circular checkboxes.
  - `DeleteTaskDialog`: Confirmation alert with "Cancel" and destructive "Delete" action.

#### D. Task Form Sheet (`TaskFormSheet`)
- **File**: `lib/features/tasks/ui/widgets/task_form_sheet.dart`
- **State Management**: `TaskFormCubit` (`lib/features/tasks/cubit/task_form_cubit.dart`) driving `TaskFormState`.
- **Widgets**:
  - `SheetDragHandle`: 20px top corners modal handle.
  - `TitleInputField`: Auto-focused text input (48dp height, 8px radius, strong hairline border, red error border on validation failure).
  - `ScheduleRow`: Date & time picker trigger, clear button, and All-day toggle switch.
  - `ContextSelectorChips`: Work, Home, Personal, custom, + Add chips.
  - `EffortEstimateChips`: Quick selection chips (`15m`, `30m`, `1h`, `2h`, `Custom`).
  - `NotesInputField`: Growing multiline input area.
  - `ChecklistEditor`: Dynamic reorderable list of subtasks with drag handles, text inputs, delete icons, and "+ Add checklist item" ghost row.
  - `SaveTaskButton`: 48dp accent green primary button anchored at bottom above keyboard.

#### E. Context Management Sheet (`ContextManagementSheet`)
- **File**: `lib/features/tasks/ui/widgets/context_management_sheet.dart`
- **State Management**: `TasksCubit` managing `TasksState.contexts`.
- **Widgets**:
  - `ContextsList`: Predefined contexts (Work, Home, Personal) locked with shield/lock icon; custom contexts with delete button.
  - `AddContextForm`: Name input with unique case-insensitive validation, pastel color palette picker row (Peach, Rose, Yellow, Sky, Mint, Lavender).
  - `DeleteContextDialog`: Warning modal confirming tasks will be preserved with context set to `No Context`.

---

### 2. Shared Widgets Inventory

The following reusable widgets will be built once under `lib/features/tasks/ui/widgets/` (or promoted to `lib/core/widgets/` when shared):
1. **`TaskCard`**: Reusable task list tile for Today and All Tasks screens.
2. **`ContextTag`**: Reusable pastel pill tag with high-contrast text.
3. **`TodaySectionHeader`**: Reusable section header with item count and overdue warning styling.
4. **`AddButton`**: 56dp square FAB with 12px corners in `#1F7A5C`.
5. **`BottomNavBar`**: 64dp persistent navigation bar with Today and Tasks tabs.
6. **`EmptyStateWidget`**: Reusable empty state view with line illustration and action button.
7. **`SnackbarWithUndo`**: Shared feedback snackbar with undo action.

---

### 3. Theme & Token Enforcement

- **Zero Hardcoded Values**: All styling must use centralized design tokens:
  - Colors: `AppColors.primary`, `AppColors.canvas` (`#FCFBF9`), `AppColors.surface`, `AppColors.hairline`, `AppColors.ink`, `AppColors.warning` (`#B45309`), `AppColors.error` (`#C92A2A`), and pastel context tints (`AppColors.tintSky`, etc.).
  - Spacing: `AppSpacing.xs` (8px), `AppSpacing.sm` (12px), `AppSpacing.md` (16px), `AppSpacing.xl` (24px).
  - Radii: `AppRadius.md` (8px), `AppRadius.lg` (12px), `AppRadius.xl` (20px), `AppRadius.full` (9999px).
  - Typography: `AppTypography` utilizing IBM Plex Sans Arabic with body line heights >= 1.6.

---

### 4. Test Plan (Golden & Widget Tests)

- **Golden Tests**: Each screen and interactive modal will have golden tests verified against the approved screenshots in `specs/001-local-tasks/design/screens/`:
  - `today_screen_golden_test.dart`: Light, Dark, Arabic RTL, and Empty state.
  - `all_tasks_screen_golden_test.dart`: Active filter, Completed filter, Dark, and Arabic RTL.
  - `task_detail_screen_golden_test.dart`: Light, Dark, and Arabic RTL.
  - `task_form_sheet_golden_test.dart`: Normal populated, Validation Error, Dark, and Arabic RTL.
  - `context_management_sheet_golden_test.dart`: Manage contexts list, Delete confirmation modal, and Arabic RTL.
  - **Golden Verification Gate**: Baseline goldens are accepted only after automated or visual comparison against the approved Stitch PNGs.
- **Widget & Unit Tests**:
  - `TasksCubitTest`: Stream subscription handling, Today view grouping/sorting, status toggle (<50ms), and context filtering.
  - `TaskFormCubitTest`: Input validation (empty title rejection), effort estimate selection, checklist management.
  - `Accessibility & RTL Test`: Verify touch targets >= 48dp, screen reader semantic labels, and zero layout overflow at 200% system text scale.

---

### 5. Design Deviations & Enhancements

- **Daily Momentum Progress Banner**: The approved Stitch design for All Tasks includes a subtle daily completion banner ("1 of 4 completed (25%)"). This is included as a non-intrusive progress affordance.
- **Flat Notebook Architecture**: Traditional elevated Material 3 card shadows are replaced with clean hairline borders (`#E7E3DD`) on a paper canvas (`#FCFBF9`) per `DESIGN.md`.

---

### 6. Constitution Check (UI Gate)

| Principle / Rule | Compliance Status | Verification |
|------------------|-------------------|--------------|
| **VIII. Localization & A11y** | **PASS** | Full Arabic RTL layout parity (mirrored checkboxes, left FAB, right text alignment); >= 48dp touch targets; dual `app_en.arb` / `app_ar.arb` copy; 200% text scale tolerance. |
| **VIII. Light & Dark Themes** | **PASS** | Centralized tokens; warm dark palette (`#1C1B19`, `#262522`, `#4FBF98`) matches character of light theme. |
| **VI. Thin Screens & DI** | **PASS** | Screens consume `TasksCubit` / `TaskFormCubit` via `BlocBuilder` and `context.read()`. Zero direct repository, data source, or DI imports in UI. |

## Complexity Tracking

> **Constitution Check passed with 0 violations. No complex deviations required.**

| Violation | Why Needed | Simpler Alternative Rejected Because |
|-----------|------------|-------------------------------------|
| *None* | *N/A* | *N/A* |
