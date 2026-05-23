// lib/features/insurance/domain/usecases/update_policy.dart
import 'package:dartz/dartz.dart';
import '../../../auth/domain/models/failure.dart';
import '../../data/model/insurance_policy_model.dart';
import '../../data/repositories/insurance_repository.dart';

class UpdatePolicyUseCase {
  final InsuranceRepository repository;

  UpdatePolicyUseCase(this.repository);

  Future<Either<Failure, InsurancePolicyModel>> call(
    String id,
    Map<String, dynamic> data,
  ) {
    return repository.updatePolicy(id, data);
  }
}
