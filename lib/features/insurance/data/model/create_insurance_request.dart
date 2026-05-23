// lib/features/insurance/data/models/create_insurance_request.dart
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../profile/data/models/kyc_model.dart';

part 'create_insurance_request.freezed.dart';
part 'create_insurance_request.g.dart';

@freezed
sealed class CreateInsuranceRequest with _$CreateInsuranceRequest {
  const factory CreateInsuranceRequest({
    @JsonKey(name: 'asset') required String assetId,
    required String provider,
    @JsonKey(name: 'policy_number') required String policyNumber,
    @DateOnlyConverter()
    @JsonKey(name: 'expiry_date')
    required DateTime expiryDate,
    @NullableDateOnlyConverter()
    @JsonKey(name: 'start_date')
    DateTime? startDate,

    required bool active,

    @JsonKey(name: 'coverage_amount') double? coverageAmount,
    @JsonKey(name: 'premium_amount') double? premiumAmount,
    @JsonKey(name: 'premium_frequency') String? premiumFrequency,

    String? notes,
  }) = _CreateInsuranceRequest;

  factory CreateInsuranceRequest.fromJson(Map<String, dynamic> json) =>
      _$CreateInsuranceRequestFromJson(json);
}
