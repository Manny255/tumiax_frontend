// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'kyc_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_KYCProfile _$KYCProfileFromJson(Map<String, dynamic> json) => _KYCProfile(
  id: json['id'] as String,
  status: json['status'] as String,
  level: json['level'] as String,
  fullName: json['full_name'] as String?,
  dateOfBirth: json['date_of_birth'] == null
      ? null
      : DateTime.parse(json['date_of_birth'] as String),
  nationality: json['nationality'] as String?,
  idType: json['id_type'] as String?,
  idNumber: json['id_number'] as String?,
  phoneNumber: json['phone_number'] as String?,
  idCountry: json['id_country'] as String?,
  idExpiryDate: const NullableDateOnlyConverter().fromJson(
    json['id_expiry_date'] as String?,
  ),
  addressLine1: json['address_line1'] as String?,
  addressLine2: json['address_line2'] as String?,
  city: json['city'] as String?,
  state: json['state'] as String?,
  postalCode: json['postal_code'] as String?,
  country: json['country'] as String?,
  employmentStatus: json['employment_status'] as String?,
  occupation: json['occupation'] as String?,
  employer: json['employer'] as String?,
  annualIncome: json['annual_income'] as String?,
  verifiedAt: json['verified_at'] == null
      ? null
      : DateTime.parse(json['verified_at'] as String),
  idFrontUrl: json['id_front_url'] as String?,
  idBackUrl: json['id_back_url'] as String?,
  selfieUrl: json['selfie_url'] as String?,
  proofOfAddressUrl: json['proof_of_address_url'] as String?,
  proofOfAddressType: json['proof_of_address_type'] as String?,
  createdAt: json['created_at'] == null
      ? null
      : DateTime.parse(json['created_at'] as String),
  updatedAt: json['updated_at'] == null
      ? null
      : DateTime.parse(json['updated_at'] as String),
  expiresAt: json['expires_at'] == null
      ? null
      : DateTime.parse(json['expires_at'] as String),
  rejectionReason: json['rejection_reason'] as String?,
  riskScore: (json['risk_score'] as num?)?.toInt(),
  pepCheck: json['pep_check'] as bool?,
  sanctionCheck: json['sanction_check'] as bool?,
  adverseMedia: json['adverse_media'] as bool?,
  user: json['user'] == null
      ? null
      : UserModel.fromJson(json['user'] as Map<String, dynamic>),
  verifiedBy: json['verified_by'] as String?,
);

Map<String, dynamic> _$KYCProfileToJson(_KYCProfile instance) =>
    <String, dynamic>{
      'id': instance.id,
      'status': instance.status,
      'level': instance.level,
      'full_name': instance.fullName,
      'date_of_birth': instance.dateOfBirth?.toIso8601String(),
      'nationality': instance.nationality,
      'id_type': instance.idType,
      'id_number': instance.idNumber,
      'phone_number': instance.phoneNumber,
      'id_country': instance.idCountry,
      'id_expiry_date': const NullableDateOnlyConverter().toJson(
        instance.idExpiryDate,
      ),
      'address_line1': instance.addressLine1,
      'address_line2': instance.addressLine2,
      'city': instance.city,
      'state': instance.state,
      'postal_code': instance.postalCode,
      'country': instance.country,
      'employment_status': instance.employmentStatus,
      'occupation': instance.occupation,
      'employer': instance.employer,
      'annual_income': instance.annualIncome,
      'verified_at': instance.verifiedAt?.toIso8601String(),
      'id_front_url': instance.idFrontUrl,
      'id_back_url': instance.idBackUrl,
      'selfie_url': instance.selfieUrl,
      'proof_of_address_url': instance.proofOfAddressUrl,
      'proof_of_address_type': instance.proofOfAddressType,
      'created_at': instance.createdAt?.toIso8601String(),
      'updated_at': instance.updatedAt?.toIso8601String(),
      'expires_at': instance.expiresAt?.toIso8601String(),
      'rejection_reason': instance.rejectionReason,
      'risk_score': instance.riskScore,
      'pep_check': instance.pepCheck,
      'sanction_check': instance.sanctionCheck,
      'adverse_media': instance.adverseMedia,
      'user': instance.user,
      'verified_by': instance.verifiedBy,
    };

_KYCStatus _$KYCStatusFromJson(Map<String, dynamic> json) => _KYCStatus(
  status: json['status'] as String,
  level: json['level'] as String,
  isVerified: json['is_verified'] as bool,
  submittedAt: json['submitted_at'] == null
      ? null
      : DateTime.parse(json['submitted_at'] as String),
  verifiedAt: json['verified_at'] == null
      ? null
      : DateTime.parse(json['verified_at'] as String),
  expiresAt: json['expires_at'] == null
      ? null
      : DateTime.parse(json['expires_at'] as String),
);

Map<String, dynamic> _$KYCStatusToJson(_KYCStatus instance) =>
    <String, dynamic>{
      'status': instance.status,
      'level': instance.level,
      'is_verified': instance.isVerified,
      'submitted_at': instance.submittedAt?.toIso8601String(),
      'verified_at': instance.verifiedAt?.toIso8601String(),
      'expires_at': instance.expiresAt?.toIso8601String(),
    };

_KYCSubmission _$KYCSubmissionFromJson(Map<String, dynamic> json) =>
    _KYCSubmission(
      fullName: json['full_name'] as String,
      dateOfBirth: const DateOnlyConverter().fromJson(
        json['date_of_birth'] as String,
      ),
      nationality: json['nationality'] as String,
      idType: json['id_type'] as String,
      idNumber: json['id_number'] as String,
      phoneNumber: json['phone_number'] as String,
      idCountry: json['id_country'] as String,
      idExpiryDate: const NullableDateOnlyConverter().fromJson(
        json['id_expiry_date'] as String?,
      ),
      addressLine1: json['address_line1'] as String,
      addressLine2: json['address_line2'] as String?,
      city: json['city'] as String,
      state: json['state'] as String,
      postalCode: json['postal_code'] as String,
      country: json['country'] as String,
      employmentStatus: json['employment_status'] as String?,
      occupation: json['occupation'] as String?,
      employer: json['employer'] as String?,
      annualIncome: json['annual_income'] as String?,
    );

Map<String, dynamic> _$KYCSubmissionToJson(_KYCSubmission instance) =>
    <String, dynamic>{
      'full_name': instance.fullName,
      'date_of_birth': const DateOnlyConverter().toJson(instance.dateOfBirth),
      'nationality': instance.nationality,
      'id_type': instance.idType,
      'id_number': instance.idNumber,
      'phone_number': instance.phoneNumber,
      'id_country': instance.idCountry,
      'id_expiry_date': const NullableDateOnlyConverter().toJson(
        instance.idExpiryDate,
      ),
      'address_line1': instance.addressLine1,
      'address_line2': instance.addressLine2,
      'city': instance.city,
      'state': instance.state,
      'postal_code': instance.postalCode,
      'country': instance.country,
      'employment_status': instance.employmentStatus,
      'occupation': instance.occupation,
      'employer': instance.employer,
      'annual_income': instance.annualIncome,
    };
