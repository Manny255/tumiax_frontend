import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'dart:io';

import '../../../../core/themes/app_theme.dart';
import '../../../auth/data/models/user_model.dart';

part 'kyc_model.freezed.dart';
part 'kyc_model.g.dart';

/// =============================
/// KYC PROFILE
/// =============================
@Freezed(fromJson: true, toJson: true)
sealed class KYCProfile with _$KYCProfile {
  const factory KYCProfile({
    required String id,
    required String status,
    required String level,

     @JsonKey(name: 'full_name') String? fullName,

    @JsonKey(name: 'date_of_birth') DateTime? dateOfBirth,

    String? nationality,

    @JsonKey(name: 'id_type') String? idType,

    @JsonKey(name: 'id_number') String? idNumber,

    @JsonKey(name: 'phone_number') String? phoneNumber,

    @JsonKey(name: 'id_country') String? idCountry,

    @JsonKey(name: 'id_expiry_date')
    @NullableDateOnlyConverter()
    DateTime? idExpiryDate,

    @JsonKey(name: 'address_line1') String? addressLine1,

    @JsonKey(name: 'address_line2') String? addressLine2,

    String? city,
    String? state,

    @JsonKey(name: 'postal_code') String? postalCode,

    String? country,

    @JsonKey(name: 'employment_status') String? employmentStatus,

    String? occupation,
    String? employer,

    @JsonKey(name: 'annual_income') String? annualIncome,

    @JsonKey(name: 'verified_at') DateTime? verifiedAt,

    @JsonKey(name: 'id_front_url') String? idFrontUrl,

    @JsonKey(name: 'id_back_url') String? idBackUrl,

    @JsonKey(name: 'selfie_url') String? selfieUrl,

    @JsonKey(name: 'proof_of_address_url') String? proofOfAddressUrl,

    @JsonKey(name: 'proof_of_address_type') String? proofOfAddressType,

    @JsonKey(name: 'created_at') DateTime? createdAt,

    @JsonKey(name: 'updated_at') DateTime? updatedAt,


    @JsonKey(name: 'expires_at') DateTime? expiresAt,

    @JsonKey(name: 'rejection_reason') String? rejectionReason,

    @JsonKey(name: 'risk_score') int? riskScore,

    @JsonKey(name: 'pep_check') bool? pepCheck,

    @JsonKey(name: 'sanction_check') bool? sanctionCheck,

    @JsonKey(name: 'adverse_media') bool? adverseMedia,

    @JsonKey(name: 'user') UserModel? user,

    @JsonKey(name: 'verified_by') String? verifiedBy,

  }) = _KYCProfile;

  factory KYCProfile.fromJson(Map<String, dynamic> json) =>
      _$KYCProfileFromJson(json);
}

/// =============================
/// KYC STATUS
/// =============================
@Freezed(fromJson: true, toJson: true)
sealed class KYCStatus with _$KYCStatus {
  const factory KYCStatus({
    required String status,
    required String level,

    @JsonKey(name: 'is_verified') required bool isVerified,

    @JsonKey(name: 'submitted_at') DateTime? submittedAt,

    @JsonKey(name: 'verified_at') DateTime? verifiedAt,

    @JsonKey(name: 'expires_at') DateTime? expiresAt,
  }) = _KYCStatus;

  factory KYCStatus.fromJson(Map<String, dynamic> json) =>
      _$KYCStatusFromJson(json);
}

class DateOnlyConverter implements JsonConverter<DateTime, String> {
  const DateOnlyConverter();

  @override
  DateTime fromJson(String json) {
    return DateTime.parse(json);
  }

  @override
  String toJson(DateTime date) {
    return "${date.year.toString().padLeft(4, '0')}-"
        "${date.month.toString().padLeft(2, '0')}-"
        "${date.day.toString().padLeft(2, '0')}";
  }
}
class NullableDateOnlyConverter implements JsonConverter<DateTime?, String?> {
  const NullableDateOnlyConverter();

  @override
  DateTime? fromJson(String? json) {
    if (json == null || json.isEmpty) return null;
    return DateTime.parse(json);
  }

  @override
  String? toJson(DateTime? date) {
    if (date == null) return null;

    return "${date.year.toString().padLeft(4, '0')}-"
        "${date.month.toString().padLeft(2, '0')}-"
        "${date.day.toString().padLeft(2, '0')}";
  }
}

/// =============================
/// KYC SUBMISSION 
/// =============================
@Freezed(fromJson: true, toJson: true)
sealed class KYCSubmission with _$KYCSubmission {
  const factory KYCSubmission({
    @JsonKey(name: 'full_name') required String fullName,

    @JsonKey(name: 'date_of_birth')
    @DateOnlyConverter()
    required DateTime dateOfBirth,

    required String nationality,

    @JsonKey(name: 'id_type') required String idType,

    @JsonKey(name: 'id_number') required String idNumber,

    @JsonKey(name: 'phone_number') required String phoneNumber,

    @JsonKey(name: 'id_country') required String idCountry,

    @JsonKey(name: 'id_expiry_date')
    @NullableDateOnlyConverter()
    DateTime? idExpiryDate,


    @JsonKey(name: 'address_line1') required String addressLine1,

    @JsonKey(name: 'address_line2') String? addressLine2,

    required String city,
    required String state,

    @JsonKey(name: 'postal_code') required String postalCode,

    required String country,

    @JsonKey(name: 'employment_status') String? employmentStatus,

    String? occupation,
    String? employer,

    @JsonKey(name: 'annual_income') String? annualIncome,
  }) = _KYCSubmission;

  factory KYCSubmission.fromJson(Map<String, dynamic> json) =>
      _$KYCSubmissionFromJson(json);
}

/// =============================
/// KYC SUBMISSION WITH FILES (FOR MULTIPART)
/// =============================
class KYCSubmissionWithFiles {
  final KYCSubmission data;
  final File? idFrontFile;
  final File? idBackFile;
  final File? selfieFile;
  final File? proofOfAddressFile;

  KYCSubmissionWithFiles({
    required this.data,
    this.idFrontFile,
    this.idBackFile,
    this.selfieFile,
    this.proofOfAddressFile,
  });
}

// Model for saving draft progress locally
class KYCDraft {
  final int currentStep;
  final Map<String, dynamic> personalInfo;
  final Map<String, dynamic> addressInfo;
  final Map<String, dynamic> employmentInfo;
  final Map<String, dynamic> idInfo;
  final List<String> documentPaths;
  final DateTime lastUpdated;

  KYCDraft({
    required this.currentStep,
    required this.personalInfo,
    required this.addressInfo,
    required this.employmentInfo,
    required this.idInfo,
    required this.documentPaths,
    required this.lastUpdated,
  });

  Map<String, dynamic> toJson() => {
    'currentStep': currentStep,
    'personalInfo': personalInfo,
    'addressInfo': addressInfo,
    'employmentInfo': employmentInfo,
    'idInfo': idInfo,
    'documentPaths': documentPaths,
    'lastUpdated': lastUpdated.toIso8601String(),
  };

  factory KYCDraft.fromJson(Map<String, dynamic> json) {
    return KYCDraft(
      currentStep: json['currentStep'] as int? ?? 0,
      personalInfo: Map<String, dynamic>.from(json['personalInfo'] ?? {}),
      addressInfo: Map<String, dynamic>.from(json['addressInfo'] ?? {}),
      employmentInfo: Map<String, dynamic>.from(json['employmentInfo'] ?? {}),
      idInfo: Map<String, dynamic>.from(json['idInfo'] ?? {}),
      documentPaths:
          (json['documentPaths'] as List?)?.map((e) => e.toString()).toList() ??
          [],
      lastUpdated: json['lastUpdated'] != null
          ? DateTime.parse(json['lastUpdated'])
          : DateTime.now(),
    );
  }
}


extension KYCProfileX on KYCProfile {
  bool get isNotStarted => status == 'NOT_STARTED';
  bool get isPending => status == 'PENDING';
  bool get isVerified => status == 'VERIFIED';
  bool get isRejected => status == 'REJECTED';
  bool get isExpired => status == 'EXPIRED';
  
  bool get canSubmit => isNotStarted || isRejected || isExpired;
  
  String get statusDisplay {
    switch (status) {
      case 'NOT_STARTED': return 'Not Started';
      case 'PENDING': return 'Pending Review';
      case 'VERIFIED': return 'Verified';
      case 'REJECTED': return 'Rejected';
      case 'EXPIRED': return 'Expired';
      default: return status;
    }
  }
  
  Color get statusColor {
    switch (status) {
      case 'VERIFIED': return Colors.green;
      case 'PENDING': return Colors.orange;
      case 'REJECTED': return Colors.red;
      case 'EXPIRED': return Colors.grey;
      default: return AppTheme.primaryColor;
    }
  }
  
  IconData get statusIcon {
    switch (status) {
      case 'VERIFIED': return Icons.verified;
      case 'PENDING': return Icons.hourglass_empty;
      case 'REJECTED': return Icons.cancel;
      case 'EXPIRED': return Icons.timer_off;
      default: return Icons.pending;
    }
  }
}