import 'package:dartz/dartz.dart';
import '../../../auth/domain/models/failure.dart';
import '../../../../core/network/models/cursor_paginated_response.dart';
import '../../data/models/transaction_model.dart';
import '../../data/repositories/wallet_repository.dart';

class GetTransactionsUsecase {
  final WalletRepository repository;

  GetTransactionsUsecase(this.repository);

  Future<Either<Failure, CursorPaginatedResponse<TransactionModel>>> call(
    GetTransactionsParams params,
  ) {
    return repository.getTransactions(
      limit: params.limit,
      cursor: params.cursor,
    );
  }
}

class GetTransactionsParams {
  final int? limit;
  final String? cursor;

  const GetTransactionsParams({this.limit, this.cursor});
}
