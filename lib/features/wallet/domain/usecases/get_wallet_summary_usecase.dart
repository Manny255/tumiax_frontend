import 'package:dartz/dartz.dart';

import '../../../auth/domain/models/failure.dart';
import '../../data/repositories/wallet_repository.dart';

class GetWalletSummaryUsecase {
  final WalletRepository repository;

  GetWalletSummaryUsecase(this.repository);

  Future<Either<Failure, Map<String, dynamic>>> call() {
    return repository.getWalletSummary();
  }
}
