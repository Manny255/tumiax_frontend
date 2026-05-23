// lib/features/insurance/domain/usecases/cancel_policy.dart
import 'package:dartz/dartz.dart';
import '../../../auth/domain/models/failure.dart';
import '../../data/model/insurance_policy_model.dart';
import '../../data/repositories/insurance_repository.dart';

class CancelPolicyUseCase {
  final InsuranceRepository repository;

  CancelPolicyUseCase(this.repository);

  Future<Either<Failure, InsurancePolicyModel>> call(String id) {
    return repository.cancelPolicy(id);
  }
}
