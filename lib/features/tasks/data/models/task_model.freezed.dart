// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'task_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$TaskModel {

 String get id; String get title; TaskStatus get status; DateTime? get dueDate; bool get isAllDay; String? get contextId; String get notes; int? get effortMinutes; String? get sourceExcerpt; bool get isDeleted; List<ChecklistItemModel> get checklist; DateTime get createdAt; DateTime get updatedAt;
/// Create a copy of TaskModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$TaskModelCopyWith<TaskModel> get copyWith => _$TaskModelCopyWithImpl<TaskModel>(this as TaskModel, _$identity);

  /// Serializes this TaskModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TaskModel&&(identical(other.id, id) || other.id == id)&&(identical(other.title, title) || other.title == title)&&(identical(other.status, status) || other.status == status)&&(identical(other.dueDate, dueDate) || other.dueDate == dueDate)&&(identical(other.isAllDay, isAllDay) || other.isAllDay == isAllDay)&&(identical(other.contextId, contextId) || other.contextId == contextId)&&(identical(other.notes, notes) || other.notes == notes)&&(identical(other.effortMinutes, effortMinutes) || other.effortMinutes == effortMinutes)&&(identical(other.sourceExcerpt, sourceExcerpt) || other.sourceExcerpt == sourceExcerpt)&&(identical(other.isDeleted, isDeleted) || other.isDeleted == isDeleted)&&const DeepCollectionEquality().equals(other.checklist, checklist)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,title,status,dueDate,isAllDay,contextId,notes,effortMinutes,sourceExcerpt,isDeleted,const DeepCollectionEquality().hash(checklist),createdAt,updatedAt);

@override
String toString() {
  return 'TaskModel(id: $id, title: $title, status: $status, dueDate: $dueDate, isAllDay: $isAllDay, contextId: $contextId, notes: $notes, effortMinutes: $effortMinutes, sourceExcerpt: $sourceExcerpt, isDeleted: $isDeleted, checklist: $checklist, createdAt: $createdAt, updatedAt: $updatedAt)';
}


}

/// @nodoc
abstract mixin class $TaskModelCopyWith<$Res>  {
  factory $TaskModelCopyWith(TaskModel value, $Res Function(TaskModel) _then) = _$TaskModelCopyWithImpl;
@useResult
$Res call({
 String id, String title, TaskStatus status, DateTime? dueDate, bool isAllDay, String? contextId, String notes, int? effortMinutes, String? sourceExcerpt, bool isDeleted, List<ChecklistItemModel> checklist, DateTime createdAt, DateTime updatedAt
});




}
/// @nodoc
class _$TaskModelCopyWithImpl<$Res>
    implements $TaskModelCopyWith<$Res> {
  _$TaskModelCopyWithImpl(this._self, this._then);

  final TaskModel _self;
  final $Res Function(TaskModel) _then;

/// Create a copy of TaskModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? title = null,Object? status = null,Object? dueDate = freezed,Object? isAllDay = null,Object? contextId = freezed,Object? notes = null,Object? effortMinutes = freezed,Object? sourceExcerpt = freezed,Object? isDeleted = null,Object? checklist = null,Object? createdAt = null,Object? updatedAt = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as TaskStatus,dueDate: freezed == dueDate ? _self.dueDate : dueDate // ignore: cast_nullable_to_non_nullable
as DateTime?,isAllDay: null == isAllDay ? _self.isAllDay : isAllDay // ignore: cast_nullable_to_non_nullable
as bool,contextId: freezed == contextId ? _self.contextId : contextId // ignore: cast_nullable_to_non_nullable
as String?,notes: null == notes ? _self.notes : notes // ignore: cast_nullable_to_non_nullable
as String,effortMinutes: freezed == effortMinutes ? _self.effortMinutes : effortMinutes // ignore: cast_nullable_to_non_nullable
as int?,sourceExcerpt: freezed == sourceExcerpt ? _self.sourceExcerpt : sourceExcerpt // ignore: cast_nullable_to_non_nullable
as String?,isDeleted: null == isDeleted ? _self.isDeleted : isDeleted // ignore: cast_nullable_to_non_nullable
as bool,checklist: null == checklist ? _self.checklist : checklist // ignore: cast_nullable_to_non_nullable
as List<ChecklistItemModel>,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,updatedAt: null == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime,
  ));
}

}


/// Adds pattern-matching-related methods to [TaskModel].
extension TaskModelPatterns on TaskModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _TaskModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _TaskModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _TaskModel value)  $default,){
final _that = this;
switch (_that) {
case _TaskModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _TaskModel value)?  $default,){
final _that = this;
switch (_that) {
case _TaskModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String title,  TaskStatus status,  DateTime? dueDate,  bool isAllDay,  String? contextId,  String notes,  int? effortMinutes,  String? sourceExcerpt,  bool isDeleted,  List<ChecklistItemModel> checklist,  DateTime createdAt,  DateTime updatedAt)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _TaskModel() when $default != null:
return $default(_that.id,_that.title,_that.status,_that.dueDate,_that.isAllDay,_that.contextId,_that.notes,_that.effortMinutes,_that.sourceExcerpt,_that.isDeleted,_that.checklist,_that.createdAt,_that.updatedAt);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String title,  TaskStatus status,  DateTime? dueDate,  bool isAllDay,  String? contextId,  String notes,  int? effortMinutes,  String? sourceExcerpt,  bool isDeleted,  List<ChecklistItemModel> checklist,  DateTime createdAt,  DateTime updatedAt)  $default,) {final _that = this;
switch (_that) {
case _TaskModel():
return $default(_that.id,_that.title,_that.status,_that.dueDate,_that.isAllDay,_that.contextId,_that.notes,_that.effortMinutes,_that.sourceExcerpt,_that.isDeleted,_that.checklist,_that.createdAt,_that.updatedAt);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String title,  TaskStatus status,  DateTime? dueDate,  bool isAllDay,  String? contextId,  String notes,  int? effortMinutes,  String? sourceExcerpt,  bool isDeleted,  List<ChecklistItemModel> checklist,  DateTime createdAt,  DateTime updatedAt)?  $default,) {final _that = this;
switch (_that) {
case _TaskModel() when $default != null:
return $default(_that.id,_that.title,_that.status,_that.dueDate,_that.isAllDay,_that.contextId,_that.notes,_that.effortMinutes,_that.sourceExcerpt,_that.isDeleted,_that.checklist,_that.createdAt,_that.updatedAt);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _TaskModel implements TaskModel {
  const _TaskModel({required this.id, required this.title, this.status = TaskStatus.open, this.dueDate, this.isAllDay = false, this.contextId, this.notes = '', this.effortMinutes, this.sourceExcerpt, this.isDeleted = false, final  List<ChecklistItemModel> checklist = const <ChecklistItemModel>[], required this.createdAt, required this.updatedAt}): _checklist = checklist;
  factory _TaskModel.fromJson(Map<String, dynamic> json) => _$TaskModelFromJson(json);

@override final  String id;
@override final  String title;
@override@JsonKey() final  TaskStatus status;
@override final  DateTime? dueDate;
@override@JsonKey() final  bool isAllDay;
@override final  String? contextId;
@override@JsonKey() final  String notes;
@override final  int? effortMinutes;
@override final  String? sourceExcerpt;
@override@JsonKey() final  bool isDeleted;
 final  List<ChecklistItemModel> _checklist;
@override@JsonKey() List<ChecklistItemModel> get checklist {
  if (_checklist is EqualUnmodifiableListView) return _checklist;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_checklist);
}

@override final  DateTime createdAt;
@override final  DateTime updatedAt;

/// Create a copy of TaskModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$TaskModelCopyWith<_TaskModel> get copyWith => __$TaskModelCopyWithImpl<_TaskModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$TaskModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _TaskModel&&(identical(other.id, id) || other.id == id)&&(identical(other.title, title) || other.title == title)&&(identical(other.status, status) || other.status == status)&&(identical(other.dueDate, dueDate) || other.dueDate == dueDate)&&(identical(other.isAllDay, isAllDay) || other.isAllDay == isAllDay)&&(identical(other.contextId, contextId) || other.contextId == contextId)&&(identical(other.notes, notes) || other.notes == notes)&&(identical(other.effortMinutes, effortMinutes) || other.effortMinutes == effortMinutes)&&(identical(other.sourceExcerpt, sourceExcerpt) || other.sourceExcerpt == sourceExcerpt)&&(identical(other.isDeleted, isDeleted) || other.isDeleted == isDeleted)&&const DeepCollectionEquality().equals(other._checklist, _checklist)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,title,status,dueDate,isAllDay,contextId,notes,effortMinutes,sourceExcerpt,isDeleted,const DeepCollectionEquality().hash(_checklist),createdAt,updatedAt);

@override
String toString() {
  return 'TaskModel(id: $id, title: $title, status: $status, dueDate: $dueDate, isAllDay: $isAllDay, contextId: $contextId, notes: $notes, effortMinutes: $effortMinutes, sourceExcerpt: $sourceExcerpt, isDeleted: $isDeleted, checklist: $checklist, createdAt: $createdAt, updatedAt: $updatedAt)';
}


}

/// @nodoc
abstract mixin class _$TaskModelCopyWith<$Res> implements $TaskModelCopyWith<$Res> {
  factory _$TaskModelCopyWith(_TaskModel value, $Res Function(_TaskModel) _then) = __$TaskModelCopyWithImpl;
@override @useResult
$Res call({
 String id, String title, TaskStatus status, DateTime? dueDate, bool isAllDay, String? contextId, String notes, int? effortMinutes, String? sourceExcerpt, bool isDeleted, List<ChecklistItemModel> checklist, DateTime createdAt, DateTime updatedAt
});




}
/// @nodoc
class __$TaskModelCopyWithImpl<$Res>
    implements _$TaskModelCopyWith<$Res> {
  __$TaskModelCopyWithImpl(this._self, this._then);

  final _TaskModel _self;
  final $Res Function(_TaskModel) _then;

/// Create a copy of TaskModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? title = null,Object? status = null,Object? dueDate = freezed,Object? isAllDay = null,Object? contextId = freezed,Object? notes = null,Object? effortMinutes = freezed,Object? sourceExcerpt = freezed,Object? isDeleted = null,Object? checklist = null,Object? createdAt = null,Object? updatedAt = null,}) {
  return _then(_TaskModel(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as TaskStatus,dueDate: freezed == dueDate ? _self.dueDate : dueDate // ignore: cast_nullable_to_non_nullable
as DateTime?,isAllDay: null == isAllDay ? _self.isAllDay : isAllDay // ignore: cast_nullable_to_non_nullable
as bool,contextId: freezed == contextId ? _self.contextId : contextId // ignore: cast_nullable_to_non_nullable
as String?,notes: null == notes ? _self.notes : notes // ignore: cast_nullable_to_non_nullable
as String,effortMinutes: freezed == effortMinutes ? _self.effortMinutes : effortMinutes // ignore: cast_nullable_to_non_nullable
as int?,sourceExcerpt: freezed == sourceExcerpt ? _self.sourceExcerpt : sourceExcerpt // ignore: cast_nullable_to_non_nullable
as String?,isDeleted: null == isDeleted ? _self.isDeleted : isDeleted // ignore: cast_nullable_to_non_nullable
as bool,checklist: null == checklist ? _self._checklist : checklist // ignore: cast_nullable_to_non_nullable
as List<ChecklistItemModel>,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,updatedAt: null == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime,
  ));
}


}

// dart format on
