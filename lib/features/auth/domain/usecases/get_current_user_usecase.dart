import 'package:dartz/dartz.dart';
import '../../data/repositories/auth_repository.dart';
import '../../data/models/user_model.dart';
import '../models/failure.dart';

class GetCurrentUserUsecase {
  final AuthRepository repository;

  GetCurrentUserUsecase(this.repository);

  Future<Either<Failure, UserModel>> call() {
    return repository.getCurrentUser();
  }
}
