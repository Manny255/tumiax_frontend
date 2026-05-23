// lib/features/auth/domain/usecases/register_usecase.dart

import 'package:dartz/dartz.dart';
import '../../data/models/user_model.dart';
import '../../data/repositories/auth_repository.dart';
import '../models/failure.dart';

class RegisterUsecase {
  final AuthRepository repository;

  RegisterUsecase(this.repository);

  Future<Either<Failure, UserModel>> call(RegisterParams params) {
    return repository.register(params.toJson());
  }
}

class RegisterParams {
  final String email;
  final String password;
  final String confirmPassword;

  RegisterParams({
    required this.email,
    required this.password,
    required this.confirmPassword,
  });

  Map<String, dynamic> toJson() => {
    'email': email,
    'password': password,
    'password2': confirmPassword,
  };
}
