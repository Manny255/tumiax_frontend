// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'notification_device_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$NotificationDeviceModel {

 String get id;@JsonKey(name: 'device_type') String get deviceType;@JsonKey(name: 'device_id') String get deviceId;@JsonKey(name: 'device_name') String? get deviceName;@JsonKey(name: 'push_token') String? get pushToken;@JsonKey(name: 'is_active') bool get isActive;@JsonKey(name: 'last_active_at') DateTime get lastActiveAt;@JsonKey(name: 'created_at') DateTime get createdAt;
/// Create a copy of NotificationDeviceModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$NotificationDeviceModelCopyWith<NotificationDeviceModel> get copyWith => _$NotificationDeviceModelCopyWithImpl<NotificationDeviceModel>(this as NotificationDeviceModel, _$identity);

  /// Serializes this NotificationDeviceModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is NotificationDeviceModel&&(identical(other.id, id) || other.id == id)&&(identical(other.deviceType, deviceType) || other.deviceType == deviceType)&&(identical(other.deviceId, deviceId) || other.deviceId == deviceId)&&(identical(other.deviceName, deviceName) || other.deviceName == deviceName)&&(identical(other.pushToken, pushToken) || other.pushToken == pushToken)&&(identical(other.isActive, isActive) || other.isActive == isActive)&&(identical(other.lastActiveAt, lastActiveAt) || other.lastActiveAt == lastActiveAt)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,deviceType,deviceId,deviceName,pushToken,isActive,lastActiveAt,createdAt);

@override
String toString() {
  return 'NotificationDeviceModel(id: $id, deviceType: $deviceType, deviceId: $deviceId, deviceName: $deviceName, pushToken: $pushToken, isActive: $isActive, lastActiveAt: $lastActiveAt, createdAt: $createdAt)';
}


}

/// @nodoc
abstract mixin class $NotificationDeviceModelCopyWith<$Res>  {
  factory $NotificationDeviceModelCopyWith(NotificationDeviceModel value, $Res Function(NotificationDeviceModel) _then) = _$NotificationDeviceModelCopyWithImpl;
@useResult
$Res call({
 String id,@JsonKey(name: 'device_type') String deviceType,@JsonKey(name: 'device_id') String deviceId,@JsonKey(name: 'device_name') String? deviceName,@JsonKey(name: 'push_token') String? pushToken,@JsonKey(name: 'is_active') bool isActive,@JsonKey(name: 'last_active_at') DateTime lastActiveAt,@JsonKey(name: 'created_at') DateTime createdAt
});




}
/// @nodoc
class _$NotificationDeviceModelCopyWithImpl<$Res>
    implements $NotificationDeviceModelCopyWith<$Res> {
  _$NotificationDeviceModelCopyWithImpl(this._self, this._then);

  final NotificationDeviceModel _self;
  final $Res Function(NotificationDeviceModel) _then;

/// Create a copy of NotificationDeviceModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? deviceType = null,Object? deviceId = null,Object? deviceName = freezed,Object? pushToken = freezed,Object? isActive = null,Object? lastActiveAt = null,Object? createdAt = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,deviceType: null == deviceType ? _self.deviceType : deviceType // ignore: cast_nullable_to_non_nullable
as String,deviceId: null == deviceId ? _self.deviceId : deviceId // ignore: cast_nullable_to_non_nullable
as String,deviceName: freezed == deviceName ? _self.deviceName : deviceName // ignore: cast_nullable_to_non_nullable
as String?,pushToken: freezed == pushToken ? _self.pushToken : pushToken // ignore: cast_nullable_to_non_nullable
as String?,isActive: null == isActive ? _self.isActive : isActive // ignore: cast_nullable_to_non_nullable
as bool,lastActiveAt: null == lastActiveAt ? _self.lastActiveAt : lastActiveAt // ignore: cast_nullable_to_non_nullable
as DateTime,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,
  ));
}

}


/// Adds pattern-matching-related methods to [NotificationDeviceModel].
extension NotificationDeviceModelPatterns on NotificationDeviceModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _NotificationDeviceModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _NotificationDeviceModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _NotificationDeviceModel value)  $default,){
final _that = this;
switch (_that) {
case _NotificationDeviceModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _NotificationDeviceModel value)?  $default,){
final _that = this;
switch (_that) {
case _NotificationDeviceModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id, @JsonKey(name: 'device_type')  String deviceType, @JsonKey(name: 'device_id')  String deviceId, @JsonKey(name: 'device_name')  String? deviceName, @JsonKey(name: 'push_token')  String? pushToken, @JsonKey(name: 'is_active')  bool isActive, @JsonKey(name: 'last_active_at')  DateTime lastActiveAt, @JsonKey(name: 'created_at')  DateTime createdAt)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _NotificationDeviceModel() when $default != null:
return $default(_that.id,_that.deviceType,_that.deviceId,_that.deviceName,_that.pushToken,_that.isActive,_that.lastActiveAt,_that.createdAt);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id, @JsonKey(name: 'device_type')  String deviceType, @JsonKey(name: 'device_id')  String deviceId, @JsonKey(name: 'device_name')  String? deviceName, @JsonKey(name: 'push_token')  String? pushToken, @JsonKey(name: 'is_active')  bool isActive, @JsonKey(name: 'last_active_at')  DateTime lastActiveAt, @JsonKey(name: 'created_at')  DateTime createdAt)  $default,) {final _that = this;
switch (_that) {
case _NotificationDeviceModel():
return $default(_that.id,_that.deviceType,_that.deviceId,_that.deviceName,_that.pushToken,_that.isActive,_that.lastActiveAt,_that.createdAt);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id, @JsonKey(name: 'device_type')  String deviceType, @JsonKey(name: 'device_id')  String deviceId, @JsonKey(name: 'device_name')  String? deviceName, @JsonKey(name: 'push_token')  String? pushToken, @JsonKey(name: 'is_active')  bool isActive, @JsonKey(name: 'last_active_at')  DateTime lastActiveAt, @JsonKey(name: 'created_at')  DateTime createdAt)?  $default,) {final _that = this;
switch (_that) {
case _NotificationDeviceModel() when $default != null:
return $default(_that.id,_that.deviceType,_that.deviceId,_that.deviceName,_that.pushToken,_that.isActive,_that.lastActiveAt,_that.createdAt);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _NotificationDeviceModel implements NotificationDeviceModel {
  const _NotificationDeviceModel({required this.id, @JsonKey(name: 'device_type') required this.deviceType, @JsonKey(name: 'device_id') required this.deviceId, @JsonKey(name: 'device_name') this.deviceName, @JsonKey(name: 'push_token') this.pushToken, @JsonKey(name: 'is_active') required this.isActive, @JsonKey(name: 'last_active_at') required this.lastActiveAt, @JsonKey(name: 'created_at') required this.createdAt});
  factory _NotificationDeviceModel.fromJson(Map<String, dynamic> json) => _$NotificationDeviceModelFromJson(json);

@override final  String id;
@override@JsonKey(name: 'device_type') final  String deviceType;
@override@JsonKey(name: 'device_id') final  String deviceId;
@override@JsonKey(name: 'device_name') final  String? deviceName;
@override@JsonKey(name: 'push_token') final  String? pushToken;
@override@JsonKey(name: 'is_active') final  bool isActive;
@override@JsonKey(name: 'last_active_at') final  DateTime lastActiveAt;
@override@JsonKey(name: 'created_at') final  DateTime createdAt;

/// Create a copy of NotificationDeviceModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$NotificationDeviceModelCopyWith<_NotificationDeviceModel> get copyWith => __$NotificationDeviceModelCopyWithImpl<_NotificationDeviceModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$NotificationDeviceModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _NotificationDeviceModel&&(identical(other.id, id) || other.id == id)&&(identical(other.deviceType, deviceType) || other.deviceType == deviceType)&&(identical(other.deviceId, deviceId) || other.deviceId == deviceId)&&(identical(other.deviceName, deviceName) || other.deviceName == deviceName)&&(identical(other.pushToken, pushToken) || other.pushToken == pushToken)&&(identical(other.isActive, isActive) || other.isActive == isActive)&&(identical(other.lastActiveAt, lastActiveAt) || other.lastActiveAt == lastActiveAt)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,deviceType,deviceId,deviceName,pushToken,isActive,lastActiveAt,createdAt);

@override
String toString() {
  return 'NotificationDeviceModel(id: $id, deviceType: $deviceType, deviceId: $deviceId, deviceName: $deviceName, pushToken: $pushToken, isActive: $isActive, lastActiveAt: $lastActiveAt, createdAt: $createdAt)';
}


}

/// @nodoc
abstract mixin class _$NotificationDeviceModelCopyWith<$Res> implements $NotificationDeviceModelCopyWith<$Res> {
  factory _$NotificationDeviceModelCopyWith(_NotificationDeviceModel value, $Res Function(_NotificationDeviceModel) _then) = __$NotificationDeviceModelCopyWithImpl;
@override @useResult
$Res call({
 String id,@JsonKey(name: 'device_type') String deviceType,@JsonKey(name: 'device_id') String deviceId,@JsonKey(name: 'device_name') String? deviceName,@JsonKey(name: 'push_token') String? pushToken,@JsonKey(name: 'is_active') bool isActive,@JsonKey(name: 'last_active_at') DateTime lastActiveAt,@JsonKey(name: 'created_at') DateTime createdAt
});




}
/// @nodoc
class __$NotificationDeviceModelCopyWithImpl<$Res>
    implements _$NotificationDeviceModelCopyWith<$Res> {
  __$NotificationDeviceModelCopyWithImpl(this._self, this._then);

  final _NotificationDeviceModel _self;
  final $Res Function(_NotificationDeviceModel) _then;

/// Create a copy of NotificationDeviceModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? deviceType = null,Object? deviceId = null,Object? deviceName = freezed,Object? pushToken = freezed,Object? isActive = null,Object? lastActiveAt = null,Object? createdAt = null,}) {
  return _then(_NotificationDeviceModel(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,deviceType: null == deviceType ? _self.deviceType : deviceType // ignore: cast_nullable_to_non_nullable
as String,deviceId: null == deviceId ? _self.deviceId : deviceId // ignore: cast_nullable_to_non_nullable
as String,deviceName: freezed == deviceName ? _self.deviceName : deviceName // ignore: cast_nullable_to_non_nullable
as String?,pushToken: freezed == pushToken ? _self.pushToken : pushToken // ignore: cast_nullable_to_non_nullable
as String?,isActive: null == isActive ? _self.isActive : isActive // ignore: cast_nullable_to_non_nullable
as bool,lastActiveAt: null == lastActiveAt ? _self.lastActiveAt : lastActiveAt // ignore: cast_nullable_to_non_nullable
as DateTime,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,
  ));
}


}

// dart format on
