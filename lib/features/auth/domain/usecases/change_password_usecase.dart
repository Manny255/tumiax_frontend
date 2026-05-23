import 'package:dartz/dartz.dart';
import '../../data/repositories/auth_repository.dart';
import '../models/failure.dart';

class ChangePasswordUsecase {
  final AuthRepository repository;

  ChangePasswordUsecase(this.repository);

  Future<Either<Failure, void>> call(ChangePasswordParams params) {
    return repository.changePassword(params.oldPassword, params.newPassword);
  }
}

class ChangePasswordParams {
  final String oldPassword;
  final String newPassword;

  ChangePasswordParams({required this.oldPassword, required this.newPassword});
}
