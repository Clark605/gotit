import 'package:freezed_annotation/freezed_annotation.dart';

part 'checklist_item_model.freezed.dart';
part 'checklist_item_model.g.dart';

@freezed
abstract class ChecklistItemModel with _$ChecklistItemModel {
  const factory ChecklistItemModel({
    required String id,
    required String taskId,
    required String content,
    @Default(false) bool isCompleted,
    @Default(0) int sortOrder,
    required DateTime createdAt,
    required DateTime updatedAt,
  }) = _ChecklistItemModel;

  factory ChecklistItemModel.fromJson(Map<String, dynamic> json) =>
      _$ChecklistItemModelFromJson(json);
}
