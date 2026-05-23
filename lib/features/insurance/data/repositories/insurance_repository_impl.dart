// lib/features/insurance/data/repositories/insurance_repository_impl.dart

import 'dart:io';

import 'package:dartz/dartz.dart';

import '../../../../core/utils/validators.dart';
import '../../../auth/domain/models/failure.dart';
import '../datasources/insurance_remote_datasource.dart';
import '../exceptions/insurance_exceptions.dart';
import '../model/create_insurance_request.dart';
import '../model/insurance_document_model.dart';
import '../model/insurance_policy_model.dart';
import 'insurance_repository.dart';

class InsuranceRepositoryImpl implements InsuranceRepository {
  final InsuranceRemoteDataSource remoteDataSource;

  InsuranceRepositoryImpl({required this.remoteDataSource});

  /// ============================================================
  /// GET ALL POLICIES
  /// ============================================================

  @override
  Future<Either<Failure, List<InsurancePolicyModel>>> getPolicies() async {
    try {
      final policies = await remoteDataSource.getPolicies();
      return Right(policies);
    } on InsuranceValidationException catch (e) {
      return Left(ValidationFailure(e.message, errors: e.errors));
    } catch (e) {
      return Left(Failure(e.toString()));
    }
  }

  /// ============================================================
  /// GET POLICY BY ID
  /// ============================================================

  @override
  Future<Either<Failure, InsurancePolicyModel>> getPolicy(String id) async {
    try {
      final policy = await remoteDataSource.getPolicy(id);
      return Right(policy);
    } on InsuranceValidationException catch (e) {
      return Left(ValidationFailure(e.message, errors: e.errors));
    } catch (e) {
      return Left(Failure(e.toString()));
    }
  }

  /// ============================================================
  /// GET POLICY FOR ASSET
  /// ============================================================

  @override
  Future<Either<Failure, InsurancePolicyModel>> getPolicyForAsset(
    String assetId,
  ) async {
    try {
      final policy = await remoteDataSource.getPolicyForAsset(assetId);
      return Right(policy);
    } on InsuranceValidationException catch (e) {
      return Left(ValidationFailure(e.message, errors: e.errors));
    } catch (e) {
      return Left(Failure(e.toString()));
    }
  }

  /// ============================================================
  /// CREATE INSURANCE FOR ASSET (CORRECT ARCHITECTURE)
  /// POST /insurance/
  /// ============================================================

  @override
  Future<Either<Failure, InsurancePolicyModel>> createInsuranceForAsset(
    CreateInsuranceRequest request,
  ) async {
    try {
      final policy = await remoteDataSource.createInsuranceForAsset(
        request,
      );
      return Right(policy);
    } on InsuranceValidationException catch (e) {
      return Left(ValidationFailure(e.message, errors: e.errors));
    } catch (e) {
      return Left(Failure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, InsuranceDocumentModel>> uploadPolicyDocument(
    int policyId,
    File file,
  ) async {
    try {
      final document = await remoteDataSource.uploadPolicyDocument(
        policyId,
        file,
      );
      return Right(document);
    } on InsuranceValidationException catch (e) {
      return Left(ValidationFailure(e.message, errors: e.errors));
    } catch (e) {
      return Left(Failure(e.toString()));
    }
  }

  /// ============================================================
  /// UPDATE POLICY
  /// ============================================================

  @override
  Future<Either<Failure, InsurancePolicyModel>> updatePolicy(
    String id,
    Map<String, dynamic> data,
  ) async {
    try {
      final policy = await remoteDataSource.updatePolicy(id, data);
      return Right(policy);
    } on InsuranceValidationException catch (e) {
      return Left(ValidationFailure(e.message, errors: e.errors));
    } catch (e) {
      return Left(Failure(e.toString()));
    }
  }

  /// ============================================================
  /// DELETE POLICY
  /// ============================================================

  @override
  Future<Either<Failure, void>> deletePolicy(String id) async {
    try {
      await remoteDataSource.deletePolicy(id);
      return const Right(null);
    } on InsuranceValidationException catch (e) {
      return Left(ValidationFailure(e.message, errors: e.errors));
    } catch (e) {
      return Left(Failure(e.toString()));
    }
  }

  /// ============================================================
  /// RENEW POLICY
  /// ============================================================

  @override
  Future<Either<Failure, InsurancePolicyModel>> renewPolicy(
    String id,
    DateTime newExpiryDate,
  ) async {
    try {
      final policy = await remoteDataSource.renewPolicy(id, newExpiryDate);
      return Right(policy);
    } on InsuranceValidationException catch (e) {
      return Left(ValidationFailure(e.message, errors: e.errors));
    } catch (e) {
      return Left(Failure(e.toString()));
    }
  }

  /// ============================================================
  /// CANCEL POLICY
  /// ============================================================

  @override
  Future<Either<Failure, InsurancePolicyModel>> cancelPolicy(String id) async {
    try {
      final policy = await remoteDataSource.cancelPolicy(id);
      return Right(policy);
    } on InsuranceValidationException catch (e) {
      return Left(ValidationFailure(e.message, errors: e.errors));
    } catch (e) {
      return Left(Failure(e.toString()));
    }
  }
}
