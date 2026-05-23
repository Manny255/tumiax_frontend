import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../core/session/auth_session_provider.dart';

import '../../../../core/session/session_controller.dart';
import '../../data/models/user_model.dart';

import '../../domain/usecases/login_usecase.dart';
import '../../domain/usecases/logout_usecase.dart';
import '../../domain/usecases/register_usecase.dart';
import '../../domain/usecases/delete_account_usecase.dart';
import '../../domain/usecases/get_current_user_usecase.dart';
import '../../domain/usecases/resend_verification_code_usecase.dart';
import '../../domain/usecases/verify_email_usecase.dart';

import '../../domain/usecases/params/login_params.dart';
import '../../domain/usecases/usecase.dart';

import '../../providers/auth_providers.dart';

part 'auth_controller.freezed.dart';

@freezed
class AuthState with _$AuthState {
  const factory AuthState.initial() = AuthStateInitial;

  const factory AuthState.loading() = AuthStateLoading;

  const factory AuthState.registrationSuccess() = AuthStateRegistrationSuccess;

  const factory AuthState.authenticated(UserModel user) =
      AuthStateAuthenticated;

  const factory AuthState.unauthenticated() = AuthStateUnauthenticated;

  const factory AuthState.accountDeleted() = AuthStateAccountDeleted;

  const factory AuthState.error(String message) = AuthStateError;
}

class AuthController extends Notifier<AuthState> {
  late final LoginUsecase _loginUsecase;
  late final LogoutUsecase _logoutUsecase;
  late final RegisterUsecase _registerUsecase;
  late final GetCurrentUserUsecase _getCurrentUserUsecase;
  late final DeleteAccountUsecase _deleteAccountUsecase;
  late final VerifyEmailUsecase _verifyEmailUsecase;
  late final ResendVerificationCodeUsecase _resendCodeUsecase;

  @override
  AuthState build() {
    _loginUsecase = ref.read(loginUsecaseProvider);
    _logoutUsecase = ref.read(logoutUsecaseProvider);
    _registerUsecase = ref.read(registerUsecaseProvider);
    _getCurrentUserUsecase = ref.read(getCurrentUserUsecaseProvider);
    _deleteAccountUsecase = ref.read(deleteAccountUsecaseProvider);
    _verifyEmailUsecase = ref.read(verifyEmailUsecaseProvider);
    _resendCodeUsecase = ref.read(resendVerificationCodeUsecaseProvider);

    return const AuthState.initial();
  }

  /*
  ==========================
  LOGIN
  ==========================
  */

  Future<void> login(String email, String password) async {
    state = const AuthState.loading();

    final result = await _loginUsecase(
      LoginParams(email: email, password: password),
    );

    result.fold(
      (failure) {
        state = AuthState.error(failure.message);
      },
      (user) {
        /// Update session (router will move to home)
        // ref.read(authsessionProvider.notifier).setAuthenticated();
        ref.read(authsessionProvider.notifier).setAuthenticated(user);
        state = AuthState.authenticated(user);
      },
    );
  }

  /*
  ==========================
  REGISTER
  ==========================
  */

  Future<void> register(
    String email,
    String password,
    String confirmPassword,
  ) async {
    state = const AuthState.loading();

    final result = await _registerUsecase(
      RegisterParams(
        email: email,
        password: password,
        confirmPassword: confirmPassword,
      ),
    );

    result.fold(
      (failure) {
        state = AuthState.error(failure.message);
      },
      (_) {
        /// Tell session verification is required
        ref.read(authsessionProvider.notifier).requireEmailVerification(email);

        state = const AuthState.registrationSuccess();
      },
    );
  }

  /*
  ==========================
  VERIFY EMAIL
  ==========================
  */
  Future<void> verifyEmail(String email, String code) async {
    state = const AuthState.loading();

    try {
      final authResponse = await _verifyEmailUsecase(
        VerifyEmailParams(email: email, code: code),
      );

      UserModel user;

      if (authResponse.user != null) {
        user = authResponse.user!;
      } else {
        final result = await _getCurrentUserUsecase();

        user = result.fold(
          (failure) => throw Exception(failure.message),
          (user) => user,
        );
      }

      ref.read(authsessionProvider.notifier).setAuthenticated(user);

      state = AuthState.authenticated(user);
    } catch (e) {
      state = AuthState.error(e.toString().replaceFirst('Exception: ', ''));
    }
  }

  /*
  ==========================
  RESEND CODE
  ==========================
  */

  Future<void> resendVerificationCode(String email) async {
    state = const AuthState.loading();

    final result = await _resendCodeUsecase(ResendCodeParams(email: email));

    result.fold(
      (failure) {
        state = AuthState.error(failure.message);
      },
      (_) {
        state = const AuthState.registrationSuccess();
      },
    );
  }

  /*
  ==========================
  LOGOUT
  ==========================
  */

  Future<void> logout() async {
    state = const AuthState.loading();

    final result = await _logoutUsecase(NoParams());

    result.fold(
      (failure) {
        state = AuthState.error(failure.message);
      },
      (_) {
        /// Reset session
        ref.read(sessionProvider.notifier).resetSession();
        ref.read(authsessionProvider.notifier).logout();
        state = const AuthState.unauthenticated();
      },
    );
  }

  /*
  ==========================
  DELETE ACCOUNT
  ==========================
  */

  Future<void> deleteAccount() async {
    state = const AuthState.loading();

    final result = await _deleteAccountUsecase(NoParams());

    result.fold(
      (failure) {
        state = AuthState.error(failure.message);
      },
      (_) {
         ref.read(sessionProvider.notifier).resetSession();
         ref.read(authsessionProvider.notifier).logout();
        state = const AuthState.accountDeleted();
      },
    );
  }

  /*
  ==========================
   REFRESH USER
  ==========================
  */

  Future<void> refreshCurrentUser() async {
    final result = await _getCurrentUserUsecase();

    result.fold((failure) {}, (user) {
      state = AuthState.authenticated(user);
    });
  }
}
