// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'context_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_ContextModel _$ContextModelFromJson(Map<String, dynamic> json) =>
    _ContextModel(
      id: json['id'] as String,
      name: json['name'] as String,
      icon: json['icon'] as String?,
      colorValue: (json['colorValue'] as num?)?.toInt(),
      isDefault: json['isDefault'] as bool? ?? false,
      createdAt: DateTime.parse(json['createdAt'] as String),
      updatedAt: DateTime.parse(json['updatedAt'] as String),
    );

Map<String, dynamic> _$ContextModelToJson(_ContextModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'icon': instance.icon,
      'colorValue': instance.colorValue,
      'isDefault': instance.isDefault,
      'createdAt': instance.createdAt.toIso8601String(),
      'updatedAt': instance.updatedAt.toIso8601String(),
    };
