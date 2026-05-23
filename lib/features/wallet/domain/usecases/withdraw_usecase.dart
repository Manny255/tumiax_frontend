import 'package:dartz/dartz.dart';
import '../../../auth/domain/models/failure.dart';
import '../../data/models/balance_transaction_model.dart';
import '../../data/repositories/wallet_repository.dart';


class WithdrawUsecase {
  final WalletRepository repository;

  WithdrawUsecase(this.repository);

  Future<Either<Failure, BalanceTransactionModel>> call({
    required double amount,
    String? description,
    required String payoutMethodId,
    Map<String, dynamic>? metadata,
  }) {
    return repository.withdraw(
      amount: amount,
      description: description,
      payoutMethodId: payoutMethodId,
      metadata: metadata,
    );
  }
}
