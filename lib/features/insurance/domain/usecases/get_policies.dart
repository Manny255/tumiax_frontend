import 'package:dartz/dartz.dart';
import '../../../auth/domain/models/failure.dart';
import '../../data/model/insurance_policy_model.dart';
import '../../data/repositories/insurance_repository.dart';

class GetPoliciesUseCase {
  final InsuranceRepository repository;

  GetPoliciesUseCase(this.repository);

  Future<Either<Failure, List<InsurancePolicyModel>>> call() {
    return repository.getPolicies();
  }
}
