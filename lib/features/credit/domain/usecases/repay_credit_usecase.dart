import 'package:dartz/dartz.dart';
import '../../../auth/domain/models/failure.dart';
import '../../data/models/credit_transaction_model.dart';
import '../../data/repositories/credit_repository.dart';

class RepayCreditUsecase {
  final CreditRepository repository;

  RepayCreditUsecase(this.repository);

  Future<Either<Failure, CreditTransactionModel>> call({
    required double amount,
    String? description,
  }) {
    return repository.repayCredit(amount: amount, description: description);
  }
}
