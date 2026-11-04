// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'context_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$ContextModel {

 String get id; String get name; String? get icon; int? get colorValue; bool get isDefault; DateTime get createdAt; DateTime get updatedAt;
/// Create a copy of ContextModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ContextModelCopyWith<ContextModel> get copyWith => _$ContextModelCopyWithImpl<ContextModel>(this as ContextModel, _$identity);

  /// Serializes this ContextModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ContextModel&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.icon, icon) || other.icon == icon)&&(identical(other.colorValue, colorValue) || other.colorValue == colorValue)&&(identical(other.isDefault, isDefault) || other.isDefault == isDefault)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name,icon,colorValue,isDefault,createdAt,updatedAt);

@override
String toString() {
  return 'ContextModel(id: $id, name: $name, icon: $icon, colorValue: $colorValue, isDefault: $isDefault, createdAt: $createdAt, updatedAt: $updatedAt)';
}


}

/// @nodoc
abstract mixin class $ContextModelCopyWith<$Res>  {
  factory $ContextModelCopyWith(ContextModel value, $Res Function(ContextModel) _then) = _$ContextModelCopyWithImpl;
@useResult
$Res call({
 String id, String name, String? icon, int? colorValue, bool isDefault, DateTime createdAt, DateTime updatedAt
});




}
/// @nodoc
class _$ContextModelCopyWithImpl<$Res>
    implements $ContextModelCopyWith<$Res> {
  _$ContextModelCopyWithImpl(this._self, this._then);

  final ContextModel _self;
  final $Res Function(ContextModel) _then;

/// Create a copy of ContextModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? name = null,Object? icon = freezed,Object? colorValue = freezed,Object? isDefault = null,Object? createdAt = null,Object? updatedAt = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,icon: freezed == icon ? _self.icon : icon // ignore: cast_nullable_to_non_nullable
as String?,colorValue: freezed == colorValue ? _self.colorValue : colorValue // ignore: cast_nullable_to_non_nullable
as int?,isDefault: null == isDefault ? _self.isDefault : isDefault // ignore: cast_nullable_to_non_nullable
as bool,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,updatedAt: null == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime,
  ));
}

}


/// Adds pattern-matching-related methods to [ContextModel].
extension ContextModelPatterns on ContextModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ContextModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ContextModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ContextModel value)  $default,){
final _that = this;
switch (_that) {
case _ContextModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ContextModel value)?  $default,){
final _that = this;
switch (_that) {
case _ContextModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String name,  String? icon,  int? colorValue,  bool isDefault,  DateTime createdAt,  DateTime updatedAt)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ContextModel() when $default != null:
return $default(_that.id,_that.name,_that.icon,_that.colorValue,_that.isDefault,_that.createdAt,_that.updatedAt);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String name,  String? icon,  int? colorValue,  bool isDefault,  DateTime createdAt,  DateTime updatedAt)  $default,) {final _that = this;
switch (_that) {
case _ContextModel():
return $default(_that.id,_that.name,_that.icon,_that.colorValue,_that.isDefault,_that.createdAt,_that.updatedAt);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String name,  String? icon,  int? colorValue,  bool isDefault,  DateTime createdAt,  DateTime updatedAt)?  $default,) {final _that = this;
switch (_that) {
case _ContextModel() when $default != null:
return $default(_that.id,_that.name,_that.icon,_that.colorValue,_that.isDefault,_that.createdAt,_that.updatedAt);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _ContextModel implements ContextModel {
  const _ContextModel({required this.id, required this.name, this.icon, this.colorValue, this.isDefault = false, required this.createdAt, required this.updatedAt});
  factory _ContextModel.fromJson(Map<String, dynamic> json) => _$ContextModelFromJson(json);

@override final  String id;
@override final  String name;
@override final  String? icon;
@override final  int? colorValue;
@override@JsonKey() final  bool isDefault;
@override final  DateTime createdAt;
@override final  DateTime updatedAt;

/// Create a copy of ContextModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ContextModelCopyWith<_ContextModel> get copyWith => __$ContextModelCopyWithImpl<_ContextModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ContextModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ContextModel&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.icon, icon) || other.icon == icon)&&(identical(other.colorValue, colorValue) || other.colorValue == colorValue)&&(identical(other.isDefault, isDefault) || other.isDefault == isDefault)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name,icon,colorValue,isDefault,createdAt,updatedAt);

@override
String toString() {
  return 'ContextModel(id: $id, name: $name, icon: $icon, colorValue: $colorValue, isDefault: $isDefault, createdAt: $createdAt, updatedAt: $updatedAt)';
}


}

/// @nodoc
abstract mixin class _$ContextModelCopyWith<$Res> implements $ContextModelCopyWith<$Res> {
  factory _$ContextModelCopyWith(_ContextModel value, $Res Function(_ContextModel) _then) = __$ContextModelCopyWithImpl;
@override @useResult
$Res call({
 String id, String name, String? icon, int? colorValue, bool isDefault, DateTime createdAt, DateTime updatedAt
});




}
/// @nodoc
class __$ContextModelCopyWithImpl<$Res>
    implements _$ContextModelCopyWith<$Res> {
  __$ContextModelCopyWithImpl(this._self, this._then);

  final _ContextModel _self;
  final $Res Function(_ContextModel) _then;

/// Create a copy of ContextModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? name = null,Object? icon = freezed,Object? colorValue = freezed,Object? isDefault = null,Object? createdAt = null,Object? updatedAt = null,}) {
  return _then(_ContextModel(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,icon: freezed == icon ? _self.icon : icon // ignore: cast_nullable_to_non_nullable
as String?,colorValue: freezed == colorValue ? _self.colorValue : colorValue // ignore: cast_nullable_to_non_nullable
as int?,isDefault: null == isDefault ? _self.isDefault : isDefault // ignore: cast_nullable_to_non_nullable
as bool,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,updatedAt: null == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime,
  ));
}


}

// dart format on
