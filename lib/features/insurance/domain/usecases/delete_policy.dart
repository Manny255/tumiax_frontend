// lib/features/insurance/domain/usecases/delete_policy.dart
import 'package:dartz/dartz.dart';
import '../../../auth/domain/models/failure.dart';
import '../../data/repositories/insurance_repository.dart';

class DeletePolicyUseCase {
  final InsuranceRepository repository;

  DeletePolicyUseCase(this.repository);

  Future<Either<Failure, void>> call(String id) {
    return repository.deletePolicy(id);
  }
}
