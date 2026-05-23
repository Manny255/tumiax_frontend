import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../../core/session/session_controller.dart';
import '../../data/models/credit_transaction_model.dart';
import '../../providers/credit_providers.dart';

class CreditTransactionsController
    extends AsyncNotifier<List<CreditTransactionModel>> {
  String? _nextCursor;
  bool _isLoadingMore = false;

  @override
  Future<List<CreditTransactionModel>> build() async {
    ref.watch(sessionProvider); 
    return _fetchInitial();
  }

  Future<List<CreditTransactionModel>> _fetchInitial() async {
    final result = await ref.read(getCreditTransactionsUsecaseProvider)();

    return result.fold((failure) => throw failure.message, (
      response,
    ) {
      _nextCursor = response.nextCursor;
      return response.results;
    });
  }

  Future<void> loadMore() async {
    if (_isLoadingMore || _nextCursor == null) return;

    _isLoadingMore = true;

    final result = await ref.read(getCreditTransactionsUsecaseProvider)(
      cursor: _nextCursor,
    );

    result.fold((_) => _isLoadingMore = false, (response) {
      _nextCursor = response.nextCursor;

      state = AsyncData([...state.value ?? [], ...response.results]);

      _isLoadingMore = false;
    });
  }

  Future<void> refresh() async {
    _nextCursor = null;
    ref.invalidateSelf();
  }
}

final creditTransactionsControllerProvider =
    AsyncNotifierProvider<
      CreditTransactionsController,
      List<CreditTransactionModel>
    >(CreditTransactionsController.new);
