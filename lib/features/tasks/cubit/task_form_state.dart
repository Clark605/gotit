import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:gotit/core/errors/failure.dart';
import 'package:gotit/core/utils/load_status.dart';

part 'task_form_state.freezed.dart';

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
