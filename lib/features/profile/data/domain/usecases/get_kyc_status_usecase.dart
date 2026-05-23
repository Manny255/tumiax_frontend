import 'package:dartz/dartz.dart';

import '../../../../auth/domain/models/failure.dart';
import '../../models/kyc_model.dart';
import '../../repositories/kyc_repository.dart';

class GetKYCStatusUsecase {
  final KYCRepository repository;

  GetKYCStatusUsecase(this.repository);

  Future<Either<Failure, KYCStatus>> call() {
    return repository.getKYCStatus();
  }
}

