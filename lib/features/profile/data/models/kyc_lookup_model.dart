import 'package:freezed_annotation/freezed_annotation.dart';

part 'kyc_lookup_model.freezed.dart';
part 'kyc_lookup_model.g.dart';

/// ======================================
/// KYC LOOKUP MODEL (TRANSFER CONFIRMATION)
/// ======================================
///
/// Used when sending money to confirm recipient identity.
///
/// Endpoint:
/// GET /api/v1/compliance/kyc/lookup/?email=
///
/// This model intentionally contains ONLY safe fields.
///
@freezed
sealed class KYCLookupModel with _$KYCLookupModel {
  const factory KYCLookupModel({
    /// Recipient email
    required String email,

    /// Verified full name
    @JsonKey(name: 'full_name') String? fullName,

    /// Selfie image URL
    @JsonKey(name: 'selfie_url') String? selfieUrl,

    /// NOT_STARTED, PENDING, VERIFIED, REJECTED, EXPIRED
    required String status,

    /// BASIC, STANDARD, ADVANCED, FULL
    required String level,

    /// Risk score (0–100)
    @JsonKey(name: 'risk_score') required int riskScore,

    /// Politically exposed person flag
    @JsonKey(name: 'pep_check') required bool pepCheck,

    /// Sanctions flag
    @JsonKey(name: 'sanction_check') required bool sanctionCheck,

    /// Adverse media flag
    @JsonKey(name: 'adverse_media') required bool adverseMedia,

    /// Expiry date
    @JsonKey(name: 'expires_at') DateTime? expiresAt,

    /// Whether allowed to receive transfers
    @JsonKey(name: 'can_receive') required bool canReceive,
  }) = _KYCLookupModel;

  factory KYCLookupModel.fromJson(Map<String, dynamic> json) =>
      _$KYCLookupModelFromJson(json);
}
