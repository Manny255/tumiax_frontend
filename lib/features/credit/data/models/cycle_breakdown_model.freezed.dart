// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'cycle_breakdown_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$CycleBreakdownModel {

 int get cycle;@JsonKey(name: 'interest_rate') String get interestRate;@JsonKey(name: 'penalty_rate') String get penaltyRate;@JsonKey(name: 'interest_amount') String get interestAmount;@JsonKey(name: 'penalty_amount') String get penaltyAmount;@JsonKey(name: 'total_added') String get totalAdded;@JsonKey(name: 'applied_date') String? get appliedDate;@JsonKey(name: 'balance_before') String? get balanceBefore;@JsonKey(name: 'is_upfront') bool get isUpfront;
/// Create a copy of CycleBreakdownModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CycleBreakdownModelCopyWith<CycleBreakdownModel> get copyWith => _$CycleBreakdownModelCopyWithImpl<CycleBreakdownModel>(this as CycleBreakdownModel, _$identity);

  /// Serializes this CycleBreakdownModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CycleBreakdownModel&&(identical(other.cycle, cycle) || other.cycle == cycle)&&(identical(other.interestRate, interestRate) || other.interestRate == interestRate)&&(identical(other.penaltyRate, penaltyRate) || other.penaltyRate == penaltyRate)&&(identical(other.interestAmount, interestAmount) || other.interestAmount == interestAmount)&&(identical(other.penaltyAmount, penaltyAmount) || other.penaltyAmount == penaltyAmount)&&(identical(other.totalAdded, totalAdded) || other.totalAdded == totalAdded)&&(identical(other.appliedDate, appliedDate) || other.appliedDate == appliedDate)&&(identical(other.balanceBefore, balanceBefore) || other.balanceBefore == balanceBefore)&&(identical(other.isUpfront, isUpfront) || other.isUpfront == isUpfront));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,cycle,interestRate,penaltyRate,interestAmount,penaltyAmount,totalAdded,appliedDate,balanceBefore,isUpfront);

@override
String toString() {
  return 'CycleBreakdownModel(cycle: $cycle, interestRate: $interestRate, penaltyRate: $penaltyRate, interestAmount: $interestAmount, penaltyAmount: $penaltyAmount, totalAdded: $totalAdded, appliedDate: $appliedDate, balanceBefore: $balanceBefore, isUpfront: $isUpfront)';
}


}

/// @nodoc
abstract mixin class $CycleBreakdownModelCopyWith<$Res>  {
  factory $CycleBreakdownModelCopyWith(CycleBreakdownModel value, $Res Function(CycleBreakdownModel) _then) = _$CycleBreakdownModelCopyWithImpl;
@useResult
$Res call({
 int cycle,@JsonKey(name: 'interest_rate') String interestRate,@JsonKey(name: 'penalty_rate') String penaltyRate,@JsonKey(name: 'interest_amount') String interestAmount,@JsonKey(name: 'penalty_amount') String penaltyAmount,@JsonKey(name: 'total_added') String totalAdded,@JsonKey(name: 'applied_date') String? appliedDate,@JsonKey(name: 'balance_before') String? balanceBefore,@JsonKey(name: 'is_upfront') bool isUpfront
});




}
/// @nodoc
class _$CycleBreakdownModelCopyWithImpl<$Res>
    implements $CycleBreakdownModelCopyWith<$Res> {
  _$CycleBreakdownModelCopyWithImpl(this._self, this._then);

  final CycleBreakdownModel _self;
  final $Res Function(CycleBreakdownModel) _then;

/// Create a copy of CycleBreakdownModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? cycle = null,Object? interestRate = null,Object? penaltyRate = null,Object? interestAmount = null,Object? penaltyAmount = null,Object? totalAdded = null,Object? appliedDate = freezed,Object? balanceBefore = freezed,Object? isUpfront = null,}) {
  return _then(_self.copyWith(
cycle: null == cycle ? _self.cycle : cycle // ignore: cast_nullable_to_non_nullable
as int,interestRate: null == interestRate ? _self.interestRate : interestRate // ignore: cast_nullable_to_non_nullable
as String,penaltyRate: null == penaltyRate ? _self.penaltyRate : penaltyRate // ignore: cast_nullable_to_non_nullable
as String,interestAmount: null == interestAmount ? _self.interestAmount : interestAmount // ignore: cast_nullable_to_non_nullable
as String,penaltyAmount: null == penaltyAmount ? _self.penaltyAmount : penaltyAmount // ignore: cast_nullable_to_non_nullable
as String,totalAdded: null == totalAdded ? _self.totalAdded : totalAdded // ignore: cast_nullable_to_non_nullable
as String,appliedDate: freezed == appliedDate ? _self.appliedDate : appliedDate // ignore: cast_nullable_to_non_nullable
as String?,balanceBefore: freezed == balanceBefore ? _self.balanceBefore : balanceBefore // ignore: cast_nullable_to_non_nullable
as String?,isUpfront: null == isUpfront ? _self.isUpfront : isUpfront // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}

}


/// Adds pattern-matching-related methods to [CycleBreakdownModel].
extension CycleBreakdownModelPatterns on CycleBreakdownModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _CycleBreakdownModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _CycleBreakdownModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _CycleBreakdownModel value)  $default,){
final _that = this;
switch (_that) {
case _CycleBreakdownModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _CycleBreakdownModel value)?  $default,){
final _that = this;
switch (_that) {
case _CycleBreakdownModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int cycle, @JsonKey(name: 'interest_rate')  String interestRate, @JsonKey(name: 'penalty_rate')  String penaltyRate, @JsonKey(name: 'interest_amount')  String interestAmount, @JsonKey(name: 'penalty_amount')  String penaltyAmount, @JsonKey(name: 'total_added')  String totalAdded, @JsonKey(name: 'applied_date')  String? appliedDate, @JsonKey(name: 'balance_before')  String? balanceBefore, @JsonKey(name: 'is_upfront')  bool isUpfront)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _CycleBreakdownModel() when $default != null:
return $default(_that.cycle,_that.interestRate,_that.penaltyRate,_that.interestAmount,_that.penaltyAmount,_that.totalAdded,_that.appliedDate,_that.balanceBefore,_that.isUpfront);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int cycle, @JsonKey(name: 'interest_rate')  String interestRate, @JsonKey(name: 'penalty_rate')  String penaltyRate, @JsonKey(name: 'interest_amount')  String interestAmount, @JsonKey(name: 'penalty_amount')  String penaltyAmount, @JsonKey(name: 'total_added')  String totalAdded, @JsonKey(name: 'applied_date')  String? appliedDate, @JsonKey(name: 'balance_before')  String? balanceBefore, @JsonKey(name: 'is_upfront')  bool isUpfront)  $default,) {final _that = this;
switch (_that) {
case _CycleBreakdownModel():
return $default(_that.cycle,_that.interestRate,_that.penaltyRate,_that.interestAmount,_that.penaltyAmount,_that.totalAdded,_that.appliedDate,_that.balanceBefore,_that.isUpfront);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int cycle, @JsonKey(name: 'interest_rate')  String interestRate, @JsonKey(name: 'penalty_rate')  String penaltyRate, @JsonKey(name: 'interest_amount')  String interestAmount, @JsonKey(name: 'penalty_amount')  String penaltyAmount, @JsonKey(name: 'total_added')  String totalAdded, @JsonKey(name: 'applied_date')  String? appliedDate, @JsonKey(name: 'balance_before')  String? balanceBefore, @JsonKey(name: 'is_upfront')  bool isUpfront)?  $default,) {final _that = this;
switch (_that) {
case _CycleBreakdownModel() when $default != null:
return $default(_that.cycle,_that.interestRate,_that.penaltyRate,_that.interestAmount,_that.penaltyAmount,_that.totalAdded,_that.appliedDate,_that.balanceBefore,_that.isUpfront);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _CycleBreakdownModel implements CycleBreakdownModel {
  const _CycleBreakdownModel({required this.cycle, @JsonKey(name: 'interest_rate') required this.interestRate, @JsonKey(name: 'penalty_rate') required this.penaltyRate, @JsonKey(name: 'interest_amount') required this.interestAmount, @JsonKey(name: 'penalty_amount') required this.penaltyAmount, @JsonKey(name: 'total_added') required this.totalAdded, @JsonKey(name: 'applied_date') this.appliedDate, @JsonKey(name: 'balance_before') this.balanceBefore, @JsonKey(name: 'is_upfront') required this.isUpfront});
  factory _CycleBreakdownModel.fromJson(Map<String, dynamic> json) => _$CycleBreakdownModelFromJson(json);

@override final  int cycle;
@override@JsonKey(name: 'interest_rate') final  String interestRate;
@override@JsonKey(name: 'penalty_rate') final  String penaltyRate;
@override@JsonKey(name: 'interest_amount') final  String interestAmount;
@override@JsonKey(name: 'penalty_amount') final  String penaltyAmount;
@override@JsonKey(name: 'total_added') final  String totalAdded;
@override@JsonKey(name: 'applied_date') final  String? appliedDate;
@override@JsonKey(name: 'balance_before') final  String? balanceBefore;
@override@JsonKey(name: 'is_upfront') final  bool isUpfront;

/// Create a copy of CycleBreakdownModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CycleBreakdownModelCopyWith<_CycleBreakdownModel> get copyWith => __$CycleBreakdownModelCopyWithImpl<_CycleBreakdownModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$CycleBreakdownModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _CycleBreakdownModel&&(identical(other.cycle, cycle) || other.cycle == cycle)&&(identical(other.interestRate, interestRate) || other.interestRate == interestRate)&&(identical(other.penaltyRate, penaltyRate) || other.penaltyRate == penaltyRate)&&(identical(other.interestAmount, interestAmount) || other.interestAmount == interestAmount)&&(identical(other.penaltyAmount, penaltyAmount) || other.penaltyAmount == penaltyAmount)&&(identical(other.totalAdded, totalAdded) || other.totalAdded == totalAdded)&&(identical(other.appliedDate, appliedDate) || other.appliedDate == appliedDate)&&(identical(other.balanceBefore, balanceBefore) || other.balanceBefore == balanceBefore)&&(identical(other.isUpfront, isUpfront) || other.isUpfront == isUpfront));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,cycle,interestRate,penaltyRate,interestAmount,penaltyAmount,totalAdded,appliedDate,balanceBefore,isUpfront);

@override
String toString() {
  return 'CycleBreakdownModel(cycle: $cycle, interestRate: $interestRate, penaltyRate: $penaltyRate, interestAmount: $interestAmount, penaltyAmount: $penaltyAmount, totalAdded: $totalAdded, appliedDate: $appliedDate, balanceBefore: $balanceBefore, isUpfront: $isUpfront)';
}


}

/// @nodoc
abstract mixin class _$CycleBreakdownModelCopyWith<$Res> implements $CycleBreakdownModelCopyWith<$Res> {
  factory _$CycleBreakdownModelCopyWith(_CycleBreakdownModel value, $Res Function(_CycleBreakdownModel) _then) = __$CycleBreakdownModelCopyWithImpl;
@override @useResult
$Res call({
 int cycle,@JsonKey(name: 'interest_rate') String interestRate,@JsonKey(name: 'penalty_rate') String penaltyRate,@JsonKey(name: 'interest_amount') String interestAmount,@JsonKey(name: 'penalty_amount') String penaltyAmount,@JsonKey(name: 'total_added') String totalAdded,@JsonKey(name: 'applied_date') String? appliedDate,@JsonKey(name: 'balance_before') String? balanceBefore,@JsonKey(name: 'is_upfront') bool isUpfront
});




}
/// @nodoc
class __$CycleBreakdownModelCopyWithImpl<$Res>
    implements _$CycleBreakdownModelCopyWith<$Res> {
  __$CycleBreakdownModelCopyWithImpl(this._self, this._then);

  final _CycleBreakdownModel _self;
  final $Res Function(_CycleBreakdownModel) _then;

/// Create a copy of CycleBreakdownModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? cycle = null,Object? interestRate = null,Object? penaltyRate = null,Object? interestAmount = null,Object? penaltyAmount = null,Object? totalAdded = null,Object? appliedDate = freezed,Object? balanceBefore = freezed,Object? isUpfront = null,}) {
  return _then(_CycleBreakdownModel(
cycle: null == cycle ? _self.cycle : cycle // ignore: cast_nullable_to_non_nullable
as int,interestRate: null == interestRate ? _self.interestRate : interestRate // ignore: cast_nullable_to_non_nullable
as String,penaltyRate: null == penaltyRate ? _self.penaltyRate : penaltyRate // ignore: cast_nullable_to_non_nullable
as String,interestAmount: null == interestAmount ? _self.interestAmount : interestAmount // ignore: cast_nullable_to_non_nullable
as String,penaltyAmount: null == penaltyAmount ? _self.penaltyAmount : penaltyAmount // ignore: cast_nullable_to_non_nullable
as String,totalAdded: null == totalAdded ? _self.totalAdded : totalAdded // ignore: cast_nullable_to_non_nullable
as String,appliedDate: freezed == appliedDate ? _self.appliedDate : appliedDate // ignore: cast_nullable_to_non_nullable
as String?,balanceBefore: freezed == balanceBefore ? _self.balanceBefore : balanceBefore // ignore: cast_nullable_to_non_nullable
as String?,isUpfront: null == isUpfront ? _self.isUpfront : isUpfront // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}

// dart format on
