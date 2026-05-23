// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'credit_line_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$CreditLineModel {

 String get id; AssetModel get asset; String get amount;@JsonKey(name: 'remaining_balance') String get remainingBalance;@JsonKey(name: 'used_amount') double get usedAmount;@JsonKey(name: 'available_amount') double get availableAmount;@JsonKey(name: 'interest_rate') String get interestRate;@JsonKey(name: 'term_months') int get termMonths;@JsonKey(name: 'monthly_payment') String get monthlyPayment;@JsonKey(name: 'originated_at') String get originatedAt;@JsonKey(name: 'matured_at') String? get maturedAt; String get status;
/// Create a copy of CreditLineModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CreditLineModelCopyWith<CreditLineModel> get copyWith => _$CreditLineModelCopyWithImpl<CreditLineModel>(this as CreditLineModel, _$identity);

  /// Serializes this CreditLineModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CreditLineModel&&(identical(other.id, id) || other.id == id)&&(identical(other.asset, asset) || other.asset == asset)&&(identical(other.amount, amount) || other.amount == amount)&&(identical(other.remainingBalance, remainingBalance) || other.remainingBalance == remainingBalance)&&(identical(other.usedAmount, usedAmount) || other.usedAmount == usedAmount)&&(identical(other.availableAmount, availableAmount) || other.availableAmount == availableAmount)&&(identical(other.interestRate, interestRate) || other.interestRate == interestRate)&&(identical(other.termMonths, termMonths) || other.termMonths == termMonths)&&(identical(other.monthlyPayment, monthlyPayment) || other.monthlyPayment == monthlyPayment)&&(identical(other.originatedAt, originatedAt) || other.originatedAt == originatedAt)&&(identical(other.maturedAt, maturedAt) || other.maturedAt == maturedAt)&&(identical(other.status, status) || other.status == status));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,asset,amount,remainingBalance,usedAmount,availableAmount,interestRate,termMonths,monthlyPayment,originatedAt,maturedAt,status);

@override
String toString() {
  return 'CreditLineModel(id: $id, asset: $asset, amount: $amount, remainingBalance: $remainingBalance, usedAmount: $usedAmount, availableAmount: $availableAmount, interestRate: $interestRate, termMonths: $termMonths, monthlyPayment: $monthlyPayment, originatedAt: $originatedAt, maturedAt: $maturedAt, status: $status)';
}


}

/// @nodoc
abstract mixin class $CreditLineModelCopyWith<$Res>  {
  factory $CreditLineModelCopyWith(CreditLineModel value, $Res Function(CreditLineModel) _then) = _$CreditLineModelCopyWithImpl;
@useResult
$Res call({
 String id, AssetModel asset, String amount,@JsonKey(name: 'remaining_balance') String remainingBalance,@JsonKey(name: 'used_amount') double usedAmount,@JsonKey(name: 'available_amount') double availableAmount,@JsonKey(name: 'interest_rate') String interestRate,@JsonKey(name: 'term_months') int termMonths,@JsonKey(name: 'monthly_payment') String monthlyPayment,@JsonKey(name: 'originated_at') String originatedAt,@JsonKey(name: 'matured_at') String? maturedAt, String status
});


$AssetModelCopyWith<$Res> get asset;

}
/// @nodoc
class _$CreditLineModelCopyWithImpl<$Res>
    implements $CreditLineModelCopyWith<$Res> {
  _$CreditLineModelCopyWithImpl(this._self, this._then);

  final CreditLineModel _self;
  final $Res Function(CreditLineModel) _then;

/// Create a copy of CreditLineModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? asset = null,Object? amount = null,Object? remainingBalance = null,Object? usedAmount = null,Object? availableAmount = null,Object? interestRate = null,Object? termMonths = null,Object? monthlyPayment = null,Object? originatedAt = null,Object? maturedAt = freezed,Object? status = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,asset: null == asset ? _self.asset : asset // ignore: cast_nullable_to_non_nullable
as AssetModel,amount: null == amount ? _self.amount : amount // ignore: cast_nullable_to_non_nullable
as String,remainingBalance: null == remainingBalance ? _self.remainingBalance : remainingBalance // ignore: cast_nullable_to_non_nullable
as String,usedAmount: null == usedAmount ? _self.usedAmount : usedAmount // ignore: cast_nullable_to_non_nullable
as double,availableAmount: null == availableAmount ? _self.availableAmount : availableAmount // ignore: cast_nullable_to_non_nullable
as double,interestRate: null == interestRate ? _self.interestRate : interestRate // ignore: cast_nullable_to_non_nullable
as String,termMonths: null == termMonths ? _self.termMonths : termMonths // ignore: cast_nullable_to_non_nullable
as int,monthlyPayment: null == monthlyPayment ? _self.monthlyPayment : monthlyPayment // ignore: cast_nullable_to_non_nullable
as String,originatedAt: null == originatedAt ? _self.originatedAt : originatedAt // ignore: cast_nullable_to_non_nullable
as String,maturedAt: freezed == maturedAt ? _self.maturedAt : maturedAt // ignore: cast_nullable_to_non_nullable
as String?,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String,
  ));
}
/// Create a copy of CreditLineModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$AssetModelCopyWith<$Res> get asset {
  
  return $AssetModelCopyWith<$Res>(_self.asset, (value) {
    return _then(_self.copyWith(asset: value));
  });
}
}


/// Adds pattern-matching-related methods to [CreditLineModel].
extension CreditLineModelPatterns on CreditLineModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _CreditLineModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _CreditLineModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _CreditLineModel value)  $default,){
final _that = this;
switch (_that) {
case _CreditLineModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _CreditLineModel value)?  $default,){
final _that = this;
switch (_that) {
case _CreditLineModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  AssetModel asset,  String amount, @JsonKey(name: 'remaining_balance')  String remainingBalance, @JsonKey(name: 'used_amount')  double usedAmount, @JsonKey(name: 'available_amount')  double availableAmount, @JsonKey(name: 'interest_rate')  String interestRate, @JsonKey(name: 'term_months')  int termMonths, @JsonKey(name: 'monthly_payment')  String monthlyPayment, @JsonKey(name: 'originated_at')  String originatedAt, @JsonKey(name: 'matured_at')  String? maturedAt,  String status)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _CreditLineModel() when $default != null:
return $default(_that.id,_that.asset,_that.amount,_that.remainingBalance,_that.usedAmount,_that.availableAmount,_that.interestRate,_that.termMonths,_that.monthlyPayment,_that.originatedAt,_that.maturedAt,_that.status);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  AssetModel asset,  String amount, @JsonKey(name: 'remaining_balance')  String remainingBalance, @JsonKey(name: 'used_amount')  double usedAmount, @JsonKey(name: 'available_amount')  double availableAmount, @JsonKey(name: 'interest_rate')  String interestRate, @JsonKey(name: 'term_months')  int termMonths, @JsonKey(name: 'monthly_payment')  String monthlyPayment, @JsonKey(name: 'originated_at')  String originatedAt, @JsonKey(name: 'matured_at')  String? maturedAt,  String status)  $default,) {final _that = this;
switch (_that) {
case _CreditLineModel():
return $default(_that.id,_that.asset,_that.amount,_that.remainingBalance,_that.usedAmount,_that.availableAmount,_that.interestRate,_that.termMonths,_that.monthlyPayment,_that.originatedAt,_that.maturedAt,_that.status);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  AssetModel asset,  String amount, @JsonKey(name: 'remaining_balance')  String remainingBalance, @JsonKey(name: 'used_amount')  double usedAmount, @JsonKey(name: 'available_amount')  double availableAmount, @JsonKey(name: 'interest_rate')  String interestRate, @JsonKey(name: 'term_months')  int termMonths, @JsonKey(name: 'monthly_payment')  String monthlyPayment, @JsonKey(name: 'originated_at')  String originatedAt, @JsonKey(name: 'matured_at')  String? maturedAt,  String status)?  $default,) {final _that = this;
switch (_that) {
case _CreditLineModel() when $default != null:
return $default(_that.id,_that.asset,_that.amount,_that.remainingBalance,_that.usedAmount,_that.availableAmount,_that.interestRate,_that.termMonths,_that.monthlyPayment,_that.originatedAt,_that.maturedAt,_that.status);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _CreditLineModel implements CreditLineModel {
  const _CreditLineModel({required this.id, required this.asset, required this.amount, @JsonKey(name: 'remaining_balance') required this.remainingBalance, @JsonKey(name: 'used_amount') required this.usedAmount, @JsonKey(name: 'available_amount') required this.availableAmount, @JsonKey(name: 'interest_rate') required this.interestRate, @JsonKey(name: 'term_months') required this.termMonths, @JsonKey(name: 'monthly_payment') required this.monthlyPayment, @JsonKey(name: 'originated_at') required this.originatedAt, @JsonKey(name: 'matured_at') this.maturedAt, required this.status});
  factory _CreditLineModel.fromJson(Map<String, dynamic> json) => _$CreditLineModelFromJson(json);

@override final  String id;
@override final  AssetModel asset;
@override final  String amount;
@override@JsonKey(name: 'remaining_balance') final  String remainingBalance;
@override@JsonKey(name: 'used_amount') final  double usedAmount;
@override@JsonKey(name: 'available_amount') final  double availableAmount;
@override@JsonKey(name: 'interest_rate') final  String interestRate;
@override@JsonKey(name: 'term_months') final  int termMonths;
@override@JsonKey(name: 'monthly_payment') final  String monthlyPayment;
@override@JsonKey(name: 'originated_at') final  String originatedAt;
@override@JsonKey(name: 'matured_at') final  String? maturedAt;
@override final  String status;

/// Create a copy of CreditLineModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CreditLineModelCopyWith<_CreditLineModel> get copyWith => __$CreditLineModelCopyWithImpl<_CreditLineModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$CreditLineModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _CreditLineModel&&(identical(other.id, id) || other.id == id)&&(identical(other.asset, asset) || other.asset == asset)&&(identical(other.amount, amount) || other.amount == amount)&&(identical(other.remainingBalance, remainingBalance) || other.remainingBalance == remainingBalance)&&(identical(other.usedAmount, usedAmount) || other.usedAmount == usedAmount)&&(identical(other.availableAmount, availableAmount) || other.availableAmount == availableAmount)&&(identical(other.interestRate, interestRate) || other.interestRate == interestRate)&&(identical(other.termMonths, termMonths) || other.termMonths == termMonths)&&(identical(other.monthlyPayment, monthlyPayment) || other.monthlyPayment == monthlyPayment)&&(identical(other.originatedAt, originatedAt) || other.originatedAt == originatedAt)&&(identical(other.maturedAt, maturedAt) || other.maturedAt == maturedAt)&&(identical(other.status, status) || other.status == status));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,asset,amount,remainingBalance,usedAmount,availableAmount,interestRate,termMonths,monthlyPayment,originatedAt,maturedAt,status);

@override
String toString() {
  return 'CreditLineModel(id: $id, asset: $asset, amount: $amount, remainingBalance: $remainingBalance, usedAmount: $usedAmount, availableAmount: $availableAmount, interestRate: $interestRate, termMonths: $termMonths, monthlyPayment: $monthlyPayment, originatedAt: $originatedAt, maturedAt: $maturedAt, status: $status)';
}


}

/// @nodoc
abstract mixin class _$CreditLineModelCopyWith<$Res> implements $CreditLineModelCopyWith<$Res> {
  factory _$CreditLineModelCopyWith(_CreditLineModel value, $Res Function(_CreditLineModel) _then) = __$CreditLineModelCopyWithImpl;
@override @useResult
$Res call({
 String id, AssetModel asset, String amount,@JsonKey(name: 'remaining_balance') String remainingBalance,@JsonKey(name: 'used_amount') double usedAmount,@JsonKey(name: 'available_amount') double availableAmount,@JsonKey(name: 'interest_rate') String interestRate,@JsonKey(name: 'term_months') int termMonths,@JsonKey(name: 'monthly_payment') String monthlyPayment,@JsonKey(name: 'originated_at') String originatedAt,@JsonKey(name: 'matured_at') String? maturedAt, String status
});


@override $AssetModelCopyWith<$Res> get asset;

}
/// @nodoc
class __$CreditLineModelCopyWithImpl<$Res>
    implements _$CreditLineModelCopyWith<$Res> {
  __$CreditLineModelCopyWithImpl(this._self, this._then);

  final _CreditLineModel _self;
  final $Res Function(_CreditLineModel) _then;

/// Create a copy of CreditLineModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? asset = null,Object? amount = null,Object? remainingBalance = null,Object? usedAmount = null,Object? availableAmount = null,Object? interestRate = null,Object? termMonths = null,Object? monthlyPayment = null,Object? originatedAt = null,Object? maturedAt = freezed,Object? status = null,}) {
  return _then(_CreditLineModel(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,asset: null == asset ? _self.asset : asset // ignore: cast_nullable_to_non_nullable
as AssetModel,amount: null == amount ? _self.amount : amount // ignore: cast_nullable_to_non_nullable
as String,remainingBalance: null == remainingBalance ? _self.remainingBalance : remainingBalance // ignore: cast_nullable_to_non_nullable
as String,usedAmount: null == usedAmount ? _self.usedAmount : usedAmount // ignore: cast_nullable_to_non_nullable
as double,availableAmount: null == availableAmount ? _self.availableAmount : availableAmount // ignore: cast_nullable_to_non_nullable
as double,interestRate: null == interestRate ? _self.interestRate : interestRate // ignore: cast_nullable_to_non_nullable
as String,termMonths: null == termMonths ? _self.termMonths : termMonths // ignore: cast_nullable_to_non_nullable
as int,monthlyPayment: null == monthlyPayment ? _self.monthlyPayment : monthlyPayment // ignore: cast_nullable_to_non_nullable
as String,originatedAt: null == originatedAt ? _self.originatedAt : originatedAt // ignore: cast_nullable_to_non_nullable
as String,maturedAt: freezed == maturedAt ? _self.maturedAt : maturedAt // ignore: cast_nullable_to_non_nullable
as String?,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

/// Create a copy of CreditLineModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$AssetModelCopyWith<$Res> get asset {
  
  return $AssetModelCopyWith<$Res>(_self.asset, (value) {
    return _then(_self.copyWith(asset: value));
  });
}
}

// dart format on
