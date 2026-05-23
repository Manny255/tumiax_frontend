import 'package:dartz/dartz.dart';
import '../../../../core/network/models/cursor_paginated_response.dart';
import '../../../auth/domain/models/failure.dart';
import '../../data/models/balance_transaction_model.dart';
import '../../data/repositories/wallet_repository.dart';

class GetBalanceTransactionsUsecase {
  final WalletRepository repository;

  GetBalanceTransactionsUsecase(this.repository);

  Future<Either<Failure, CursorPaginatedResponse<BalanceTransactionModel>>>
  call({int? limit, String? cursor}) {
    return repository.getBalanceTransactions(limit: limit, cursor: cursor);
  }
}
