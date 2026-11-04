// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'checklist_item_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_ChecklistItemModel _$ChecklistItemModelFromJson(Map<String, dynamic> json) =>
    _ChecklistItemModel(
      id: json['id'] as String,
      taskId: json['taskId'] as String,
      content: json['content'] as String,
      isCompleted: json['isCompleted'] as bool? ?? false,
      sortOrder: (json['sortOrder'] as num?)?.toInt() ?? 0,
      createdAt: DateTime.parse(json['createdAt'] as String),
      updatedAt: DateTime.parse(json['updatedAt'] as String),
    );

Map<String, dynamic> _$ChecklistItemModelToJson(_ChecklistItemModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'taskId': instance.taskId,
      'content': instance.content,
      'isCompleted': instance.isCompleted,
      'sortOrder': instance.sortOrder,
      'createdAt': instance.createdAt.toIso8601String(),
      'updatedAt': instance.updatedAt.toIso8601String(),
    };
