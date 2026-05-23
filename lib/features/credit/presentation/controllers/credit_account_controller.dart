import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../../core/session/session_controller.dart';
import '../../data/models/credit_account_model.dart';
import '../../providers/credit_providers.dart';

class CreditAccountController extends AsyncNotifier<CreditAccountModel> {
  @override
  Future<CreditAccountModel> build() async {
    ref.watch(sessionProvider); 
    return _fetch();
  }

  Future<CreditAccountModel> _fetch() async {
    final result = await ref.read(getCreditAccountUsecaseProvider)();

    return result.fold(
      (failure) => throw failure.message,
      (account) => account,
    );
  }

  Future<void> refresh() async {
    ref.invalidateSelf();
  }
}

final creditAccountControllerProvider =
    AsyncNotifierProvider<CreditAccountController, CreditAccountModel>(
      CreditAccountController.new,
    );

