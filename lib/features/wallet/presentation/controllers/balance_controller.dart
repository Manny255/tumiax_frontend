import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../../core/session/session_controller.dart';
import '../../data/models/balance_transaction_model.dart';
import '../../data/models/user_balance_model.dart';
import '../../providers/balance_providers.dart';

class BalanceData {
  final UserBalanceModel balance;
  final List<BalanceTransactionModel> recentTransactions;
  final List<BalanceTransactionModel> allTransactions;
  final double totalDeposits;
  final double totalWithdrawals;
  final String? nextCursor;

  BalanceData({
    required this.balance,
    required this.recentTransactions,
    required this.allTransactions,
    required this.totalDeposits,
    required this.totalWithdrawals,
    required this.nextCursor,
  });
}

class BalanceController extends AsyncNotifier<BalanceData> {
  @override
  Future<BalanceData> build() async {
    ref.watch(sessionProvider); 
    return _fetch();
  }

  Future<BalanceData> _fetch({String? cursor}) async {
    final getBalance = ref.read(getBalanceUsecaseProvider);
    final getTransactions = ref.read(getBalanceTransactionsUsecaseProvider);

    final balanceResult = await getBalance();

    final balance = balanceResult.fold(
      (failure) => throw Exception(failure.message),
      (data) => data,
    );

    final transactionsResult = await getTransactions(limit: 50, cursor: cursor);

    final response = transactionsResult.fold(
      (failure) => throw Exception(failure.message),
      (data) => data,
    );

    final transactions = response.results;

    double deposits = 0;
    double withdrawals = 0;

    for (final tx in transactions) {
      if (tx.isDeposit || tx.isRefund) {
        deposits += tx.amount;
      } else if (tx.isWithdrawal || tx.isRepayment) {
        withdrawals += tx.amount;
      }
    }

    return BalanceData(
      balance: balance,
      recentTransactions: transactions.take(5).toList(),
      allTransactions: transactions,
      totalDeposits: deposits,
      totalWithdrawals: withdrawals,
      nextCursor: response.nextCursor,
    );
  }

  /// Refresh
  Future<void> refresh() async {
    state = const AsyncLoading();

    state = await AsyncValue.guard(() async {
      return _fetch();
    });
  }

  /// Deposit
  Future<BalanceTransactionModel> deposit({
    required double amount,
    String? description,
    required String paymentMethod,
    String? transactionReference,
    Map<String, dynamic>? metadata,
  }) async {
    final usecase = ref.read(depositUsecaseProvider);

    final result = await usecase(
      amount: amount,
      description: description,
      paymentMethod: paymentMethod,
      transactionReference: transactionReference,
      metadata: metadata,
    );

    return result.fold((failure) => throw Exception(failure.message), (
      transaction,
    ) {
      refresh();
      return transaction;
    });
  }

  /// Withdraw
  Future<BalanceTransactionModel> withdraw({
    required double amount,
    String? description,
    required String payoutMethodId,
    Map<String, dynamic>? metadata,
  }) async {
    final usecase = ref.read(withdrawUsecaseProvider);

    final result = await usecase(
      amount: amount,
      description: description,
      payoutMethodId: payoutMethodId,
      metadata: metadata,
    );

    return result.fold((failure) => throw Exception(failure.message), (
      transaction,
    ) {
      refresh();
      return transaction;
    });
  }

  /// Pagination
  Future<void> loadMore() async {
    final current = state.value;

    if (current == null || current.nextCursor == null) return;

    final getTransactions = ref.read(getBalanceTransactionsUsecaseProvider);

    final result = await getTransactions(limit: 50, cursor: current.nextCursor);

    result.fold((failure) => state = AsyncError(failure, StackTrace.current), (
      response,
    ) {
      final updated = [...current.allTransactions, ...response.results];

      double deposits = 0;
      double withdrawals = 0;

      for (final tx in updated) {
        if (tx.isDeposit || tx.isRefund) {
          deposits += tx.amount;
        } else if (tx.isWithdrawal || tx.isRepayment) {
          withdrawals += tx.amount;
        }
      }

      state = AsyncData(
        BalanceData(
          balance: current.balance,
          recentTransactions: updated.take(5).toList(),
          allTransactions: updated,
          totalDeposits: deposits,
          totalWithdrawals: withdrawals,
          nextCursor: response.nextCursor,
        ),
      );
    });
  }

  /// Force reload using Riverpod lifecycle
  void invalidate() {
    ref.invalidateSelf();
  }
}

final balanceControllerProvider =
    AsyncNotifierProvider<BalanceController, BalanceData>(
      BalanceController.new,
    );

// import 'package:hooks_riverpod/hooks_riverpod.dart';

// import '../../data/models/balance_transaction_model.dart';
// import '../../data/models/user_balance_model.dart';
// import '../../domain/usecases/deposit_usecase.dart';
// import '../../domain/usecases/get_balance_transactions_usecase.dart';
// import '../../domain/usecases/get_balance_usecase.dart';
// import '../../domain/usecases/withdraw_usecase.dart';
// import '../../providers/balance_providers.dart';

// class BalanceData {
//   final UserBalanceModel balance;
//   final List<BalanceTransactionModel> recentTransactions;
//   final List<BalanceTransactionModel> allTransactions;
//   final double totalDeposits;
//   final double totalWithdrawals;
//   final String? nextCursor;

//   BalanceData({
//     required this.balance,
//     required this.recentTransactions,
//     required this.allTransactions,
//     required this.totalDeposits,
//     required this.totalWithdrawals,
//     required this.nextCursor,
//   });
// }

// class BalanceController extends AsyncNotifier<BalanceData> {
//   late final GetBalanceUsecase _getBalanceUsecase;
//   late final GetBalanceTransactionsUsecase _getTransactionsUsecase;
//   late final DepositUsecase _depositUsecase;
//   late final WithdrawUsecase _withdrawUsecase;

//   @override
//   Future<BalanceData> build() async {
//     _getBalanceUsecase = ref.read(getBalanceUsecaseProvider);
//     _getTransactionsUsecase = ref.read(getBalanceTransactionsUsecaseProvider);
//     _depositUsecase = ref.read(depositUsecaseProvider);
//     _withdrawUsecase = ref.read(withdrawUsecaseProvider);

//     // Fetch balance
//     final balanceResult = await _getBalanceUsecase();
//     final balance = balanceResult.fold(
//       (failure) => throw Exception(failure.message),
//       (data) => data,
//     );

//     // Fetch transactions
//     final transactionsResult = await _getTransactionsUsecase(
//       limit: 50,
//       cursor: null,
//     );

//     final transactionsResponse = transactionsResult.fold(
//       (failure) => throw Exception(failure.message),
//       (data) => data,
//     );

//     final transactions = transactionsResponse.results;
//     final recent = transactions.take(5).toList();

//     double totalDeposits = 0;
//     double totalWithdrawals = 0;

//     for (var tx in transactions) {
//       if (tx.isDeposit || tx.isRefund) {
//         totalDeposits += tx.amount;
//       } else if (tx.isWithdrawal || tx.isRepayment) {
//         totalWithdrawals += tx.amount;
//       }
//     }

//     return BalanceData(
//       balance: balance,
//       recentTransactions: recent,
//       allTransactions: transactions,
//       totalDeposits: totalDeposits,
//       totalWithdrawals: totalWithdrawals,
//       nextCursor: transactionsResponse.nextCursor,
//     );
//   }

//   // ============================
//   // REFRESH
//   // ============================
//   Future<void> refresh() async {
//     state = const AsyncLoading();
//     state = await AsyncValue.guard(() => build());
//   }

//   // ============================
//   // DEPOSIT
//   // ============================
//   Future<BalanceTransactionModel> deposit({
//     required double amount,
//     String? description,
//     required String paymentMethod,
//     String? transactionReference,
//     Map<String, dynamic>? metadata,
//   }) async {
//     final result = await _depositUsecase(
//       amount: amount,
//       description: description,
//       paymentMethod: paymentMethod,
//       transactionReference: transactionReference,
//       metadata: metadata,
//     );

//     return result.fold((failure) => throw Exception(failure.message), (
//       transaction,
//     ) {
//       refresh();
//       return transaction;
//     });
//   }

//   // ============================
//   // WITHDRAW
//   // ============================
//   Future<BalanceTransactionModel> withdraw({
//     required double amount,
//     String? description,
//     required String payoutMethodId,
//     Map<String, dynamic>? metadata,
//   }) async {
//     final result = await _withdrawUsecase(
//       amount: amount,
//       description: description,
//       payoutMethodId: payoutMethodId,
//       metadata: metadata,
//     );

//     return result.fold((failure) => throw Exception(failure.message), (
//       transaction,
//     ) {
//       refresh();
//       return transaction;
//     });
//   }

//   // ============================
//   // LOAD MORE
//   // ============================
//   Future<void> loadMore() async {
//     final current = state.value;
//     if (current == null || current.nextCursor == null) return;

//     final result = await _getTransactionsUsecase(
//       limit: 50,
//       cursor: current.nextCursor,
//     );

//     result.fold((failure) => state = AsyncError(failure, StackTrace.current), (
//       response,
//     ) {
//       final updatedTransactions = [
//         ...current.allTransactions,
//         ...response.results,
//       ];

//       double totalDeposits = 0;
//       double totalWithdrawals = 0;

//       for (var tx in updatedTransactions) {
//         if (tx.isDeposit || tx.isRefund) {
//           totalDeposits += tx.amount;
//         } else if (tx.isWithdrawal || tx.isRepayment) {
//           totalWithdrawals += tx.amount;
//         }
//       }

//       state = AsyncData(
//         BalanceData(
//           balance: current.balance,
//           recentTransactions: updatedTransactions.take(5).toList(),
//           allTransactions: updatedTransactions,
//           totalDeposits: totalDeposits,
//           totalWithdrawals: totalWithdrawals,
//           nextCursor: response.nextCursor,
//         ),
//       );
//     });
//   }
// }


// /// ===============================
// /// Controller
// /// ===============================
// final balanceControllerProvider =
//     AsyncNotifierProvider<BalanceController, BalanceData>(
//       BalanceController.new,
//     );


