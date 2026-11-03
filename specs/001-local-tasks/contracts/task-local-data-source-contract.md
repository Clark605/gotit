# Contract: TaskLocalDataSource

**File**: `lib/features/tasks/data/datasources/task_local_data_source.dart`

The local data source interacts directly with `AppDatabase` (Drift). All methods throw on error.

```dart
abstract class TaskLocalDataSource {
  /// Reactive stream of tasks eligible for the Today view.
  Stream<List<TaskModel>> watchTodayTasks();

  /// Reactive stream of tasks filtered by status and/or context.
  Stream<List<TaskModel>> watchTasks({
    TaskStatus? status,
    String? contextId,
  });

  /// Fetch task by ID.
  Future<TaskModel> getTaskById(String id);

  /// Insert task and its checklist items in a single transaction.
  Future<TaskModel> insertTask(TaskModel task);

  /// Update task fields and reconcile checklist items in a single transaction.
  Future<TaskModel> updateTask(TaskModel task);

  /// Toggle task status (open <-> completed).
  Future<TaskModel> toggleTaskStatus(String id);

  /// Mark task as soft-deleted (isDeleted = true).
  Future<void> softDeleteTask(String id);

  /// Toggle checklist item status.
  Future<ChecklistItemModel> toggleChecklistItem({
    required String taskId,
    required String itemId,
  });

  /// Watch all contexts.
  Stream<List<ContextModel>> watchContexts();

  /// Insert custom context.
  Future<ContextModel> insertContext(ContextModel context);

  /// Delete context and set context_id = null on all associated tasks.
  Future<void> deleteContext(String id);
}
```
