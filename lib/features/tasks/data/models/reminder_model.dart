import 'package:freezed_annotation/freezed_annotation.dart';

part 'reminder_model.freezed.dart';
part 'reminder_model.g.dart';

enum ReminderType {
  @JsonValue('due')
  due,
  @JsonValue('start_working')
  startWorking,
}

enum ReminderStatus {
  @JsonValue('pending')
  pending,
  @JsonValue('fired')
  fired,
  @JsonValue('cancelled')
  cancelled,
  @JsonValue('dismissed')
  dismissed,
}

@freezed
abstract class ReminderModel with _$ReminderModel {
  const factory ReminderModel({
    required String id,
    required String taskId,
    required ReminderType type,
    required DateTime scheduledTime,
    @Default(0) int leadTimeMinutes,
    @Default(ReminderStatus.pending) ReminderStatus status,
    required int notificationId,
    required DateTime createdAt,
    required DateTime updatedAt,
  }) = _ReminderModel;

  factory ReminderModel.fromJson(Map<String, dynamic> json) =>
      _$ReminderModelFromJson(json);
}
