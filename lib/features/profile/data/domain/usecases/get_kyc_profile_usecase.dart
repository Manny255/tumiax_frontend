import 'package:dartz/dartz.dart';

import '../../../../auth/domain/models/failure.dart';
import '../../models/kyc_model.dart';
import '../../repositories/kyc_repository.dart';

class GetKYCProfileUsecase {
  final KYCRepository repository;

  GetKYCProfileUsecase(this.repository);

  Future<Either<Failure, KYCProfile>> call() {
    return repository.getKYCProfile();
  }
}
