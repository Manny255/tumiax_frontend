import 'package:dio/dio.dart';
import '../models/payout_method_model.dart';

abstract class PayoutRemoteDataSource {
  Future<List<PayoutMethodModel>> getPayoutMethods();
  Future<PayoutMethodModel> createPayoutMethod(Map<String, dynamic> data);
  Future<void> deletePayoutMethod(int id);
}

class PayoutRemoteDataSourceImpl implements PayoutRemoteDataSource {
  final Dio dio;

  PayoutRemoteDataSourceImpl(this.dio);

 @override
  Future<List<PayoutMethodModel>> getPayoutMethods() async {
    final response = await dio.get('/payout-methods/');

    final List<dynamic> results = response.data['results'];

    return results
        .map((e) => PayoutMethodModel.fromJson(e as Map<String, dynamic>))
        .toList();
  }

  @override
  Future<PayoutMethodModel> createPayoutMethod(
    Map<String, dynamic> data,
  ) async {
    final response = await dio.post('/payout-methods/', data: data);
    // return PayoutMethodModel.fromJson(response.data['data']);
    return PayoutMethodModel.fromJson(response.data);
  }

  @override
  Future<void> deletePayoutMethod(int id) async {
    await dio.delete('/payout-methods/$id/');
  }
}
