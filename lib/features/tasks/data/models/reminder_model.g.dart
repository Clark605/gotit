// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'reminder_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_ReminderModel _$ReminderModelFromJson(Map<String, dynamic> json) =>
    _ReminderModel(
      id: json['id'] as String,
      taskId: json['taskId'] as String,
      type: $enumDecode(_$ReminderTypeEnumMap, json['type']),
      scheduledTime: DateTime.parse(json['scheduledTime'] as String),
      leadTimeMinutes: (json['leadTimeMinutes'] as num?)?.toInt() ?? 0,
      status:
          $enumDecodeNullable(_$ReminderStatusEnumMap, json['status']) ??
          ReminderStatus.pending,
      notificationId: (json['notificationId'] as num).toInt(),
      createdAt: DateTime.parse(json['createdAt'] as String),
      updatedAt: DateTime.parse(json['updatedAt'] as String),
    );

Map<String, dynamic> _$ReminderModelToJson(_ReminderModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'taskId': instance.taskId,
      'type': _$ReminderTypeEnumMap[instance.type]!,
      'scheduledTime': instance.scheduledTime.toIso8601String(),
      'leadTimeMinutes': instance.leadTimeMinutes,
      'status': _$ReminderStatusEnumMap[instance.status]!,
      'notificationId': instance.notificationId,
      'createdAt': instance.createdAt.toIso8601String(),
      'updatedAt': instance.updatedAt.toIso8601String(),
    };

const _$ReminderTypeEnumMap = {
  ReminderType.due: 'due',
  ReminderType.startWorking: 'start_working',
};

const _$ReminderStatusEnumMap = {
  ReminderStatus.pending: 'pending',
  ReminderStatus.fired: 'fired',
  ReminderStatus.cancelled: 'cancelled',
  ReminderStatus.dismissed: 'dismissed',
};
