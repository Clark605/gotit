import 'package:gotit/core/services/reminder_service.dart';
import 'package:gotit/features/tasks/data/datasources/task_local_data_source.dart';
import 'package:gotit/features/tasks/data/models/checklist_item_model.dart';
import 'package:gotit/features/tasks/data/models/context_model.dart';
import 'package:gotit/features/tasks/data/models/task_model.dart';
import 'package:gotit/features/tasks/data/repositories/task_repository.dart';
import 'package:injectable/injectable.dart';
import 'package:uuid/uuid.dart';

@LazySingleton(as: TaskRepository)
class TaskRepositoryImpl implements TaskRepository {
  final TaskLocalDataSource _dataSource;
  final IReminderService? _reminderService;
  static const _uuid = Uuid();

  TaskRepositoryImpl(
    this._dataSource, [
    this._reminderService,
  ]);

  @override
  Stream<List<TaskModel>> watchTodayTasks() => _dataSource.watchTodayTasks();

  @override
  Stream<List<TaskModel>> watchTasks({TaskStatus? status, String? contextId}) =>
      _dataSource.watchTasks(status: status, contextId: contextId);

  @override
  Future<TaskModel> getTaskById(String id) => _dataSource.getTaskById(id);

  @override
  Future<TaskModel> createTask(TaskModel task) async {
    final created = await _dataSource.insertTask(task);
    await _syncReminders(created);
    return created;
  }

  @override
  Future<TaskModel> updateTask(TaskModel task) async {
    final updated = await _dataSource.updateTask(task);
    await _syncReminders(updated);
    return updated;
  }

  @override
  Future<TaskModel> toggleTaskStatus(String id) async {
    final toggled = await _dataSource.toggleTaskStatus(id);
    if (toggled.status == TaskStatus.completed) {
      await _reminderService?.cancelForTask(id);
    } else {
      await _syncReminders(toggled);
    }
    return toggled;
  }

  @override
  Future<void> deleteTask(String id) async {
    await _reminderService?.cancelForTask(id);
    await _dataSource.softDeleteTask(id);
  }

  Future<void> _syncReminders(TaskModel task) async {
    if (_reminderService == null) return;
    await _reminderService.syncReminderSchedule(
      TaskReminderSchedule(
        taskId: task.id,
        title: task.title,
        dueDate: task.dueDate,
        isAllDay: task.isAllDay,
        isReminderEnabled: task.isReminderEnabled,
        reminderLeadMinutes: task.reminderLeadMinutes,
        allDayReminderTime: task.allDayReminderTime,
        effortMinutes: task.effortMinutes,
      ),
    );
  }

  @override
  Future<ChecklistItemModel> toggleChecklistItem({
    required String taskId,
    required String itemId,
  }) =>
      _dataSource.toggleChecklistItem(taskId: taskId, itemId: itemId);

  @override
  Stream<List<ContextModel>> watchContexts() => _dataSource.watchContexts();

  @override
  Future<ContextModel> createContext({
    required String name,
    String? icon,
    int? colorValue,
  }) {
    final now = DateTime.now();
    final newContext = ContextModel(
      id: _uuid.v4(),
      name: name.trim(),
      icon: icon,
      colorValue: colorValue,
      isDefault: false,
      createdAt: now,
      updatedAt: now,
    );
    return _dataSource.insertContext(newContext);
  }

  @override
  Future<void> deleteContext(String id) => _dataSource.deleteContext(id);
}
