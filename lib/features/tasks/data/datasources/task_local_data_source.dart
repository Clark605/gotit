import 'package:gotit/features/tasks/data/models/checklist_item_model.dart';
import 'package:gotit/features/tasks/data/models/context_model.dart';
import 'package:gotit/features/tasks/data/models/reminder_model.dart';
import 'package:gotit/features/tasks/data/models/task_model.dart';

abstract class TaskLocalDataSource {
  /// Reactive stream of tasks eligible for the Today view.
  Stream<List<TaskModel>> watchTodayTasks();

  /// Reactive stream of tasks filtered by status and/or context.
  Stream<List<TaskModel>> watchTasks({TaskStatus? status, String? contextId});

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

  /// Insert or replace reminder.
  Future<void> insertReminder({
    required String id,
    required String taskId,
    required String type,
    required DateTime scheduledTime,
    required int leadTimeMinutes,
    required int notificationId,
  });

  /// Get all reminders for a task.
  Future<List<ReminderModel>> getRemindersForTask(String taskId);

  /// Update reminder status ('pending', 'fired', 'cancelled', 'dismissed').
  Future<void> updateReminderStatus(String id, String status);

  /// Delete all reminders for a task.
  Future<void> deleteRemindersForTask(String taskId);
}
