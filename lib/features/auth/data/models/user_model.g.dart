// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_UserModel _$UserModelFromJson(Map<String, dynamic> json) => _UserModel(
  id: json['id'] as String,
  email: json['email'] as String,
  accountTier: json['account_tier'] as String,
  isVerified: json['is_verified'] as bool,
  isFrozen: json['is_frozen'] as bool,
  fullName: json['full_name'] as String?,
  firstName: json['first_name'] as String?,
  selfieUrl: json['selfie_url'] as String?,
  phoneNumber: json['phone_number'] as String?,
  dailySpendLimit: _stringToDouble(json['daily_spend_limit']),
  monthlySpendLimit: _stringToDouble(json['monthly_spend_limit']),
  createdAt: DateTime.parse(json['created_at'] as String),
  availableCredit: _stringToDouble(json['available_credit']),
  mfaEnabled: json['mfa_enabled'] as bool? ?? false,
);

Map<String, dynamic> _$UserModelToJson(_UserModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'email': instance.email,
      'account_tier': instance.accountTier,
      'is_verified': instance.isVerified,
      'is_frozen': instance.isFrozen,
      'full_name': instance.fullName,
      'first_name': instance.firstName,
      'selfie_url': instance.selfieUrl,
      'phone_number': instance.phoneNumber,
      'daily_spend_limit': _doubleToString(instance.dailySpendLimit),
      'monthly_spend_limit': _doubleToString(instance.monthlySpendLimit),
      'created_at': instance.createdAt.toIso8601String(),
      'available_credit': _doubleToString(instance.availableCredit),
      'mfa_enabled': instance.mfaEnabled,
    };
