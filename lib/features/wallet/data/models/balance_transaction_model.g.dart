// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'balance_transaction_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_BalanceTransactionModel _$BalanceTransactionModelFromJson(
  Map<String, dynamic> json,
) => _BalanceTransactionModel(
  id: json['id'] as String,
  transactionType: json['transaction_type'] as String,
  status: json['status'] as String,
  amount: (json['amount'] as num).toDouble(),
  runningBalance: (json['running_balance'] as num).toDouble(),
  description: json['description'] as String?,
  referenceId: json['reference_id'] as String,
  createdAt: DateTime.parse(json['created_at'] as String),
);

Map<String, dynamic> _$BalanceTransactionModelToJson(
  _BalanceTransactionModel instance,
) => <String, dynamic>{
  'id': instance.id,
  'transaction_type': instance.transactionType,
  'status': instance.status,
  'amount': instance.amount,
  'running_balance': instance.runningBalance,
  'description': instance.description,
  'reference_id': instance.referenceId,
  'created_at': instance.createdAt.toIso8601String(),
};
