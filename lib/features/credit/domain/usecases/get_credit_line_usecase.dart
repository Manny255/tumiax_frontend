import 'package:dartz/dartz.dart';
import '../../../../core/network/models/cursor_paginated_response.dart';
import '../../../auth/domain/models/failure.dart';
import '../../data/models/credit_line_model.dart';
import '../../data/repositories/credit_repository.dart';

class GetCreditLineUsecase {
  final CreditRepository repository;

  GetCreditLineUsecase(this.repository);

  Future<Either<Failure, CursorPaginatedResponse<CreditLineModel>>> call({
    bool? hasDebt,
    String? status,
    String? cursor,
  }) {
    return repository.getCreditLines(
      hasDebt: hasDebt,
      status: status,
      cursor: cursor,
    );
  }
}
