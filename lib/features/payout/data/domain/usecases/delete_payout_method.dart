import '../../repositories/payout_repository.dart';

class DeletePayoutMethod {
  final PayoutRepository repository;

  DeletePayoutMethod(this.repository);

  Future<void> call(int id) {
    return repository.deletePayoutMethod(id);
  }
}
