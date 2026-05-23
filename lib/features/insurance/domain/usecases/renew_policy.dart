import 'package:dartz/dartz.dart';
import '../../../auth/domain/models/failure.dart';
import '../../data/model/insurance_policy_model.dart';
import '../../data/repositories/insurance_repository.dart';

class RenewPolicyUseCase {
  final InsuranceRepository repository;

  RenewPolicyUseCase(this.repository);

  Future<Either<Failure, InsurancePolicyModel>> call(
    String id,
    DateTime newExpiryDate,
  ) {
    return repository.renewPolicy(id, newExpiryDate);
  }
}
