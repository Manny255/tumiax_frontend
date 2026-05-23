// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'asset_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_AssetModel _$AssetModelFromJson(Map<String, dynamic> json) => _AssetModel(
  id: json['id'] as String,
  title: json['title'] as String,
  description: json['description'] as String?,
  category: json['category'] == null
      ? null
      : AssetCategoryModel.fromJson(json['category'] as Map<String, dynamic>),
  categoryName: json['category_name'] as String?,
  categoryDetails: json['category_details'] == null
      ? null
      : AssetCategoryModel.fromJson(
          json['category_details'] as Map<String, dynamic>,
        ),
  serialNumber: json['serial_number'] as String?,
  registrationNumber: json['registration_number'] as String?,
  vin: json['vin'] as String?,
  purchaseDate: json['purchase_date'] == null
      ? null
      : DateTime.parse(json['purchase_date'] as String),
  purchasePrice: _stringToDouble(json['purchase_price']),
  currentMarketValue: _stringToDoubleRequired(json['current_market_value']),
  ageYears: _stringToDouble(json['age_years']),
  condition: json['condition'] as String,
  conditionScore: (json['condition_score'] as num?)?.toInt(),
  locationAddress: json['location_address'] as String?,
  outstandingLoanAmount: _stringToDouble(json['outstanding_loan_amount']),
  loanToValue: _stringToDouble(json['loan_to_value']),
  availableEquity: _stringToDouble(json['available_equity']),
  verificationStatus: json['verification_status'] as String,
  rejectionReasons: json['rejection_reasons'] as Map<String, dynamic>?,
  verifiedBy: json['verified_by'] as String?,
  verifiedAt: json['verified_at'] == null
      ? null
      : DateTime.parse(json['verified_at'] as String),
  resubmissionCount: (json['resubmission_count'] as num?)?.toInt(),
  lastSubmittedAt: json['last_submitted_at'] == null
      ? null
      : DateTime.parse(json['last_submitted_at'] as String),
  documents: (json['documents'] as List<dynamic>?)
      ?.map((e) => AssetDocumentModel.fromJson(e as Map<String, dynamic>))
      .toList(),
  insurancePolicy: json['insurance_policy'] == null
      ? null
      : InsurancePolicyModel.fromJson(
          json['insurance_policy'] as Map<String, dynamic>,
        ),
  hasActiveInsurance: json['has_active_insurance'] as bool?,
  isExternallyEncumbered: json['is_externally_encumbered'] as bool? ?? false,
  externalLenderName: json['external_lender_name'] as String?,
  externalLienAmount: _stringToDouble(json['external_lien_amount']),
  createdAt: json['created_at'] == null
      ? null
      : DateTime.parse(json['created_at'] as String),
  updatedAt: json['updated_at'] == null
      ? null
      : DateTime.parse(json['updated_at'] as String),
);

Map<String, dynamic> _$AssetModelToJson(_AssetModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'description': instance.description,
      'category': instance.category,
      'category_name': instance.categoryName,
      'category_details': instance.categoryDetails,
      'serial_number': instance.serialNumber,
      'registration_number': instance.registrationNumber,
      'vin': instance.vin,
      'purchase_date': instance.purchaseDate?.toIso8601String(),
      'purchase_price': instance.purchasePrice,
      'current_market_value': instance.currentMarketValue,
      'age_years': instance.ageYears,
      'condition': instance.condition,
      'condition_score': instance.conditionScore,
      'location_address': instance.locationAddress,
      'outstanding_loan_amount': instance.outstandingLoanAmount,
      'loan_to_value': instance.loanToValue,
      'available_equity': instance.availableEquity,
      'verification_status': instance.verificationStatus,
      'rejection_reasons': instance.rejectionReasons,
      'verified_by': instance.verifiedBy,
      'verified_at': instance.verifiedAt?.toIso8601String(),
      'resubmission_count': instance.resubmissionCount,
      'last_submitted_at': instance.lastSubmittedAt?.toIso8601String(),
      'documents': instance.documents,
      'insurance_policy': instance.insurancePolicy,
      'has_active_insurance': instance.hasActiveInsurance,
      'is_externally_encumbered': instance.isExternallyEncumbered,
      'external_lender_name': instance.externalLenderName,
      'external_lien_amount': instance.externalLienAmount,
      'created_at': instance.createdAt?.toIso8601String(),
      'updated_at': instance.updatedAt?.toIso8601String(),
    };
