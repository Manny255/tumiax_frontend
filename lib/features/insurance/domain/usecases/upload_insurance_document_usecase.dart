import 'dart:io';
import 'package:dartz/dartz.dart';
import '../../../auth/domain/models/failure.dart';
import '../../data/model/insurance_document_model.dart';
import '../../data/repositories/insurance_repository.dart';

class UploadInsuranceDocumentUseCase {
  final InsuranceRepository repository;

  UploadInsuranceDocumentUseCase(this.repository);

  Future<Either<Failure, InsuranceDocumentModel>> call(
    int policyId,
    File file,
  ) {
    return repository.uploadPolicyDocument(policyId, file);
  }
}
