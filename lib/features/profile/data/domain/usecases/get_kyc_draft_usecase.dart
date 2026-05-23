import 'package:dartz/dartz.dart';

import '../../../../auth/domain/models/failure.dart';
import '../../models/kyc_model.dart';
import '../../repositories/kyc_repository.dart';

class GetKYCDraftUsecase {
  final KYCRepository repository;

  GetKYCDraftUsecase(this.repository);

  Future<Either<Failure, KYCDraft?>> call() {
    return repository.getDraft();
  }
}
