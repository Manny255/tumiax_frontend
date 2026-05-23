import '../../repositories/payout_repository.dart';
import '../entities/payout_method.dart';

class CreatePayoutMethod {
  final PayoutRepository repository;

  CreatePayoutMethod(this.repository);

  Future<PayoutMethod> call(Map<String, dynamic> data) {
    return repository.createPayoutMethod(data);
  }
}
