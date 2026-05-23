// lib/features/assets/data/models/asset_category.dart
import 'package:freezed_annotation/freezed_annotation.dart';

part 'asset_category.freezed.dart';
part 'asset_category.g.dart';

@freezed
sealed class AssetCategoryModel with _$AssetCategoryModel {
  const factory AssetCategoryModel({
    required int id,
    required String name,
    required String code,

    @JsonKey(name: 'base_ltv', fromJson: _doubleFromJson)
    required double baseLtv,

    @JsonKey(name: 'max_ltv', fromJson: _doubleFromJson)
    required double maxLtv,

    @JsonKey(
      name: 'annual_depreciation_rate',
      fromJson: _doubleFromJson,
    )
    required double annualDepreciationRate,

    @JsonKey(name: 'max_age_years')
    required int maxAgeYears,

    @JsonKey(name: 'requires_insurance')
    required bool requiresInsurance,

    @JsonKey(name: 'requires_valuation')
    required bool requiresValuation,

    @JsonKey(name: 'requires_inspection')
    required bool requiresInspection,

    String? description,
    String? icon,
  }) = _AssetCategoryModel;

  factory AssetCategoryModel.fromJson(Map<String, dynamic> json) =>
      _$AssetCategoryModelFromJson(json);
}

double _doubleFromJson(dynamic value) {
  if (value == null) return 0.0;
  if (value is double) return value;
  if (value is int) return value.toDouble();
  if (value is String) return double.tryParse(value) ?? 0.0;
  return 0.0;
}
