# Quickstart & Validation Guide: Local Foundation & Task Management

**Feature**: `specs/001-local-tasks` | **Date**: 2026-11-03

This guide provides runnable scenarios to validate Phase 1 end-to-end against the [Feature Specification](spec.md) and [Constitution](../../.specify/memory/constitution.md).

---

## 1. Prerequisites & Setup

1. **Install Dependencies**:
   Ensure `drift`, `drift_flutter`, and `drift_dev` are added in `pubspec.yaml`, then run:
   ```bash
   flutter pub get
   ```

2. **Generate Code**:
   Run build runner to produce Drift database code (`app_database.g.dart`), Freezed models, and DI registrations:
   ```bash
   dart run build_runner build --delete-conflicting-outputs
   ```

3. **Verify Lint & Architecture Compliance**:
   ```bash
   flutter analyze
   dart run tool/check_architecture.dart
   ```

---

## 2. Automated Test Execution

Execute unit, repository, and widget test suites:

```bash
# Run all unit and widget tests
flutter test

# Specifically test Drift database and repository CRUD operations
flutter test test/features/tasks/data/repositories/task_repository_test.dart

# Specifically test Today view grouping and sorting logic
flutter test test/features/tasks/cubit/tasks_cubit_test.dart

# Specifically test RTL and localized rendering
flutter test test/features/tasks/ui/today_screen_test.dart
```

---

## 3. End-to-End Validation Scenarios

### Scenario 1: Offline Task Creation & Persistence (FR-001, FR-002, SC-001)
1. Launch app in Airplane Mode (or with network disconnected):
   ```bash
   flutter run --flavor dev --dart-define-from-file=env/dev.json
   ```
2. Tap the Add Task (+) button on the Today view.
3. Enter title `"Submit research paper"`, select context `"Work"`, pick tomorrow's date with a 2-hour effort estimate, and add two checklist items (`"Verify citations"`, `"Export PDF"`).
4. Tap Save.
5. **Expected Outcome**: Task immediately appears in local storage. Close and restart the app; the task and its checklist items persist without data loss.

### Scenario 2: Today View Grouping & Sorting (FR-003, SC-002)
1. Create four tasks:
   - Task A: Due yesterday, active (Overdue).
   - Task B: Due today at 3:00 PM (Due Today, timed).
   - Task C: Due today, all-day (Due Today, all-day).
   - Task D: Due tomorrow at 10:00 AM with effort estimate of 180 minutes (Start Today).
2. Open the Today screen.
3. **Expected Outcome**:
   - `Overdue` section lists Task A.
   - `Due Today` section lists Task C first (all-day), then Task B (timed).
   - `Start Today` section lists Task D (due tomorrow, but preparation starts today).
   - Grouping renders in < 100ms.

### Scenario 3: Task Status Toggle & All Tasks Filtering (FR-004, SC-004)
1. On the Today screen, tap the checkbox next to Task A (Overdue).
2. **Expected Outcome**: Task A vanishes immediately from Today view (< 50ms).
3. Navigate to the `All Tasks` screen and select the `"Completed"` filter.
4. **Expected Outcome**: Task A appears in the completed list. Tap the checkbox to reopen it; it instantly transitions back to active and reappears in the Today view.

### Scenario 4: Context Lifecycle & Safe Unassign (FR-008)
1. On the All Tasks screen, tap `+ Add Context` and enter `"Bio-101"`.
2. Assign `"Bio-101"` to a newly created task `"Read chapter 4"`.
3. Attempt to add another context named `"bio-101"` (different case).
   - **Expected Outcome**: Inline validation error `"Context already exists"` prevents saving.
4. Delete the custom context `"Bio-101"`.
   - **Expected Outcome**: Default contexts (`Work`, `Home`, `Personal`) remain protected. The task `"Read chapter 4"` is preserved intact with its context set to `"No Context"` (`null`).

### Scenario 5: Arabic RTL & Scaled Text Verification (FR-009, SC-005)
1. In device settings (or app settings), switch locale to Arabic (`ar`).
2. Verify Today view and Task Form sheet.
3. **Expected Outcome**:
   - Layout is fully flipped for RTL (leading checkboxes align to right, text aligns right).
   - Section headers (اليوم, المتأخرة, البدء اليوم) display appropriate Arabic translations from `app_ar.arb`.
   - No text overflow or clipping when system font size is set to large (1.5x scaling).
