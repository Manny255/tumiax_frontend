// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'insurance_policy_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_InsurancePolicyModel _$InsurancePolicyModelFromJson(
  Map<String, dynamic> json,
) => _InsurancePolicyModel(
  id: (json['id'] as num).toInt(),
  asset: json['asset'] as String,
  assetDetails: json['asset_details'] as Map<String, dynamic>?,
  provider: json['provider'] as String,
  policyNumber: json['policy_number'] as String,
  expiryDate: DateTime.parse(json['expiry_date'] as String),
  active: json['active'] as bool,
  coverageAmount: _stringToDouble(json['coverage_amount']),
  premiumAmount: _stringToDouble(json['premium_amount']),
  premiumFrequency: json['premium_frequency'] as String?,
  startDate: json['start_date'] == null
      ? null
      : DateTime.parse(json['start_date'] as String),
  notes: json['notes'] as String?,
  isExpired: json['is_expired'] as bool?,
  daysUntilExpiry: (json['days_until_expiry'] as num?)?.toInt(),
  createdAt: DateTime.parse(json['created_at'] as String),
  updatedAt: json['updated_at'] == null
      ? null
      : DateTime.parse(json['updated_at'] as String),
);

Map<String, dynamic> _$InsurancePolicyModelToJson(
  _InsurancePolicyModel instance,
) => <String, dynamic>{
  'id': instance.id,
  'asset': instance.asset,
  'asset_details': instance.assetDetails,
  'provider': instance.provider,
  'policy_number': instance.policyNumber,
  'expiry_date': instance.expiryDate.toIso8601String(),
  'active': instance.active,
  'coverage_amount': _doubleToString(instance.coverageAmount),
  'premium_amount': _doubleToString(instance.premiumAmount),
  'premium_frequency': instance.premiumFrequency,
  'start_date': instance.startDate?.toIso8601String(),
  'notes': instance.notes,
  'is_expired': instance.isExpired,
  'days_until_expiry': instance.daysUntilExpiry,
  'created_at': instance.createdAt.toIso8601String(),
  'updated_at': instance.updatedAt?.toIso8601String(),
};
