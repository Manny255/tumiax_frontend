import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../features/auth/data/models/user_model.dart';
import '../../features/auth/domain/usecases/get_current_user_usecase.dart';
import '../../features/auth/providers/auth_providers.dart';
import '../../features/auth/providers/onboarding_provider.dart';
import '../storage/secure_storage.dart';
import 'auth_session_state.dart';

class AuthSessionController extends Notifier<AuthSessionState> {
  late final GetCurrentUserUsecase _getCurrentUser;

  @override
  AuthSessionState build() {
    _getCurrentUser = ref.read(getCurrentUserUsecaseProvider);

    _initialize();

    return const AuthSessionState(status: AuthSessionStatus.booting);
  }

  // Future<void> _initialize() async {
  //   final onboardingSeen = await ref.read(onboardingSeenProvider.future);

  //   if (!onboardingSeen) {
  //     state = const AuthSessionState(status: AuthSessionStatus.onboardingRequired);
  //     return;
  //   }

  //   final result = await _getCurrentUser();

  //   result.fold(
  //     (_) {
  //       state = const AuthSessionState(status: AuthSessionStatus.unauthenticated);
  //     },
  //     (_) {
  //       state = const AuthSessionState(status: AuthSessionStatus.authenticated);
  //     },
  //   );
  // }

  Future<void> _initialize() async {
    final onboardingSeen = await ref.read(onboardingSeenProvider.future);

    if (!onboardingSeen) {
      state = const AuthSessionState(
        status: AuthSessionStatus.onboardingRequired,
      );
      return;
    }

    final result = await _getCurrentUser();

    result.fold(
      (_) {
        state = const AuthSessionState(
          status: AuthSessionStatus.unauthenticated,
        );
      },
      (user) {
        state = AuthSessionState(
          status: AuthSessionStatus.authenticated,
          user: user,
        );
      },
    );
  }

  void requireEmailVerification(String email) {
    state = AuthSessionState(
      status: AuthSessionStatus.emailVerificationRequired,
      email: email,
    );
  }

  // void setAuthenticated() {
  //   state = const AuthSessionState(status: AuthSessionStatus.authenticated);
  // }

  void setAuthenticated(UserModel user) {
    state = AuthSessionState(
      status: AuthSessionStatus.authenticated,
      user: user,
    );
  }

  void logout() {
    state = const AuthSessionState(status: AuthSessionStatus.unauthenticated);
  }


  Future<void> completeOnboarding() async {
    final storage = ref.read(secureStorageProvider);

    await storage.write(StorageKeys.onboardingShown, 'true');

    state = const AuthSessionState(status: AuthSessionStatus.unauthenticated);
  }

}
