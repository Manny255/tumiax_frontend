import 'package:dio/dio.dart';
import '../../../../core/network/models/cursor_paginated_response.dart';
import '../models/balance_transaction_model.dart';
import '../models/transaction_model.dart';
import '../models/user_balance_model.dart';

class WalletRemoteDataSource {
  final Dio dio;

  WalletRemoteDataSource(this.dio);

  Future<CursorPaginatedResponse<TransactionModel>> getTransactions({
    int? limit,
    String? cursor,
  }) async {
    try {
      final response = await dio.get(
        '/wallet/transactions/',
        queryParameters: {
          'limit': ?limit,
          'cursor': ?cursor,
        },
      );

      return CursorPaginatedResponse<TransactionModel>.fromJson(
        response.data,
        (json) => TransactionModel.fromJson(json),
      );
    } on DioException catch (e) {
      throw _handleError(e);
    }
  }

  Future<TransactionModel> getTransaction(String id) async {
    try {
      final response = await dio.get('/wallet/transactions/$id/');
      return TransactionModel.fromJson(response.data);
    } on DioException catch (e) {
      throw _handleError(e);
    }
  }

  Future<Map<String, dynamic>> getWalletSummary() async {
    try {
      final response = await dio.get('/wallet/transactions/summary/');
      return response.data;
    } on DioException catch (e) {
      throw _handleError(e);
    }
  }

  Exception _handleError(DioException e) {
    if (e.response != null) {
      final data = e.response!.data;
      if (data is Map && data.containsKey('message')) {
        return Exception(data['message']);
      }
      return Exception('Server error: ${e.response!.statusCode}');
    }
    return Exception('Network error: ${e.message}');
  }


    // =====================================================
  // GET /balance/
  // =====================================================
  Future<UserBalanceModel> getBalance() async {
    try {
      final response = await dio.get('/balance/');
      return UserBalanceModel.fromJson(response.data);
    } on DioException catch (e) {
      throw _handleError(e);
    }
  }

  // =====================================================
  // POST /balance/deposit/
  // =====================================================
  Future<BalanceTransactionModel> deposit({
    required double amount,
    String? description,
    required String paymentMethod,
    String? transactionReference,
    Map<String, dynamic>? metadata,
  }) async {
    try {
      final response = await dio.post(
        '/balance/deposit/',
        data: {
          'amount': amount,
          'description': description ?? 'Deposit',
          'payment_method': paymentMethod,
          'transaction_reference': ?transactionReference,
          'metadata': ?metadata,
        },
      );
      return BalanceTransactionModel.fromJson(response.data);
    } on DioException catch (e) {
      throw _handleError(e);
    }
  }

  // =====================================================
  // POST /balance/withdraw/
  // =====================================================
  Future<BalanceTransactionModel> withdraw({
    required double amount,
    String? description,
    required String payoutMethodId,
    Map<String, dynamic>? metadata,
  }) async {
    try {
      final response = await dio.post(
        '/balance/withdraw/',
        data: {
          'amount': amount,
          'description': description ?? 'Withdrawal',
          'payout_method_id': payoutMethodId,
          if (metadata != null) 'metadata': metadata,
        },
      );
      return BalanceTransactionModel.fromJson(response.data);
    } on DioException catch (e) {
      throw _handleError(e);
    }
  }

  // =====================================================
  // GET /balance/transactions/
  // =====================================================
  Future<CursorPaginatedResponse<BalanceTransactionModel>>
  getBalanceTransactions({int? limit, String? cursor}) async {
    try {
      final response = await dio.get(
        '/balance/transactions/',
        queryParameters: {
          'limit': ?limit,
          'cursor': ?cursor,
        },
      );

      return CursorPaginatedResponse<BalanceTransactionModel>.fromJson(
        response.data,
        (json) => BalanceTransactionModel.fromJson(json),
      );
    } on DioException catch (e) {
      throw _handleError(e);
    }
  }
}
