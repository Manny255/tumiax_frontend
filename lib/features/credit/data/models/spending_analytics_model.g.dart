// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'spending_analytics_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_SpendingAnalyticsModel _$SpendingAnalyticsModelFromJson(
  Map<String, dynamic> json,
) => _SpendingAnalyticsModel(
  totalSpent: (json['total_spent'] as num).toDouble(),
  weeklySpending: (json['weekly_spending'] as List<dynamic>)
      .map((e) => (e as num).toDouble())
      .toList(),
  weekDays: (json['week_days'] as List<dynamic>)
      .map((e) => e as String)
      .toList(),
  period: Map<String, String>.from(json['period'] as Map),
  analytics: json['analytics'] as Map<String, dynamic>,
);

Map<String, dynamic> _$SpendingAnalyticsModelToJson(
  _SpendingAnalyticsModel instance,
) => <String, dynamic>{
  'total_spent': instance.totalSpent,
  'weekly_spending': instance.weeklySpending,
  'week_days': instance.weekDays,
  'period': instance.period,
  'analytics': instance.analytics,
};
