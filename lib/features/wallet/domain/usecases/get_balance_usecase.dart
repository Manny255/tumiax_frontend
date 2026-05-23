import 'package:dartz/dartz.dart';
import '../../../auth/domain/models/failure.dart';
import '../../data/models/user_balance_model.dart';
import '../../data/repositories/wallet_repository.dart';

class GetBalanceUsecase {
  final WalletRepository repository;

  GetBalanceUsecase(this.repository);

  Future<Either<Failure, UserBalanceModel>> call() {
    return repository.getBalance();
  }
}
