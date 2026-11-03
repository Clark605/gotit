# Feature Specification: Local Foundation & Task Management

**Feature Branch**: `app-init`

**Created**: 2026-11-03

**Status**: Draft

**Input**: User description: "Divide the project into phases to build the features: Phase 1 Local Foundation & Task Management, including local database schema, task CRUD, and the Today view."

## User Scenarios & Testing *(mandatory)*

### User Story 1 - Create and View Tasks Manually (Priority: P1)

As a user tracking my commitments, I want to create a task with a title, due date, context, notes, and checklist items so that I have a clean, organized record of what I need to do.

**Why this priority**: Essential core capability. Without the ability to store, view, and persist tasks locally, no other feature (reminders, AI capture, sync) can function.

**Independent Test**: Can be fully tested by opening the application offline, tapping the add task button, entering a task with title, date, notes, and checklist items, saving it, and verifying it persists across app restarts.

**Acceptance Scenarios**:

1. **Given** the user is on the main tasks screen, **When** they tap the add task action, enter a title "Submit assignment", set a due date, and save, **Then** the task appears in the task list immediately.
2. **Given** a user creating a task, **When** they add multiple checklist items (e.g. "Draft intro", "Add references"), **Then** all checklist items are saved with the task and displayed in order.
3. **Given** the app is completely offline (Airplane mode), **When** a user creates or modifies a task, **Then** the operation completes instantly without network errors or delays.

---

### User Story 2 - Prioritized Today View (Priority: P2)

As a busy student or professional opening the app, I want to see a focused Today view that groups what is overdue, what is due today, and what I should start today, so that I immediately know my top priorities without sorting through all tasks.

**Why this priority**: Core value proposition from the Gotit PRD. Gives users immediate clarity on their daily commitments upon launching the app.

**Independent Test**: Can be fully tested by creating tasks with dates in the past, today, and future, then navigating to Today view and verifying tasks are automatically grouped and sorted by urgency.

**Acceptance Scenarios**:

1. **Given** tasks with due dates in the past that are not marked done, **When** the user views the Today screen, **Then** these tasks appear under an "Overdue" section at the top of the list.
2. **Given** tasks scheduled for the current calendar day, **When** the user views the Today screen, **Then** these tasks appear under a "Due Today" section.
3. **Given** tasks with an effort lead-time scheduled to begin today, **When** the user views the Today screen, **Then** these tasks appear under a "Start Today" section.
4. **Given** an overdue task, **When** the user marks it completed, **Then** it is immediately removed from the active Today view.

---

### User Story 3 - Task Status Toggling, Checklist Progression & Editing (Priority: P3)

As a user working through my tasks, I want to check off checklist items, mark tasks complete with one tap, or edit task details when plans change, so that my task list always reflects reality.

**Why this priority**: Everyday lifecycle management of tasks. Users must be able to update and progress their commitments.

**Independent Test**: Can be fully tested by tapping a task completion checkbox to mark it done, checking individual checklist items, and opening a task to edit its title and context.

**Acceptance Scenarios**:

1. **Given** an open task with checklist items, **When** the user checks off a checklist item, **Then** the checklist item reflects completed state while the main task remains open.
2. **Given** an open task, **When** the user taps the task completion control, **Then** the task status transitions to completed.
3. **Given** an existing task, **When** the user edits the title or context and saves, **Then** the updated values are reflected across all views immediately.
4. **Given** an existing task, **When** the user deletes the task, **Then** it is removed from active views.

---

### User Story 4 - Categorization by Contexts (Priority: P4)

As a user with diverse commitments, I want to categorize tasks into contexts (Work, Home, Personal, or custom labels) and filter by context, so that I can focus on one domain at a time.

**Why this priority**: Enhances organization for users balancing school, work, and personal commitments as detailed in target user personas.

**Independent Test**: Can be fully tested by assigning different contexts to tasks and filtering the task list by context.

**Acceptance Scenarios**:

1. **Given** a set of tasks across Work and Personal contexts, **When** the user selects the "Work" filter, **Then** only tasks categorized as Work are displayed.
2. **Given** a user creating or editing a task, **When** they create a new custom context label, **Then** the custom context is saved and available for future tasks.

---

### Edge Cases

- **Empty Title Validation**: When a user attempts to save a task without a title, the system displays an inline validation message and prevents submission.
- **Unscheduled Tasks (No Due Date)**: Tasks created without a due date are displayed in the general task list and context lists, but excluded from time-bound sections of the Today view.
- **Timezone and Midnight Roll**: When the calendar date advances past midnight while the app is active, the Today view dynamically recalculates Overdue and Due Today groupings.
- **Right-to-Left (RTL) Layout in Arabic**: When the device or app language is set to Arabic, task titles, notes, context labels, and checklist items align correctly according to RTL typography standards without text clipping or UI inversion.
- **Deleted Task Handling**: Deleted tasks are flagged with a soft-delete status locally so that subsequent cloud synchronization can resolve removals gracefully.

## Requirements *(mandatory)*

### Functional Requirements

- **FR-001**: System MUST allow users to manually create tasks with a mandatory title, optional due date and time (or all-day flag), context category, notes, checklist items, and optional effort estimate.
- **FR-002**: System MUST persist all tasks, checklist items, and contexts on the local device, ensuring all viewing and editing operations function fully offline.
- **FR-003**: System MUST provide a Today view that automatically groups tasks into Overdue, Due Today, and Start Today, ordered chronologically by urgency.
- **FR-004**: System MUST allow users to mark a task as completed or reopen a completed task with a single interaction.
- **FR-005**: System MUST allow users to check off individual checklist items independently of the overall task status.
- **FR-006**: System MUST allow users to edit all attributes of an existing task (title, due date, context, notes, checklist items).
- **FR-007**: System MUST allow users to delete tasks, applying a local soft-delete flag and immediately removing them from active views.
- **FR-008**: System MUST provide standard predefined contexts (Work, Home, Personal) and support user-defined custom context labels.
- **FR-009**: System MUST support full Right-to-Left (RTL) and Left-to-Right (LTR) bidirectional text rendering and interface layouts in both English and Arabic.
- **FR-010**: System MUST validate input to ensure a task title contains at least one non-whitespace character before saving.

### Key Entities *(include if feature involves data)*

- **Task**: The central commitment entity. Attributes include: unique local identifier, title (text), status (open, completed), due date/time (timestamp or null), all-day indicator (boolean), context label (string), notes (text), effort estimate in minutes (integer or null), source excerpt (text or null), creation timestamp, updated timestamp, and soft-delete flag.
- **ChecklistItem**: An actionable sub-step of a task. Attributes include: unique local identifier, parent task identifier, content (text), completion status (boolean), display order index (integer), and updated timestamp.
- **Context**: A domain or category tag. Attributes include: unique identifier, label/name (text), display icon/color identifier, and is-default indicator (boolean).

## Success Criteria *(mandatory)*

### Measurable Outcomes

- **SC-001**: Users can create and save a new manual task with title, due date, and context in under 15 seconds.
- **SC-002**: The Today view renders its grouped sections in under 100 milliseconds from local storage upon screen presentation.
- **SC-003**: 100% of task creation, editing, checklist completion, and viewing operations succeed with zero network connectivity.
- **SC-004**: Task status transitions (marking complete or incomplete) update the UI in under 50 milliseconds.
- **SC-005**: All user-facing text and controls render without visual clipping or alignment errors in both English (LTR) and Arabic (RTL).

## Assumptions

- **Local-First Baseline**: In this phase (Phase 1), tasks and contexts are persisted strictly in the local device database as the single source of truth; network synchronization will be layered in Phase 5.
- **Reminders Decoupled**: Notification alarm scheduling logic will be implemented in Phase 2; in Phase 1, due dates and times are stored and displayed without triggering operating system notifications.
- **Default Contexts**: System seeds standard default contexts (Work, Home, Personal) on first launch.
- **Template Transition**: Completion of this feature will replace the starter template's temporary example feature and establish the Today screen as the primary application home screen.
