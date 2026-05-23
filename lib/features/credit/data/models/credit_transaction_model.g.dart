// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'credit_transaction_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_CreditTransactionModel _$CreditTransactionModelFromJson(
  Map<String, dynamic> json,
) => _CreditTransactionModel(
  id: json['id'] as String,
  creditLineId: json['credit_line_id'] as String?,
  asset: json['asset'] == null
      ? null
      : AssetModel.fromJson(json['asset'] as Map<String, dynamic>),
  transactionType: json['transaction_type'] as String,
  amount: json['amount'] as String,
  remainingAmount: json['remaining_amount'] as String,
  runningBalance: json['running_balance'] as String,
  dueDate: json['due_date'] as String?,
  isOverdue: json['is_overdue'] as bool,
  daysOverdue: (json['days_overdue'] as num?)?.toInt(),
  description: json['description'] as String?,
  referenceId: json['reference_id'] as String?,
  createdAt: json['created_at'] as String,
  interestAccrued: json['interest_accrued'] as String?,
  totalDue: json['total_due'] as String?,
  originalInterest5Percent: json['original_interest_5_percent'] as String?,
  latePenalties: json['late_penalties'] as String?,
  interestRateType: json['interest_rate_type'] as String?,
  lastInterestCalculation: json['last_interest_calculation'] as String?,
  latePenaltiesAccrued: json['late_penalties_accrued'] as String?,
  regularInterestAccrued: json['regular_interest_accrued'] as String?,
  feeAmount: json['fee_amount'] as String?,
  remainingFee: json['remaining_fee'] as String?,
  isLinkedFee: json['is_linked_fee'] as bool?,
  parentSpendId: json['parent_spend_id'] as String?,
  feeType: json['fee_type'] as String?,
  cycleNumber: (json['cycle_number'] as num?)?.toInt(),
  cyclesProcessed: (json['cycles_processed'] as num?)?.toInt(),
  nextCycleDate: json['next_cycle_date'] as String?,
  cycleBreakdown: (json['cycle_breakdown'] as List<dynamic>?)
      ?.map((e) => CycleBreakdownModel.fromJson(e as Map<String, dynamic>))
      .toList(),
);

Map<String, dynamic> _$CreditTransactionModelToJson(
  _CreditTransactionModel instance,
) => <String, dynamic>{
  'id': instance.id,
  'credit_line_id': instance.creditLineId,
  'asset': instance.asset,
  'transaction_type': instance.transactionType,
  'amount': instance.amount,
  'remaining_amount': instance.remainingAmount,
  'running_balance': instance.runningBalance,
  'due_date': instance.dueDate,
  'is_overdue': instance.isOverdue,
  'days_overdue': instance.daysOverdue,
  'description': instance.description,
  'reference_id': instance.referenceId,
  'created_at': instance.createdAt,
  'interest_accrued': instance.interestAccrued,
  'total_due': instance.totalDue,
  'original_interest_5_percent': instance.originalInterest5Percent,
  'late_penalties': instance.latePenalties,
  'interest_rate_type': instance.interestRateType,
  'last_interest_calculation': instance.lastInterestCalculation,
  'late_penalties_accrued': instance.latePenaltiesAccrued,
  'regular_interest_accrued': instance.regularInterestAccrued,
  'fee_amount': instance.feeAmount,
  'remaining_fee': instance.remainingFee,
  'is_linked_fee': instance.isLinkedFee,
  'parent_spend_id': instance.parentSpendId,
  'fee_type': instance.feeType,
  'cycle_number': instance.cycleNumber,
  'cycles_processed': instance.cyclesProcessed,
  'next_cycle_date': instance.nextCycleDate,
  'cycle_breakdown': instance.cycleBreakdown,
};
