import '../datasources/payout_remote_datasource.dart';
import '../domain/entities/payout_method.dart';
import '../models/payout_method_model.dart';
import 'payout_repository.dart';

class PayoutRepositoryImpl implements PayoutRepository {
  final PayoutRemoteDataSource remote;

  PayoutRepositoryImpl(this.remote);

  @override
  Future<List<PayoutMethod>> getPayoutMethods() async {
    final models = await remote.getPayoutMethods();
    return models.map((e) => e.toEntity()).toList();
  }

  @override
  Future<PayoutMethod> createPayoutMethod(Map<String, dynamic> data) async {
    final model = await remote.createPayoutMethod(data);
    return model.toEntity();
  }

  @override
  Future<void> deletePayoutMethod(int id) {
    return remote.deletePayoutMethod(id);
  }
}
