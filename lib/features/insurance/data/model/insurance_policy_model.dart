// lib/features/insurance/data/models/insurance_policy_model.dart
import 'package:freezed_annotation/freezed_annotation.dart';

part 'insurance_policy_model.freezed.dart';
part 'insurance_policy_model.g.dart';

@freezed
sealed class InsurancePolicyModel with _$InsurancePolicyModel {
  const factory InsurancePolicyModel({
    required int id,

    /// UUID of asset
    required String asset,

    @JsonKey(name: 'asset_details') Map<String, dynamic>? assetDetails,

    required String provider,

    @JsonKey(name: 'policy_number') required String policyNumber,

    @JsonKey(name: 'expiry_date') required DateTime expiryDate,

    required bool active,

    @JsonKey(
      name: 'coverage_amount',
      fromJson: _stringToDouble,
      toJson: _doubleToString,
    )
    double? coverageAmount,

    @JsonKey(
      name: 'premium_amount',
      fromJson: _stringToDouble,
      toJson: _doubleToString,
    )
    double? premiumAmount,

    @JsonKey(name: 'premium_frequency') String? premiumFrequency,

    @JsonKey(name: 'start_date') DateTime? startDate,

    String? notes,

    @JsonKey(name: 'is_expired') bool? isExpired,

    @JsonKey(name: 'days_until_expiry') int? daysUntilExpiry,

    @JsonKey(name: 'created_at') required DateTime createdAt,

    @JsonKey(name: 'updated_at') DateTime? updatedAt,
  }) = _InsurancePolicyModel;

  factory InsurancePolicyModel.fromJson(Map<String, dynamic> json) =>
      _$InsurancePolicyModelFromJson(json);
}

double? _stringToDouble(dynamic value) {
  if (value == null) return null;
  if (value is double) return value;
  return double.tryParse(value.toString());
}

String? _doubleToString(double? value) {
  return value?.toString();
}

// Premium frequency enum
enum PremiumFrequency {
  monthly('MONTHLY'),
  quarterly('QUARTERLY'),
  annually('ANNUALLY');

  final String value;
  const PremiumFrequency(this.value);

  static PremiumFrequency fromString(String value) {
    return PremiumFrequency.values.firstWhere(
      (e) => e.value == value,
      orElse: () => PremiumFrequency.annually,
    );
  }

  String get displayName {
    switch (this) {
      case PremiumFrequency.monthly:
        return 'Monthly';
      case PremiumFrequency.quarterly:
        return 'Quarterly';
      case PremiumFrequency.annually:
        return 'Annually';
    }
  }
}
