// lib/features/auth/providers/auth_providers.dart

import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../../core/network/dio_client.dart';
import '../../../../core/storage/secure_storage.dart';

import '../../../core/session/auth_session_provider.dart';
import '../../../core/session/auth_session_state.dart';
import '../../../core/session/session_controller.dart';
import '../data/datasources/auth_local_datasource.dart';
import '../data/datasources/auth_remote_datasource.dart';
import '../data/models/user_model.dart';
import '../data/repositories/auth_repository.dart';
import '../data/repositories/auth_repository_impl.dart';

import '../domain/usecases/change_password_usecase.dart';
import '../domain/usecases/delete_account_usecase.dart';
import '../domain/usecases/get_current_user_usecase.dart';
import '../domain/usecases/login_usecase.dart';
import '../domain/usecases/logout_usecase.dart';
import '../domain/usecases/register_usecase.dart';

import '../domain/usecases/resend_verification_code_usecase.dart';
import '../domain/usecases/verify_email_usecase.dart';
import '../presentation/controllers/auth_controller.dart';

/// =======================
/// DATA SOURCES
/// =======================

final authRemoteDataSourceProvider = Provider<AuthRemoteDataSource>((ref) {
  final dio = ref.read(dioProvider);
  return AuthRemoteDataSourceImpl(dio);
});

final authLocalDataSourceProvider = Provider<AuthLocalDataSource>((ref) {
  final secureStorage = ref.read(secureStorageProvider);
  return AuthLocalDataSourceImpl(secureStorage);
});

/// =======================
/// REPOSITORY
/// =======================

final authRepositoryProvider = Provider<AuthRepository>((ref) {
  return AuthRepositoryImpl(
    remoteDataSource: ref.read(authRemoteDataSourceProvider),
    localDataSource: ref.read(authLocalDataSourceProvider),
  );
});

/// =======================
/// USE CASES
/// =======================

final loginUsecaseProvider = Provider<LoginUsecase>((ref) {
  return LoginUsecase(ref.read(authRepositoryProvider));
});

final logoutUsecaseProvider = Provider<LogoutUsecase>((ref) {
  return LogoutUsecase(ref.read(authRepositoryProvider));
});

final deleteAccountUsecaseProvider = Provider<DeleteAccountUsecase>((ref) {
  return DeleteAccountUsecase(ref.read(authRepositoryProvider));
});

final changePasswordUsecaseProvider = Provider<ChangePasswordUsecase>((ref) {
  return ChangePasswordUsecase(ref.read(authRepositoryProvider));
});

final registerUsecaseProvider = Provider<RegisterUsecase>((ref) {
  return RegisterUsecase(ref.read(authRepositoryProvider));
});
final getCurrentUserUsecaseProvider = Provider<GetCurrentUserUsecase>((ref) {
  return GetCurrentUserUsecase(ref.read(authRepositoryProvider));
});

// Add with other use case providers
final verifyEmailUsecaseProvider = Provider<VerifyEmailUsecase>((ref) {
  return VerifyEmailUsecase(ref.read(authRepositoryProvider));
});

final resendVerificationCodeUsecaseProvider =
    Provider<ResendVerificationCodeUsecase>((ref) {
      return ResendVerificationCodeUsecase(ref.read(authRepositoryProvider));
    });

/// =======================
/// CONTROLLER 
/// =======================

final authControllerProvider = NotifierProvider<AuthController, AuthState>(
  AuthController.new,
);

/// =======================
/// HELPER PROVIDERS
/// =======================
// final userProvider = FutureProvider.autoDispose<UserModel>((ref) async {
//   final repo = ref.read(authRepositoryProvider);

//   final result = await repo.getCurrentUser();

//   return result.fold(
//     (failure) => throw Exception(failure.message),
//     (user) => user,
//   );
// });


final userProvider = Provider<UserModel?>((ref) {
  return ref.watch(authsessionProvider).user;
});


final isAuthenticatedProvider = Provider<bool>((ref) {
  final session = ref.watch(authsessionProvider);

  return session.status == AuthSessionStatus.authenticated;
});

final authTokenProvider = FutureProvider<String?>((ref) async {
  ref.watch(sessionProvider);

  final local = ref.read(authLocalDataSourceProvider);
  final tokens = await local.getTokens();
  return tokens?.accessToken;
});
