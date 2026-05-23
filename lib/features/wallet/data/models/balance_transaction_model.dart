import 'package:freezed_annotation/freezed_annotation.dart';

part 'balance_transaction_model.freezed.dart';
part 'balance_transaction_model.g.dart';

@freezed
sealed class BalanceTransactionModel with _$BalanceTransactionModel {
  const factory BalanceTransactionModel({
    required String id,
    @JsonKey(name: 'transaction_type') required String transactionType,
    required String status,
    required double amount,
    @JsonKey(name: 'running_balance') required double runningBalance,
    String? description,
    @JsonKey(name: 'reference_id') required String referenceId,
    @JsonKey(name: 'created_at') required DateTime createdAt,
  }) = _BalanceTransactionModel;

  factory BalanceTransactionModel.fromJson(Map<String, dynamic> json) =>
      _$BalanceTransactionModelFromJson(json);
}

extension BalanceTransactionModelX on BalanceTransactionModel {
  bool get isDeposit => transactionType == 'DEPOSIT';
  bool get isWithdrawal => transactionType == 'WITHDRAWAL';
  bool get isRepayment => transactionType == 'REPAYMENT';
  bool get isRefund => transactionType == 'REFUND';
  bool get isAdjustment => transactionType == 'ADJUSTMENT';

  String get formattedType {
    switch (transactionType) {
      case 'DEPOSIT':
        return 'Deposit';
      case 'WITHDRAWAL':
        return 'Withdrawal';
      case 'REPAYMENT':
        return 'Repayment';
      case 'REFUND':
        return 'Refund';
      case 'ADJUSTMENT':
        return 'Adjustment';
      default:
        return transactionType;
    }
  }
}
