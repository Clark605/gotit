import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:gotit/features/tasks/data/models/checklist_item_model.dart';

part 'task_model.freezed.dart';
part 'task_model.g.dart';

enum TaskStatus {
  @JsonValue('open')
  open,
  @JsonValue('completed')
  completed,
}

@freezed
abstract class TaskModel with _$TaskModel {
  const factory TaskModel({
    required String id,
    required String title,
    @Default(TaskStatus.open) TaskStatus status,
    DateTime? dueDate,
    @Default(false) bool isAllDay,
    String? contextId,
    @Default('') String notes,
    int? effortMinutes,
    String? sourceExcerpt,
    @Default(false) bool isDeleted,
    @Default(<ChecklistItemModel>[]) List<ChecklistItemModel> checklist,
    required DateTime createdAt,
    required DateTime updatedAt,
  }) = _TaskModel;

  factory TaskModel.fromJson(Map<String, dynamic> json) =>
      _$TaskModelFromJson(json);
}
