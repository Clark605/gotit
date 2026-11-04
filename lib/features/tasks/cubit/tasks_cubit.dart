import 'dart:async';
import 'package:gotit/core/cubit/base_cubit.dart';
import 'package:gotit/core/errors/failure.dart';
import 'package:gotit/core/utils/load_status.dart';
import 'package:gotit/features/tasks/cubit/tasks_state.dart';
import 'package:gotit/features/tasks/data/models/context_model.dart';
import 'package:gotit/features/tasks/data/models/task_model.dart';
import 'package:gotit/features/tasks/data/repositories/task_repository.dart';
import 'package:injectable/injectable.dart';

@injectable
class TasksCubit extends BaseCubit<TasksState> {
  final TaskRepository _repository;

  StreamSubscription<List<TaskModel>>? _todaySub;
  StreamSubscription<List<TaskModel>>? _allTasksSub;
  StreamSubscription<List<ContextModel>>? _contextsSub;

  TasksCubit(this._repository) : super(const TasksState());

  void initSubscriptions() {
    emit(state.copyWith(status: LoadStatus.loading, failure: null));

    _todaySub?.cancel();
    _todaySub = _repository.watchTodayTasks().listen(
      (tasks) {
        emit(
          state.copyWith(
            status: LoadStatus.success,
            todayTasks: tasks,
            failure: null,
          ),
        );
      },
      onError: (err) {
        emit(
          state.copyWith(
            status: LoadStatus.failure,
            failure: Failure.unknown(originalError: err),
          ),
        );
      },
    );

    _subscribeToAllTasks();

    _contextsSub?.cancel();
    _contextsSub = _repository.watchContexts().listen((contexts) {
      emit(state.copyWith(contexts: contexts));
    }, onError: (_) {});
  }

  void _subscribeToAllTasks() {
    _allTasksSub?.cancel();
    _allTasksSub = _repository
        .watchTasks(
          status: state.selectedStatusFilter,
          contextId: state.selectedContextId,
        )
        .listen(
          (tasks) {
            emit(
              state.copyWith(
                status: LoadStatus.success,
                allTasks: tasks,
                failure: null,
              ),
            );
          },
          onError: (err) {
            emit(
              state.copyWith(
                status: LoadStatus.failure,
                failure: Failure.unknown(originalError: err),
              ),
            );
          },
        );
  }

  void setContextFilter(String? contextId) {
    if (state.selectedContextId == contextId) return;
    emit(state.copyWith(selectedContextId: contextId));
    _subscribeToAllTasks();
  }

  void setStatusFilter(TaskStatus? status) {
    if (state.selectedStatusFilter == status) return;
    emit(state.copyWith(selectedStatusFilter: status));
    _subscribeToAllTasks();
  }

  Future<void> toggleTaskStatus(String id) async {
    final result = await guard<TaskModel>(
      () => _repository.toggleTaskStatus(id),
      key: 'toggle_task_$id',
    );
    result.fold((_) {}, (failure) {
      if (failure is! CancelledFailure) {
        emit(state.copyWith(failure: failure));
      }
    });
  }

  Future<void> toggleChecklistItem({
    required String taskId,
    required String itemId,
  }) async {
    final result = await guard(
      () => _repository.toggleChecklistItem(taskId: taskId, itemId: itemId),
      key: 'toggle_chk_${taskId}_$itemId',
    );
    result.fold((_) {}, (failure) {
      if (failure is! CancelledFailure) {
        emit(state.copyWith(failure: failure));
      }
    });
  }

  Future<void> deleteTask(String id) async {
    final result = await guard<void>(
      () => _repository.deleteTask(id),
      key: 'delete_task_$id',
    );
    result.fold((_) {}, (failure) {
      if (failure is! CancelledFailure) {
        emit(state.copyWith(failure: failure));
      }
    });
  }

  Future<void> restoreTask(TaskModel task) async {
    final result = await guard<TaskModel>(
      () => _repository.createTask(task.copyWith(isDeleted: false)),
      key: 'restore_task_${task.id}',
    );
    result.fold((_) {}, (failure) {
      if (failure is! CancelledFailure) {
        emit(state.copyWith(failure: failure));
      }
    });
  }

  Future<void> addCustomContext({
    required String name,
    String? icon,
    int? colorValue,
  }) async {
    final result = await guard(
      () => _repository.createContext(
        name: name,
        icon: icon,
        colorValue: colorValue,
      ),
      key: 'add_context_${name.trim().toLowerCase()}',
    );
    result.fold((_) {}, (failure) {
      if (failure is! CancelledFailure) {
        emit(state.copyWith(failure: failure));
      }
    });
  }

  Future<void> deleteCustomContext(String contextId) async {
    final result = await guard<void>(
      () => _repository.deleteContext(contextId),
      key: 'delete_context_$contextId',
    );
    result.fold(
      (_) {
        if (state.selectedContextId == contextId) {
          setContextFilter(null);
        }
      },
      (failure) {
        if (failure is! CancelledFailure) {
          emit(state.copyWith(failure: failure));
        }
      },
    );
  }

  @override
  Future<void> close() {
    _todaySub?.cancel();
    _allTasksSub?.cancel();
    _contextsSub?.cancel();
    return super.close();
  }
}
