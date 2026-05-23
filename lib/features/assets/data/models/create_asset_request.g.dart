// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'create_asset_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_CreateAssetRequest _$CreateAssetRequestFromJson(Map<String, dynamic> json) =>
    _CreateAssetRequest(
      category: (json['category'] as num).toInt(),
      title: json['title'] as String,
      description: json['description'] as String?,
      purchasePrice: (json['purchase_price'] as num).toDouble(),
      purchaseDate: const DateOnlyConverter().fromJson(
        json['purchase_date'] as String,
      ),
      currentMarketValue: (json['current_market_value'] as num).toDouble(),
      condition: json['condition'] as String,
      conditionScore: (json['condition_score'] as num?)?.toInt(),
      serialNumber: json['serial_number'] as String?,
      registrationNumber: json['registration_number'] as String?,
      vin: json['vin'] as String?,
      locationAddress: json['location_address'] as String?,
      gpsAddress: json['gps_address'] as String?,
      latitude: (json['latitude'] as num).toDouble(),
      longitude: (json['longitude'] as num).toDouble(),
      isExternallyEncumbered:
          json['is_externally_encumbered'] as bool? ?? false,
      externalLenderName: json['external_lender_name'] as String?,
      externalLienAmount: (json['external_lien_amount'] as num?)?.toDouble(),
    );

Map<String, dynamic> _$CreateAssetRequestToJson(_CreateAssetRequest instance) =>
    <String, dynamic>{
      'category': instance.category,
      'title': instance.title,
      'description': instance.description,
      'purchase_price': instance.purchasePrice,
      'purchase_date': const DateOnlyConverter().toJson(instance.purchaseDate),
      'current_market_value': instance.currentMarketValue,
      'condition': instance.condition,
      'condition_score': instance.conditionScore,
      'serial_number': instance.serialNumber,
      'registration_number': instance.registrationNumber,
      'vin': instance.vin,
      'location_address': instance.locationAddress,
      'gps_address': instance.gpsAddress,
      'latitude': instance.latitude,
      'longitude': instance.longitude,
      'is_externally_encumbered': instance.isExternallyEncumbered,
      'external_lender_name': instance.externalLenderName,
      'external_lien_amount': instance.externalLienAmount,
    };
