import 'package:freezed_annotation/freezed_annotation.dart';

part 'context_model.freezed.dart';
part 'context_model.g.dart';

@freezed
abstract class ContextModel with _$ContextModel {
  const factory ContextModel({
    required String id,
    required String name,
    String? icon,
    int? colorValue,
    @Default(false) bool isDefault,
    required DateTime createdAt,
    required DateTime updatedAt,
  }) = _ContextModel;

  factory ContextModel.fromJson(Map<String, dynamic> json) =>
      _$ContextModelFromJson(json);
}
