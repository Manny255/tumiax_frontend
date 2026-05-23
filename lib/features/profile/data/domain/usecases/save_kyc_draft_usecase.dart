import 'package:dartz/dartz.dart';

import '../../../../auth/domain/models/failure.dart';
import '../../models/kyc_model.dart';
import '../../repositories/kyc_repository.dart';

class SaveKYCDraftUsecase {
  final KYCRepository repository;

  SaveKYCDraftUsecase(this.repository);

  Future<Either<Failure, void>> call(KYCDraft draft) {
    return repository.saveDraft(draft);
  }
}
