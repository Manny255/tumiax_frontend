
// lib/features/auth/domain/usecases/logout_usecase.dart
import 'package:dartz/dartz.dart';
import '../../data/repositories/auth_repository.dart';
import '../models/failure.dart';
import 'usecase.dart';

class LogoutUsecase {
  final AuthRepository repository;

  LogoutUsecase(this.repository);

  Future<Either<Failure, void>> call(NoParams params) {
    return repository.logout();
  }
}
