// lib/features/credit/domain/usecases/get_credit_transactions_usecase.dart

import 'package:dartz/dartz.dart';
import '../../../../core/network/models/cursor_paginated_response.dart';
import '../../../auth/domain/models/failure.dart';
import '../../data/models/credit_transaction_model.dart';
import '../../data/repositories/credit_repository.dart';

class GetCreditTransactionsUsecase {
  final CreditRepository repository;

  GetCreditTransactionsUsecase(this.repository);

  Future<Either<Failure, CursorPaginatedResponse<CreditTransactionModel>>>
  call({String? cursor}) {
    return repository.getTransactions(cursor: cursor);
  }
}
