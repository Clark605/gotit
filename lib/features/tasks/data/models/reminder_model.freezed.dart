// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'reminder_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$ReminderModel {

 String get id; String get taskId; ReminderType get type; DateTime get scheduledTime; int get leadTimeMinutes; ReminderStatus get status; int get notificationId; DateTime get createdAt; DateTime get updatedAt;
/// Create a copy of ReminderModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ReminderModelCopyWith<ReminderModel> get copyWith => _$ReminderModelCopyWithImpl<ReminderModel>(this as ReminderModel, _$identity);

  /// Serializes this ReminderModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ReminderModel&&(identical(other.id, id) || other.id == id)&&(identical(other.taskId, taskId) || other.taskId == taskId)&&(identical(other.type, type) || other.type == type)&&(identical(other.scheduledTime, scheduledTime) || other.scheduledTime == scheduledTime)&&(identical(other.leadTimeMinutes, leadTimeMinutes) || other.leadTimeMinutes == leadTimeMinutes)&&(identical(other.status, status) || other.status == status)&&(identical(other.notificationId, notificationId) || other.notificationId == notificationId)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,taskId,type,scheduledTime,leadTimeMinutes,status,notificationId,createdAt,updatedAt);

@override
String toString() {
  return 'ReminderModel(id: $id, taskId: $taskId, type: $type, scheduledTime: $scheduledTime, leadTimeMinutes: $leadTimeMinutes, status: $status, notificationId: $notificationId, createdAt: $createdAt, updatedAt: $updatedAt)';
}


}

/// @nodoc
abstract mixin class $ReminderModelCopyWith<$Res>  {
  factory $ReminderModelCopyWith(ReminderModel value, $Res Function(ReminderModel) _then) = _$ReminderModelCopyWithImpl;
@useResult
$Res call({
 String id, String taskId, ReminderType type, DateTime scheduledTime, int leadTimeMinutes, ReminderStatus status, int notificationId, DateTime createdAt, DateTime updatedAt
});




}
/// @nodoc
class _$ReminderModelCopyWithImpl<$Res>
    implements $ReminderModelCopyWith<$Res> {
  _$ReminderModelCopyWithImpl(this._self, this._then);

  final ReminderModel _self;
  final $Res Function(ReminderModel) _then;

/// Create a copy of ReminderModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? taskId = null,Object? type = null,Object? scheduledTime = null,Object? leadTimeMinutes = null,Object? status = null,Object? notificationId = null,Object? createdAt = null,Object? updatedAt = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,taskId: null == taskId ? _self.taskId : taskId // ignore: cast_nullable_to_non_nullable
as String,type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as ReminderType,scheduledTime: null == scheduledTime ? _self.scheduledTime : scheduledTime // ignore: cast_nullable_to_non_nullable
as DateTime,leadTimeMinutes: null == leadTimeMinutes ? _self.leadTimeMinutes : leadTimeMinutes // ignore: cast_nullable_to_non_nullable
as int,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as ReminderStatus,notificationId: null == notificationId ? _self.notificationId : notificationId // ignore: cast_nullable_to_non_nullable
as int,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,updatedAt: null == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime,
  ));
}

}


/// Adds pattern-matching-related methods to [ReminderModel].
extension ReminderModelPatterns on ReminderModel {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ReminderModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ReminderModel() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ReminderModel value)  $default,){
final _that = this;
switch (_that) {
case _ReminderModel():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ReminderModel value)?  $default,){
final _that = this;
switch (_that) {
case _ReminderModel() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String taskId,  ReminderType type,  DateTime scheduledTime,  int leadTimeMinutes,  ReminderStatus status,  int notificationId,  DateTime createdAt,  DateTime updatedAt)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ReminderModel() when $default != null:
return $default(_that.id,_that.taskId,_that.type,_that.scheduledTime,_that.leadTimeMinutes,_that.status,_that.notificationId,_that.createdAt,_that.updatedAt);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String taskId,  ReminderType type,  DateTime scheduledTime,  int leadTimeMinutes,  ReminderStatus status,  int notificationId,  DateTime createdAt,  DateTime updatedAt)  $default,) {final _that = this;
switch (_that) {
case _ReminderModel():
return $default(_that.id,_that.taskId,_that.type,_that.scheduledTime,_that.leadTimeMinutes,_that.status,_that.notificationId,_that.createdAt,_that.updatedAt);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String taskId,  ReminderType type,  DateTime scheduledTime,  int leadTimeMinutes,  ReminderStatus status,  int notificationId,  DateTime createdAt,  DateTime updatedAt)?  $default,) {final _that = this;
switch (_that) {
case _ReminderModel() when $default != null:
return $default(_that.id,_that.taskId,_that.type,_that.scheduledTime,_that.leadTimeMinutes,_that.status,_that.notificationId,_that.createdAt,_that.updatedAt);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _ReminderModel implements ReminderModel {
  const _ReminderModel({required this.id, required this.taskId, required this.type, required this.scheduledTime, this.leadTimeMinutes = 0, this.status = ReminderStatus.pending, required this.notificationId, required this.createdAt, required this.updatedAt});
  factory _ReminderModel.fromJson(Map<String, dynamic> json) => _$ReminderModelFromJson(json);

@override final  String id;
@override final  String taskId;
@override final  ReminderType type;
@override final  DateTime scheduledTime;
@override@JsonKey() final  int leadTimeMinutes;
@override@JsonKey() final  ReminderStatus status;
@override final  int notificationId;
@override final  DateTime createdAt;
@override final  DateTime updatedAt;

/// Create a copy of ReminderModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ReminderModelCopyWith<_ReminderModel> get copyWith => __$ReminderModelCopyWithImpl<_ReminderModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ReminderModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ReminderModel&&(identical(other.id, id) || other.id == id)&&(identical(other.taskId, taskId) || other.taskId == taskId)&&(identical(other.type, type) || other.type == type)&&(identical(other.scheduledTime, scheduledTime) || other.scheduledTime == scheduledTime)&&(identical(other.leadTimeMinutes, leadTimeMinutes) || other.leadTimeMinutes == leadTimeMinutes)&&(identical(other.status, status) || other.status == status)&&(identical(other.notificationId, notificationId) || other.notificationId == notificationId)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,taskId,type,scheduledTime,leadTimeMinutes,status,notificationId,createdAt,updatedAt);

@override
String toString() {
  return 'ReminderModel(id: $id, taskId: $taskId, type: $type, scheduledTime: $scheduledTime, leadTimeMinutes: $leadTimeMinutes, status: $status, notificationId: $notificationId, createdAt: $createdAt, updatedAt: $updatedAt)';
}


}

/// @nodoc
abstract mixin class _$ReminderModelCopyWith<$Res> implements $ReminderModelCopyWith<$Res> {
  factory _$ReminderModelCopyWith(_ReminderModel value, $Res Function(_ReminderModel) _then) = __$ReminderModelCopyWithImpl;
@override @useResult
$Res call({
 String id, String taskId, ReminderType type, DateTime scheduledTime, int leadTimeMinutes, ReminderStatus status, int notificationId, DateTime createdAt, DateTime updatedAt
});




}
/// @nodoc
class __$ReminderModelCopyWithImpl<$Res>
    implements _$ReminderModelCopyWith<$Res> {
  __$ReminderModelCopyWithImpl(this._self, this._then);

  final _ReminderModel _self;
  final $Res Function(_ReminderModel) _then;

/// Create a copy of ReminderModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? taskId = null,Object? type = null,Object? scheduledTime = null,Object? leadTimeMinutes = null,Object? status = null,Object? notificationId = null,Object? createdAt = null,Object? updatedAt = null,}) {
  return _then(_ReminderModel(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,taskId: null == taskId ? _self.taskId : taskId // ignore: cast_nullable_to_non_nullable
as String,type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as ReminderType,scheduledTime: null == scheduledTime ? _self.scheduledTime : scheduledTime // ignore: cast_nullable_to_non_nullable
as DateTime,leadTimeMinutes: null == leadTimeMinutes ? _self.leadTimeMinutes : leadTimeMinutes // ignore: cast_nullable_to_non_nullable
as int,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as ReminderStatus,notificationId: null == notificationId ? _self.notificationId : notificationId // ignore: cast_nullable_to_non_nullable
as int,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,updatedAt: null == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime,
  ));
}


}

// dart format on
