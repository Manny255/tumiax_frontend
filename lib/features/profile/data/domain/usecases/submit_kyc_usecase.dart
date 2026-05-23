import 'package:dartz/dartz.dart';

import '../../../../auth/domain/models/failure.dart';
import '../../models/kyc_model.dart';
import '../../repositories/kyc_repository.dart';

class SubmitKYCUsecase {
  final KYCRepository repository;

  SubmitKYCUsecase(this.repository);

  Future<Either<Failure, KYCProfile>> call(KYCSubmission request) {
    return repository.submitKYC(request);
  }
}

class SubmitKYCWithFilesUsecase {
  final KYCRepository repository;

  SubmitKYCWithFilesUsecase(this.repository);

  Future<Either<Failure, KYCProfile>> call(KYCSubmissionWithFiles submission) {
    return repository.submitKYCWithFiles(submission);
  }
}
