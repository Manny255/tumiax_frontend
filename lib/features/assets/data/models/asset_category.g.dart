// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'asset_category.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_AssetCategoryModel _$AssetCategoryModelFromJson(Map<String, dynamic> json) =>
    _AssetCategoryModel(
      id: (json['id'] as num).toInt(),
      name: json['name'] as String,
      code: json['code'] as String,
      baseLtv: _doubleFromJson(json['base_ltv']),
      maxLtv: _doubleFromJson(json['max_ltv']),
      annualDepreciationRate: _doubleFromJson(json['annual_depreciation_rate']),
      maxAgeYears: (json['max_age_years'] as num).toInt(),
      requiresInsurance: json['requires_insurance'] as bool,
      requiresValuation: json['requires_valuation'] as bool,
      requiresInspection: json['requires_inspection'] as bool,
      description: json['description'] as String?,
      icon: json['icon'] as String?,
    );

Map<String, dynamic> _$AssetCategoryModelToJson(_AssetCategoryModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'code': instance.code,
      'base_ltv': instance.baseLtv,
      'max_ltv': instance.maxLtv,
      'annual_depreciation_rate': instance.annualDepreciationRate,
      'max_age_years': instance.maxAgeYears,
      'requires_insurance': instance.requiresInsurance,
      'requires_valuation': instance.requiresValuation,
      'requires_inspection': instance.requiresInspection,
      'description': instance.description,
      'icon': instance.icon,
    };
