// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'transaction_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_TransactionModel _$TransactionModelFromJson(Map<String, dynamic> json) =>
    _TransactionModel(
      id: json['id'] as String,
      transactionType: json['transaction_type'] as String,
      amount: _doubleFromJson(json['amount']),
      fee: _doubleFromJson(json['fee']),
      description: json['description'] as String,
      merchant: json['merchant'] as String?,
      merchantCategory: json['merchant_category'] as String?,
      referenceId: json['reference_id'] as String,
      status: json['status'] as String?,
      createdAt: DateTime.parse(json['created_at'] as String),
      settledAt: json['settled_at'] == null
          ? null
          : DateTime.parse(json['settled_at'] as String),
    );

Map<String, dynamic> _$TransactionModelToJson(_TransactionModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'transaction_type': instance.transactionType,
      'amount': instance.amount,
      'fee': instance.fee,
      'description': instance.description,
      'merchant': instance.merchant,
      'merchant_category': instance.merchantCategory,
      'reference_id': instance.referenceId,
      'status': instance.status,
      'created_at': instance.createdAt.toIso8601String(),
      'settled_at': instance.settledAt?.toIso8601String(),
    };
