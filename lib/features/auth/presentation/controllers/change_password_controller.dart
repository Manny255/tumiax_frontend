import 'dart:async';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../domain/usecases/change_password_usecase.dart';
import '../../providers/auth_providers.dart';

class ChangePasswordController extends AsyncNotifier<void> {
  @override
  FutureOr<void> build() {
    // initial state
  }

  Future<bool> changePassword({
    required String oldPassword,
    required String newPassword,
  }) async {
    state = const AsyncLoading();

    final result = await ref.read(changePasswordUsecaseProvider)(
      ChangePasswordParams(oldPassword: oldPassword, newPassword: newPassword),
    );

    return result.fold(
      (failure) {
        state = AsyncError(failure.message, StackTrace.current);
        return false;
      },
      (_) {
        state = const AsyncData(null);
        return true;
      },
    );
  }
}

final changePasswordControllerProvider =
    AsyncNotifierProvider<ChangePasswordController, void>(
      ChangePasswordController.new,
    );
