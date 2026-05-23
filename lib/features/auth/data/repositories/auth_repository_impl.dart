// lib/features/auth/data/repositories/auth_repository_impl.dart

import 'package:dartz/dartz.dart';
import '../../domain/models/failure.dart';
import '../datasources/auth_remote_datasource.dart';
import '../datasources/auth_local_datasource.dart';
import '../models/auth_response.dart';
import '../models/login_request.dart';
import '../models/register_request.dart';
import '../models/user_model.dart';
import 'auth_repository.dart';

class AuthRepositoryImpl implements AuthRepository {
  final AuthRemoteDataSource remoteDataSource;
  final AuthLocalDataSource localDataSource;

  AuthRepositoryImpl({
    required this.remoteDataSource,
    required this.localDataSource,
  });

  @override
  Future<Either<Failure, AuthResponse>> login(
    String email,
    String password,
  ) async {
    try {
      final request = LoginRequest(email: email, password: password);

      final response = await remoteDataSource.login(request);

      await localDataSource.saveTokens(response);
      

      return Right(response);
    } catch (e) {
      return Left(Failure(e.toString().replaceFirst('Exception: ', '')));
    }
  }

@override
  Future<Either<Failure, UserModel>> register(
    Map<String, dynamic> userData,
  ) async {
    try {
      final request = RegisterRequest(
        email: userData['email'] as String,
        password: userData['password'] as String,
        confirmPassword: userData['password2'] as String,
      );

      final user = await remoteDataSource.register(request);

      return Right(user);
    } catch (e) {
      return Left(Failure(e.toString().replaceFirst('Exception: ', '')));
    }
  }


@override
  Future<Either<Failure, void>> logout() async {
    try {
      // Get tokens from local storage
      final tokens = await localDataSource.getTokens();

      if (tokens == null) {
        return Left(Failure("No refresh token found"));
      }

      // Call remote logout with refresh token
      await remoteDataSource.logout(tokens.refreshToken);

      // Clear local storage regardless of server response
      await localDataSource.clearAll();

      return const Right(null);
    } catch (e) {
      // Still clear local storage even if server request fails
      try {
        await localDataSource.clearAll();
      } catch (_) {}

      return Left(Failure(e.toString().replaceFirst('Exception: ', '')));
    }
  }

@override
  Future<Either<Failure, void>> deleteAccount() async {
    try {
      // Call remote delete account
      await remoteDataSource.deleteAccount();

      // Only clear local storage if deletion succeeded
      await localDataSource.clearAll();

      return const Right(null);
    } catch (e) {
      return Left(Failure(e.toString().replaceFirst('Exception: ', '')));
    }
  }

  @override
  Future<Either<Failure, UserModel>> getCurrentUser() async {
    try {
      final user = await remoteDataSource.getCurrentUser();

      await localDataSource.saveUser(user);

      return Right(user);
    } catch (e) {
      try {
        final localUser = await localDataSource.getUser();

        if (localUser != null) {
          return Right(localUser);
        }
      } catch (_) {}

      return Left(Failure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, AuthResponse>> refreshToken() async {
    try {
      final tokens = await localDataSource.getTokens();

      if (tokens == null) {
        return Left(Failure("No refresh token found"));
      }

      final response = await remoteDataSource.refreshToken(tokens.refreshToken);

      await localDataSource.saveTokens(response);

      return Right(response);
    } catch (e) {
      return Left(Failure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, void>> changePassword(
    String oldPassword,
    String newPassword,
  ) async {
    try {
      await remoteDataSource.changePassword(oldPassword, newPassword);
      return const Right(null);
    } catch (e) {
      return Left(Failure(e.toString()));
    }
  }

  @override
  Future<bool> isAuthenticated() async {
    final tokens = await localDataSource.getTokens();
    return tokens != null;
  }

 @override
  Future<Either<Failure, AuthResponse>> verifyEmail(
    String email,
    String code,
  ) async {
    try {
      // Get the auth response with tokens and user data
      final authResponse = await remoteDataSource.verifyEmail(email, code);

      // Save tokens to local storage
      await localDataSource.saveTokens(authResponse);

      // Save user data if present
      if (authResponse.user != null) {
        await localDataSource.saveUser(authResponse.user!);
      }

      // Return the auth response
      return Right(authResponse);
    } catch (e) {
      return Left(Failure(e.toString().replaceFirst('Exception: ', '')));
    }
  }
  
  @override
  Future<Either<Failure, void>> resendVerificationCode(String email) async {
    try {
      await remoteDataSource.resendVerificationCode(email);
      return const Right(null);
    } catch (e) {
      return Left(Failure(e.toString().replaceFirst('Exception: ', '')));
    }
  }
}
