// lib/features/insurance/domain/usecases/get_policy_for_asset_usecase.dart

import 'package:dartz/dartz.dart';
import '../../../auth/domain/models/failure.dart';
import '../../data/model/insurance_policy_model.dart';
import '../../data/repositories/insurance_repository.dart';

class GetPolicyForAssetUsecase {
  final InsuranceRepository repository;

  GetPolicyForAssetUsecase(this.repository);

  Future<Either<Failure, InsurancePolicyModel>> call(String assetId) {
    return repository.getPolicyForAsset(assetId);
  }
}
