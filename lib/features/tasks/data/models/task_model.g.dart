// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'task_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_TaskModel _$TaskModelFromJson(Map<String, dynamic> json) => _TaskModel(
  id: json['id'] as String,
  title: json['title'] as String,
  status:
      $enumDecodeNullable(_$TaskStatusEnumMap, json['status']) ??
      TaskStatus.open,
  dueDate: json['dueDate'] == null
      ? null
      : DateTime.parse(json['dueDate'] as String),
  isAllDay: json['isAllDay'] as bool? ?? false,
  contextId: json['contextId'] as String?,
  notes: json['notes'] as String? ?? '',
  effortMinutes: (json['effortMinutes'] as num?)?.toInt(),
  sourceExcerpt: json['sourceExcerpt'] as String?,
  isDeleted: json['isDeleted'] as bool? ?? false,
  checklist:
      (json['checklist'] as List<dynamic>?)
          ?.map((e) => ChecklistItemModel.fromJson(e as Map<String, dynamic>))
          .toList() ??
      const <ChecklistItemModel>[],
  createdAt: DateTime.parse(json['createdAt'] as String),
  updatedAt: DateTime.parse(json['updatedAt'] as String),
);

Map<String, dynamic> _$TaskModelToJson(_TaskModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'status': _$TaskStatusEnumMap[instance.status]!,
      'dueDate': instance.dueDate?.toIso8601String(),
      'isAllDay': instance.isAllDay,
      'contextId': instance.contextId,
      'notes': instance.notes,
      'effortMinutes': instance.effortMinutes,
      'sourceExcerpt': instance.sourceExcerpt,
      'isDeleted': instance.isDeleted,
      'checklist': instance.checklist,
      'createdAt': instance.createdAt.toIso8601String(),
      'updatedAt': instance.updatedAt.toIso8601String(),
    };

const _$TaskStatusEnumMap = {
  TaskStatus.open: 'open',
  TaskStatus.completed: 'completed',
};
