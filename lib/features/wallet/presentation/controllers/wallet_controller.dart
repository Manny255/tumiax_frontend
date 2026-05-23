import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../../core/session/session_controller.dart';
import '../../data/models/transaction_model.dart';
import '../../domain/usecases/get_transactions_usecase.dart';
import '../../providers/wallet_providers.dart';

class WalletData {
  final List<TransactionModel> recentTransactions;
  final List<TransactionModel> allTransactions;
  final double totalSpent;
  final double totalReceived;
  final double balance;
  final String? nextCursor;

  WalletData({
    required this.recentTransactions,
    required this.allTransactions,
    required this.totalSpent,
    required this.totalReceived,
    required this.balance,
    required this.nextCursor,
  });
}

class WalletController extends AsyncNotifier<WalletData> {
  @override
  Future<WalletData> build() async {
    ref.watch(sessionProvider); 
    return _fetch();
  }

  Future<WalletData> _fetch({String? cursor}) async {
    final usecase = ref.read(getTransactionsUsecaseProvider);

    final result = await usecase(
      GetTransactionsParams(limit: 50, cursor: cursor),
    );

    return result.fold((failure) => throw Exception(failure.message), (
      response,
    ) {
      final transactions = response.results;

      final totalSpent = transactions
          .where((t) => t.transactionType == 'SPEND')
          .fold(0.0, (sum, t) => sum + t.amount);

      final totalReceived = transactions
          .where(
            (t) =>
                t.transactionType == 'REPAY' || t.transactionType == 'REFUND',
          )
          .fold(0.0, (sum, t) => sum + t.amount);

      return WalletData(
        recentTransactions: transactions.take(5).toList(),
        allTransactions: transactions,
        totalSpent: totalSpent,
        totalReceived: totalReceived,
        balance: totalReceived - totalSpent,
        nextCursor: response.nextCursor,
      );
    });
  }

  Future<void> refresh() async {
    state = const AsyncLoading();

    state = await AsyncValue.guard(() async {
      return _fetch();
    });
  }

  Future<void> loadMore() async {
    final current = state.value;

    if (current == null || current.nextCursor == null) return;

    final usecase = ref.read(getTransactionsUsecaseProvider);

    final result = await usecase(
      GetTransactionsParams(limit: 50, cursor: current.nextCursor),
    );

    result.fold((failure) => state = AsyncError(failure, StackTrace.current), (
      response,
    ) {
      final updated = [...current.allTransactions, ...response.results];

      final spent = updated
          .where((t) => t.transactionType == 'SPEND')
          .fold(0.0, (sum, t) => sum + t.amount);

      final received = updated
          .where(
            (t) =>
                t.transactionType == 'REPAY' || t.transactionType == 'REFUND',
          )
          .fold(0.0, (sum, t) => sum + t.amount);

      state = AsyncData(
        WalletData(
          recentTransactions: updated.take(5).toList(),
          allTransactions: updated,
          totalSpent: spent,
          totalReceived: received,
          balance: received - spent,
          nextCursor: response.nextCursor,
        ),
      );
    });
  }

  void invalidate() {
    ref.invalidateSelf();
  }
}

final walletControllerProvider =
    AsyncNotifierProvider<WalletController, WalletData>(WalletController.new);


// import 'package:hooks_riverpod/hooks_riverpod.dart';
// import '../../data/models/transaction_model.dart';
// import '../../domain/usecases/get_transactions_usecase.dart';
// import '../../providers/wallet_providers.dart';

// class WalletData {
//   final List<TransactionModel> recentTransactions;
//   final List<TransactionModel> allTransactions;
//   final double totalSpent;
//   final double totalReceived;
//   final double balance;
//   final String? nextCursor;

//   WalletData({
//     required this.recentTransactions,
//     required this.allTransactions,
//     required this.totalSpent,
//     required this.totalReceived,
//     required this.balance,
//     required this.nextCursor,
//   });
// }

// class WalletController extends AsyncNotifier<WalletData> {
//   late final GetTransactionsUsecase _getTransactionsUsecase;

//   @override
//   Future<WalletData> build() async {
//     _getTransactionsUsecase = ref.read(getTransactionsUsecaseProvider);
//     return _fetchTransactions();
//   }

//   Future<WalletData> _fetchTransactions({String? cursor}) async {
//     final result = await _getTransactionsUsecase(
//       GetTransactionsParams(limit: 50, cursor: cursor),
//     );

//     return result.fold((failure) => throw Exception(failure.message), (
//       response,
//     ) {
//       final transactions = response.results;

//       final recent = transactions.take(5).toList();

//       final totalSpent = transactions
//           .where((t) => t.transactionType == 'SPEND')
//           .fold(0.0, (sum, t) => sum + t.amount);

//       final totalReceived = transactions
//           .where(
//             (t) =>
//                 t.transactionType == 'REPAY' || t.transactionType == 'REFUND',
//           )
//           .fold(0.0, (sum, t) => sum + t.amount);

//       return WalletData(
//         recentTransactions: recent,
//         allTransactions: transactions,
//         totalSpent: totalSpent,
//         totalReceived: totalReceived,
//         balance: totalReceived - totalSpent,
//         nextCursor: response.nextCursor,
//       );
//     });
//   }

//   Future<void> refresh() async {
//     state = const AsyncLoading();
//     state = await AsyncValue.guard(() async => _fetchTransactions());
//   }

//   /// Ready for infinite scroll (future use)
//   Future<void> loadMore() async {
//     final current = state.value;
//     if (current == null || current.nextCursor == null) return;

//     final result = await _getTransactionsUsecase(
//       GetTransactionsParams(limit: 50, cursor: current.nextCursor),
//     );

//     result.fold((failure) => state = AsyncError(failure, StackTrace.current), (
//       response,
//     ) {
//       final updatedTransactions = [
//         ...current.allTransactions,
//         ...response.results,
//       ];

//       state = AsyncData(
//         WalletData(
//           recentTransactions: updatedTransactions.take(5).toList(),
//           allTransactions: updatedTransactions,
//           totalSpent: updatedTransactions
//               .where((t) => t.transactionType == 'SPEND')
//               .fold(0.0, (sum, t) => sum + t.amount),
//           totalReceived: updatedTransactions
//               .where(
//                 (t) =>
//                     t.transactionType == 'REPAY' ||
//                     t.transactionType == 'REFUND',
//               )
//               .fold(0.0, (sum, t) => sum + t.amount),
//           balance: current.balance,
//           nextCursor: response.nextCursor,
//         ),
//       );
//     });
//   }
// }

// final walletControllerProvider =
//     AsyncNotifierProvider<WalletController, WalletData>(WalletController.new);
