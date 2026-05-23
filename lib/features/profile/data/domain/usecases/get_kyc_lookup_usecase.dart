import 'package:dartz/dartz.dart';

import '../../../../auth/domain/models/failure.dart';
import '../../models/kyc_lookup_model.dart';
import '../../repositories/kyc_repository.dart';

class GetKYCLookupUsecase {
  final KYCRepository repository;

  GetKYCLookupUsecase(this.repository);

  Future<Either<Failure, KYCLookupModel>> call(String email) {
    return repository.getKYCLookup(email);
  }
}
