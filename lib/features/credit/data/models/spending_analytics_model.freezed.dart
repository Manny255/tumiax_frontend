// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'spending_analytics_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$SpendingAnalyticsModel {

@JsonKey(name: 'total_spent') double get totalSpent;@JsonKey(name: 'weekly_spending') List<double> get weeklySpending;@JsonKey(name: 'week_days') List<String> get weekDays; Map<String, String> get period; Map<String, dynamic> get analytics;
/// Create a copy of SpendingAnalyticsModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SpendingAnalyticsModelCopyWith<SpendingAnalyticsModel> get copyWith => _$SpendingAnalyticsModelCopyWithImpl<SpendingAnalyticsModel>(this as SpendingAnalyticsModel, _$identity);

  /// Serializes this SpendingAnalyticsModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SpendingAnalyticsModel&&(identical(other.totalSpent, totalSpent) || other.totalSpent == totalSpent)&&const DeepCollectionEquality().equals(other.weeklySpending, weeklySpending)&&const DeepCollectionEquality().equals(other.weekDays, weekDays)&&const DeepCollectionEquality().equals(other.period, period)&&const DeepCollectionEquality().equals(other.analytics, analytics));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,totalSpent,const DeepCollectionEquality().hash(weeklySpending),const DeepCollectionEquality().hash(weekDays),const DeepCollectionEquality().hash(period),const DeepCollectionEquality().hash(analytics));

@override
String toString() {
  return 'SpendingAnalyticsModel(totalSpent: $totalSpent, weeklySpending: $weeklySpending, weekDays: $weekDays, period: $period, analytics: $analytics)';
}


}

/// @nodoc
abstract mixin class $SpendingAnalyticsModelCopyWith<$Res>  {
  factory $SpendingAnalyticsModelCopyWith(SpendingAnalyticsModel value, $Res Function(SpendingAnalyticsModel) _then) = _$SpendingAnalyticsModelCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: 'total_spent') double totalSpent,@JsonKey(name: 'weekly_spending') List<double> weeklySpending,@JsonKey(name: 'week_days') List<String> weekDays, Map<String, String> period, Map<String, dynamic> analytics
});




}
/// @nodoc
class _$SpendingAnalyticsModelCopyWithImpl<$Res>
    implements $SpendingAnalyticsModelCopyWith<$Res> {
  _$SpendingAnalyticsModelCopyWithImpl(this._self, this._then);

  final SpendingAnalyticsModel _self;
  final $Res Function(SpendingAnalyticsModel) _then;

/// Create a copy of SpendingAnalyticsModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? totalSpent = null,Object? weeklySpending = null,Object? weekDays = null,Object? period = null,Object? analytics = null,}) {
  return _then(_self.copyWith(
totalSpent: null == totalSpent ? _self.totalSpent : totalSpent // ignore: cast_nullable_to_non_nullable
as double,weeklySpending: null == weeklySpending ? _self.weeklySpending : weeklySpending // ignore: cast_nullable_to_non_nullable
as List<double>,weekDays: null == weekDays ? _self.weekDays : weekDays // ignore: cast_nullable_to_non_nullable
as List<String>,period: null == period ? _self.period : period // ignore: cast_nullable_to_non_nullable
as Map<String, String>,analytics: null == analytics ? _self.analytics : analytics // ignore: cast_nullable_to_non_nullable
as Map<String, dynamic>,
  ));
}

}


/// Adds pattern-matching-related methods to [SpendingAnalyticsModel].
extension SpendingAnalyticsModelPatterns on SpendingAnalyticsModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _SpendingAnalyticsModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _SpendingAnalyticsModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _SpendingAnalyticsModel value)  $default,){
final _that = this;
switch (_that) {
case _SpendingAnalyticsModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _SpendingAnalyticsModel value)?  $default,){
final _that = this;
switch (_that) {
case _SpendingAnalyticsModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: 'total_spent')  double totalSpent, @JsonKey(name: 'weekly_spending')  List<double> weeklySpending, @JsonKey(name: 'week_days')  List<String> weekDays,  Map<String, String> period,  Map<String, dynamic> analytics)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _SpendingAnalyticsModel() when $default != null:
return $default(_that.totalSpent,_that.weeklySpending,_that.weekDays,_that.period,_that.analytics);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: 'total_spent')  double totalSpent, @JsonKey(name: 'weekly_spending')  List<double> weeklySpending, @JsonKey(name: 'week_days')  List<String> weekDays,  Map<String, String> period,  Map<String, dynamic> analytics)  $default,) {final _that = this;
switch (_that) {
case _SpendingAnalyticsModel():
return $default(_that.totalSpent,_that.weeklySpending,_that.weekDays,_that.period,_that.analytics);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: 'total_spent')  double totalSpent, @JsonKey(name: 'weekly_spending')  List<double> weeklySpending, @JsonKey(name: 'week_days')  List<String> weekDays,  Map<String, String> period,  Map<String, dynamic> analytics)?  $default,) {final _that = this;
switch (_that) {
case _SpendingAnalyticsModel() when $default != null:
return $default(_that.totalSpent,_that.weeklySpending,_that.weekDays,_that.period,_that.analytics);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _SpendingAnalyticsModel implements SpendingAnalyticsModel {
  const _SpendingAnalyticsModel({@JsonKey(name: 'total_spent') required this.totalSpent, @JsonKey(name: 'weekly_spending') required final  List<double> weeklySpending, @JsonKey(name: 'week_days') required final  List<String> weekDays, required final  Map<String, String> period, required final  Map<String, dynamic> analytics}): _weeklySpending = weeklySpending,_weekDays = weekDays,_period = period,_analytics = analytics;
  factory _SpendingAnalyticsModel.fromJson(Map<String, dynamic> json) => _$SpendingAnalyticsModelFromJson(json);

@override@JsonKey(name: 'total_spent') final  double totalSpent;
 final  List<double> _weeklySpending;
@override@JsonKey(name: 'weekly_spending') List<double> get weeklySpending {
  if (_weeklySpending is EqualUnmodifiableListView) return _weeklySpending;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_weeklySpending);
}

 final  List<String> _weekDays;
@override@JsonKey(name: 'week_days') List<String> get weekDays {
  if (_weekDays is EqualUnmodifiableListView) return _weekDays;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_weekDays);
}

 final  Map<String, String> _period;
@override Map<String, String> get period {
  if (_period is EqualUnmodifiableMapView) return _period;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableMapView(_period);
}

 final  Map<String, dynamic> _analytics;
@override Map<String, dynamic> get analytics {
  if (_analytics is EqualUnmodifiableMapView) return _analytics;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableMapView(_analytics);
}


/// Create a copy of SpendingAnalyticsModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SpendingAnalyticsModelCopyWith<_SpendingAnalyticsModel> get copyWith => __$SpendingAnalyticsModelCopyWithImpl<_SpendingAnalyticsModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$SpendingAnalyticsModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _SpendingAnalyticsModel&&(identical(other.totalSpent, totalSpent) || other.totalSpent == totalSpent)&&const DeepCollectionEquality().equals(other._weeklySpending, _weeklySpending)&&const DeepCollectionEquality().equals(other._weekDays, _weekDays)&&const DeepCollectionEquality().equals(other._period, _period)&&const DeepCollectionEquality().equals(other._analytics, _analytics));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,totalSpent,const DeepCollectionEquality().hash(_weeklySpending),const DeepCollectionEquality().hash(_weekDays),const DeepCollectionEquality().hash(_period),const DeepCollectionEquality().hash(_analytics));

@override
String toString() {
  return 'SpendingAnalyticsModel(totalSpent: $totalSpent, weeklySpending: $weeklySpending, weekDays: $weekDays, period: $period, analytics: $analytics)';
}


}

/// @nodoc
abstract mixin class _$SpendingAnalyticsModelCopyWith<$Res> implements $SpendingAnalyticsModelCopyWith<$Res> {
  factory _$SpendingAnalyticsModelCopyWith(_SpendingAnalyticsModel value, $Res Function(_SpendingAnalyticsModel) _then) = __$SpendingAnalyticsModelCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: 'total_spent') double totalSpent,@JsonKey(name: 'weekly_spending') List<double> weeklySpending,@JsonKey(name: 'week_days') List<String> weekDays, Map<String, String> period, Map<String, dynamic> analytics
});




}
/// @nodoc
class __$SpendingAnalyticsModelCopyWithImpl<$Res>
    implements _$SpendingAnalyticsModelCopyWith<$Res> {
  __$SpendingAnalyticsModelCopyWithImpl(this._self, this._then);

  final _SpendingAnalyticsModel _self;
  final $Res Function(_SpendingAnalyticsModel) _then;

/// Create a copy of SpendingAnalyticsModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? totalSpent = null,Object? weeklySpending = null,Object? weekDays = null,Object? period = null,Object? analytics = null,}) {
  return _then(_SpendingAnalyticsModel(
totalSpent: null == totalSpent ? _self.totalSpent : totalSpent // ignore: cast_nullable_to_non_nullable
as double,weeklySpending: null == weeklySpending ? _self._weeklySpending : weeklySpending // ignore: cast_nullable_to_non_nullable
as List<double>,weekDays: null == weekDays ? _self._weekDays : weekDays // ignore: cast_nullable_to_non_nullable
as List<String>,period: null == period ? _self._period : period // ignore: cast_nullable_to_non_nullable
as Map<String, String>,analytics: null == analytics ? _self._analytics : analytics // ignore: cast_nullable_to_non_nullable
as Map<String, dynamic>,
  ));
}


}

// dart format on
