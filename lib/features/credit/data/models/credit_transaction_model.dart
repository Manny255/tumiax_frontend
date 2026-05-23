// lib/features/credit/data/models/credit_transaction_model.dart

import 'package:freezed_annotation/freezed_annotation.dart';
import '../../../assets/data/models/asset_model.dart';
import 'cycle_breakdown_model.dart';

part 'credit_transaction_model.freezed.dart';
part 'credit_transaction_model.g.dart';

@freezed
sealed class CreditTransactionModel with _$CreditTransactionModel {
  const factory CreditTransactionModel({
    required String id,

    @JsonKey(name: 'credit_line_id') String? creditLineId,

    AssetModel? asset,

    @JsonKey(name: 'transaction_type') required String transactionType,

    required String amount,

    @JsonKey(name: 'remaining_amount') required String remainingAmount,

    @JsonKey(name: 'running_balance') required String runningBalance,

    @JsonKey(name: 'due_date') String? dueDate,

    @JsonKey(name: 'is_overdue') required bool isOverdue,
    @JsonKey(name: 'days_overdue') int? daysOverdue,

    String? description,

    @JsonKey(name: 'reference_id') String? referenceId,

    @JsonKey(name: 'created_at') required String createdAt,

    @JsonKey(name: 'interest_accrued') String? interestAccrued,

    @JsonKey(name: 'total_due') String? totalDue,

    // @JsonKey(name: 'principal_amount') String? principalAmount,

     @JsonKey(name: 'original_interest_5_percent')
    String? originalInterest5Percent,
    @JsonKey(name: 'late_penalties') String? latePenalties,

    @JsonKey(name: 'interest_rate_type') String? interestRateType,

    @JsonKey(name: 'last_interest_calculation') String? lastInterestCalculation,
    @JsonKey(name: 'late_penalties_accrued') String? latePenaltiesAccrued,
    @JsonKey(name: 'regular_interest_accrued') String? regularInterestAccrued, 


    @JsonKey(name: 'fee_amount') String? feeAmount,

    @JsonKey(name: 'remaining_fee') String? remainingFee,

    @JsonKey(name: 'is_linked_fee') bool? isLinkedFee,

    @JsonKey(name: 'parent_spend_id') String? parentSpendId,

    @JsonKey(name: 'fee_type') String? feeType,

    // Cycle tracking fields
    @JsonKey(name: 'cycle_number') int? cycleNumber,
    @JsonKey(name: 'cycles_processed') int? cyclesProcessed,
    @JsonKey(name: 'next_cycle_date') String? nextCycleDate,
    @JsonKey(name: 'cycle_breakdown') List<CycleBreakdownModel>? cycleBreakdown,
  }) = _CreditTransactionModel;

  factory CreditTransactionModel.fromJson(Map<String, dynamic> json) =>
      _$CreditTransactionModelFromJson(json);
}

extension CreditTransactionModelX on CreditTransactionModel {
  double get amountAsDouble => double.tryParse(amount) ?? 0;
  double get remainingAmountAsDouble => double.tryParse(remainingAmount) ?? 0;
  double get runningBalanceAsDouble => double.tryParse(runningBalance) ?? 0;
  
  double get interestAccruedAsDouble => double.tryParse(interestAccrued ?? '0') ?? 0;
  double get latePenaltiesAccruedAsDouble => double.tryParse(latePenaltiesAccrued ?? '0') ?? 0;
  double get regularInterestAccruedAsDouble => double.tryParse(regularInterestAccrued ?? '0') ?? 0;
  double get totalDueAsDouble => double.tryParse(totalDue ?? remainingAmount) ?? remainingAmountAsDouble;
  double get originalInterest5PercentAsDouble => double.tryParse(originalInterest5Percent ?? '0') ?? 0;
  
  bool get isDebt => transactionType == "SPEND" && remainingAmountAsDouble > 0;
  bool get isCleared => transactionType == "SPEND" && remainingAmountAsDouble == 0;
  bool get hasLatePenalties => latePenaltiesAccruedAsDouble > 0;
  bool get isLate => interestRateType == "LATE";

  double get feeAmountAsDouble => double.tryParse(feeAmount ?? '0') ?? 0;
  double get remainingFeeAsDouble => double.tryParse(remainingFee ?? '0') ?? 0;
  bool get hasFee => feeAmountAsDouble > 0;
  bool get hasRemainingFee => remainingFeeAsDouble > 0;
  
  String get interestRateDisplay {
    if (interestRateType == "LATE") return "5% + 18% Late";
    return "5%";
  }

  bool get isInFirstCycle => (cycleNumber ?? 1) == 1;
  bool get hasMultipleCycles => (cyclesProcessed ?? 0) > 0;
  int get totalCyclesCount => (cyclesProcessed ?? 0) + 1;

  // Cycle-aware total display
  String get cycleDisplayText {
    final cycle = cycleNumber ?? 1;
    if (cycle == 1) {
      return "First 30-Day Cycle";
    } else {
      return "Cycle $cycle (Overdue)";
    }
  }

    // Total including fee for calculations
  double get totalDebtWithFee => remainingAmountAsDouble + interestAccruedAsDouble + remainingFeeAsDouble;
}