// lib/features/auth/domain/usecases/login_usecase.dart

import 'package:dartz/dartz.dart';
import '../../data/models/user_model.dart';
import '../../data/repositories/auth_repository.dart';
import '../models/failure.dart';
import 'params/login_params.dart';

class LoginUsecase {
  final AuthRepository repository;

  LoginUsecase(this.repository);

  Future<Either<Failure, UserModel>> call(LoginParams params) async {
    // First perform login to get tokens
    final loginResult = await repository.login(params.email, params.password);

    return loginResult.fold((failure) => Left(failure), (authResponse) async {
      // After successful login, fetch the current user
      final userResult = await repository.getCurrentUser();

      return userResult.fold((failure) => Left(failure), (user) => Right(user));
    });
  }
}
