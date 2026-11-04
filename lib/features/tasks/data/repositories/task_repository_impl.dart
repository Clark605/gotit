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
  static const _uuid = Uuid();

  TaskRepositoryImpl(this._dataSource);

  @override
  Stream<List<TaskModel>> watchTodayTasks() => _dataSource.watchTodayTasks();

  @override
  Stream<List<TaskModel>> watchTasks({TaskStatus? status, String? contextId}) =>
      _dataSource.watchTasks(status: status, contextId: contextId);

  @override
  Future<TaskModel> getTaskById(String id) => _dataSource.getTaskById(id);

  @override
  Future<TaskModel> createTask(TaskModel task) => _dataSource.insertTask(task);

  @override
  Future<TaskModel> updateTask(TaskModel task) => _dataSource.updateTask(task);

  @override
  Future<TaskModel> toggleTaskStatus(String id) =>
      _dataSource.toggleTaskStatus(id);

  @override
  Future<void> deleteTask(String id) => _dataSource.softDeleteTask(id);

  @override
  Future<ChecklistItemModel> toggleChecklistItem({
    required String taskId,
    required String itemId,
  }) => _dataSource.toggleChecklistItem(taskId: taskId, itemId: itemId);

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
