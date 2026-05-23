import 'package:hooks_riverpod/hooks_riverpod.dart';
import '../../data/models/credit_transaction_model.dart';
import '../../domain/enums/spend_type.dart';
import '../../providers/credit_providers.dart';
import 'credit_account_controller.dart';
import 'credit_transactions_controller.dart';

class CreditActionsController {
  final Ref ref;

  CreditActionsController(this.ref);

  // =====================================================
  // SPEND
  // =====================================================

  Future<CreditTransactionModel> spend({
    required String creditLineId,
    required double amount,
    required String description,
    required SpendType spendType,
    String? recipientEmail,
    String? payoutMethodId,
    String? merchant,
    String? merchantCategory,
    Map<String, dynamic>? metadata,
  }) async {
    final usecase = ref.read(spendCreditUsecaseProvider);

    final result = await usecase(
      creditLineId: creditLineId,
      amount: amount,
      description: description,
      spendType: spendType,
      recipientEmail: recipientEmail,
      payoutMethodId: payoutMethodId,
      merchant: merchant,
      merchantCategory: merchantCategory,
      metadata: metadata,
    );

  //  return result.fold((failure) => throw Exception(failure.message), (
  //     transaction,
  //   ) async {
  //     ref.invalidate(creditAccountControllerProvider);
  //     ref.invalidate(creditTransactionsControllerProvider);
  //     return transaction;
  //   });

  return result.fold(
      (failure) => throw failure.message,
      (transaction) async {
        ref.invalidate(creditAccountControllerProvider);
        ref.invalidate(creditTransactionsControllerProvider);
        return transaction;
      },
    );
  }

  // =====================================================
  // REPAY
  // =====================================================

  Future<CreditTransactionModel> repay({required double amount, String? description,
  }) async {
    final usecase = ref.read(repayCreditUsecaseProvider);

    final result = await usecase(amount: amount, description: description);

    return result.fold((failure) =>  throw failure.message, (
      transaction,
    ) async {
      ref.invalidate(creditAccountControllerProvider);
      ref.invalidate(creditTransactionsControllerProvider);

      return transaction;
    });
  }

  // =====================================================
  // REFRESH CREDIT LIMIT
  // =====================================================

  Future<void> refreshCreditLimit() async {
    final repository = ref.read(creditRepositoryProvider);

    final result = await repository.refreshCreditLimit();

    result.fold((failure) => throw failure.message, (_) {
      ref.invalidate(creditAccountControllerProvider);
    });
  }
}

final creditActionsControllerProvider = Provider<CreditActionsController>(
  (ref) => CreditActionsController(ref),
);
