import 'package:dartz/dartz.dart';
import '../../../auth/domain/models/failure.dart';
import '../../../../core/network/models/cursor_paginated_response.dart';
import '../models/balance_transaction_model.dart';
import '../models/transaction_model.dart';
import '../models/user_balance_model.dart';

abstract class WalletRepository {
  Future<Either<Failure, CursorPaginatedResponse<TransactionModel>>>
  getTransactions({int? limit, String? cursor});

  Future<Either<Failure, TransactionModel>> getTransaction(String id);

  Future<Either<Failure, Map<String, dynamic>>> getWalletSummary();


    // Balance
  Future<Either<Failure, UserBalanceModel>> getBalance();

  // Deposits
  Future<Either<Failure, BalanceTransactionModel>> deposit({
    required double amount,
    String? description,
    required String paymentMethod,
    String? transactionReference,
    Map<String, dynamic>? metadata,
  });

  // Withdrawals
  Future<Either<Failure, BalanceTransactionModel>> withdraw({
    required double amount,
    String? description,
    required String payoutMethodId,
    Map<String, dynamic>? metadata,
  });

  // Transactions
  Future<Either<Failure, CursorPaginatedResponse<BalanceTransactionModel>>>
  getBalanceTransactions({int? limit, String? cursor});
}
