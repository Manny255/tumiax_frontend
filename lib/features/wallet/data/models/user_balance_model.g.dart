// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_balance_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_UserBalanceModel _$UserBalanceModelFromJson(Map<String, dynamic> json) =>
    _UserBalanceModel(
      id: json['id'] as String,
      balance: (json['balance'] as num).toDouble(),
      totalDeposited: (json['total_deposited'] as num).toDouble(),
      totalWithdrawn: (json['total_withdrawn'] as num).toDouble(),
      isFrozen: json['is_frozen'] as bool,
      createdAt: DateTime.parse(json['created_at'] as String),
      updatedAt: DateTime.parse(json['updated_at'] as String),
    );

Map<String, dynamic> _$UserBalanceModelToJson(_UserBalanceModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'balance': instance.balance,
      'total_deposited': instance.totalDeposited,
      'total_withdrawn': instance.totalWithdrawn,
      'is_frozen': instance.isFrozen,
      'created_at': instance.createdAt.toIso8601String(),
      'updated_at': instance.updatedAt.toIso8601String(),
    };
