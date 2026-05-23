

import '../domain/entities/payout_method.dart';

abstract class PayoutRepository {
  Future<List<PayoutMethod>> getPayoutMethods();
  Future<PayoutMethod> createPayoutMethod(Map<String, dynamic> data);
  Future<void> deletePayoutMethod(int id);
}
