import 'package:dartz/dartz.dart';
import '../../../auth/domain/models/failure.dart';
import '../datasources/kyc_remote_datasource.dart';
import '../datasources/kyc_local_datasource.dart';
import '../models/kyc_lookup_model.dart';
import '../models/kyc_model.dart';
import 'kyc_repository.dart';

class KYCRepositoryImpl implements KYCRepository {
  final KYCRemoteDataSource remoteDataSource;
  final KYCLocalDataSource localDataSource;

  KYCRepositoryImpl({
    required this.remoteDataSource,
    required this.localDataSource,
  });

  @override
  Future<Either<Failure, KYCProfile>> getKYCProfile() async {
    try {
      final profile = await remoteDataSource.getKYCProfile();
      return Right(profile);
    } catch (e) {
      return Left(Failure(e.toString()));
    }
  }

@override
  Future<Either<Failure, KYCLookupModel>> getKYCLookup(String email) async {
    try {
      final lookup = await remoteDataSource.getKYCLookup(email);
      return Right(lookup);
    } catch (e) {
      return Left(Failure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, KYCProfile>> submitKYC(
    KYCSubmission request,
  ) async {
    try {
      final profile = await remoteDataSource.submitKYC(request);
      // Clear draft after successful submission
      await localDataSource.clearDraft();
      return Right(profile);
    } catch (e) {
      return Left(Failure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, KYCProfile>> submitKYCWithFiles(
    KYCSubmissionWithFiles submission,
  ) async {
    try {
      final profile = await remoteDataSource.submitKYCWithFiles(submission);
      // Clear draft after successful submission
      await localDataSource.clearDraft();
      return Right(profile);
    } catch (e) {
      return Left(Failure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, KYCStatus>> getKYCStatus() async {
    try {
      final statusJson = await remoteDataSource.getKYCStatus();

      final status = KYCStatus.fromJson(statusJson);

      return Right(status);
    } catch (e) {
      return Left(Failure(e.toString()));
    }
  }


  @override
  Future<Either<Failure, void>> uploadDocument(
    String filePath,
    String documentType,
  ) async {
    try {
      await remoteDataSource.uploadDocument(filePath, documentType);
      return const Right(null);
    } catch (e) {
      return Left(Failure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, void>> saveDraft(KYCDraft draft) async {
    try {
      await localDataSource.saveDraft(draft);
      return const Right(null);
    } catch (e) {
      return Left(Failure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, KYCDraft?>> getDraft() async {
    try {
      final draft = await localDataSource.getDraft();
      return Right(draft);
    } catch (e) {
      return Left(Failure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, void>> clearDraft() async {
    try {
      await localDataSource.clearDraft();
      return const Right(null);
    } catch (e) {
      return Left(Failure(e.toString()));
    }
  }
}
