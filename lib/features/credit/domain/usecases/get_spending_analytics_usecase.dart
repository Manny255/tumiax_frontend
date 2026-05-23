import 'package:dartz/dartz.dart';
import '../../../auth/domain/models/failure.dart';
import '../../data/models/spending_analytics_model.dart';
import '../../data/repositories/credit_repository.dart';

class GetSpendingAnalyticsUsecase {
  final CreditRepository repository;

  GetSpendingAnalyticsUsecase(this.repository);

  Future<Either<Failure, SpendingAnalyticsModel>> call() {
    return repository.getSpendingAnalytics();
  }
}
