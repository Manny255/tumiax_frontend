import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../../core/network/models/cursor_paginated_response.dart';
import '../../../../core/session/session_controller.dart';
import '../../data/models/credit_transaction_model.dart';
import '../../providers/credit_providers.dart';

class CreditDebtsController
    extends AsyncNotifier<CursorPaginatedResponse<CreditTransactionModel>> {
  @override
  Future<CursorPaginatedResponse<CreditTransactionModel>> build() async {
    ref.watch(sessionProvider); 
    return _fetch();
  }

  Future<CursorPaginatedResponse<CreditTransactionModel>> _fetch({
    String? cursor,
  }) async {
    final result = await ref.read(getDebtsUsecaseProvider)(cursor: cursor);

    return result.fold(
      (failure) => throw failure.message,
      (data) => data,
    );
  }

  Future<void> refresh() async {
    ref.invalidateSelf();
  }
}

final creditDebtsControllerProvider =
    AsyncNotifierProvider<
      CreditDebtsController,
      CursorPaginatedResponse<CreditTransactionModel>
    >(CreditDebtsController.new);
    

// import 'package:hooks_riverpod/hooks_riverpod.dart';
// import '../../../../core/network/models/cursor_paginated_response.dart';
// import '../../data/models/credit_transaction_model.dart';
// import '../../domain/usecases/get_debt_usecase.dart';
// import '../../providers/credit_providers.dart';

// class CreditDebtsController
//     extends AsyncNotifier<CursorPaginatedResponse<CreditTransactionModel>> {
//   late final GetDebtsUsecase _getDebtsUsecase;

//   @override
//   Future<CursorPaginatedResponse<CreditTransactionModel>> build() async {
//     _getDebtsUsecase = ref.read(getDebtsUsecaseProvider);
//     return _fetch();
//   }

//   Future<CursorPaginatedResponse<CreditTransactionModel>> _fetch({
//     String? cursor,
//   }) async {
//     final result = await _getDebtsUsecase(cursor: cursor);

//     return result.fold(
//       (failure) => throw Exception(failure.message),
//       (data) => data,
//     );
//   }

//   Future<void> refresh() async {
//     state = const AsyncLoading();
//     state = await AsyncValue.guard(() => _fetch());
//   }
// }

// final creditDebtsControllerProvider =
//     AsyncNotifierProvider<
//       CreditDebtsController,
//       CursorPaginatedResponse<CreditTransactionModel>
//     >(CreditDebtsController.new);
