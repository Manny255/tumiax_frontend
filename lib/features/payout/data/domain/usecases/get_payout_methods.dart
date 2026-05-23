import '../../repositories/payout_repository.dart';
import '../entities/payout_method.dart';

class GetPayoutMethods {
  final PayoutRepository repository;

  GetPayoutMethods(this.repository);

  Future<List<PayoutMethod>> call() {
    return repository.getPayoutMethods();
  }
}