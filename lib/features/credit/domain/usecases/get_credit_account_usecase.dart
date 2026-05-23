import 'package:dartz/dartz.dart';
import '../../../auth/domain/models/failure.dart';
import '../../data/models/credit_account_model.dart';
import '../../data/repositories/credit_repository.dart';

class GetCreditAccountUsecase {
  final CreditRepository repository;

  GetCreditAccountUsecase(this.repository);

  Future<Either<Failure, CreditAccountModel>> call() {
    return repository.getCreditAccount();
  }
}

