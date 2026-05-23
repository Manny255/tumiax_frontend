// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'credit_transaction_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$CreditTransactionModel {

 String get id;@JsonKey(name: 'credit_line_id') String? get creditLineId; AssetModel? get asset;@JsonKey(name: 'transaction_type') String get transactionType; String get amount;@JsonKey(name: 'remaining_amount') String get remainingAmount;@JsonKey(name: 'running_balance') String get runningBalance;@JsonKey(name: 'due_date') String? get dueDate;@JsonKey(name: 'is_overdue') bool get isOverdue;@JsonKey(name: 'days_overdue') int? get daysOverdue; String? get description;@JsonKey(name: 'reference_id') String? get referenceId;@JsonKey(name: 'created_at') String get createdAt;@JsonKey(name: 'interest_accrued') String? get interestAccrued;@JsonKey(name: 'total_due') String? get totalDue;// @JsonKey(name: 'principal_amount') String? principalAmount,
@JsonKey(name: 'original_interest_5_percent') String? get originalInterest5Percent;@JsonKey(name: 'late_penalties') String? get latePenalties;@JsonKey(name: 'interest_rate_type') String? get interestRateType;@JsonKey(name: 'last_interest_calculation') String? get lastInterestCalculation;@JsonKey(name: 'late_penalties_accrued') String? get latePenaltiesAccrued;@JsonKey(name: 'regular_interest_accrued') String? get regularInterestAccrued;@JsonKey(name: 'fee_amount') String? get feeAmount;@JsonKey(name: 'remaining_fee') String? get remainingFee;@JsonKey(name: 'is_linked_fee') bool? get isLinkedFee;@JsonKey(name: 'parent_spend_id') String? get parentSpendId;@JsonKey(name: 'fee_type') String? get feeType;// Cycle tracking fields
@JsonKey(name: 'cycle_number') int? get cycleNumber;@JsonKey(name: 'cycles_processed') int? get cyclesProcessed;@JsonKey(name: 'next_cycle_date') String? get nextCycleDate;@JsonKey(name: 'cycle_breakdown') List<CycleBreakdownModel>? get cycleBreakdown;
/// Create a copy of CreditTransactionModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CreditTransactionModelCopyWith<CreditTransactionModel> get copyWith => _$CreditTransactionModelCopyWithImpl<CreditTransactionModel>(this as CreditTransactionModel, _$identity);

  /// Serializes this CreditTransactionModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CreditTransactionModel&&(identical(other.id, id) || other.id == id)&&(identical(other.creditLineId, creditLineId) || other.creditLineId == creditLineId)&&(identical(other.asset, asset) || other.asset == asset)&&(identical(other.transactionType, transactionType) || other.transactionType == transactionType)&&(identical(other.amount, amount) || other.amount == amount)&&(identical(other.remainingAmount, remainingAmount) || other.remainingAmount == remainingAmount)&&(identical(other.runningBalance, runningBalance) || other.runningBalance == runningBalance)&&(identical(other.dueDate, dueDate) || other.dueDate == dueDate)&&(identical(other.isOverdue, isOverdue) || other.isOverdue == isOverdue)&&(identical(other.daysOverdue, daysOverdue) || other.daysOverdue == daysOverdue)&&(identical(other.description, description) || other.description == description)&&(identical(other.referenceId, referenceId) || other.referenceId == referenceId)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.interestAccrued, interestAccrued) || other.interestAccrued == interestAccrued)&&(identical(other.totalDue, totalDue) || other.totalDue == totalDue)&&(identical(other.originalInterest5Percent, originalInterest5Percent) || other.originalInterest5Percent == originalInterest5Percent)&&(identical(other.latePenalties, latePenalties) || other.latePenalties == latePenalties)&&(identical(other.interestRateType, interestRateType) || other.interestRateType == interestRateType)&&(identical(other.lastInterestCalculation, lastInterestCalculation) || other.lastInterestCalculation == lastInterestCalculation)&&(identical(other.latePenaltiesAccrued, latePenaltiesAccrued) || other.latePenaltiesAccrued == latePenaltiesAccrued)&&(identical(other.regularInterestAccrued, regularInterestAccrued) || other.regularInterestAccrued == regularInterestAccrued)&&(identical(other.feeAmount, feeAmount) || other.feeAmount == feeAmount)&&(identical(other.remainingFee, remainingFee) || other.remainingFee == remainingFee)&&(identical(other.isLinkedFee, isLinkedFee) || other.isLinkedFee == isLinkedFee)&&(identical(other.parentSpendId, parentSpendId) || other.parentSpendId == parentSpendId)&&(identical(other.feeType, feeType) || other.feeType == feeType)&&(identical(other.cycleNumber, cycleNumber) || other.cycleNumber == cycleNumber)&&(identical(other.cyclesProcessed, cyclesProcessed) || other.cyclesProcessed == cyclesProcessed)&&(identical(other.nextCycleDate, nextCycleDate) || other.nextCycleDate == nextCycleDate)&&const DeepCollectionEquality().equals(other.cycleBreakdown, cycleBreakdown));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hashAll([runtimeType,id,creditLineId,asset,transactionType,amount,remainingAmount,runningBalance,dueDate,isOverdue,daysOverdue,description,referenceId,createdAt,interestAccrued,totalDue,originalInterest5Percent,latePenalties,interestRateType,lastInterestCalculation,latePenaltiesAccrued,regularInterestAccrued,feeAmount,remainingFee,isLinkedFee,parentSpendId,feeType,cycleNumber,cyclesProcessed,nextCycleDate,const DeepCollectionEquality().hash(cycleBreakdown)]);

@override
String toString() {
  return 'CreditTransactionModel(id: $id, creditLineId: $creditLineId, asset: $asset, transactionType: $transactionType, amount: $amount, remainingAmount: $remainingAmount, runningBalance: $runningBalance, dueDate: $dueDate, isOverdue: $isOverdue, daysOverdue: $daysOverdue, description: $description, referenceId: $referenceId, createdAt: $createdAt, interestAccrued: $interestAccrued, totalDue: $totalDue, originalInterest5Percent: $originalInterest5Percent, latePenalties: $latePenalties, interestRateType: $interestRateType, lastInterestCalculation: $lastInterestCalculation, latePenaltiesAccrued: $latePenaltiesAccrued, regularInterestAccrued: $regularInterestAccrued, feeAmount: $feeAmount, remainingFee: $remainingFee, isLinkedFee: $isLinkedFee, parentSpendId: $parentSpendId, feeType: $feeType, cycleNumber: $cycleNumber, cyclesProcessed: $cyclesProcessed, nextCycleDate: $nextCycleDate, cycleBreakdown: $cycleBreakdown)';
}


}

/// @nodoc
abstract mixin class $CreditTransactionModelCopyWith<$Res>  {
  factory $CreditTransactionModelCopyWith(CreditTransactionModel value, $Res Function(CreditTransactionModel) _then) = _$CreditTransactionModelCopyWithImpl;
@useResult
$Res call({
 String id,@JsonKey(name: 'credit_line_id') String? creditLineId, AssetModel? asset,@JsonKey(name: 'transaction_type') String transactionType, String amount,@JsonKey(name: 'remaining_amount') String remainingAmount,@JsonKey(name: 'running_balance') String runningBalance,@JsonKey(name: 'due_date') String? dueDate,@JsonKey(name: 'is_overdue') bool isOverdue,@JsonKey(name: 'days_overdue') int? daysOverdue, String? description,@JsonKey(name: 'reference_id') String? referenceId,@JsonKey(name: 'created_at') String createdAt,@JsonKey(name: 'interest_accrued') String? interestAccrued,@JsonKey(name: 'total_due') String? totalDue,@JsonKey(name: 'original_interest_5_percent') String? originalInterest5Percent,@JsonKey(name: 'late_penalties') String? latePenalties,@JsonKey(name: 'interest_rate_type') String? interestRateType,@JsonKey(name: 'last_interest_calculation') String? lastInterestCalculation,@JsonKey(name: 'late_penalties_accrued') String? latePenaltiesAccrued,@JsonKey(name: 'regular_interest_accrued') String? regularInterestAccrued,@JsonKey(name: 'fee_amount') String? feeAmount,@JsonKey(name: 'remaining_fee') String? remainingFee,@JsonKey(name: 'is_linked_fee') bool? isLinkedFee,@JsonKey(name: 'parent_spend_id') String? parentSpendId,@JsonKey(name: 'fee_type') String? feeType,@JsonKey(name: 'cycle_number') int? cycleNumber,@JsonKey(name: 'cycles_processed') int? cyclesProcessed,@JsonKey(name: 'next_cycle_date') String? nextCycleDate,@JsonKey(name: 'cycle_breakdown') List<CycleBreakdownModel>? cycleBreakdown
});


$AssetModelCopyWith<$Res>? get asset;

}
/// @nodoc
class _$CreditTransactionModelCopyWithImpl<$Res>
    implements $CreditTransactionModelCopyWith<$Res> {
  _$CreditTransactionModelCopyWithImpl(this._self, this._then);

  final CreditTransactionModel _self;
  final $Res Function(CreditTransactionModel) _then;

/// Create a copy of CreditTransactionModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? creditLineId = freezed,Object? asset = freezed,Object? transactionType = null,Object? amount = null,Object? remainingAmount = null,Object? runningBalance = null,Object? dueDate = freezed,Object? isOverdue = null,Object? daysOverdue = freezed,Object? description = freezed,Object? referenceId = freezed,Object? createdAt = null,Object? interestAccrued = freezed,Object? totalDue = freezed,Object? originalInterest5Percent = freezed,Object? latePenalties = freezed,Object? interestRateType = freezed,Object? lastInterestCalculation = freezed,Object? latePenaltiesAccrued = freezed,Object? regularInterestAccrued = freezed,Object? feeAmount = freezed,Object? remainingFee = freezed,Object? isLinkedFee = freezed,Object? parentSpendId = freezed,Object? feeType = freezed,Object? cycleNumber = freezed,Object? cyclesProcessed = freezed,Object? nextCycleDate = freezed,Object? cycleBreakdown = freezed,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,creditLineId: freezed == creditLineId ? _self.creditLineId : creditLineId // ignore: cast_nullable_to_non_nullable
as String?,asset: freezed == asset ? _self.asset : asset // ignore: cast_nullable_to_non_nullable
as AssetModel?,transactionType: null == transactionType ? _self.transactionType : transactionType // ignore: cast_nullable_to_non_nullable
as String,amount: null == amount ? _self.amount : amount // ignore: cast_nullable_to_non_nullable
as String,remainingAmount: null == remainingAmount ? _self.remainingAmount : remainingAmount // ignore: cast_nullable_to_non_nullable
as String,runningBalance: null == runningBalance ? _self.runningBalance : runningBalance // ignore: cast_nullable_to_non_nullable
as String,dueDate: freezed == dueDate ? _self.dueDate : dueDate // ignore: cast_nullable_to_non_nullable
as String?,isOverdue: null == isOverdue ? _self.isOverdue : isOverdue // ignore: cast_nullable_to_non_nullable
as bool,daysOverdue: freezed == daysOverdue ? _self.daysOverdue : daysOverdue // ignore: cast_nullable_to_non_nullable
as int?,description: freezed == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String?,referenceId: freezed == referenceId ? _self.referenceId : referenceId // ignore: cast_nullable_to_non_nullable
as String?,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as String,interestAccrued: freezed == interestAccrued ? _self.interestAccrued : interestAccrued // ignore: cast_nullable_to_non_nullable
as String?,totalDue: freezed == totalDue ? _self.totalDue : totalDue // ignore: cast_nullable_to_non_nullable
as String?,originalInterest5Percent: freezed == originalInterest5Percent ? _self.originalInterest5Percent : originalInterest5Percent // ignore: cast_nullable_to_non_nullable
as String?,latePenalties: freezed == latePenalties ? _self.latePenalties : latePenalties // ignore: cast_nullable_to_non_nullable
as String?,interestRateType: freezed == interestRateType ? _self.interestRateType : interestRateType // ignore: cast_nullable_to_non_nullable
as String?,lastInterestCalculation: freezed == lastInterestCalculation ? _self.lastInterestCalculation : lastInterestCalculation // ignore: cast_nullable_to_non_nullable
as String?,latePenaltiesAccrued: freezed == latePenaltiesAccrued ? _self.latePenaltiesAccrued : latePenaltiesAccrued // ignore: cast_nullable_to_non_nullable
as String?,regularInterestAccrued: freezed == regularInterestAccrued ? _self.regularInterestAccrued : regularInterestAccrued // ignore: cast_nullable_to_non_nullable
as String?,feeAmount: freezed == feeAmount ? _self.feeAmount : feeAmount // ignore: cast_nullable_to_non_nullable
as String?,remainingFee: freezed == remainingFee ? _self.remainingFee : remainingFee // ignore: cast_nullable_to_non_nullable
as String?,isLinkedFee: freezed == isLinkedFee ? _self.isLinkedFee : isLinkedFee // ignore: cast_nullable_to_non_nullable
as bool?,parentSpendId: freezed == parentSpendId ? _self.parentSpendId : parentSpendId // ignore: cast_nullable_to_non_nullable
as String?,feeType: freezed == feeType ? _self.feeType : feeType // ignore: cast_nullable_to_non_nullable
as String?,cycleNumber: freezed == cycleNumber ? _self.cycleNumber : cycleNumber // ignore: cast_nullable_to_non_nullable
as int?,cyclesProcessed: freezed == cyclesProcessed ? _self.cyclesProcessed : cyclesProcessed // ignore: cast_nullable_to_non_nullable
as int?,nextCycleDate: freezed == nextCycleDate ? _self.nextCycleDate : nextCycleDate // ignore: cast_nullable_to_non_nullable
as String?,cycleBreakdown: freezed == cycleBreakdown ? _self.cycleBreakdown : cycleBreakdown // ignore: cast_nullable_to_non_nullable
as List<CycleBreakdownModel>?,
  ));
}
/// Create a copy of CreditTransactionModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$AssetModelCopyWith<$Res>? get asset {
    if (_self.asset == null) {
    return null;
  }

  return $AssetModelCopyWith<$Res>(_self.asset!, (value) {
    return _then(_self.copyWith(asset: value));
  });
}
}


/// Adds pattern-matching-related methods to [CreditTransactionModel].
extension CreditTransactionModelPatterns on CreditTransactionModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _CreditTransactionModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _CreditTransactionModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _CreditTransactionModel value)  $default,){
final _that = this;
switch (_that) {
case _CreditTransactionModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _CreditTransactionModel value)?  $default,){
final _that = this;
switch (_that) {
case _CreditTransactionModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id, @JsonKey(name: 'credit_line_id')  String? creditLineId,  AssetModel? asset, @JsonKey(name: 'transaction_type')  String transactionType,  String amount, @JsonKey(name: 'remaining_amount')  String remainingAmount, @JsonKey(name: 'running_balance')  String runningBalance, @JsonKey(name: 'due_date')  String? dueDate, @JsonKey(name: 'is_overdue')  bool isOverdue, @JsonKey(name: 'days_overdue')  int? daysOverdue,  String? description, @JsonKey(name: 'reference_id')  String? referenceId, @JsonKey(name: 'created_at')  String createdAt, @JsonKey(name: 'interest_accrued')  String? interestAccrued, @JsonKey(name: 'total_due')  String? totalDue, @JsonKey(name: 'original_interest_5_percent')  String? originalInterest5Percent, @JsonKey(name: 'late_penalties')  String? latePenalties, @JsonKey(name: 'interest_rate_type')  String? interestRateType, @JsonKey(name: 'last_interest_calculation')  String? lastInterestCalculation, @JsonKey(name: 'late_penalties_accrued')  String? latePenaltiesAccrued, @JsonKey(name: 'regular_interest_accrued')  String? regularInterestAccrued, @JsonKey(name: 'fee_amount')  String? feeAmount, @JsonKey(name: 'remaining_fee')  String? remainingFee, @JsonKey(name: 'is_linked_fee')  bool? isLinkedFee, @JsonKey(name: 'parent_spend_id')  String? parentSpendId, @JsonKey(name: 'fee_type')  String? feeType, @JsonKey(name: 'cycle_number')  int? cycleNumber, @JsonKey(name: 'cycles_processed')  int? cyclesProcessed, @JsonKey(name: 'next_cycle_date')  String? nextCycleDate, @JsonKey(name: 'cycle_breakdown')  List<CycleBreakdownModel>? cycleBreakdown)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _CreditTransactionModel() when $default != null:
return $default(_that.id,_that.creditLineId,_that.asset,_that.transactionType,_that.amount,_that.remainingAmount,_that.runningBalance,_that.dueDate,_that.isOverdue,_that.daysOverdue,_that.description,_that.referenceId,_that.createdAt,_that.interestAccrued,_that.totalDue,_that.originalInterest5Percent,_that.latePenalties,_that.interestRateType,_that.lastInterestCalculation,_that.latePenaltiesAccrued,_that.regularInterestAccrued,_that.feeAmount,_that.remainingFee,_that.isLinkedFee,_that.parentSpendId,_that.feeType,_that.cycleNumber,_that.cyclesProcessed,_that.nextCycleDate,_that.cycleBreakdown);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id, @JsonKey(name: 'credit_line_id')  String? creditLineId,  AssetModel? asset, @JsonKey(name: 'transaction_type')  String transactionType,  String amount, @JsonKey(name: 'remaining_amount')  String remainingAmount, @JsonKey(name: 'running_balance')  String runningBalance, @JsonKey(name: 'due_date')  String? dueDate, @JsonKey(name: 'is_overdue')  bool isOverdue, @JsonKey(name: 'days_overdue')  int? daysOverdue,  String? description, @JsonKey(name: 'reference_id')  String? referenceId, @JsonKey(name: 'created_at')  String createdAt, @JsonKey(name: 'interest_accrued')  String? interestAccrued, @JsonKey(name: 'total_due')  String? totalDue, @JsonKey(name: 'original_interest_5_percent')  String? originalInterest5Percent, @JsonKey(name: 'late_penalties')  String? latePenalties, @JsonKey(name: 'interest_rate_type')  String? interestRateType, @JsonKey(name: 'last_interest_calculation')  String? lastInterestCalculation, @JsonKey(name: 'late_penalties_accrued')  String? latePenaltiesAccrued, @JsonKey(name: 'regular_interest_accrued')  String? regularInterestAccrued, @JsonKey(name: 'fee_amount')  String? feeAmount, @JsonKey(name: 'remaining_fee')  String? remainingFee, @JsonKey(name: 'is_linked_fee')  bool? isLinkedFee, @JsonKey(name: 'parent_spend_id')  String? parentSpendId, @JsonKey(name: 'fee_type')  String? feeType, @JsonKey(name: 'cycle_number')  int? cycleNumber, @JsonKey(name: 'cycles_processed')  int? cyclesProcessed, @JsonKey(name: 'next_cycle_date')  String? nextCycleDate, @JsonKey(name: 'cycle_breakdown')  List<CycleBreakdownModel>? cycleBreakdown)  $default,) {final _that = this;
switch (_that) {
case _CreditTransactionModel():
return $default(_that.id,_that.creditLineId,_that.asset,_that.transactionType,_that.amount,_that.remainingAmount,_that.runningBalance,_that.dueDate,_that.isOverdue,_that.daysOverdue,_that.description,_that.referenceId,_that.createdAt,_that.interestAccrued,_that.totalDue,_that.originalInterest5Percent,_that.latePenalties,_that.interestRateType,_that.lastInterestCalculation,_that.latePenaltiesAccrued,_that.regularInterestAccrued,_that.feeAmount,_that.remainingFee,_that.isLinkedFee,_that.parentSpendId,_that.feeType,_that.cycleNumber,_that.cyclesProcessed,_that.nextCycleDate,_that.cycleBreakdown);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id, @JsonKey(name: 'credit_line_id')  String? creditLineId,  AssetModel? asset, @JsonKey(name: 'transaction_type')  String transactionType,  String amount, @JsonKey(name: 'remaining_amount')  String remainingAmount, @JsonKey(name: 'running_balance')  String runningBalance, @JsonKey(name: 'due_date')  String? dueDate, @JsonKey(name: 'is_overdue')  bool isOverdue, @JsonKey(name: 'days_overdue')  int? daysOverdue,  String? description, @JsonKey(name: 'reference_id')  String? referenceId, @JsonKey(name: 'created_at')  String createdAt, @JsonKey(name: 'interest_accrued')  String? interestAccrued, @JsonKey(name: 'total_due')  String? totalDue, @JsonKey(name: 'original_interest_5_percent')  String? originalInterest5Percent, @JsonKey(name: 'late_penalties')  String? latePenalties, @JsonKey(name: 'interest_rate_type')  String? interestRateType, @JsonKey(name: 'last_interest_calculation')  String? lastInterestCalculation, @JsonKey(name: 'late_penalties_accrued')  String? latePenaltiesAccrued, @JsonKey(name: 'regular_interest_accrued')  String? regularInterestAccrued, @JsonKey(name: 'fee_amount')  String? feeAmount, @JsonKey(name: 'remaining_fee')  String? remainingFee, @JsonKey(name: 'is_linked_fee')  bool? isLinkedFee, @JsonKey(name: 'parent_spend_id')  String? parentSpendId, @JsonKey(name: 'fee_type')  String? feeType, @JsonKey(name: 'cycle_number')  int? cycleNumber, @JsonKey(name: 'cycles_processed')  int? cyclesProcessed, @JsonKey(name: 'next_cycle_date')  String? nextCycleDate, @JsonKey(name: 'cycle_breakdown')  List<CycleBreakdownModel>? cycleBreakdown)?  $default,) {final _that = this;
switch (_that) {
case _CreditTransactionModel() when $default != null:
return $default(_that.id,_that.creditLineId,_that.asset,_that.transactionType,_that.amount,_that.remainingAmount,_that.runningBalance,_that.dueDate,_that.isOverdue,_that.daysOverdue,_that.description,_that.referenceId,_that.createdAt,_that.interestAccrued,_that.totalDue,_that.originalInterest5Percent,_that.latePenalties,_that.interestRateType,_that.lastInterestCalculation,_that.latePenaltiesAccrued,_that.regularInterestAccrued,_that.feeAmount,_that.remainingFee,_that.isLinkedFee,_that.parentSpendId,_that.feeType,_that.cycleNumber,_that.cyclesProcessed,_that.nextCycleDate,_that.cycleBreakdown);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _CreditTransactionModel implements CreditTransactionModel {
  const _CreditTransactionModel({required this.id, @JsonKey(name: 'credit_line_id') this.creditLineId, this.asset, @JsonKey(name: 'transaction_type') required this.transactionType, required this.amount, @JsonKey(name: 'remaining_amount') required this.remainingAmount, @JsonKey(name: 'running_balance') required this.runningBalance, @JsonKey(name: 'due_date') this.dueDate, @JsonKey(name: 'is_overdue') required this.isOverdue, @JsonKey(name: 'days_overdue') this.daysOverdue, this.description, @JsonKey(name: 'reference_id') this.referenceId, @JsonKey(name: 'created_at') required this.createdAt, @JsonKey(name: 'interest_accrued') this.interestAccrued, @JsonKey(name: 'total_due') this.totalDue, @JsonKey(name: 'original_interest_5_percent') this.originalInterest5Percent, @JsonKey(name: 'late_penalties') this.latePenalties, @JsonKey(name: 'interest_rate_type') this.interestRateType, @JsonKey(name: 'last_interest_calculation') this.lastInterestCalculation, @JsonKey(name: 'late_penalties_accrued') this.latePenaltiesAccrued, @JsonKey(name: 'regular_interest_accrued') this.regularInterestAccrued, @JsonKey(name: 'fee_amount') this.feeAmount, @JsonKey(name: 'remaining_fee') this.remainingFee, @JsonKey(name: 'is_linked_fee') this.isLinkedFee, @JsonKey(name: 'parent_spend_id') this.parentSpendId, @JsonKey(name: 'fee_type') this.feeType, @JsonKey(name: 'cycle_number') this.cycleNumber, @JsonKey(name: 'cycles_processed') this.cyclesProcessed, @JsonKey(name: 'next_cycle_date') this.nextCycleDate, @JsonKey(name: 'cycle_breakdown') final  List<CycleBreakdownModel>? cycleBreakdown}): _cycleBreakdown = cycleBreakdown;
  factory _CreditTransactionModel.fromJson(Map<String, dynamic> json) => _$CreditTransactionModelFromJson(json);

@override final  String id;
@override@JsonKey(name: 'credit_line_id') final  String? creditLineId;
@override final  AssetModel? asset;
@override@JsonKey(name: 'transaction_type') final  String transactionType;
@override final  String amount;
@override@JsonKey(name: 'remaining_amount') final  String remainingAmount;
@override@JsonKey(name: 'running_balance') final  String runningBalance;
@override@JsonKey(name: 'due_date') final  String? dueDate;
@override@JsonKey(name: 'is_overdue') final  bool isOverdue;
@override@JsonKey(name: 'days_overdue') final  int? daysOverdue;
@override final  String? description;
@override@JsonKey(name: 'reference_id') final  String? referenceId;
@override@JsonKey(name: 'created_at') final  String createdAt;
@override@JsonKey(name: 'interest_accrued') final  String? interestAccrued;
@override@JsonKey(name: 'total_due') final  String? totalDue;
// @JsonKey(name: 'principal_amount') String? principalAmount,
@override@JsonKey(name: 'original_interest_5_percent') final  String? originalInterest5Percent;
@override@JsonKey(name: 'late_penalties') final  String? latePenalties;
@override@JsonKey(name: 'interest_rate_type') final  String? interestRateType;
@override@JsonKey(name: 'last_interest_calculation') final  String? lastInterestCalculation;
@override@JsonKey(name: 'late_penalties_accrued') final  String? latePenaltiesAccrued;
@override@JsonKey(name: 'regular_interest_accrued') final  String? regularInterestAccrued;
@override@JsonKey(name: 'fee_amount') final  String? feeAmount;
@override@JsonKey(name: 'remaining_fee') final  String? remainingFee;
@override@JsonKey(name: 'is_linked_fee') final  bool? isLinkedFee;
@override@JsonKey(name: 'parent_spend_id') final  String? parentSpendId;
@override@JsonKey(name: 'fee_type') final  String? feeType;
// Cycle tracking fields
@override@JsonKey(name: 'cycle_number') final  int? cycleNumber;
@override@JsonKey(name: 'cycles_processed') final  int? cyclesProcessed;
@override@JsonKey(name: 'next_cycle_date') final  String? nextCycleDate;
 final  List<CycleBreakdownModel>? _cycleBreakdown;
@override@JsonKey(name: 'cycle_breakdown') List<CycleBreakdownModel>? get cycleBreakdown {
  final value = _cycleBreakdown;
  if (value == null) return null;
  if (_cycleBreakdown is EqualUnmodifiableListView) return _cycleBreakdown;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}


/// Create a copy of CreditTransactionModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CreditTransactionModelCopyWith<_CreditTransactionModel> get copyWith => __$CreditTransactionModelCopyWithImpl<_CreditTransactionModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$CreditTransactionModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _CreditTransactionModel&&(identical(other.id, id) || other.id == id)&&(identical(other.creditLineId, creditLineId) || other.creditLineId == creditLineId)&&(identical(other.asset, asset) || other.asset == asset)&&(identical(other.transactionType, transactionType) || other.transactionType == transactionType)&&(identical(other.amount, amount) || other.amount == amount)&&(identical(other.remainingAmount, remainingAmount) || other.remainingAmount == remainingAmount)&&(identical(other.runningBalance, runningBalance) || other.runningBalance == runningBalance)&&(identical(other.dueDate, dueDate) || other.dueDate == dueDate)&&(identical(other.isOverdue, isOverdue) || other.isOverdue == isOverdue)&&(identical(other.daysOverdue, daysOverdue) || other.daysOverdue == daysOverdue)&&(identical(other.description, description) || other.description == description)&&(identical(other.referenceId, referenceId) || other.referenceId == referenceId)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.interestAccrued, interestAccrued) || other.interestAccrued == interestAccrued)&&(identical(other.totalDue, totalDue) || other.totalDue == totalDue)&&(identical(other.originalInterest5Percent, originalInterest5Percent) || other.originalInterest5Percent == originalInterest5Percent)&&(identical(other.latePenalties, latePenalties) || other.latePenalties == latePenalties)&&(identical(other.interestRateType, interestRateType) || other.interestRateType == interestRateType)&&(identical(other.lastInterestCalculation, lastInterestCalculation) || other.lastInterestCalculation == lastInterestCalculation)&&(identical(other.latePenaltiesAccrued, latePenaltiesAccrued) || other.latePenaltiesAccrued == latePenaltiesAccrued)&&(identical(other.regularInterestAccrued, regularInterestAccrued) || other.regularInterestAccrued == regularInterestAccrued)&&(identical(other.feeAmount, feeAmount) || other.feeAmount == feeAmount)&&(identical(other.remainingFee, remainingFee) || other.remainingFee == remainingFee)&&(identical(other.isLinkedFee, isLinkedFee) || other.isLinkedFee == isLinkedFee)&&(identical(other.parentSpendId, parentSpendId) || other.parentSpendId == parentSpendId)&&(identical(other.feeType, feeType) || other.feeType == feeType)&&(identical(other.cycleNumber, cycleNumber) || other.cycleNumber == cycleNumber)&&(identical(other.cyclesProcessed, cyclesProcessed) || other.cyclesProcessed == cyclesProcessed)&&(identical(other.nextCycleDate, nextCycleDate) || other.nextCycleDate == nextCycleDate)&&const DeepCollectionEquality().equals(other._cycleBreakdown, _cycleBreakdown));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hashAll([runtimeType,id,creditLineId,asset,transactionType,amount,remainingAmount,runningBalance,dueDate,isOverdue,daysOverdue,description,referenceId,createdAt,interestAccrued,totalDue,originalInterest5Percent,latePenalties,interestRateType,lastInterestCalculation,latePenaltiesAccrued,regularInterestAccrued,feeAmount,remainingFee,isLinkedFee,parentSpendId,feeType,cycleNumber,cyclesProcessed,nextCycleDate,const DeepCollectionEquality().hash(_cycleBreakdown)]);

@override
String toString() {
  return 'CreditTransactionModel(id: $id, creditLineId: $creditLineId, asset: $asset, transactionType: $transactionType, amount: $amount, remainingAmount: $remainingAmount, runningBalance: $runningBalance, dueDate: $dueDate, isOverdue: $isOverdue, daysOverdue: $daysOverdue, description: $description, referenceId: $referenceId, createdAt: $createdAt, interestAccrued: $interestAccrued, totalDue: $totalDue, originalInterest5Percent: $originalInterest5Percent, latePenalties: $latePenalties, interestRateType: $interestRateType, lastInterestCalculation: $lastInterestCalculation, latePenaltiesAccrued: $latePenaltiesAccrued, regularInterestAccrued: $regularInterestAccrued, feeAmount: $feeAmount, remainingFee: $remainingFee, isLinkedFee: $isLinkedFee, parentSpendId: $parentSpendId, feeType: $feeType, cycleNumber: $cycleNumber, cyclesProcessed: $cyclesProcessed, nextCycleDate: $nextCycleDate, cycleBreakdown: $cycleBreakdown)';
}


}

/// @nodoc
abstract mixin class _$CreditTransactionModelCopyWith<$Res> implements $CreditTransactionModelCopyWith<$Res> {
  factory _$CreditTransactionModelCopyWith(_CreditTransactionModel value, $Res Function(_CreditTransactionModel) _then) = __$CreditTransactionModelCopyWithImpl;
@override @useResult
$Res call({
 String id,@JsonKey(name: 'credit_line_id') String? creditLineId, AssetModel? asset,@JsonKey(name: 'transaction_type') String transactionType, String amount,@JsonKey(name: 'remaining_amount') String remainingAmount,@JsonKey(name: 'running_balance') String runningBalance,@JsonKey(name: 'due_date') String? dueDate,@JsonKey(name: 'is_overdue') bool isOverdue,@JsonKey(name: 'days_overdue') int? daysOverdue, String? description,@JsonKey(name: 'reference_id') String? referenceId,@JsonKey(name: 'created_at') String createdAt,@JsonKey(name: 'interest_accrued') String? interestAccrued,@JsonKey(name: 'total_due') String? totalDue,@JsonKey(name: 'original_interest_5_percent') String? originalInterest5Percent,@JsonKey(name: 'late_penalties') String? latePenalties,@JsonKey(name: 'interest_rate_type') String? interestRateType,@JsonKey(name: 'last_interest_calculation') String? lastInterestCalculation,@JsonKey(name: 'late_penalties_accrued') String? latePenaltiesAccrued,@JsonKey(name: 'regular_interest_accrued') String? regularInterestAccrued,@JsonKey(name: 'fee_amount') String? feeAmount,@JsonKey(name: 'remaining_fee') String? remainingFee,@JsonKey(name: 'is_linked_fee') bool? isLinkedFee,@JsonKey(name: 'parent_spend_id') String? parentSpendId,@JsonKey(name: 'fee_type') String? feeType,@JsonKey(name: 'cycle_number') int? cycleNumber,@JsonKey(name: 'cycles_processed') int? cyclesProcessed,@JsonKey(name: 'next_cycle_date') String? nextCycleDate,@JsonKey(name: 'cycle_breakdown') List<CycleBreakdownModel>? cycleBreakdown
});


@override $AssetModelCopyWith<$Res>? get asset;

}
/// @nodoc
class __$CreditTransactionModelCopyWithImpl<$Res>
    implements _$CreditTransactionModelCopyWith<$Res> {
  __$CreditTransactionModelCopyWithImpl(this._self, this._then);

  final _CreditTransactionModel _self;
  final $Res Function(_CreditTransactionModel) _then;

/// Create a copy of CreditTransactionModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? creditLineId = freezed,Object? asset = freezed,Object? transactionType = null,Object? amount = null,Object? remainingAmount = null,Object? runningBalance = null,Object? dueDate = freezed,Object? isOverdue = null,Object? daysOverdue = freezed,Object? description = freezed,Object? referenceId = freezed,Object? createdAt = null,Object? interestAccrued = freezed,Object? totalDue = freezed,Object? originalInterest5Percent = freezed,Object? latePenalties = freezed,Object? interestRateType = freezed,Object? lastInterestCalculation = freezed,Object? latePenaltiesAccrued = freezed,Object? regularInterestAccrued = freezed,Object? feeAmount = freezed,Object? remainingFee = freezed,Object? isLinkedFee = freezed,Object? parentSpendId = freezed,Object? feeType = freezed,Object? cycleNumber = freezed,Object? cyclesProcessed = freezed,Object? nextCycleDate = freezed,Object? cycleBreakdown = freezed,}) {
  return _then(_CreditTransactionModel(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,creditLineId: freezed == creditLineId ? _self.creditLineId : creditLineId // ignore: cast_nullable_to_non_nullable
as String?,asset: freezed == asset ? _self.asset : asset // ignore: cast_nullable_to_non_nullable
as AssetModel?,transactionType: null == transactionType ? _self.transactionType : transactionType // ignore: cast_nullable_to_non_nullable
as String,amount: null == amount ? _self.amount : amount // ignore: cast_nullable_to_non_nullable
as String,remainingAmount: null == remainingAmount ? _self.remainingAmount : remainingAmount // ignore: cast_nullable_to_non_nullable
as String,runningBalance: null == runningBalance ? _self.runningBalance : runningBalance // ignore: cast_nullable_to_non_nullable
as String,dueDate: freezed == dueDate ? _self.dueDate : dueDate // ignore: cast_nullable_to_non_nullable
as String?,isOverdue: null == isOverdue ? _self.isOverdue : isOverdue // ignore: cast_nullable_to_non_nullable
as bool,daysOverdue: freezed == daysOverdue ? _self.daysOverdue : daysOverdue // ignore: cast_nullable_to_non_nullable
as int?,description: freezed == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String?,referenceId: freezed == referenceId ? _self.referenceId : referenceId // ignore: cast_nullable_to_non_nullable
as String?,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as String,interestAccrued: freezed == interestAccrued ? _self.interestAccrued : interestAccrued // ignore: cast_nullable_to_non_nullable
as String?,totalDue: freezed == totalDue ? _self.totalDue : totalDue // ignore: cast_nullable_to_non_nullable
as String?,originalInterest5Percent: freezed == originalInterest5Percent ? _self.originalInterest5Percent : originalInterest5Percent // ignore: cast_nullable_to_non_nullable
as String?,latePenalties: freezed == latePenalties ? _self.latePenalties : latePenalties // ignore: cast_nullable_to_non_nullable
as String?,interestRateType: freezed == interestRateType ? _self.interestRateType : interestRateType // ignore: cast_nullable_to_non_nullable
as String?,lastInterestCalculation: freezed == lastInterestCalculation ? _self.lastInterestCalculation : lastInterestCalculation // ignore: cast_nullable_to_non_nullable
as String?,latePenaltiesAccrued: freezed == latePenaltiesAccrued ? _self.latePenaltiesAccrued : latePenaltiesAccrued // ignore: cast_nullable_to_non_nullable
as String?,regularInterestAccrued: freezed == regularInterestAccrued ? _self.regularInterestAccrued : regularInterestAccrued // ignore: cast_nullable_to_non_nullable
as String?,feeAmount: freezed == feeAmount ? _self.feeAmount : feeAmount // ignore: cast_nullable_to_non_nullable
as String?,remainingFee: freezed == remainingFee ? _self.remainingFee : remainingFee // ignore: cast_nullable_to_non_nullable
as String?,isLinkedFee: freezed == isLinkedFee ? _self.isLinkedFee : isLinkedFee // ignore: cast_nullable_to_non_nullable
as bool?,parentSpendId: freezed == parentSpendId ? _self.parentSpendId : parentSpendId // ignore: cast_nullable_to_non_nullable
as String?,feeType: freezed == feeType ? _self.feeType : feeType // ignore: cast_nullable_to_non_nullable
as String?,cycleNumber: freezed == cycleNumber ? _self.cycleNumber : cycleNumber // ignore: cast_nullable_to_non_nullable
as int?,cyclesProcessed: freezed == cyclesProcessed ? _self.cyclesProcessed : cyclesProcessed // ignore: cast_nullable_to_non_nullable
as int?,nextCycleDate: freezed == nextCycleDate ? _self.nextCycleDate : nextCycleDate // ignore: cast_nullable_to_non_nullable
as String?,cycleBreakdown: freezed == cycleBreakdown ? _self._cycleBreakdown : cycleBreakdown // ignore: cast_nullable_to_non_nullable
as List<CycleBreakdownModel>?,
  ));
}

/// Create a copy of CreditTransactionModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$AssetModelCopyWith<$Res>? get asset {
    if (_self.asset == null) {
    return null;
  }

  return $AssetModelCopyWith<$Res>(_self.asset!, (value) {
    return _then(_self.copyWith(asset: value));
  });
}
}

// dart format on
