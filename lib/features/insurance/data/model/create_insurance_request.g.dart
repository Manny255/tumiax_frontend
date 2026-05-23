// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'create_insurance_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_CreateInsuranceRequest _$CreateInsuranceRequestFromJson(
  Map<String, dynamic> json,
) => _CreateInsuranceRequest(
  assetId: json['asset'] as String,
  provider: json['provider'] as String,
  policyNumber: json['policy_number'] as String,
  expiryDate: const DateOnlyConverter().fromJson(json['expiry_date'] as String),
  startDate: const NullableDateOnlyConverter().fromJson(
    json['start_date'] as String?,
  ),
  active: json['active'] as bool,
  coverageAmount: (json['coverage_amount'] as num?)?.toDouble(),
  premiumAmount: (json['premium_amount'] as num?)?.toDouble(),
  premiumFrequency: json['premium_frequency'] as String?,
  notes: json['notes'] as String?,
);

Map<String, dynamic> _$CreateInsuranceRequestToJson(
  _CreateInsuranceRequest instance,
) => <String, dynamic>{
  'asset': instance.assetId,
  'provider': instance.provider,
  'policy_number': instance.policyNumber,
  'expiry_date': const DateOnlyConverter().toJson(instance.expiryDate),
  'start_date': const NullableDateOnlyConverter().toJson(instance.startDate),
  'active': instance.active,
  'coverage_amount': instance.coverageAmount,
  'premium_amount': instance.premiumAmount,
  'premium_frequency': instance.premiumFrequency,
  'notes': instance.notes,
};
