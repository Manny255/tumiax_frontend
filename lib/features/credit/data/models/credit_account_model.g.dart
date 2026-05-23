// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'credit_account_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_CreditAccountModel _$CreditAccountModelFromJson(Map<String, dynamic> json) =>
    _CreditAccountModel(
      id: json['id'] as String,
      creditLimit: json['credit_limit'] as String,
      usedAmount: json['used_amount'] as String,
      availableCredit: (json['available_credit'] as num).toDouble(),
      utilizationRatio: (json['utilization_ratio'] as num).toInt(),
      interestRate: json['interest_rate'] as String,
      isActive: json['is_active'] as bool,
      isDelinquent: json['is_delinquent'] as bool,
      currentStatementBalance: json['current_statement_balance'] as String?,
      minimumPaymentDue: json['minimum_payment_due'] as String?,
      paymentDueDate: json['payment_due_date'] as String?,
      totalSpentLifetime: json['total_spent_lifetime'] as String?,
      totalRepaidLifetime: json['total_repaid_lifetime'] as String?,
      creditLines:
          (json['credit_lines'] as List<dynamic>?)
              ?.map((e) => CreditLineModel.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      createdAt: json['created_at'] as String?,
      updatedAt: json['updated_at'] as String?,
    );

Map<String, dynamic> _$CreditAccountModelToJson(_CreditAccountModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'credit_limit': instance.creditLimit,
      'used_amount': instance.usedAmount,
      'available_credit': instance.availableCredit,
      'utilization_ratio': instance.utilizationRatio,
      'interest_rate': instance.interestRate,
      'is_active': instance.isActive,
      'is_delinquent': instance.isDelinquent,
      'current_statement_balance': instance.currentStatementBalance,
      'minimum_payment_due': instance.minimumPaymentDue,
      'payment_due_date': instance.paymentDueDate,
      'total_spent_lifetime': instance.totalSpentLifetime,
      'total_repaid_lifetime': instance.totalRepaidLifetime,
      'credit_lines': instance.creditLines,
      'created_at': instance.createdAt,
      'updated_at': instance.updatedAt,
    };
