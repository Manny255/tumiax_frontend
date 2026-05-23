import 'package:freezed_annotation/freezed_annotation.dart';

part 'spending_analytics_model.freezed.dart';
part 'spending_analytics_model.g.dart';

@freezed
sealed class SpendingAnalyticsModel with _$SpendingAnalyticsModel {
  const factory SpendingAnalyticsModel({
    @JsonKey(name: 'total_spent') required double totalSpent,

    @JsonKey(name: 'weekly_spending') required List<double> weeklySpending,

    @JsonKey(name: 'week_days') required List<String> weekDays,

    required Map<String, String> period,

    required Map<String, dynamic> analytics,
  }) = _SpendingAnalyticsModel;

  factory SpendingAnalyticsModel.fromJson(Map<String, dynamic> json) =>
      _$SpendingAnalyticsModelFromJson(json);
}

extension SpendingAnalyticsModelX on SpendingAnalyticsModel {
  double get totalWeeklySpending =>
      (analytics['total_weekly'] as num?)?.toDouble() ?? 0;

  double get averageDailySpending =>
      (analytics['average_daily'] as num?)?.toDouble() ?? 0;

  String? get highestSpendingDay => analytics['highest_day'];

  double get highestSpendingAmount =>
      (analytics['highest_amount'] as num?)?.toDouble() ?? 0;

  double get weekOverWeekChange =>
      (analytics['week_over_week_change'] as num?)?.toDouble() ?? 0;

  int get transactionCount =>
      (analytics['transaction_count'] as num?)?.toInt() ?? 0;

  bool get isSpendingIncreasing => weekOverWeekChange > 0;

  String get formattedWeekOverWeekChange {
    final change = weekOverWeekChange;

    if (change > 0) {
      return '+${change.toStringAsFixed(1)}%';
    } else if (change < 0) {
      return '${change.toStringAsFixed(1)}%';
    } else {
      return '0%';
    }
  }
}
