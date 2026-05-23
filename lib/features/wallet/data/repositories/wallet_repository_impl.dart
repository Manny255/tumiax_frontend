import 'package:dartz/dartz.dart';
import '../../../auth/domain/models/failure.dart';
import '../../../../core/network/models/cursor_paginated_response.dart';
import '../datasources/wallet_remote_datasource.dart';
import '../models/balance_transaction_model.dart';
import '../models/transaction_model.dart';
import '../models/user_balance_model.dart';
import 'wallet_repository.dart';

class WalletRepositoryImpl implements WalletRepository {
  final WalletRemoteDataSource remoteDataSource;

  WalletRepositoryImpl({required this.remoteDataSource});

  @override
  Future<Either<Failure, CursorPaginatedResponse<TransactionModel>>>
  getTransactions({int? limit, String? cursor}) async {
    try {
      final response = await remoteDataSource.getTransactions(
        limit: limit,
        cursor: cursor,
      );

      return Right(response);
    } catch (e) {
      return Left(Failure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, TransactionModel>> getTransaction(String id) async {
    try {
      final transaction = await remoteDataSource.getTransaction(id);
      return Right(transaction);
    } catch (e) {
      return Left(Failure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, Map<String, dynamic>>> getWalletSummary() async {
    try {
      final summary = await remoteDataSource.getWalletSummary();
      return Right(summary);
    } catch (e) {
      return Left(Failure(e.toString()));
    }
  }

   @override
  Future<Either<Failure, UserBalanceModel>> getBalance() async {
    try {
      final balance = await remoteDataSource.getBalance();
      return Right(balance);
    } catch (e) {
      return Left(Failure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, BalanceTransactionModel>> deposit({
    required double amount,
    String? description,
    required String paymentMethod,
    String? transactionReference,
    Map<String, dynamic>? metadata,
  }) async {
    try {
      final transaction = await remoteDataSource.deposit(
        amount: amount,
        description: description,
        paymentMethod: paymentMethod,
        transactionReference: transactionReference,
        metadata: metadata,
      );
      return Right(transaction);
    } catch (e) {
      return Left(Failure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, BalanceTransactionModel>> withdraw({
    required double amount,
    String? description,
    required String payoutMethodId,
    Map<String, dynamic>? metadata,
  }) async {
    try {
      final transaction = await remoteDataSource.withdraw(
        amount: amount,
        description: description,
        payoutMethodId: payoutMethodId,
        metadata: metadata,
      );
      return Right(transaction);
    } catch (e) {
      return Left(Failure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, CursorPaginatedResponse<BalanceTransactionModel>>>
  getBalanceTransactions({int? limit, String? cursor}) async {
    try {
      final response = await remoteDataSource.getBalanceTransactions(
        limit: limit,
        cursor: cursor,
      );
      return Right(response);
    } catch (e) {
      return Left(Failure(e.toString()));
    }
  }
}
