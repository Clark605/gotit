# Contract: UI, Routes & Cubits

**Directory**: `lib/features/tasks/`

## 1. Routes & Navigation Arguments

### Route Names (`lib/core/routes/route_names.dart`)
- `RouteNames.today = '/today'` (Primary home screen)
- `RouteNames.allTasks = '/tasks'` (All tasks screen with context & status filters)
- `RouteNames.taskDetail = '/task-detail'` (Task detail screen)

### Navigation Arguments (`lib/features/tasks/ui/task_detail_args.dart`)
```dart
class TaskDetailArgs {
  final String taskId;
  const TaskDetailArgs({required this.taskId});
}
```

---

## 2. Cubits & States

### 2.1 `TasksCubit` (`lib/features/tasks/cubit/tasks_cubit.dart`)
Controls the Today view and All Tasks list, handling stream subscriptions, context filtering, and quick completions.

```dart
@injectable
class TasksCubit extends BaseCubit<TasksState> {
  final TaskRepository _repository;

  TasksCubit(this._repository) : super(const TasksState());

  void initSubscriptions();
  void setContextFilter(String? contextId);
  void setStatusFilter(TaskStatus? status);
  Future<void> toggleTaskStatus(String id);
  Future<void> toggleChecklistItem({required String taskId, required String itemId});
  Future<void> deleteTask(String id);
  Future<void> addCustomContext({required String name, String? icon, int? colorValue});
  Future<void> deleteCustomContext(String contextId);
}
```

#### `TasksState` (`lib/features/tasks/cubit/tasks_state.dart`)
```dart
@freezed
abstract class TasksState with _$TasksState {
  const factory TasksState({
    @Default(LoadStatus.initial) LoadStatus status,
    @Default(<TaskModel>[]) List<TaskModel> todayTasks,
    @Default(<TaskModel>[]) List<TaskModel> allTasks,
    @Default(<ContextModel>[]) List<ContextModel> contexts,
    String? selectedContextId,
    TaskStatus? selectedStatusFilter,
    Failure? failure,
  }) = _TasksState;
}
```

### 2.2 `TaskFormCubit` (`lib/features/tasks/cubit/task_form_cubit.dart`)
Handles manual task creation and editing bottom sheets/modals with input validation.

```dart
@injectable
class TaskFormCubit extends BaseCubit<TaskFormState> {
  final TaskRepository _repository;

  TaskFormCubit(this._repository) : super(const TaskFormState());

  void initializeForEdit(TaskModel task);
  void updateTitle(String title);
  void updateDueDate(DateTime? date, {bool isAllDay = false});
  void updateContext(String? contextId);
  void updateNotes(String notes);
  void updateEffortMinutes(int? minutes);
  void addChecklistItem(String content);
  void removeChecklistItem(int index);
  void updateChecklistItem(int index, String content);
  Future<bool> save();
}
```

#### `TaskFormState` (`lib/features/tasks/cubit/task_form_state.dart`)
```dart
@freezed
abstract class TaskFormState with _$TaskFormState {
  const factory TaskFormState({
    @Default(LoadStatus.initial) LoadStatus status,
    String? taskId,
    @Default('') String title,
    DateTime? dueDate,
    @Default(false) bool isAllDay,
    String? contextId,
    @Default('') String notes,
    int? effortMinutes,
    @Default(<String>[]) List<String> checklistDrafts,
    String? titleError,
    Failure? failure,
  }) = _TaskFormState;
}
```

---

## 3. UI Screens & Modals

1. **`TodayScreen` (`lib/features/tasks/ui/today_screen.dart`)**:
   - Header with current date (localized in English/Arabic) and quick filter chip bar.
   - Grouped sections:
     - `OverdueSection`: Red badge indicator; only visible if overdue tasks exist.
     - `DueTodaySection`: Tasks due today (all-day first, then chronologically).
     - `StartTodaySection`: Preparation tasks whose `dueDate - effort` is today or earlier.
   - Floating Action Button (FAB) or bottom bar to trigger `TaskFormSheet`.

2. **`AllTasksScreen` (`lib/features/tasks/ui/all_tasks_screen.dart`)**:
   - Filter chips for Context (All, Work, Home, Personal, custom contexts, + Add Context).
   - Segmented button / tabs for Status (Active, Completed, All).
   - Tapping completion checkbox toggles status in real-time.

3. **`TaskDetailScreen` (`lib/features/tasks/ui/task_detail_screen.dart`)**:
   - Full view of title, context, due date/time, effort, notes, and checklist items.
   - Interactive checklist checkboxes.
   - Edit button (opens `TaskFormSheet`) and Delete button with confirmation dialog.

4. **`TaskFormSheet` (`lib/features/tasks/ui/widgets/task_form_sheet.dart`)**:
   - Modal bottom sheet for fast task entry (< 15 seconds).
   - Auto-focused title input, due date/time picker, context selector, effort estimate chip picker (15m, 30m, 1h, 2h, custom), and dynamic checklist item inputs.
