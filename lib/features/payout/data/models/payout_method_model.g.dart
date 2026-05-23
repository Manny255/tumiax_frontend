// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'payout_method_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_PayoutMethodModel _$PayoutMethodModelFromJson(Map<String, dynamic> json) =>
    _PayoutMethodModel(
      id: (json['id'] as num).toInt(),
      method: json['method'] as String,
      bankName: json['bank_name'] as String?,
      accountNumber: json['account_number'] as String?,
      accountHolder: json['account_holder'] as String?,
      accountCurrency: json['account_currency'] as String?,
      swiftCode: json['swift_code'] as String?,
      routingNumber: json['routing_number'] as String?,
      iban: json['iban'] as String?,
      mobileWalletNumber: json['mobile_wallet_number'] as String?,
      mobileWalletProvider: json['mobile_wallet_provider'] as String?,
      mobileWalletName: json['mobile_wallet_name'] as String?,
      isActive: json['is_active'] as bool,
      createdAt: DateTime.parse(json['created_at'] as String),
      activeFrom: json['active_from'] == null
          ? null
          : DateTime.parse(json['active_from'] as String),
    );

Map<String, dynamic> _$PayoutMethodModelToJson(_PayoutMethodModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'method': instance.method,
      'bank_name': instance.bankName,
      'account_number': instance.accountNumber,
      'account_holder': instance.accountHolder,
      'account_currency': instance.accountCurrency,
      'swift_code': instance.swiftCode,
      'routing_number': instance.routingNumber,
      'iban': instance.iban,
      'mobile_wallet_number': instance.mobileWalletNumber,
      'mobile_wallet_provider': instance.mobileWalletProvider,
      'mobile_wallet_name': instance.mobileWalletName,
      'is_active': instance.isActive,
      'created_at': instance.createdAt.toIso8601String(),
      'active_from': instance.activeFrom?.toIso8601String(),
    };
