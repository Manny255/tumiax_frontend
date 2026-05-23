// lib/features/auth/domain/repositories/auth_repository.dart

import 'package:dartz/dartz.dart';
import '../../domain/models/failure.dart';
import '../models/auth_response.dart';
import '../models/user_model.dart';

abstract class AuthRepository {
  Future<Either<Failure, AuthResponse>> login(String email, String password);

  Future<Either<Failure, UserModel>> register(Map<String, dynamic> userData);

  Future<Either<Failure, void>> logout();
  Future<Either<Failure, void>> deleteAccount(); 

  Future<Either<Failure, UserModel>> getCurrentUser();
  Future<Either<Failure, AuthResponse>> refreshToken();

  Future<bool> isAuthenticated();
    Future<Either<Failure, void>> changePassword(
    String oldPassword,
    String newPassword,
  );

Future<Either<Failure, AuthResponse>> verifyEmail(String email, String code);
Future<Either<Failure, void>> resendVerificationCode(String email);
}
