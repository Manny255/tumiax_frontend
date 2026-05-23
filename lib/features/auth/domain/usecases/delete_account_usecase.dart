import 'package:dartz/dartz.dart';
import '../../data/repositories/auth_repository.dart';
import '../../domain/models/failure.dart';
import 'usecase.dart';

class DeleteAccountUsecase implements UseCase<void, NoParams> {
  final AuthRepository repository;

  DeleteAccountUsecase(this.repository);

  @override
  Future<Either<Failure, void>> call(NoParams params) {
    return repository.deleteAccount();
  }
}
