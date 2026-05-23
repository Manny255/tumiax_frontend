import 'package:dartz/dartz.dart';
import '../../../auth/domain/models/failure.dart';
import '../../data/models/kyc_model.dart';
import '../models/kyc_lookup_model.dart';

abstract class KYCRepository {
  Future<Either<Failure, KYCProfile>> getKYCProfile();

  Future<Either<Failure, KYCProfile>> submitKYC(KYCSubmission request);
  Future<Either<Failure, KYCProfile>> submitKYCWithFiles(
    KYCSubmissionWithFiles submission,
  );
  Future<Either<Failure, KYCStatus>> getKYCStatus();

  Future<Either<Failure, void>> uploadDocument(
    String filePath,
    String documentType,
  );

  Future<Either<Failure, void>> saveDraft(KYCDraft draft);

  Future<Either<Failure, KYCDraft?>> getDraft();

  Future<Either<Failure, void>> clearDraft();

  Future<Either<Failure, KYCLookupModel>> getKYCLookup(String email);
}
