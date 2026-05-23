// lib/features/credit/data/models/credit_line_model.dart

import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../assets/data/models/asset_model.dart';

part 'credit_line_model.freezed.dart';
part 'credit_line_model.g.dart';

@freezed
sealed class CreditLineModel with _$CreditLineModel {
  const factory CreditLineModel({
    required String id,

    required AssetModel asset,

    required String amount,

    @JsonKey(name: 'remaining_balance')
    required String remainingBalance,

    @JsonKey(name: 'used_amount') required double usedAmount,

    @JsonKey(name: 'available_amount') required double availableAmount,

    @JsonKey(name: 'interest_rate')
    required String interestRate,

    @JsonKey(name: 'term_months')
    required int termMonths,

    @JsonKey(name: 'monthly_payment')
    required String monthlyPayment,

    @JsonKey(name: 'originated_at')
    required String originatedAt,

    @JsonKey(name: 'matured_at')
    String? maturedAt,

    required String status,
  }) = _CreditLineModel;

  factory CreditLineModel.fromJson(Map<String, dynamic> json) =>
      _$CreditLineModelFromJson(json);
}

extension CreditLineModelX on CreditLineModel {
  double get amountAsDouble => double.tryParse(amount) ?? 0;
  double get remainingBalanceAsDouble =>
      double.tryParse(remainingBalance) ?? 0;
  double get usedAmountAsDouble => usedAmount;
  double get availableAmountAsDouble => availableAmount;
}