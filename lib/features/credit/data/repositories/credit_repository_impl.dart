import 'package:dartz/dartz.dart';
import '../../../../core/network/models/cursor_paginated_response.dart';
import '../../../auth/domain/models/failure.dart';
import '../../domain/enums/spend_type.dart';
import '../datasources/credit_remote_datasource.dart';
import '../models/credit_account_model.dart';
import '../models/credit_line_model.dart';
import '../models/credit_transaction_model.dart';
import '../models/spending_analytics_model.dart';
import 'credit_repository.dart';

class CreditRepositoryImpl implements CreditRepository {
  final CreditRemoteDataSource remoteDataSource;

  CreditRepositoryImpl({required this.remoteDataSource});

  @override
  Future<Either<Failure, CreditAccountModel>> getCreditAccount() async {
    try {
      final result = await remoteDataSource.getCreditAccount();
      return Right(result);
    } catch (e) {
     return Left(Failure(e.toString().replaceFirst('Exception: ', '')));
    }
  }

  @override
  Future<Either<Failure, CursorPaginatedResponse<CreditTransactionModel>>>
  getDebts({String? cursor}) async {
    try {
      final result = await remoteDataSource.getDebts(cursor: cursor);
      return Right(result);
    } catch (e) {
      return Left(Failure(e.toString().replaceFirst('Exception: ', '')));
    }
  }

  @override
  Future<Either<Failure, CursorPaginatedResponse<CreditLineModel>>>
  getCreditLines({bool? hasDebt, String? status, String? cursor }) async {
    try {
      final result = await remoteDataSource.getCreditLines(hasDebt: hasDebt,
        status: status, cursor: cursor
      );
      return Right(result);
    } catch (e) {
      return Left(Failure(e.toString().replaceFirst('Exception: ', '')));
    }
  }

@override
 Future<Either<Failure, CursorPaginatedResponse<CreditTransactionModel>>>getTransactions({String? cursor}) async {
    try {
      final result = await remoteDataSource.getTransactions(cursor: cursor);
      return Right(result);
    } catch (e) {
      return Left(Failure(e.toString().replaceFirst('Exception: ', '')));
    }
  }

 @override
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
  }) async {
    try {
      final result = await remoteDataSource.spendCredit(
        creditLineId: creditLineId,
        amount: amount,
        description: description,
        spendType: spendType,
        recipientEmail: recipientEmail,
        payoutMethodId: payoutMethodId,
        merchant: merchant,
        merchantCategory: merchantCategory,
        metadata: metadata,
      );

      return Right(result);
    } catch (e) {
      return Left(Failure(e.toString().replaceFirst('Exception: ', '')));
    }
  }

  @override
  Future<Either<Failure, SpendingAnalyticsModel>> getSpendingAnalytics() async {
    try {
      final result = await remoteDataSource.getSpendingAnalytics();
      return Right(result);
    } catch (e) {
      return Left(Failure(e.toString().replaceFirst('Exception: ', '')));
    }
  }

  @override
  Future<Either<Failure, CreditTransactionModel>> repayCredit({
    required double amount,
    String? description,

  }) async {
    try {
      final result = await remoteDataSource.repayCredit(amount: amount,  description: description,
      );
      return Right(result);
    } catch (e) {
      return Left(Failure(e.toString().replaceFirst('Exception: ', '')));
    }
  }

  @override
  Future<Either<Failure, Map<String, dynamic>>> refreshCreditLimit() async {
    try {
      final result = await remoteDataSource.refreshCreditLimit();
      return Right(result);
    } catch (e) {
      return Left(Failure(e.toString().replaceFirst('Exception: ', '')));
    }
  }
}
