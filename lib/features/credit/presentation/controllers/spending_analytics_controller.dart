import 'package:hooks_riverpod/hooks_riverpod.dart';
import '../../../../core/session/session_controller.dart';
import '../../data/models/spending_analytics_model.dart';
import '../../providers/credit_providers.dart';

class SpendingAnalyticsController
    extends AsyncNotifier<SpendingAnalyticsModel> {
  @override
  Future<SpendingAnalyticsModel> build() async {
    ref.watch(sessionProvider); 
    return _fetch();
  }

  Future<SpendingAnalyticsModel> _fetch() async {
    final result = await ref.read(getSpendingAnalyticsUsecaseProvider)();

    return result.fold(
      (failure) => throw failure.message,
      (analytics) => analytics,
    );
  }

  Future<void> refresh() async {
    ref.invalidateSelf();
  }
}

final spendingAnalyticsControllerProvider =
    AsyncNotifierProvider<SpendingAnalyticsController, SpendingAnalyticsModel>(
      SpendingAnalyticsController.new,
    );
