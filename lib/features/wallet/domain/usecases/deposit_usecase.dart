import 'package:dartz/dartz.dart';
import '../../../auth/domain/models/failure.dart';
import '../../data/models/balance_transaction_model.dart';
import '../../data/repositories/wallet_repository.dart';

class DepositUsecase {
  final WalletRepository repository;

  DepositUsecase(this.repository);

  Future<Either<Failure, BalanceTransactionModel>> call({
    required double amount,
    String? description,
    required String paymentMethod,
    String? transactionReference,
    Map<String, dynamic>? metadata,
  }) {
    return repository.deposit(
      amount: amount,
      description: description,
      paymentMethod: paymentMethod,
      transactionReference: transactionReference,
      metadata: metadata,
    );
  }
}
