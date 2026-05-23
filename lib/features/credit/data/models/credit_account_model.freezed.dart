// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'credit_account_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$CreditAccountModel {

 String get id;@JsonKey(name: 'credit_limit') String get creditLimit;@JsonKey(name: 'used_amount') String get usedAmount;@JsonKey(name: 'available_credit') double get availableCredit;@JsonKey(name: 'utilization_ratio') int get utilizationRatio;@JsonKey(name: 'interest_rate') String get interestRate;@JsonKey(name: 'is_active') bool get isActive;@JsonKey(name: 'is_delinquent') bool get isDelinquent;@JsonKey(name: 'current_statement_balance') String? get currentStatementBalance;@JsonKey(name: 'minimum_payment_due') String? get minimumPaymentDue;@JsonKey(name: 'payment_due_date') String? get paymentDueDate;@JsonKey(name: 'total_spent_lifetime') String? get totalSpentLifetime;@JsonKey(name: 'total_repaid_lifetime') String? get totalRepaidLifetime;@JsonKey(name: 'credit_lines') List<CreditLineModel> get creditLines;@JsonKey(name: 'created_at') String? get createdAt;@JsonKey(name: 'updated_at') String? get updatedAt;
/// Create a copy of CreditAccountModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CreditAccountModelCopyWith<CreditAccountModel> get copyWith => _$CreditAccountModelCopyWithImpl<CreditAccountModel>(this as CreditAccountModel, _$identity);

  /// Serializes this CreditAccountModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CreditAccountModel&&(identical(other.id, id) || other.id == id)&&(identical(other.creditLimit, creditLimit) || other.creditLimit == creditLimit)&&(identical(other.usedAmount, usedAmount) || other.usedAmount == usedAmount)&&(identical(other.availableCredit, availableCredit) || other.availableCredit == availableCredit)&&(identical(other.utilizationRatio, utilizationRatio) || other.utilizationRatio == utilizationRatio)&&(identical(other.interestRate, interestRate) || other.interestRate == interestRate)&&(identical(other.isActive, isActive) || other.isActive == isActive)&&(identical(other.isDelinquent, isDelinquent) || other.isDelinquent == isDelinquent)&&(identical(other.currentStatementBalance, currentStatementBalance) || other.currentStatementBalance == currentStatementBalance)&&(identical(other.minimumPaymentDue, minimumPaymentDue) || other.minimumPaymentDue == minimumPaymentDue)&&(identical(other.paymentDueDate, paymentDueDate) || other.paymentDueDate == paymentDueDate)&&(identical(other.totalSpentLifetime, totalSpentLifetime) || other.totalSpentLifetime == totalSpentLifetime)&&(identical(other.totalRepaidLifetime, totalRepaidLifetime) || other.totalRepaidLifetime == totalRepaidLifetime)&&const DeepCollectionEquality().equals(other.creditLines, creditLines)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,creditLimit,usedAmount,availableCredit,utilizationRatio,interestRate,isActive,isDelinquent,currentStatementBalance,minimumPaymentDue,paymentDueDate,totalSpentLifetime,totalRepaidLifetime,const DeepCollectionEquality().hash(creditLines),createdAt,updatedAt);

@override
String toString() {
  return 'CreditAccountModel(id: $id, creditLimit: $creditLimit, usedAmount: $usedAmount, availableCredit: $availableCredit, utilizationRatio: $utilizationRatio, interestRate: $interestRate, isActive: $isActive, isDelinquent: $isDelinquent, currentStatementBalance: $currentStatementBalance, minimumPaymentDue: $minimumPaymentDue, paymentDueDate: $paymentDueDate, totalSpentLifetime: $totalSpentLifetime, totalRepaidLifetime: $totalRepaidLifetime, creditLines: $creditLines, createdAt: $createdAt, updatedAt: $updatedAt)';
}


}

/// @nodoc
abstract mixin class $CreditAccountModelCopyWith<$Res>  {
  factory $CreditAccountModelCopyWith(CreditAccountModel value, $Res Function(CreditAccountModel) _then) = _$CreditAccountModelCopyWithImpl;
@useResult
$Res call({
 String id,@JsonKey(name: 'credit_limit') String creditLimit,@JsonKey(name: 'used_amount') String usedAmount,@JsonKey(name: 'available_credit') double availableCredit,@JsonKey(name: 'utilization_ratio') int utilizationRatio,@JsonKey(name: 'interest_rate') String interestRate,@JsonKey(name: 'is_active') bool isActive,@JsonKey(name: 'is_delinquent') bool isDelinquent,@JsonKey(name: 'current_statement_balance') String? currentStatementBalance,@JsonKey(name: 'minimum_payment_due') String? minimumPaymentDue,@JsonKey(name: 'payment_due_date') String? paymentDueDate,@JsonKey(name: 'total_spent_lifetime') String? totalSpentLifetime,@JsonKey(name: 'total_repaid_lifetime') String? totalRepaidLifetime,@JsonKey(name: 'credit_lines') List<CreditLineModel> creditLines,@JsonKey(name: 'created_at') String? createdAt,@JsonKey(name: 'updated_at') String? updatedAt
});




}
/// @nodoc
class _$CreditAccountModelCopyWithImpl<$Res>
    implements $CreditAccountModelCopyWith<$Res> {
  _$CreditAccountModelCopyWithImpl(this._self, this._then);

  final CreditAccountModel _self;
  final $Res Function(CreditAccountModel) _then;

/// Create a copy of CreditAccountModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? creditLimit = null,Object? usedAmount = null,Object? availableCredit = null,Object? utilizationRatio = null,Object? interestRate = null,Object? isActive = null,Object? isDelinquent = null,Object? currentStatementBalance = freezed,Object? minimumPaymentDue = freezed,Object? paymentDueDate = freezed,Object? totalSpentLifetime = freezed,Object? totalRepaidLifetime = freezed,Object? creditLines = null,Object? createdAt = freezed,Object? updatedAt = freezed,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,creditLimit: null == creditLimit ? _self.creditLimit : creditLimit // ignore: cast_nullable_to_non_nullable
as String,usedAmount: null == usedAmount ? _self.usedAmount : usedAmount // ignore: cast_nullable_to_non_nullable
as String,availableCredit: null == availableCredit ? _self.availableCredit : availableCredit // ignore: cast_nullable_to_non_nullable
as double,utilizationRatio: null == utilizationRatio ? _self.utilizationRatio : utilizationRatio // ignore: cast_nullable_to_non_nullable
as int,interestRate: null == interestRate ? _self.interestRate : interestRate // ignore: cast_nullable_to_non_nullable
as String,isActive: null == isActive ? _self.isActive : isActive // ignore: cast_nullable_to_non_nullable
as bool,isDelinquent: null == isDelinquent ? _self.isDelinquent : isDelinquent // ignore: cast_nullable_to_non_nullable
as bool,currentStatementBalance: freezed == currentStatementBalance ? _self.currentStatementBalance : currentStatementBalance // ignore: cast_nullable_to_non_nullable
as String?,minimumPaymentDue: freezed == minimumPaymentDue ? _self.minimumPaymentDue : minimumPaymentDue // ignore: cast_nullable_to_non_nullable
as String?,paymentDueDate: freezed == paymentDueDate ? _self.paymentDueDate : paymentDueDate // ignore: cast_nullable_to_non_nullable
as String?,totalSpentLifetime: freezed == totalSpentLifetime ? _self.totalSpentLifetime : totalSpentLifetime // ignore: cast_nullable_to_non_nullable
as String?,totalRepaidLifetime: freezed == totalRepaidLifetime ? _self.totalRepaidLifetime : totalRepaidLifetime // ignore: cast_nullable_to_non_nullable
as String?,creditLines: null == creditLines ? _self.creditLines : creditLines // ignore: cast_nullable_to_non_nullable
as List<CreditLineModel>,createdAt: freezed == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as String?,updatedAt: freezed == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [CreditAccountModel].
extension CreditAccountModelPatterns on CreditAccountModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _CreditAccountModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _CreditAccountModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _CreditAccountModel value)  $default,){
final _that = this;
switch (_that) {
case _CreditAccountModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _CreditAccountModel value)?  $default,){
final _that = this;
switch (_that) {
case _CreditAccountModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id, @JsonKey(name: 'credit_limit')  String creditLimit, @JsonKey(name: 'used_amount')  String usedAmount, @JsonKey(name: 'available_credit')  double availableCredit, @JsonKey(name: 'utilization_ratio')  int utilizationRatio, @JsonKey(name: 'interest_rate')  String interestRate, @JsonKey(name: 'is_active')  bool isActive, @JsonKey(name: 'is_delinquent')  bool isDelinquent, @JsonKey(name: 'current_statement_balance')  String? currentStatementBalance, @JsonKey(name: 'minimum_payment_due')  String? minimumPaymentDue, @JsonKey(name: 'payment_due_date')  String? paymentDueDate, @JsonKey(name: 'total_spent_lifetime')  String? totalSpentLifetime, @JsonKey(name: 'total_repaid_lifetime')  String? totalRepaidLifetime, @JsonKey(name: 'credit_lines')  List<CreditLineModel> creditLines, @JsonKey(name: 'created_at')  String? createdAt, @JsonKey(name: 'updated_at')  String? updatedAt)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _CreditAccountModel() when $default != null:
return $default(_that.id,_that.creditLimit,_that.usedAmount,_that.availableCredit,_that.utilizationRatio,_that.interestRate,_that.isActive,_that.isDelinquent,_that.currentStatementBalance,_that.minimumPaymentDue,_that.paymentDueDate,_that.totalSpentLifetime,_that.totalRepaidLifetime,_that.creditLines,_that.createdAt,_that.updatedAt);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id, @JsonKey(name: 'credit_limit')  String creditLimit, @JsonKey(name: 'used_amount')  String usedAmount, @JsonKey(name: 'available_credit')  double availableCredit, @JsonKey(name: 'utilization_ratio')  int utilizationRatio, @JsonKey(name: 'interest_rate')  String interestRate, @JsonKey(name: 'is_active')  bool isActive, @JsonKey(name: 'is_delinquent')  bool isDelinquent, @JsonKey(name: 'current_statement_balance')  String? currentStatementBalance, @JsonKey(name: 'minimum_payment_due')  String? minimumPaymentDue, @JsonKey(name: 'payment_due_date')  String? paymentDueDate, @JsonKey(name: 'total_spent_lifetime')  String? totalSpentLifetime, @JsonKey(name: 'total_repaid_lifetime')  String? totalRepaidLifetime, @JsonKey(name: 'credit_lines')  List<CreditLineModel> creditLines, @JsonKey(name: 'created_at')  String? createdAt, @JsonKey(name: 'updated_at')  String? updatedAt)  $default,) {final _that = this;
switch (_that) {
case _CreditAccountModel():
return $default(_that.id,_that.creditLimit,_that.usedAmount,_that.availableCredit,_that.utilizationRatio,_that.interestRate,_that.isActive,_that.isDelinquent,_that.currentStatementBalance,_that.minimumPaymentDue,_that.paymentDueDate,_that.totalSpentLifetime,_that.totalRepaidLifetime,_that.creditLines,_that.createdAt,_that.updatedAt);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id, @JsonKey(name: 'credit_limit')  String creditLimit, @JsonKey(name: 'used_amount')  String usedAmount, @JsonKey(name: 'available_credit')  double availableCredit, @JsonKey(name: 'utilization_ratio')  int utilizationRatio, @JsonKey(name: 'interest_rate')  String interestRate, @JsonKey(name: 'is_active')  bool isActive, @JsonKey(name: 'is_delinquent')  bool isDelinquent, @JsonKey(name: 'current_statement_balance')  String? currentStatementBalance, @JsonKey(name: 'minimum_payment_due')  String? minimumPaymentDue, @JsonKey(name: 'payment_due_date')  String? paymentDueDate, @JsonKey(name: 'total_spent_lifetime')  String? totalSpentLifetime, @JsonKey(name: 'total_repaid_lifetime')  String? totalRepaidLifetime, @JsonKey(name: 'credit_lines')  List<CreditLineModel> creditLines, @JsonKey(name: 'created_at')  String? createdAt, @JsonKey(name: 'updated_at')  String? updatedAt)?  $default,) {final _that = this;
switch (_that) {
case _CreditAccountModel() when $default != null:
return $default(_that.id,_that.creditLimit,_that.usedAmount,_that.availableCredit,_that.utilizationRatio,_that.interestRate,_that.isActive,_that.isDelinquent,_that.currentStatementBalance,_that.minimumPaymentDue,_that.paymentDueDate,_that.totalSpentLifetime,_that.totalRepaidLifetime,_that.creditLines,_that.createdAt,_that.updatedAt);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _CreditAccountModel implements CreditAccountModel {
  const _CreditAccountModel({required this.id, @JsonKey(name: 'credit_limit') required this.creditLimit, @JsonKey(name: 'used_amount') required this.usedAmount, @JsonKey(name: 'available_credit') required this.availableCredit, @JsonKey(name: 'utilization_ratio') required this.utilizationRatio, @JsonKey(name: 'interest_rate') required this.interestRate, @JsonKey(name: 'is_active') required this.isActive, @JsonKey(name: 'is_delinquent') required this.isDelinquent, @JsonKey(name: 'current_statement_balance') this.currentStatementBalance, @JsonKey(name: 'minimum_payment_due') this.minimumPaymentDue, @JsonKey(name: 'payment_due_date') this.paymentDueDate, @JsonKey(name: 'total_spent_lifetime') this.totalSpentLifetime, @JsonKey(name: 'total_repaid_lifetime') this.totalRepaidLifetime, @JsonKey(name: 'credit_lines') final  List<CreditLineModel> creditLines = const [], @JsonKey(name: 'created_at') this.createdAt, @JsonKey(name: 'updated_at') this.updatedAt}): _creditLines = creditLines;
  factory _CreditAccountModel.fromJson(Map<String, dynamic> json) => _$CreditAccountModelFromJson(json);

@override final  String id;
@override@JsonKey(name: 'credit_limit') final  String creditLimit;
@override@JsonKey(name: 'used_amount') final  String usedAmount;
@override@JsonKey(name: 'available_credit') final  double availableCredit;
@override@JsonKey(name: 'utilization_ratio') final  int utilizationRatio;
@override@JsonKey(name: 'interest_rate') final  String interestRate;
@override@JsonKey(name: 'is_active') final  bool isActive;
@override@JsonKey(name: 'is_delinquent') final  bool isDelinquent;
@override@JsonKey(name: 'current_statement_balance') final  String? currentStatementBalance;
@override@JsonKey(name: 'minimum_payment_due') final  String? minimumPaymentDue;
@override@JsonKey(name: 'payment_due_date') final  String? paymentDueDate;
@override@JsonKey(name: 'total_spent_lifetime') final  String? totalSpentLifetime;
@override@JsonKey(name: 'total_repaid_lifetime') final  String? totalRepaidLifetime;
 final  List<CreditLineModel> _creditLines;
@override@JsonKey(name: 'credit_lines') List<CreditLineModel> get creditLines {
  if (_creditLines is EqualUnmodifiableListView) return _creditLines;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_creditLines);
}

@override@JsonKey(name: 'created_at') final  String? createdAt;
@override@JsonKey(name: 'updated_at') final  String? updatedAt;

/// Create a copy of CreditAccountModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CreditAccountModelCopyWith<_CreditAccountModel> get copyWith => __$CreditAccountModelCopyWithImpl<_CreditAccountModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$CreditAccountModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _CreditAccountModel&&(identical(other.id, id) || other.id == id)&&(identical(other.creditLimit, creditLimit) || other.creditLimit == creditLimit)&&(identical(other.usedAmount, usedAmount) || other.usedAmount == usedAmount)&&(identical(other.availableCredit, availableCredit) || other.availableCredit == availableCredit)&&(identical(other.utilizationRatio, utilizationRatio) || other.utilizationRatio == utilizationRatio)&&(identical(other.interestRate, interestRate) || other.interestRate == interestRate)&&(identical(other.isActive, isActive) || other.isActive == isActive)&&(identical(other.isDelinquent, isDelinquent) || other.isDelinquent == isDelinquent)&&(identical(other.currentStatementBalance, currentStatementBalance) || other.currentStatementBalance == currentStatementBalance)&&(identical(other.minimumPaymentDue, minimumPaymentDue) || other.minimumPaymentDue == minimumPaymentDue)&&(identical(other.paymentDueDate, paymentDueDate) || other.paymentDueDate == paymentDueDate)&&(identical(other.totalSpentLifetime, totalSpentLifetime) || other.totalSpentLifetime == totalSpentLifetime)&&(identical(other.totalRepaidLifetime, totalRepaidLifetime) || other.totalRepaidLifetime == totalRepaidLifetime)&&const DeepCollectionEquality().equals(other._creditLines, _creditLines)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,creditLimit,usedAmount,availableCredit,utilizationRatio,interestRate,isActive,isDelinquent,currentStatementBalance,minimumPaymentDue,paymentDueDate,totalSpentLifetime,totalRepaidLifetime,const DeepCollectionEquality().hash(_creditLines),createdAt,updatedAt);

@override
String toString() {
  return 'CreditAccountModel(id: $id, creditLimit: $creditLimit, usedAmount: $usedAmount, availableCredit: $availableCredit, utilizationRatio: $utilizationRatio, interestRate: $interestRate, isActive: $isActive, isDelinquent: $isDelinquent, currentStatementBalance: $currentStatementBalance, minimumPaymentDue: $minimumPaymentDue, paymentDueDate: $paymentDueDate, totalSpentLifetime: $totalSpentLifetime, totalRepaidLifetime: $totalRepaidLifetime, creditLines: $creditLines, createdAt: $createdAt, updatedAt: $updatedAt)';
}


}

/// @nodoc
abstract mixin class _$CreditAccountModelCopyWith<$Res> implements $CreditAccountModelCopyWith<$Res> {
  factory _$CreditAccountModelCopyWith(_CreditAccountModel value, $Res Function(_CreditAccountModel) _then) = __$CreditAccountModelCopyWithImpl;
@override @useResult
$Res call({
 String id,@JsonKey(name: 'credit_limit') String creditLimit,@JsonKey(name: 'used_amount') String usedAmount,@JsonKey(name: 'available_credit') double availableCredit,@JsonKey(name: 'utilization_ratio') int utilizationRatio,@JsonKey(name: 'interest_rate') String interestRate,@JsonKey(name: 'is_active') bool isActive,@JsonKey(name: 'is_delinquent') bool isDelinquent,@JsonKey(name: 'current_statement_balance') String? currentStatementBalance,@JsonKey(name: 'minimum_payment_due') String? minimumPaymentDue,@JsonKey(name: 'payment_due_date') String? paymentDueDate,@JsonKey(name: 'total_spent_lifetime') String? totalSpentLifetime,@JsonKey(name: 'total_repaid_lifetime') String? totalRepaidLifetime,@JsonKey(name: 'credit_lines') List<CreditLineModel> creditLines,@JsonKey(name: 'created_at') String? createdAt,@JsonKey(name: 'updated_at') String? updatedAt
});




}
/// @nodoc
class __$CreditAccountModelCopyWithImpl<$Res>
    implements _$CreditAccountModelCopyWith<$Res> {
  __$CreditAccountModelCopyWithImpl(this._self, this._then);

  final _CreditAccountModel _self;
  final $Res Function(_CreditAccountModel) _then;

/// Create a copy of CreditAccountModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? creditLimit = null,Object? usedAmount = null,Object? availableCredit = null,Object? utilizationRatio = null,Object? interestRate = null,Object? isActive = null,Object? isDelinquent = null,Object? currentStatementBalance = freezed,Object? minimumPaymentDue = freezed,Object? paymentDueDate = freezed,Object? totalSpentLifetime = freezed,Object? totalRepaidLifetime = freezed,Object? creditLines = null,Object? createdAt = freezed,Object? updatedAt = freezed,}) {
  return _then(_CreditAccountModel(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,creditLimit: null == creditLimit ? _self.creditLimit : creditLimit // ignore: cast_nullable_to_non_nullable
as String,usedAmount: null == usedAmount ? _self.usedAmount : usedAmount // ignore: cast_nullable_to_non_nullable
as String,availableCredit: null == availableCredit ? _self.availableCredit : availableCredit // ignore: cast_nullable_to_non_nullable
as double,utilizationRatio: null == utilizationRatio ? _self.utilizationRatio : utilizationRatio // ignore: cast_nullable_to_non_nullable
as int,interestRate: null == interestRate ? _self.interestRate : interestRate // ignore: cast_nullable_to_non_nullable
as String,isActive: null == isActive ? _self.isActive : isActive // ignore: cast_nullable_to_non_nullable
as bool,isDelinquent: null == isDelinquent ? _self.isDelinquent : isDelinquent // ignore: cast_nullable_to_non_nullable
as bool,currentStatementBalance: freezed == currentStatementBalance ? _self.currentStatementBalance : currentStatementBalance // ignore: cast_nullable_to_non_nullable
as String?,minimumPaymentDue: freezed == minimumPaymentDue ? _self.minimumPaymentDue : minimumPaymentDue // ignore: cast_nullable_to_non_nullable
as String?,paymentDueDate: freezed == paymentDueDate ? _self.paymentDueDate : paymentDueDate // ignore: cast_nullable_to_non_nullable
as String?,totalSpentLifetime: freezed == totalSpentLifetime ? _self.totalSpentLifetime : totalSpentLifetime // ignore: cast_nullable_to_non_nullable
as String?,totalRepaidLifetime: freezed == totalRepaidLifetime ? _self.totalRepaidLifetime : totalRepaidLifetime // ignore: cast_nullable_to_non_nullable
as String?,creditLines: null == creditLines ? _self._creditLines : creditLines // ignore: cast_nullable_to_non_nullable
as List<CreditLineModel>,createdAt: freezed == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as String?,updatedAt: freezed == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
