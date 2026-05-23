import 'package:dartz/dartz.dart';
import '../../../auth/domain/models/failure.dart';
import '../../data/models/credit_transaction_model.dart';
import '../../data/repositories/credit_repository.dart';
import '../enums/spend_type.dart';
class SpendCreditUsecase {
  final CreditRepository repository;

 SpendCreditUsecase(this.repository);
Future<Either<Failure, CreditTransactionModel>> call({
  required String creditLineId,
  required double amount,
  required String description,
  required SpendType spendType,
  String? recipientEmail,
  String? payoutMethodId,
  String? merchant,
  String? merchantCategory,
  Map<String, dynamic>? metadata,
}) {
  return repository.spendCredit(
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
}
}