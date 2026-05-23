// lib/features/insurance/domain/repositories/insurance_repository.dart

import 'dart:io';

import 'package:dartz/dartz.dart';
import '../../../auth/domain/models/failure.dart';
import '../model/insurance_document_model.dart';
import '../model/insurance_policy_model.dart';
import '../model/create_insurance_request.dart';

abstract class InsuranceRepository {
  // Policy read
  Future<Either<Failure, List<InsurancePolicyModel>>> getPolicies();
  Future<Either<Failure, InsurancePolicyModel>> getPolicy(String id);
  Future<Either<Failure, InsurancePolicyModel>> getPolicyForAsset(
    String assetId,
  );

  // Asset-based creation 
  Future<Either<Failure, InsurancePolicyModel>> createInsuranceForAsset(
    CreateInsuranceRequest request,
  );

  Future<Either<Failure, InsuranceDocumentModel>> uploadPolicyDocument(
    int policyId,
    File file,
  );

  // Policy update/delete
  Future<Either<Failure, InsurancePolicyModel>> updatePolicy(
    String id,
    Map<String, dynamic> data,
  );
  Future<Either<Failure, void>> deletePolicy(String id);

  // Policy actions
  Future<Either<Failure, InsurancePolicyModel>> renewPolicy(
    String id,
    DateTime newExpiryDate,
  );
  Future<Either<Failure, InsurancePolicyModel>> cancelPolicy(String id);
}
