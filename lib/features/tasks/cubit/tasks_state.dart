import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:gotit/core/errors/failure.dart';
import 'package:gotit/core/utils/load_status.dart';
import 'package:gotit/features/tasks/data/models/context_model.dart';
import 'package:gotit/features/tasks/data/models/task_model.dart';

part 'tasks_state.freezed.dart';

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
