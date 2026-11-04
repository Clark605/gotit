import 'package:gotit/features/tasks/data/models/checklist_item_model.dart';
import 'package:gotit/features/tasks/data/models/context_model.dart';
import 'package:gotit/features/tasks/data/models/task_model.dart';

abstract class TaskRepository {
  /// Stream of active tasks categorized for the Today view.
  Stream<List<TaskModel>> watchTodayTasks();

  /// Stream of all tasks, optionally filtered by status and context.
  Stream<List<TaskModel>> watchTasks({TaskStatus? status, String? contextId});

  /// Retrieve a single task by ID with its checklist items.
  Future<TaskModel> getTaskById(String id);

  /// Create a new task along with its checklist items.
  Future<TaskModel> createTask(TaskModel task);

  /// Update an existing task and synchronize its checklist items.
  Future<TaskModel> updateTask(TaskModel task);

  /// Toggle task completion status between open and completed.
  Future<TaskModel> toggleTaskStatus(String id);

  /// Soft-delete a task.
  Future<void> deleteTask(String id);

  /// Toggle completion of a specific checklist item.
  Future<ChecklistItemModel> toggleChecklistItem({
    required String taskId,
    required String itemId,
  });

  /// Retrieve all available contexts (defaults + custom).
  Stream<List<ContextModel>> watchContexts();

  /// Create a new custom context (rejects duplicates case-insensitively).
  Future<ContextModel> createContext({
    required String name,
    String? icon,
    int? colorValue,
  });

  /// Delete a custom context (sets contextId to null on associated tasks).
  Future<void> deleteContext(String id);
}
