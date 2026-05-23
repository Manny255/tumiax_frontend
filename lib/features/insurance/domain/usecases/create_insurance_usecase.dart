// lib/features/insurance/domain/usecases/create_insurance_usecase.dart

import 'package:dartz/dartz.dart';
import '../../../auth/domain/models/failure.dart';
import '../../data/model/create_insurance_request.dart';
import '../../data/model/insurance_policy_model.dart';
import '../../data/repositories/insurance_repository.dart';

class CreateInsuranceUsecase {
  final InsuranceRepository repository;

  CreateInsuranceUsecase(this.repository);

  Future<Either<Failure, InsurancePolicyModel>> call(
    CreateInsuranceRequest request,
  ) {
    return repository.createInsuranceForAsset(request);
  }
}

