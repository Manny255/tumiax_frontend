// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'credit_line_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_CreditLineModel _$CreditLineModelFromJson(Map<String, dynamic> json) =>
    _CreditLineModel(
      id: json['id'] as String,
      asset: AssetModel.fromJson(json['asset'] as Map<String, dynamic>),
      amount: json['amount'] as String,
      remainingBalance: json['remaining_balance'] as String,
      usedAmount: (json['used_amount'] as num).toDouble(),
      availableAmount: (json['available_amount'] as num).toDouble(),
      interestRate: json['interest_rate'] as String,
      termMonths: (json['term_months'] as num).toInt(),
      monthlyPayment: json['monthly_payment'] as String,
      originatedAt: json['originated_at'] as String,
      maturedAt: json['matured_at'] as String?,
      status: json['status'] as String,
    );

Map<String, dynamic> _$CreditLineModelToJson(_CreditLineModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'asset': instance.asset,
      'amount': instance.amount,
      'remaining_balance': instance.remainingBalance,
      'used_amount': instance.usedAmount,
      'available_amount': instance.availableAmount,
      'interest_rate': instance.interestRate,
      'term_months': instance.termMonths,
      'monthly_payment': instance.monthlyPayment,
      'originated_at': instance.originatedAt,
      'matured_at': instance.maturedAt,
      'status': instance.status,
    };
