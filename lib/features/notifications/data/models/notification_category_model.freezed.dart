// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'notification_category_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$NotificationCategoryModel {

 String get id; String get name; String get code; String? get description; String? get icon; int get priority;@JsonKey(name: 'created_at') DateTime get createdAt;
/// Create a copy of NotificationCategoryModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$NotificationCategoryModelCopyWith<NotificationCategoryModel> get copyWith => _$NotificationCategoryModelCopyWithImpl<NotificationCategoryModel>(this as NotificationCategoryModel, _$identity);

  /// Serializes this NotificationCategoryModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is NotificationCategoryModel&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.code, code) || other.code == code)&&(identical(other.description, description) || other.description == description)&&(identical(other.icon, icon) || other.icon == icon)&&(identical(other.priority, priority) || other.priority == priority)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name,code,description,icon,priority,createdAt);

@override
String toString() {
  return 'NotificationCategoryModel(id: $id, name: $name, code: $code, description: $description, icon: $icon, priority: $priority, createdAt: $createdAt)';
}


}

/// @nodoc
abstract mixin class $NotificationCategoryModelCopyWith<$Res>  {
  factory $NotificationCategoryModelCopyWith(NotificationCategoryModel value, $Res Function(NotificationCategoryModel) _then) = _$NotificationCategoryModelCopyWithImpl;
@useResult
$Res call({
 String id, String name, String code, String? description, String? icon, int priority,@JsonKey(name: 'created_at') DateTime createdAt
});




}
/// @nodoc
class _$NotificationCategoryModelCopyWithImpl<$Res>
    implements $NotificationCategoryModelCopyWith<$Res> {
  _$NotificationCategoryModelCopyWithImpl(this._self, this._then);

  final NotificationCategoryModel _self;
  final $Res Function(NotificationCategoryModel) _then;

/// Create a copy of NotificationCategoryModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? name = null,Object? code = null,Object? description = freezed,Object? icon = freezed,Object? priority = null,Object? createdAt = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,code: null == code ? _self.code : code // ignore: cast_nullable_to_non_nullable
as String,description: freezed == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String?,icon: freezed == icon ? _self.icon : icon // ignore: cast_nullable_to_non_nullable
as String?,priority: null == priority ? _self.priority : priority // ignore: cast_nullable_to_non_nullable
as int,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,
  ));
}

}


/// Adds pattern-matching-related methods to [NotificationCategoryModel].
extension NotificationCategoryModelPatterns on NotificationCategoryModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _NotificationCategoryModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _NotificationCategoryModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _NotificationCategoryModel value)  $default,){
final _that = this;
switch (_that) {
case _NotificationCategoryModel():
return $default(_that);}
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _NotificationCategoryModel value)?  $default,){
final _that = this;
switch (_that) {
case _NotificationCategoryModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String name,  String code,  String? description,  String? icon,  int priority, @JsonKey(name: 'created_at')  DateTime createdAt)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _NotificationCategoryModel() when $default != null:
return $default(_that.id,_that.name,_that.code,_that.description,_that.icon,_that.priority,_that.createdAt);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String name,  String code,  String? description,  String? icon,  int priority, @JsonKey(name: 'created_at')  DateTime createdAt)  $default,) {final _that = this;
switch (_that) {
case _NotificationCategoryModel():
return $default(_that.id,_that.name,_that.code,_that.description,_that.icon,_that.priority,_that.createdAt);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String name,  String code,  String? description,  String? icon,  int priority, @JsonKey(name: 'created_at')  DateTime createdAt)?  $default,) {final _that = this;
switch (_that) {
case _NotificationCategoryModel() when $default != null:
return $default(_that.id,_that.name,_that.code,_that.description,_that.icon,_that.priority,_that.createdAt);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _NotificationCategoryModel implements NotificationCategoryModel {
  const _NotificationCategoryModel({required this.id, required this.name, required this.code, this.description, this.icon, required this.priority, @JsonKey(name: 'created_at') required this.createdAt});
  factory _NotificationCategoryModel.fromJson(Map<String, dynamic> json) => _$NotificationCategoryModelFromJson(json);

@override final  String id;
@override final  String name;
@override final  String code;
@override final  String? description;
@override final  String? icon;
@override final  int priority;
@override@JsonKey(name: 'created_at') final  DateTime createdAt;

/// Create a copy of NotificationCategoryModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$NotificationCategoryModelCopyWith<_NotificationCategoryModel> get copyWith => __$NotificationCategoryModelCopyWithImpl<_NotificationCategoryModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$NotificationCategoryModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _NotificationCategoryModel&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.code, code) || other.code == code)&&(identical(other.description, description) || other.description == description)&&(identical(other.icon, icon) || other.icon == icon)&&(identical(other.priority, priority) || other.priority == priority)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name,code,description,icon,priority,createdAt);

@override
String toString() {
  return 'NotificationCategoryModel(id: $id, name: $name, code: $code, description: $description, icon: $icon, priority: $priority, createdAt: $createdAt)';
}


}

/// @nodoc
abstract mixin class _$NotificationCategoryModelCopyWith<$Res> implements $NotificationCategoryModelCopyWith<$Res> {
  factory _$NotificationCategoryModelCopyWith(_NotificationCategoryModel value, $Res Function(_NotificationCategoryModel) _then) = __$NotificationCategoryModelCopyWithImpl;
@override @useResult
$Res call({
 String id, String name, String code, String? description, String? icon, int priority,@JsonKey(name: 'created_at') DateTime createdAt
});




}
/// @nodoc
class __$NotificationCategoryModelCopyWithImpl<$Res>
    implements _$NotificationCategoryModelCopyWith<$Res> {
  __$NotificationCategoryModelCopyWithImpl(this._self, this._then);

  final _NotificationCategoryModel _self;
  final $Res Function(_NotificationCategoryModel) _then;

/// Create a copy of NotificationCategoryModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? name = null,Object? code = null,Object? description = freezed,Object? icon = freezed,Object? priority = null,Object? createdAt = null,}) {
  return _then(_NotificationCategoryModel(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,code: null == code ? _self.code : code // ignore: cast_nullable_to_non_nullable
as String,description: freezed == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String?,icon: freezed == icon ? _self.icon : icon // ignore: cast_nullable_to_non_nullable
as String?,priority: null == priority ? _self.priority : priority // ignore: cast_nullable_to_non_nullable
as int,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,
  ));
}


}

// dart format on
