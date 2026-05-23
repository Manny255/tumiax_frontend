import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_model.freezed.dart';
part 'user_model.g.dart';

enum KycStatus { none, pending, verified }

@freezed
sealed class UserModel with _$UserModel {
  const UserModel._();

  const factory UserModel({
    required String id,
    required String email,

    @JsonKey(name: 'account_tier') required String accountTier,

    @JsonKey(name: 'is_verified') required bool isVerified,

    @JsonKey(name: 'is_frozen') required bool isFrozen,

    @JsonKey(name: 'full_name') String? fullName,

    @JsonKey(name: 'first_name') String? firstName,

    @JsonKey(name: 'selfie_url') String? selfieUrl,

    @JsonKey(name: 'phone_number') String? phoneNumber,

    // -------------------------
    // LIMITS
    // -------------------------
    @JsonKey(
      name: 'daily_spend_limit',
      fromJson: _stringToDouble,
      toJson: _doubleToString,
    )
    double? dailySpendLimit,

    @JsonKey(
      name: 'monthly_spend_limit',
      fromJson: _stringToDouble,
      toJson: _doubleToString,
    )
    double? monthlySpendLimit,

    // -------------------------
    // META
    // -------------------------
    @JsonKey(name: 'created_at') required DateTime createdAt,

    @JsonKey(
      name: 'available_credit',
      fromJson: _stringToDouble,
      toJson: _doubleToString,
    )
    double? availableCredit,

    @JsonKey(name: 'mfa_enabled') @Default(false) bool mfaEnabled,
  }) = _UserModel;

  factory UserModel.fromJson(Map<String, dynamic> json) =>
      _$UserModelFromJson(json);

  // -------------------------------------------------
  // KYC STATUS HELPERS
  // -------------------------------------------------

 KycStatus get kycStatus {
    final first = firstName?.trim();
    final selfie = selfieUrl?.trim();

    final hasKyc =
        first != null &&
        first.isNotEmpty &&
        selfie != null &&
        selfie.isNotEmpty;

    if (!hasKyc) return KycStatus.none;
    if (hasKyc && !isVerified) return KycStatus.pending;
    return KycStatus.verified;
  }

  bool get canAddAsset => kycStatus == KycStatus.verified;
}

/// -------------------------------------------------
/// JSON SAFE DOUBLE CONVERSION
/// -------------------------------------------------

double? _stringToDouble(dynamic value) {
  if (value == null) return null;

  if (value is double) return value;
  if (value is int) return value.toDouble();

  return double.tryParse(value.toString());
}

String? _doubleToString(double? value) {
  return value?.toString();
}
