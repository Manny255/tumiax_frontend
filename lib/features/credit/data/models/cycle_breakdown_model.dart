import 'package:freezed_annotation/freezed_annotation.dart';

part 'cycle_breakdown_model.freezed.dart';
part 'cycle_breakdown_model.g.dart';

@freezed
sealed class CycleBreakdownModel with _$CycleBreakdownModel {
  const factory CycleBreakdownModel({
    required int cycle,
    @JsonKey(name: 'interest_rate') required String interestRate,
    @JsonKey(name: 'penalty_rate') required String penaltyRate,
    @JsonKey(name: 'interest_amount') required String interestAmount,
    @JsonKey(name: 'penalty_amount') required String penaltyAmount,
    @JsonKey(name: 'total_added') required String totalAdded,
    @JsonKey(name: 'applied_date') String? appliedDate,
    @JsonKey(name: 'balance_before') String? balanceBefore,
    @JsonKey(name: 'is_upfront') required bool isUpfront,
  }) = _CycleBreakdownModel;

  factory CycleBreakdownModel.fromJson(Map<String, dynamic> json) =>
      _$CycleBreakdownModelFromJson(json);
}

extension CycleBreakdownModelX on CycleBreakdownModel {
  double get interestAmountAsDouble => double.tryParse(interestAmount) ?? 0;
  double get penaltyAmountAsDouble => double.tryParse(penaltyAmount) ?? 0;
  double get totalAddedAsDouble => double.tryParse(totalAdded) ?? 0;
  double get balanceBeforeAsDouble =>
      double.tryParse(balanceBefore ?? '0') ?? 0;

  DateTime? get appliedDateTime =>
      appliedDate != null ? DateTime.tryParse(appliedDate!) : null;
}
