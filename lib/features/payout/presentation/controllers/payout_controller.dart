import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../../core/session/session_controller.dart';
import '../../data/domain/entities/payout_method.dart';
import '../../providers/payout_providers.dart';

class PayoutController extends AsyncNotifier<List<PayoutMethod>> {
  @override
  Future<List<PayoutMethod>> build() async {
    ref.watch(sessionProvider); 
    return await ref.read(getPayoutMethodsProvider)();
  }

  Future<void> create(Map<String, dynamic> data) async {
    final previous = state.value ?? [];

    state = const AsyncLoading();

    try {
      final newMethod = await ref.read(createPayoutMethodProvider)(data);

      state = AsyncData([...previous, newMethod]);
    } catch (e, st) {
      state = AsyncError(e, st);
      state = AsyncData(previous);
    }
  }

  Future<void> delete(int id) async {
    final previous = state.value ?? [];

    state = const AsyncLoading();

    try {
      await ref.read(deletePayoutMethodProvider)(id);

      state = AsyncData(previous.where((m) => m.id != id).toList());
    } catch (e, st) {
      state = AsyncError(e, st);
      state = AsyncData(previous);
    }
  }

  Future<void> refresh() async {
    ref.invalidateSelf();
  }
}
