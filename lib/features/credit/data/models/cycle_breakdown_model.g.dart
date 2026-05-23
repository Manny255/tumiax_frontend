// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cycle_breakdown_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_CycleBreakdownModel _$CycleBreakdownModelFromJson(Map<String, dynamic> json) =>
    _CycleBreakdownModel(
      cycle: (json['cycle'] as num).toInt(),
      interestRate: json['interest_rate'] as String,
      penaltyRate: json['penalty_rate'] as String,
      interestAmount: json['interest_amount'] as String,
      penaltyAmount: json['penalty_amount'] as String,
      totalAdded: json['total_added'] as String,
      appliedDate: json['applied_date'] as String?,
      balanceBefore: json['balance_before'] as String?,
      isUpfront: json['is_upfront'] as bool,
    );

Map<String, dynamic> _$CycleBreakdownModelToJson(
  _CycleBreakdownModel instance,
) => <String, dynamic>{
  'cycle': instance.cycle,
  'interest_rate': instance.interestRate,
  'penalty_rate': instance.penaltyRate,
  'interest_amount': instance.interestAmount,
  'penalty_amount': instance.penaltyAmount,
  'total_added': instance.totalAdded,
  'applied_date': instance.appliedDate,
  'balance_before': instance.balanceBefore,
  'is_upfront': instance.isUpfront,
};
