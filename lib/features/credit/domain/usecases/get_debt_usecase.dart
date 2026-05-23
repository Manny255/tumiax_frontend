import 'package:dartz/dartz.dart';
import '../../../../core/network/models/cursor_paginated_response.dart';
import '../../../auth/domain/models/failure.dart';
import '../../data/models/credit_transaction_model.dart';
import '../../data/repositories/credit_repository.dart';

class GetDebtsUsecase {
  final CreditRepository repository;

  GetDebtsUsecase(this.repository);

  Future<Either<Failure, CursorPaginatedResponse<CreditTransactionModel>>>
  call({String? cursor}) {
    return repository.getDebts(cursor: cursor);
  }
}
