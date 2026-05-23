import 'package:dio/dio.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'dart:io';

import '../../../profile/data/models/kyc_model.dart';

part 'create_asset_request.freezed.dart';
part 'create_asset_request.g.dart';

@freezed
sealed class CreateAssetRequest with _$CreateAssetRequest {
  const factory CreateAssetRequest({
    required int category,
    required String title,
    String? description,

    @JsonKey(name: 'purchase_price') required double purchasePrice,

    @DateOnlyConverter()
    @JsonKey(name: 'purchase_date')
    required DateTime purchaseDate,

    @JsonKey(name: 'current_market_value') required double currentMarketValue,

    required String condition,

    @JsonKey(name: 'condition_score') int? conditionScore,

    @JsonKey(name: 'serial_number') String? serialNumber,

    @JsonKey(name: 'registration_number') String? registrationNumber,

    String? vin,

    @JsonKey(name: 'location_address') String? locationAddress,

    @JsonKey(name: 'gps_address') String? gpsAddress,

    required double latitude,
    required double longitude,

    // Files (excluded from JSON)
    @JsonKey(includeFromJson: false, includeToJson: false) List<File>? files,

    @JsonKey(name: 'is_externally_encumbered')
    @Default(false)
    bool isExternallyEncumbered,

    @JsonKey(name: 'external_lender_name') String? externalLenderName,

    @JsonKey(name: 'external_lien_amount') double? externalLienAmount,
  }) = _CreateAssetRequest;

  factory CreateAssetRequest.fromJson(Map<String, dynamic> json) =>
      _$CreateAssetRequestFromJson(json);
}

extension CreateAssetRequestX on CreateAssetRequest {
  Future<FormData> toFormData() async {
    final Map<String, dynamic> data = {
      'category': category.toString(),
      'title': title,
      if (description != null) 'description': description,
      'purchase_price': purchasePrice.toString(),
      'purchase_date': purchaseDate.toIso8601String().split('T').first,
      'current_market_value': currentMarketValue.toString(),
      'condition': condition,
      if (conditionScore != null) 'condition_score': conditionScore.toString(),
      if (serialNumber != null) 'serial_number': serialNumber,
      if (registrationNumber != null) 'registration_number': registrationNumber,
      if (vin != null) 'vin': vin,
      if (locationAddress != null) 'location_address': locationAddress,
      if (gpsAddress != null) 'gps_address': gpsAddress,
      'latitude': latitude.toStringAsFixed(6),
      'longitude': longitude.toStringAsFixed(6),

      'is_externally_encumbered': isExternallyEncumbered.toString(),
      if (externalLenderName != null) 'external_lender_name': externalLenderName,
      if (externalLienAmount != null) 'external_lien_amount': externalLienAmount.toString(),
    };

    final formData = FormData.fromMap(data);

    // Debug logging
    // print('📦 FormData fields:');
    // data.forEach((key, value) => print('  $key: $value'));

    // Attach files
    if (files != null && files!.isNotEmpty) {
      for (var file in files!) {
        formData.files.add(
          MapEntry(
            'files',
            await MultipartFile.fromFile(
              file.path,
              filename: file.path.split('/').last,
            ),
          ),
        );
      }
    }

    return formData;
  }
}

