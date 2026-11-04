// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'tasks_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$TasksState {

 LoadStatus get status; List<TaskModel> get todayTasks; List<TaskModel> get allTasks; List<ContextModel> get contexts; String? get selectedContextId; TaskStatus? get selectedStatusFilter; Failure? get failure;
/// Create a copy of TasksState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$TasksStateCopyWith<TasksState> get copyWith => _$TasksStateCopyWithImpl<TasksState>(this as TasksState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TasksState&&(identical(other.status, status) || other.status == status)&&const DeepCollectionEquality().equals(other.todayTasks, todayTasks)&&const DeepCollectionEquality().equals(other.allTasks, allTasks)&&const DeepCollectionEquality().equals(other.contexts, contexts)&&(identical(other.selectedContextId, selectedContextId) || other.selectedContextId == selectedContextId)&&(identical(other.selectedStatusFilter, selectedStatusFilter) || other.selectedStatusFilter == selectedStatusFilter)&&(identical(other.failure, failure) || other.failure == failure));
}


@override
int get hashCode => Object.hash(runtimeType,status,const DeepCollectionEquality().hash(todayTasks),const DeepCollectionEquality().hash(allTasks),const DeepCollectionEquality().hash(contexts),selectedContextId,selectedStatusFilter,failure);

@override
String toString() {
  return 'TasksState(status: $status, todayTasks: $todayTasks, allTasks: $allTasks, contexts: $contexts, selectedContextId: $selectedContextId, selectedStatusFilter: $selectedStatusFilter, failure: $failure)';
}


}

/// @nodoc
abstract mixin class $TasksStateCopyWith<$Res>  {
  factory $TasksStateCopyWith(TasksState value, $Res Function(TasksState) _then) = _$TasksStateCopyWithImpl;
@useResult
$Res call({
 LoadStatus status, List<TaskModel> todayTasks, List<TaskModel> allTasks, List<ContextModel> contexts, String? selectedContextId, TaskStatus? selectedStatusFilter, Failure? failure
});




}
/// @nodoc
class _$TasksStateCopyWithImpl<$Res>
    implements $TasksStateCopyWith<$Res> {
  _$TasksStateCopyWithImpl(this._self, this._then);

  final TasksState _self;
  final $Res Function(TasksState) _then;

/// Create a copy of TasksState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? status = null,Object? todayTasks = null,Object? allTasks = null,Object? contexts = null,Object? selectedContextId = freezed,Object? selectedStatusFilter = freezed,Object? failure = freezed,}) {
  return _then(_self.copyWith(
status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as LoadStatus,todayTasks: null == todayTasks ? _self.todayTasks : todayTasks // ignore: cast_nullable_to_non_nullable
as List<TaskModel>,allTasks: null == allTasks ? _self.allTasks : allTasks // ignore: cast_nullable_to_non_nullable
as List<TaskModel>,contexts: null == contexts ? _self.contexts : contexts // ignore: cast_nullable_to_non_nullable
as List<ContextModel>,selectedContextId: freezed == selectedContextId ? _self.selectedContextId : selectedContextId // ignore: cast_nullable_to_non_nullable
as String?,selectedStatusFilter: freezed == selectedStatusFilter ? _self.selectedStatusFilter : selectedStatusFilter // ignore: cast_nullable_to_non_nullable
as TaskStatus?,failure: freezed == failure ? _self.failure : failure // ignore: cast_nullable_to_non_nullable
as Failure?,
  ));
}

}


/// Adds pattern-matching-related methods to [TasksState].
extension TasksStatePatterns on TasksState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _TasksState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _TasksState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _TasksState value)  $default,){
final _that = this;
switch (_that) {
case _TasksState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _TasksState value)?  $default,){
final _that = this;
switch (_that) {
case _TasksState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( LoadStatus status,  List<TaskModel> todayTasks,  List<TaskModel> allTasks,  List<ContextModel> contexts,  String? selectedContextId,  TaskStatus? selectedStatusFilter,  Failure? failure)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _TasksState() when $default != null:
return $default(_that.status,_that.todayTasks,_that.allTasks,_that.contexts,_that.selectedContextId,_that.selectedStatusFilter,_that.failure);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( LoadStatus status,  List<TaskModel> todayTasks,  List<TaskModel> allTasks,  List<ContextModel> contexts,  String? selectedContextId,  TaskStatus? selectedStatusFilter,  Failure? failure)  $default,) {final _that = this;
switch (_that) {
case _TasksState():
return $default(_that.status,_that.todayTasks,_that.allTasks,_that.contexts,_that.selectedContextId,_that.selectedStatusFilter,_that.failure);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( LoadStatus status,  List<TaskModel> todayTasks,  List<TaskModel> allTasks,  List<ContextModel> contexts,  String? selectedContextId,  TaskStatus? selectedStatusFilter,  Failure? failure)?  $default,) {final _that = this;
switch (_that) {
case _TasksState() when $default != null:
return $default(_that.status,_that.todayTasks,_that.allTasks,_that.contexts,_that.selectedContextId,_that.selectedStatusFilter,_that.failure);case _:
  return null;

}
}

}

/// @nodoc


class _TasksState implements TasksState {
  const _TasksState({this.status = LoadStatus.initial, final  List<TaskModel> todayTasks = const <TaskModel>[], final  List<TaskModel> allTasks = const <TaskModel>[], final  List<ContextModel> contexts = const <ContextModel>[], this.selectedContextId, this.selectedStatusFilter, this.failure}): _todayTasks = todayTasks,_allTasks = allTasks,_contexts = contexts;
  

@override@JsonKey() final  LoadStatus status;
 final  List<TaskModel> _todayTasks;
@override@JsonKey() List<TaskModel> get todayTasks {
  if (_todayTasks is EqualUnmodifiableListView) return _todayTasks;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_todayTasks);
}

 final  List<TaskModel> _allTasks;
@override@JsonKey() List<TaskModel> get allTasks {
  if (_allTasks is EqualUnmodifiableListView) return _allTasks;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_allTasks);
}

 final  List<ContextModel> _contexts;
@override@JsonKey() List<ContextModel> get contexts {
  if (_contexts is EqualUnmodifiableListView) return _contexts;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_contexts);
}

@override final  String? selectedContextId;
@override final  TaskStatus? selectedStatusFilter;
@override final  Failure? failure;

/// Create a copy of TasksState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$TasksStateCopyWith<_TasksState> get copyWith => __$TasksStateCopyWithImpl<_TasksState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _TasksState&&(identical(other.status, status) || other.status == status)&&const DeepCollectionEquality().equals(other._todayTasks, _todayTasks)&&const DeepCollectionEquality().equals(other._allTasks, _allTasks)&&const DeepCollectionEquality().equals(other._contexts, _contexts)&&(identical(other.selectedContextId, selectedContextId) || other.selectedContextId == selectedContextId)&&(identical(other.selectedStatusFilter, selectedStatusFilter) || other.selectedStatusFilter == selectedStatusFilter)&&(identical(other.failure, failure) || other.failure == failure));
}


@override
int get hashCode => Object.hash(runtimeType,status,const DeepCollectionEquality().hash(_todayTasks),const DeepCollectionEquality().hash(_allTasks),const DeepCollectionEquality().hash(_contexts),selectedContextId,selectedStatusFilter,failure);

@override
String toString() {
  return 'TasksState(status: $status, todayTasks: $todayTasks, allTasks: $allTasks, contexts: $contexts, selectedContextId: $selectedContextId, selectedStatusFilter: $selectedStatusFilter, failure: $failure)';
}


}

/// @nodoc
abstract mixin class _$TasksStateCopyWith<$Res> implements $TasksStateCopyWith<$Res> {
  factory _$TasksStateCopyWith(_TasksState value, $Res Function(_TasksState) _then) = __$TasksStateCopyWithImpl;
@override @useResult
$Res call({
 LoadStatus status, List<TaskModel> todayTasks, List<TaskModel> allTasks, List<ContextModel> contexts, String? selectedContextId, TaskStatus? selectedStatusFilter, Failure? failure
});




}
/// @nodoc
class __$TasksStateCopyWithImpl<$Res>
    implements _$TasksStateCopyWith<$Res> {
  __$TasksStateCopyWithImpl(this._self, this._then);

  final _TasksState _self;
  final $Res Function(_TasksState) _then;

/// Create a copy of TasksState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? status = null,Object? todayTasks = null,Object? allTasks = null,Object? contexts = null,Object? selectedContextId = freezed,Object? selectedStatusFilter = freezed,Object? failure = freezed,}) {
  return _then(_TasksState(
status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as LoadStatus,todayTasks: null == todayTasks ? _self._todayTasks : todayTasks // ignore: cast_nullable_to_non_nullable
as List<TaskModel>,allTasks: null == allTasks ? _self._allTasks : allTasks // ignore: cast_nullable_to_non_nullable
as List<TaskModel>,contexts: null == contexts ? _self._contexts : contexts // ignore: cast_nullable_to_non_nullable
as List<ContextModel>,selectedContextId: freezed == selectedContextId ? _self.selectedContextId : selectedContextId // ignore: cast_nullable_to_non_nullable
as String?,selectedStatusFilter: freezed == selectedStatusFilter ? _self.selectedStatusFilter : selectedStatusFilter // ignore: cast_nullable_to_non_nullable
as TaskStatus?,failure: freezed == failure ? _self.failure : failure // ignore: cast_nullable_to_non_nullable
as Failure?,
  ));
}


}

// dart format on
