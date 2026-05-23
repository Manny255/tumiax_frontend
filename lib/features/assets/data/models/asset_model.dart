// lib/features/assets/data/models/asset_model.dart

import 'package:freezed_annotation/freezed_annotation.dart';
import '../../../insurance/data/model/insurance_policy_model.dart';
import 'asset_category.dart';
import 'asset_document.dart';

part 'asset_model.freezed.dart';
part 'asset_model.g.dart';

@freezed
sealed class AssetModel with _$AssetModel {
  const factory AssetModel({
    required String id,
    required String title,
    String? description,

    /// Category (Detail serializer)
    @JsonKey(name: 'category')
    AssetCategoryModel? category,

    @JsonKey(name: 'category_name') String? categoryName,

    /// Category (Create serializer)
    @JsonKey(name: 'category_details')
    AssetCategoryModel? categoryDetails,

    /// Sensitive info
    @JsonKey(name: 'serial_number')
    String? serialNumber,

    @JsonKey(name: 'registration_number')
    String? registrationNumber,

    String? vin,

    /// Financials
    @JsonKey(name: 'purchase_date')
    DateTime? purchaseDate,

    @JsonKey(name: 'purchase_price', fromJson: _stringToDouble)
    double? purchasePrice,

    @JsonKey(name: 'current_market_value', fromJson: _stringToDoubleRequired)
    required double currentMarketValue,
    // @JsonKey(
    //   name: 'collateral_value',
    //   fromJson: _stringToDoubleRequired,
    // )
    // required double collateralValue,

    /// Condition
    @JsonKey(name: 'age_years', fromJson: _stringToDouble)
    double? ageYears,

    required String condition,

    @JsonKey(name: 'condition_score')
    int? conditionScore,

    /// Location
    @JsonKey(name: 'location_address')
    String? locationAddress,

    /// Loan tracking
    @JsonKey(name: 'outstanding_loan_amount', fromJson: _stringToDouble)
    double? outstandingLoanAmount,

    @JsonKey(name: 'loan_to_value', fromJson: _stringToDouble)
    double? loanToValue,

    @JsonKey(name: 'available_equity', fromJson: _stringToDouble)
    double? availableEquity,

    /// Verification
    @JsonKey(name: 'verification_status')
    required String verificationStatus,

    @JsonKey(name: 'rejection_reasons')
    Map<String, dynamic>? rejectionReasons,

    @JsonKey(name: 'verified_by')
    String? verifiedBy,

    @JsonKey(name: 'verified_at')
    DateTime? verifiedAt,

    /// Audit
    @JsonKey(name: 'resubmission_count')
    int? resubmissionCount,

    @JsonKey(name: 'last_submitted_at')
    DateTime? lastSubmittedAt,

    /// Documents
    List<AssetDocumentModel>? documents,

    /// Insurance
    @JsonKey(name: 'insurance_policy')
    InsurancePolicyModel? insurancePolicy,

    @JsonKey(name: 'has_active_insurance')
    bool? hasActiveInsurance,

    @JsonKey(name: 'is_externally_encumbered')
    @Default(false)
    bool isExternallyEncumbered,

    @JsonKey(name: 'external_lender_name') String? externalLenderName,

   @JsonKey(
      name: 'external_lien_amount',
      fromJson: _stringToDouble,
    )
    double? externalLienAmount,

    /// Timestamps
    @JsonKey(name: 'created_at')
    DateTime? createdAt,

    @JsonKey(name: 'updated_at')
    DateTime? updatedAt,
  }) = _AssetModel;

  factory AssetModel.fromJson(Map<String, dynamic> json) =>
      _$AssetModelFromJson(json);
}

//
// ===============================
// SAFE NUMBER CONVERTERS
// ===============================
//

double? _stringToDouble(dynamic value) {
  if (value == null) return null;

  if (value is double) return value;

  if (value is int) return value.toDouble();

  if (value is String) {
    final cleaned = value.replaceAll(',', '').trim();

    return double.tryParse(cleaned);
  }

  return null;
}

double _stringToDoubleRequired(dynamic value) {
  final result = _stringToDouble(value);

  if (result == null) {
    throw FormatException('Unable to parse double from value: $value');
  }

  return result;
}


//
// ===============================
// CATEGORY RESOLUTION EXTENSION
// ===============================
//

extension AssetModelX on AssetModel {
  /// Works for BOTH create + detail serializers
  AssetCategoryModel? get resolvedCategory => category ?? categoryDetails;

  String? get categoryName => resolvedCategory?.name;

  /// --------------------------------------------------
  /// DOCUMENT HELPERS
  /// --------------------------------------------------

  /// First PHOTO document
  AssetDocumentModel? get primaryPhoto {
    if (documents == null || documents!.isEmpty) return null;

    for (final doc in documents!) {
      if (doc.documentType == DocumentType.photo.value &&
          doc.fileUrl != null &&
          doc.fileUrl!.isNotEmpty) {
        return doc;
      }
    }

    return null;
  }

  /// Primary photo URL
  String? get primaryPhotoUrl => primaryPhoto?.fileUrl;

  /// All photo documents
  List<AssetDocumentModel> get photoDocuments {
    if (documents == null) return const [];

    return documents!
        .where((d) => d.documentType == DocumentType.photo.value)
        .toList();
  }

  /// Check if asset has photos
  bool get hasPhotos => photoDocuments.isNotEmpty;
}

//
// ===============================
// ASSET STATUS ENUM
// ===============================
//

enum AssetStatus {
  draft('DRAFT'),
  submitted('SUBMITTED'),
  underReview('UNDER_REVIEW'),
  rejected('REJECTED'),
  verified('VERIFIED'),
  expired('EXPIRED');

  final String value;

  const AssetStatus(this.value);

  static AssetStatus fromString(String value) {
    return AssetStatus.values.firstWhere(
      (e) => e.value == value,
      orElse: () => AssetStatus.draft,
    );
  }

  bool get isDraft => this == AssetStatus.draft;

  bool get isSubmitted => this == AssetStatus.submitted;

  bool get isUnderReview => this == AssetStatus.underReview;

  bool get isRejected => this == AssetStatus.rejected;

  bool get isVerified => this == AssetStatus.verified;

  bool get isExpired => this == AssetStatus.expired;

  bool get isEditable => isDraft || isRejected;

  bool get isPending => isSubmitted || isUnderReview;
}

//
// ===============================
// ASSET CONDITION ENUM
// ===============================
//

enum AssetCondition {
  excellent('EXCELLENT'),
  good('GOOD'),
  fair('FAIR'),
  poor('POOR'),
  damaged('DAMAGED');

  final String value;

  const AssetCondition(this.value);

  static AssetCondition fromString(String value) {
    return AssetCondition.values.firstWhere(
      (e) => e.value == value,
      orElse: () => AssetCondition.good,
    );
  }
}

