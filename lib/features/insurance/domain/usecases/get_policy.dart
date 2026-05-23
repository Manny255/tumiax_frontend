import 'package:dartz/dartz.dart';
import '../../../auth/domain/models/failure.dart';
import '../../data/model/insurance_policy_model.dart';
import '../../data/repositories/insurance_repository.dart';

class GetPolicyUseCase {
  final InsuranceRepository repository;

  GetPolicyUseCase(this.repository);

  Future<Either<Failure, InsurancePolicyModel>> call(String id) {
    return repository.getPolicy(id);
  }
}
