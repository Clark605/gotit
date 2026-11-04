// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'task_form_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$TaskFormState {

 LoadStatus get status; String? get taskId; String get title; DateTime? get dueDate; bool get isAllDay; String? get contextId; String get notes; int? get effortMinutes; List<String> get checklistDrafts; bool get isReminderEnabled; int? get reminderLeadMinutes; String? get allDayReminderTime; String? get titleError; Failure? get failure;
/// Create a copy of TaskFormState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$TaskFormStateCopyWith<TaskFormState> get copyWith => _$TaskFormStateCopyWithImpl<TaskFormState>(this as TaskFormState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TaskFormState&&(identical(other.status, status) || other.status == status)&&(identical(other.taskId, taskId) || other.taskId == taskId)&&(identical(other.title, title) || other.title == title)&&(identical(other.dueDate, dueDate) || other.dueDate == dueDate)&&(identical(other.isAllDay, isAllDay) || other.isAllDay == isAllDay)&&(identical(other.contextId, contextId) || other.contextId == contextId)&&(identical(other.notes, notes) || other.notes == notes)&&(identical(other.effortMinutes, effortMinutes) || other.effortMinutes == effortMinutes)&&const DeepCollectionEquality().equals(other.checklistDrafts, checklistDrafts)&&(identical(other.isReminderEnabled, isReminderEnabled) || other.isReminderEnabled == isReminderEnabled)&&(identical(other.reminderLeadMinutes, reminderLeadMinutes) || other.reminderLeadMinutes == reminderLeadMinutes)&&(identical(other.allDayReminderTime, allDayReminderTime) || other.allDayReminderTime == allDayReminderTime)&&(identical(other.titleError, titleError) || other.titleError == titleError)&&(identical(other.failure, failure) || other.failure == failure));
}


@override
int get hashCode => Object.hash(runtimeType,status,taskId,title,dueDate,isAllDay,contextId,notes,effortMinutes,const DeepCollectionEquality().hash(checklistDrafts),isReminderEnabled,reminderLeadMinutes,allDayReminderTime,titleError,failure);

@override
String toString() {
  return 'TaskFormState(status: $status, taskId: $taskId, title: $title, dueDate: $dueDate, isAllDay: $isAllDay, contextId: $contextId, notes: $notes, effortMinutes: $effortMinutes, checklistDrafts: $checklistDrafts, isReminderEnabled: $isReminderEnabled, reminderLeadMinutes: $reminderLeadMinutes, allDayReminderTime: $allDayReminderTime, titleError: $titleError, failure: $failure)';
}


}

/// @nodoc
abstract mixin class $TaskFormStateCopyWith<$Res>  {
  factory $TaskFormStateCopyWith(TaskFormState value, $Res Function(TaskFormState) _then) = _$TaskFormStateCopyWithImpl;
@useResult
$Res call({
 LoadStatus status, String? taskId, String title, DateTime? dueDate, bool isAllDay, String? contextId, String notes, int? effortMinutes, List<String> checklistDrafts, bool isReminderEnabled, int? reminderLeadMinutes, String? allDayReminderTime, String? titleError, Failure? failure
});




}
/// @nodoc
class _$TaskFormStateCopyWithImpl<$Res>
    implements $TaskFormStateCopyWith<$Res> {
  _$TaskFormStateCopyWithImpl(this._self, this._then);

  final TaskFormState _self;
  final $Res Function(TaskFormState) _then;

/// Create a copy of TaskFormState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? status = null,Object? taskId = freezed,Object? title = null,Object? dueDate = freezed,Object? isAllDay = null,Object? contextId = freezed,Object? notes = null,Object? effortMinutes = freezed,Object? checklistDrafts = null,Object? isReminderEnabled = null,Object? reminderLeadMinutes = freezed,Object? allDayReminderTime = freezed,Object? titleError = freezed,Object? failure = freezed,}) {
  return _then(_self.copyWith(
status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as LoadStatus,taskId: freezed == taskId ? _self.taskId : taskId // ignore: cast_nullable_to_non_nullable
as String?,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,dueDate: freezed == dueDate ? _self.dueDate : dueDate // ignore: cast_nullable_to_non_nullable
as DateTime?,isAllDay: null == isAllDay ? _self.isAllDay : isAllDay // ignore: cast_nullable_to_non_nullable
as bool,contextId: freezed == contextId ? _self.contextId : contextId // ignore: cast_nullable_to_non_nullable
as String?,notes: null == notes ? _self.notes : notes // ignore: cast_nullable_to_non_nullable
as String,effortMinutes: freezed == effortMinutes ? _self.effortMinutes : effortMinutes // ignore: cast_nullable_to_non_nullable
as int?,checklistDrafts: null == checklistDrafts ? _self.checklistDrafts : checklistDrafts // ignore: cast_nullable_to_non_nullable
as List<String>,isReminderEnabled: null == isReminderEnabled ? _self.isReminderEnabled : isReminderEnabled // ignore: cast_nullable_to_non_nullable
as bool,reminderLeadMinutes: freezed == reminderLeadMinutes ? _self.reminderLeadMinutes : reminderLeadMinutes // ignore: cast_nullable_to_non_nullable
as int?,allDayReminderTime: freezed == allDayReminderTime ? _self.allDayReminderTime : allDayReminderTime // ignore: cast_nullable_to_non_nullable
as String?,titleError: freezed == titleError ? _self.titleError : titleError // ignore: cast_nullable_to_non_nullable
as String?,failure: freezed == failure ? _self.failure : failure // ignore: cast_nullable_to_non_nullable
as Failure?,
  ));
}

}


/// Adds pattern-matching-related methods to [TaskFormState].
extension TaskFormStatePatterns on TaskFormState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _TaskFormState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _TaskFormState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _TaskFormState value)  $default,){
final _that = this;
switch (_that) {
case _TaskFormState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _TaskFormState value)?  $default,){
final _that = this;
switch (_that) {
case _TaskFormState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( LoadStatus status,  String? taskId,  String title,  DateTime? dueDate,  bool isAllDay,  String? contextId,  String notes,  int? effortMinutes,  List<String> checklistDrafts,  bool isReminderEnabled,  int? reminderLeadMinutes,  String? allDayReminderTime,  String? titleError,  Failure? failure)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _TaskFormState() when $default != null:
return $default(_that.status,_that.taskId,_that.title,_that.dueDate,_that.isAllDay,_that.contextId,_that.notes,_that.effortMinutes,_that.checklistDrafts,_that.isReminderEnabled,_that.reminderLeadMinutes,_that.allDayReminderTime,_that.titleError,_that.failure);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( LoadStatus status,  String? taskId,  String title,  DateTime? dueDate,  bool isAllDay,  String? contextId,  String notes,  int? effortMinutes,  List<String> checklistDrafts,  bool isReminderEnabled,  int? reminderLeadMinutes,  String? allDayReminderTime,  String? titleError,  Failure? failure)  $default,) {final _that = this;
switch (_that) {
case _TaskFormState():
return $default(_that.status,_that.taskId,_that.title,_that.dueDate,_that.isAllDay,_that.contextId,_that.notes,_that.effortMinutes,_that.checklistDrafts,_that.isReminderEnabled,_that.reminderLeadMinutes,_that.allDayReminderTime,_that.titleError,_that.failure);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( LoadStatus status,  String? taskId,  String title,  DateTime? dueDate,  bool isAllDay,  String? contextId,  String notes,  int? effortMinutes,  List<String> checklistDrafts,  bool isReminderEnabled,  int? reminderLeadMinutes,  String? allDayReminderTime,  String? titleError,  Failure? failure)?  $default,) {final _that = this;
switch (_that) {
case _TaskFormState() when $default != null:
return $default(_that.status,_that.taskId,_that.title,_that.dueDate,_that.isAllDay,_that.contextId,_that.notes,_that.effortMinutes,_that.checklistDrafts,_that.isReminderEnabled,_that.reminderLeadMinutes,_that.allDayReminderTime,_that.titleError,_that.failure);case _:
  return null;

}
}

}

/// @nodoc


class _TaskFormState implements TaskFormState {
  const _TaskFormState({this.status = LoadStatus.initial, this.taskId, this.title = '', this.dueDate, this.isAllDay = false, this.contextId, this.notes = '', this.effortMinutes, final  List<String> checklistDrafts = const <String>[], this.isReminderEnabled = false, this.reminderLeadMinutes, this.allDayReminderTime, this.titleError, this.failure}): _checklistDrafts = checklistDrafts;
  

@override@JsonKey() final  LoadStatus status;
@override final  String? taskId;
@override@JsonKey() final  String title;
@override final  DateTime? dueDate;
@override@JsonKey() final  bool isAllDay;
@override final  String? contextId;
@override@JsonKey() final  String notes;
@override final  int? effortMinutes;
 final  List<String> _checklistDrafts;
@override@JsonKey() List<String> get checklistDrafts {
  if (_checklistDrafts is EqualUnmodifiableListView) return _checklistDrafts;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_checklistDrafts);
}

@override@JsonKey() final  bool isReminderEnabled;
@override final  int? reminderLeadMinutes;
@override final  String? allDayReminderTime;
@override final  String? titleError;
@override final  Failure? failure;

/// Create a copy of TaskFormState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$TaskFormStateCopyWith<_TaskFormState> get copyWith => __$TaskFormStateCopyWithImpl<_TaskFormState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _TaskFormState&&(identical(other.status, status) || other.status == status)&&(identical(other.taskId, taskId) || other.taskId == taskId)&&(identical(other.title, title) || other.title == title)&&(identical(other.dueDate, dueDate) || other.dueDate == dueDate)&&(identical(other.isAllDay, isAllDay) || other.isAllDay == isAllDay)&&(identical(other.contextId, contextId) || other.contextId == contextId)&&(identical(other.notes, notes) || other.notes == notes)&&(identical(other.effortMinutes, effortMinutes) || other.effortMinutes == effortMinutes)&&const DeepCollectionEquality().equals(other._checklistDrafts, _checklistDrafts)&&(identical(other.isReminderEnabled, isReminderEnabled) || other.isReminderEnabled == isReminderEnabled)&&(identical(other.reminderLeadMinutes, reminderLeadMinutes) || other.reminderLeadMinutes == reminderLeadMinutes)&&(identical(other.allDayReminderTime, allDayReminderTime) || other.allDayReminderTime == allDayReminderTime)&&(identical(other.titleError, titleError) || other.titleError == titleError)&&(identical(other.failure, failure) || other.failure == failure));
}


@override
int get hashCode => Object.hash(runtimeType,status,taskId,title,dueDate,isAllDay,contextId,notes,effortMinutes,const DeepCollectionEquality().hash(_checklistDrafts),isReminderEnabled,reminderLeadMinutes,allDayReminderTime,titleError,failure);

@override
String toString() {
  return 'TaskFormState(status: $status, taskId: $taskId, title: $title, dueDate: $dueDate, isAllDay: $isAllDay, contextId: $contextId, notes: $notes, effortMinutes: $effortMinutes, checklistDrafts: $checklistDrafts, isReminderEnabled: $isReminderEnabled, reminderLeadMinutes: $reminderLeadMinutes, allDayReminderTime: $allDayReminderTime, titleError: $titleError, failure: $failure)';
}


}

/// @nodoc
abstract mixin class _$TaskFormStateCopyWith<$Res> implements $TaskFormStateCopyWith<$Res> {
  factory _$TaskFormStateCopyWith(_TaskFormState value, $Res Function(_TaskFormState) _then) = __$TaskFormStateCopyWithImpl;
@override @useResult
$Res call({
 LoadStatus status, String? taskId, String title, DateTime? dueDate, bool isAllDay, String? contextId, String notes, int? effortMinutes, List<String> checklistDrafts, bool isReminderEnabled, int? reminderLeadMinutes, String? allDayReminderTime, String? titleError, Failure? failure
});




}
/// @nodoc
class __$TaskFormStateCopyWithImpl<$Res>
    implements _$TaskFormStateCopyWith<$Res> {
  __$TaskFormStateCopyWithImpl(this._self, this._then);

  final _TaskFormState _self;
  final $Res Function(_TaskFormState) _then;

/// Create a copy of TaskFormState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? status = null,Object? taskId = freezed,Object? title = null,Object? dueDate = freezed,Object? isAllDay = null,Object? contextId = freezed,Object? notes = null,Object? effortMinutes = freezed,Object? checklistDrafts = null,Object? isReminderEnabled = null,Object? reminderLeadMinutes = freezed,Object? allDayReminderTime = freezed,Object? titleError = freezed,Object? failure = freezed,}) {
  return _then(_TaskFormState(
status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as LoadStatus,taskId: freezed == taskId ? _self.taskId : taskId // ignore: cast_nullable_to_non_nullable
as String?,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,dueDate: freezed == dueDate ? _self.dueDate : dueDate // ignore: cast_nullable_to_non_nullable
as DateTime?,isAllDay: null == isAllDay ? _self.isAllDay : isAllDay // ignore: cast_nullable_to_non_nullable
as bool,contextId: freezed == contextId ? _self.contextId : contextId // ignore: cast_nullable_to_non_nullable
as String?,notes: null == notes ? _self.notes : notes // ignore: cast_nullable_to_non_nullable
as String,effortMinutes: freezed == effortMinutes ? _self.effortMinutes : effortMinutes // ignore: cast_nullable_to_non_nullable
as int?,checklistDrafts: null == checklistDrafts ? _self._checklistDrafts : checklistDrafts // ignore: cast_nullable_to_non_nullable
as List<String>,isReminderEnabled: null == isReminderEnabled ? _self.isReminderEnabled : isReminderEnabled // ignore: cast_nullable_to_non_nullable
as bool,reminderLeadMinutes: freezed == reminderLeadMinutes ? _self.reminderLeadMinutes : reminderLeadMinutes // ignore: cast_nullable_to_non_nullable
as int?,allDayReminderTime: freezed == allDayReminderTime ? _self.allDayReminderTime : allDayReminderTime // ignore: cast_nullable_to_non_nullable
as String?,titleError: freezed == titleError ? _self.titleError : titleError // ignore: cast_nullable_to_non_nullable
as String?,failure: freezed == failure ? _self.failure : failure // ignore: cast_nullable_to_non_nullable
as Failure?,
  ));
}


}

// dart format on
