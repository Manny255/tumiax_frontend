// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'kyc_lookup_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_KYCLookupModel _$KYCLookupModelFromJson(Map<String, dynamic> json) =>
    _KYCLookupModel(
      email: json['email'] as String,
      fullName: json['full_name'] as String?,
      selfieUrl: json['selfie_url'] as String?,
      status: json['status'] as String,
      level: json['level'] as String,
      riskScore: (json['risk_score'] as num).toInt(),
      pepCheck: json['pep_check'] as bool,
      sanctionCheck: json['sanction_check'] as bool,
      adverseMedia: json['adverse_media'] as bool,
      expiresAt: json['expires_at'] == null
          ? null
          : DateTime.parse(json['expires_at'] as String),
      canReceive: json['can_receive'] as bool,
    );

Map<String, dynamic> _$KYCLookupModelToJson(_KYCLookupModel instance) =>
    <String, dynamic>{
      'email': instance.email,
      'full_name': instance.fullName,
      'selfie_url': instance.selfieUrl,
      'status': instance.status,
      'level': instance.level,
      'risk_score': instance.riskScore,
      'pep_check': instance.pepCheck,
      'sanction_check': instance.sanctionCheck,
      'adverse_media': instance.adverseMedia,
      'expires_at': instance.expiresAt?.toIso8601String(),
      'can_receive': instance.canReceive,
    };
