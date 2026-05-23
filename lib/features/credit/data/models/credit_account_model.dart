// lib/features/credit/data/models/credit_account_model.dart

import 'package:freezed_annotation/freezed_annotation.dart';
import 'credit_line_model.dart';

part 'credit_account_model.freezed.dart';
part 'credit_account_model.g.dart';

@freezed
sealed class CreditAccountModel with _$CreditAccountModel {
  const factory CreditAccountModel({
    required String id,

    @JsonKey(name: 'credit_limit') required String creditLimit,

    @JsonKey(name: 'used_amount') required String usedAmount,

    @JsonKey(name: 'available_credit')
    required double availableCredit, 

    @JsonKey(name: 'utilization_ratio') required int utilizationRatio,

    @JsonKey(name: 'interest_rate') required String interestRate,

    @JsonKey(name: 'is_active') required bool isActive,

    @JsonKey(name: 'is_delinquent') required bool isDelinquent,

    @JsonKey(name: 'current_statement_balance') String? currentStatementBalance,

    @JsonKey(name: 'minimum_payment_due') String? minimumPaymentDue,

    @JsonKey(name: 'payment_due_date') String? paymentDueDate,

    @JsonKey(name: 'total_spent_lifetime') String? totalSpentLifetime,

    @JsonKey(name: 'total_repaid_lifetime') String? totalRepaidLifetime,

    @JsonKey(name: 'credit_lines')
    @Default([])
    List<CreditLineModel> creditLines,

    @JsonKey(name: 'created_at') String? createdAt,

    @JsonKey(name: 'updated_at') String? updatedAt,
  }) = _CreditAccountModel;

  factory CreditAccountModel.fromJson(Map<String, dynamic> json) =>
      _$CreditAccountModelFromJson(json);
}

extension CreditAccountModelX on CreditAccountModel {
  double get creditLimitAsDouble => double.tryParse(creditLimit) ?? 0;
  double get usedAmountAsDouble => double.tryParse(usedAmount) ?? 0;
  double get interestRateAsDouble => double.tryParse(interestRate) ?? 0;
  double get totalSpentLifetimeAsDouble =>
      double.tryParse(totalSpentLifetime ?? '0') ?? 0;
  double get totalRepaidLifetimeAsDouble =>
      double.tryParse(totalRepaidLifetime ?? '0') ?? 0;
  double get currentStatementBalanceAsDouble =>
      double.tryParse(currentStatementBalance ?? '0') ?? 0;
  double get minimumPaymentDueAsDouble =>
      double.tryParse(minimumPaymentDue ?? '0') ?? 0;
}




// // lib/features/credit/data/models/credit_account_model.dart

// import 'package:freezed_annotation/freezed_annotation.dart';

// part 'credit_account_model.freezed.dart';
// part 'credit_account_model.g.dart';

// @freezed
// sealed class CreditAccountModel with _$CreditAccountModel {
//   const factory CreditAccountModel({
//     required String id,
//     @JsonKey(name: 'credit_limit')
//     required String creditLimit, 
//     @JsonKey(name: 'used_amount')
//     required String usedAmount, 
//     @JsonKey(name: 'available_credit')
//     required String availableCredit, 
//     @JsonKey(name: 'interest_rate')
//     required String interestRate, 
//     @JsonKey(name: 'is_active') required bool isActive,
//     @JsonKey(name: 'is_delinquent') required bool isDelinquent,
//     @JsonKey(name: 'utilization_ratio') required double utilizationRatio,
//     @JsonKey(name: 'total_spent_lifetime')
//     String? totalSpentLifetime, 
//     @JsonKey(name: 'total_repaid_lifetime')
//     String? totalRepaidLifetime, 
//     @JsonKey(name: 'created_at') String? createdAt, 
//     @JsonKey(name: 'updated_at') String? updatedAt, 
//     @JsonKey(name: 'current_statement_balance')
//     String? currentStatementBalance, // Added
//     @JsonKey(name: 'minimum_payment_due') String? minimumPaymentDue,
//     @JsonKey(name: 'payment_due_date') String? paymentDueDate, 
//   }) = _CreditAccountModel;

//   factory CreditAccountModel.fromJson(Map<String, dynamic> json) =>
//       _$CreditAccountModelFromJson(json);
// }

// // Extension for convenience methods
// extension CreditAccountModelX on CreditAccountModel {
//   double get creditLimitAsDouble => double.tryParse(creditLimit) ?? 0.0;
//   double get usedAmountAsDouble => double.tryParse(usedAmount) ?? 0.0;
//   double get availableCreditAsDouble => double.tryParse(availableCredit) ?? 0.0;
//   double get interestRateAsDouble => double.tryParse(interestRate) ?? 0.0;
//   double get totalSpentLifetimeAsDouble =>
//       double.tryParse(totalSpentLifetime ?? '0') ?? 0.0;
//   double get totalRepaidLifetimeAsDouble =>
//       double.tryParse(totalRepaidLifetime ?? '0') ?? 0.0;
//   double get currentStatementBalanceAsDouble =>
//       double.tryParse(currentStatementBalance ?? '0') ?? 0.0;
//   double get minimumPaymentDueAsDouble =>
//       double.tryParse(minimumPaymentDue ?? '0') ?? 0.0;
// }
