import 'package:dartz/dartz.dart';
import '../../../../core/network/models/cursor_paginated_response.dart';
import '../../../auth/domain/models/failure.dart';
import '../../data/models/credit_account_model.dart';
import '../../data/models/credit_line_model.dart';
import '../../data/models/credit_transaction_model.dart';
import '../../domain/enums/spend_type.dart';
import '../models/spending_analytics_model.dart';

abstract class CreditRepository {
  Future<Either<Failure, CreditAccountModel>> getCreditAccount();

  // Future<Either<Failure, List<CreditLineModel>>> getCreditLines();

  Future<Either<Failure, CursorPaginatedResponse<CreditTransactionModel>>>
  getDebts({String? cursor});

  Future<Either<Failure, CursorPaginatedResponse<CreditTransactionModel>>>getTransactions({String? cursor});

  Future<Either<Failure, CursorPaginatedResponse<CreditLineModel>>> getCreditLines({
    bool? hasDebt,
    String? status,
    String? cursor
  });
  Future<Either<Failure, CreditTransactionModel>> spendCredit({
    required String creditLineId,
    required double amount,
    required String description,
    required SpendType spendType,
    String? recipientEmail,
    String? payoutMethodId,
    String? merchant,
    String? merchantCategory,
    Map<String, dynamic>? metadata,
  });

  Future<Either<Failure, CreditTransactionModel>> repayCredit({
    required double amount,
    String? description,
  });

  Future<Either<Failure, Map<String, dynamic>>> refreshCreditLimit();
  /// Get spending analytics for charts
  Future<Either<Failure, SpendingAnalyticsModel>> getSpendingAnalytics();
}
