// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'notification_preference_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$NotificationPreferenceModel {

@JsonKey(name: 'all_notifications_disabled') bool get allNotificationsDisabled; Map<String, dynamic> get preferences;@JsonKey(name: 'quiet_hours_enabled') bool get quietHoursEnabled;@JsonKey(name: 'quiet_hours_start') String? get quietHoursStart;@JsonKey(name: 'quiet_hours_end') String? get quietHoursEnd;@JsonKey(name: 'quiet_hours_timezone') String get quietHoursTimezone;
/// Create a copy of NotificationPreferenceModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$NotificationPreferenceModelCopyWith<NotificationPreferenceModel> get copyWith => _$NotificationPreferenceModelCopyWithImpl<NotificationPreferenceModel>(this as NotificationPreferenceModel, _$identity);

  /// Serializes this NotificationPreferenceModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is NotificationPreferenceModel&&(identical(other.allNotificationsDisabled, allNotificationsDisabled) || other.allNotificationsDisabled == allNotificationsDisabled)&&const DeepCollectionEquality().equals(other.preferences, preferences)&&(identical(other.quietHoursEnabled, quietHoursEnabled) || other.quietHoursEnabled == quietHoursEnabled)&&(identical(other.quietHoursStart, quietHoursStart) || other.quietHoursStart == quietHoursStart)&&(identical(other.quietHoursEnd, quietHoursEnd) || other.quietHoursEnd == quietHoursEnd)&&(identical(other.quietHoursTimezone, quietHoursTimezone) || other.quietHoursTimezone == quietHoursTimezone));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,allNotificationsDisabled,const DeepCollectionEquality().hash(preferences),quietHoursEnabled,quietHoursStart,quietHoursEnd,quietHoursTimezone);

@override
String toString() {
  return 'NotificationPreferenceModel(allNotificationsDisabled: $allNotificationsDisabled, preferences: $preferences, quietHoursEnabled: $quietHoursEnabled, quietHoursStart: $quietHoursStart, quietHoursEnd: $quietHoursEnd, quietHoursTimezone: $quietHoursTimezone)';
}


}

/// @nodoc
abstract mixin class $NotificationPreferenceModelCopyWith<$Res>  {
  factory $NotificationPreferenceModelCopyWith(NotificationPreferenceModel value, $Res Function(NotificationPreferenceModel) _then) = _$NotificationPreferenceModelCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: 'all_notifications_disabled') bool allNotificationsDisabled, Map<String, dynamic> preferences,@JsonKey(name: 'quiet_hours_enabled') bool quietHoursEnabled,@JsonKey(name: 'quiet_hours_start') String? quietHoursStart,@JsonKey(name: 'quiet_hours_end') String? quietHoursEnd,@JsonKey(name: 'quiet_hours_timezone') String quietHoursTimezone
});




}
/// @nodoc
class _$NotificationPreferenceModelCopyWithImpl<$Res>
    implements $NotificationPreferenceModelCopyWith<$Res> {
  _$NotificationPreferenceModelCopyWithImpl(this._self, this._then);

  final NotificationPreferenceModel _self;
  final $Res Function(NotificationPreferenceModel) _then;

/// Create a copy of NotificationPreferenceModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? allNotificationsDisabled = null,Object? preferences = null,Object? quietHoursEnabled = null,Object? quietHoursStart = freezed,Object? quietHoursEnd = freezed,Object? quietHoursTimezone = null,}) {
  return _then(_self.copyWith(
allNotificationsDisabled: null == allNotificationsDisabled ? _self.allNotificationsDisabled : allNotificationsDisabled // ignore: cast_nullable_to_non_nullable
as bool,preferences: null == preferences ? _self.preferences : preferences // ignore: cast_nullable_to_non_nullable
as Map<String, dynamic>,quietHoursEnabled: null == quietHoursEnabled ? _self.quietHoursEnabled : quietHoursEnabled // ignore: cast_nullable_to_non_nullable
as bool,quietHoursStart: freezed == quietHoursStart ? _self.quietHoursStart : quietHoursStart // ignore: cast_nullable_to_non_nullable
as String?,quietHoursEnd: freezed == quietHoursEnd ? _self.quietHoursEnd : quietHoursEnd // ignore: cast_nullable_to_non_nullable
as String?,quietHoursTimezone: null == quietHoursTimezone ? _self.quietHoursTimezone : quietHoursTimezone // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [NotificationPreferenceModel].
extension NotificationPreferenceModelPatterns on NotificationPreferenceModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _NotificationPreferenceModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _NotificationPreferenceModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _NotificationPreferenceModel value)  $default,){
final _that = this;
switch (_that) {
case _NotificationPreferenceModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _NotificationPreferenceModel value)?  $default,){
final _that = this;
switch (_that) {
case _NotificationPreferenceModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: 'all_notifications_disabled')  bool allNotificationsDisabled,  Map<String, dynamic> preferences, @JsonKey(name: 'quiet_hours_enabled')  bool quietHoursEnabled, @JsonKey(name: 'quiet_hours_start')  String? quietHoursStart, @JsonKey(name: 'quiet_hours_end')  String? quietHoursEnd, @JsonKey(name: 'quiet_hours_timezone')  String quietHoursTimezone)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _NotificationPreferenceModel() when $default != null:
return $default(_that.allNotificationsDisabled,_that.preferences,_that.quietHoursEnabled,_that.quietHoursStart,_that.quietHoursEnd,_that.quietHoursTimezone);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: 'all_notifications_disabled')  bool allNotificationsDisabled,  Map<String, dynamic> preferences, @JsonKey(name: 'quiet_hours_enabled')  bool quietHoursEnabled, @JsonKey(name: 'quiet_hours_start')  String? quietHoursStart, @JsonKey(name: 'quiet_hours_end')  String? quietHoursEnd, @JsonKey(name: 'quiet_hours_timezone')  String quietHoursTimezone)  $default,) {final _that = this;
switch (_that) {
case _NotificationPreferenceModel():
return $default(_that.allNotificationsDisabled,_that.preferences,_that.quietHoursEnabled,_that.quietHoursStart,_that.quietHoursEnd,_that.quietHoursTimezone);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: 'all_notifications_disabled')  bool allNotificationsDisabled,  Map<String, dynamic> preferences, @JsonKey(name: 'quiet_hours_enabled')  bool quietHoursEnabled, @JsonKey(name: 'quiet_hours_start')  String? quietHoursStart, @JsonKey(name: 'quiet_hours_end')  String? quietHoursEnd, @JsonKey(name: 'quiet_hours_timezone')  String quietHoursTimezone)?  $default,) {final _that = this;
switch (_that) {
case _NotificationPreferenceModel() when $default != null:
return $default(_that.allNotificationsDisabled,_that.preferences,_that.quietHoursEnabled,_that.quietHoursStart,_that.quietHoursEnd,_that.quietHoursTimezone);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _NotificationPreferenceModel implements NotificationPreferenceModel {
  const _NotificationPreferenceModel({@JsonKey(name: 'all_notifications_disabled') required this.allNotificationsDisabled, required final  Map<String, dynamic> preferences, @JsonKey(name: 'quiet_hours_enabled') required this.quietHoursEnabled, @JsonKey(name: 'quiet_hours_start') this.quietHoursStart, @JsonKey(name: 'quiet_hours_end') this.quietHoursEnd, @JsonKey(name: 'quiet_hours_timezone') required this.quietHoursTimezone}): _preferences = preferences;
  factory _NotificationPreferenceModel.fromJson(Map<String, dynamic> json) => _$NotificationPreferenceModelFromJson(json);

@override@JsonKey(name: 'all_notifications_disabled') final  bool allNotificationsDisabled;
 final  Map<String, dynamic> _preferences;
@override Map<String, dynamic> get preferences {
  if (_preferences is EqualUnmodifiableMapView) return _preferences;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableMapView(_preferences);
}

@override@JsonKey(name: 'quiet_hours_enabled') final  bool quietHoursEnabled;
@override@JsonKey(name: 'quiet_hours_start') final  String? quietHoursStart;
@override@JsonKey(name: 'quiet_hours_end') final  String? quietHoursEnd;
@override@JsonKey(name: 'quiet_hours_timezone') final  String quietHoursTimezone;

/// Create a copy of NotificationPreferenceModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$NotificationPreferenceModelCopyWith<_NotificationPreferenceModel> get copyWith => __$NotificationPreferenceModelCopyWithImpl<_NotificationPreferenceModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$NotificationPreferenceModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _NotificationPreferenceModel&&(identical(other.allNotificationsDisabled, allNotificationsDisabled) || other.allNotificationsDisabled == allNotificationsDisabled)&&const DeepCollectionEquality().equals(other._preferences, _preferences)&&(identical(other.quietHoursEnabled, quietHoursEnabled) || other.quietHoursEnabled == quietHoursEnabled)&&(identical(other.quietHoursStart, quietHoursStart) || other.quietHoursStart == quietHoursStart)&&(identical(other.quietHoursEnd, quietHoursEnd) || other.quietHoursEnd == quietHoursEnd)&&(identical(other.quietHoursTimezone, quietHoursTimezone) || other.quietHoursTimezone == quietHoursTimezone));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,allNotificationsDisabled,const DeepCollectionEquality().hash(_preferences),quietHoursEnabled,quietHoursStart,quietHoursEnd,quietHoursTimezone);

@override
String toString() {
  return 'NotificationPreferenceModel(allNotificationsDisabled: $allNotificationsDisabled, preferences: $preferences, quietHoursEnabled: $quietHoursEnabled, quietHoursStart: $quietHoursStart, quietHoursEnd: $quietHoursEnd, quietHoursTimezone: $quietHoursTimezone)';
}


}

/// @nodoc
abstract mixin class _$NotificationPreferenceModelCopyWith<$Res> implements $NotificationPreferenceModelCopyWith<$Res> {
  factory _$NotificationPreferenceModelCopyWith(_NotificationPreferenceModel value, $Res Function(_NotificationPreferenceModel) _then) = __$NotificationPreferenceModelCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: 'all_notifications_disabled') bool allNotificationsDisabled, Map<String, dynamic> preferences,@JsonKey(name: 'quiet_hours_enabled') bool quietHoursEnabled,@JsonKey(name: 'quiet_hours_start') String? quietHoursStart,@JsonKey(name: 'quiet_hours_end') String? quietHoursEnd,@JsonKey(name: 'quiet_hours_timezone') String quietHoursTimezone
});




}
/// @nodoc
class __$NotificationPreferenceModelCopyWithImpl<$Res>
    implements _$NotificationPreferenceModelCopyWith<$Res> {
  __$NotificationPreferenceModelCopyWithImpl(this._self, this._then);

  final _NotificationPreferenceModel _self;
  final $Res Function(_NotificationPreferenceModel) _then;

/// Create a copy of NotificationPreferenceModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? allNotificationsDisabled = null,Object? preferences = null,Object? quietHoursEnabled = null,Object? quietHoursStart = freezed,Object? quietHoursEnd = freezed,Object? quietHoursTimezone = null,}) {
  return _then(_NotificationPreferenceModel(
allNotificationsDisabled: null == allNotificationsDisabled ? _self.allNotificationsDisabled : allNotificationsDisabled // ignore: cast_nullable_to_non_nullable
as bool,preferences: null == preferences ? _self._preferences : preferences // ignore: cast_nullable_to_non_nullable
as Map<String, dynamic>,quietHoursEnabled: null == quietHoursEnabled ? _self.quietHoursEnabled : quietHoursEnabled // ignore: cast_nullable_to_non_nullable
as bool,quietHoursStart: freezed == quietHoursStart ? _self.quietHoursStart : quietHoursStart // ignore: cast_nullable_to_non_nullable
as String?,quietHoursEnd: freezed == quietHoursEnd ? _self.quietHoursEnd : quietHoursEnd // ignore: cast_nullable_to_non_nullable
as String?,quietHoursTimezone: null == quietHoursTimezone ? _self.quietHoursTimezone : quietHoursTimezone // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
