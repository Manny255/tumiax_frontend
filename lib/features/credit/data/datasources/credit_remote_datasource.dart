
import 'package:dio/dio.dart';

import '../../../../core/network/models/cursor_paginated_response.dart';
import '../../domain/enums/spend_type.dart';
import '../models/credit_account_model.dart';
import '../models/credit_line_model.dart';
import '../models/credit_transaction_model.dart';
import '../models/spending_analytics_model.dart';

abstract class CreditRemoteDataSource {

  Future<CreditAccountModel> getCreditSummary();

  /// Full Credit Account
  Future<CreditAccountModel> getCreditAccount();

  /// Credit Lines per asset
  Future<CursorPaginatedResponse<CreditLineModel>> getCreditLines({bool? hasDebt, String? status, String? cursor});

  /// Transactions
  Future<CursorPaginatedResponse<CreditTransactionModel>> getTransactions({
    String? cursor,
  });

  Future<CursorPaginatedResponse<CreditTransactionModel>> getDebts({
    String? cursor,
  });

   /// Get spending analytics for charts
  Future<SpendingAnalyticsModel> getSpendingAnalytics();

  /// Spend from specific credit line

  Future<CreditTransactionModel> spendCredit({
  required String creditLineId,
  required double amount,
  required String description,
  required SpendType spendType,
  String? recipientEmail,
  String? payoutMethodId,
  String? merchant,
  String? merchantCategory,
  Map<String, dynamic>? metadata,
});

  /// Repay credit
  Future<CreditTransactionModel> repayCredit({
    required double amount,
    String? description,
  });

  /// Refresh credit structure
  Future<Map<String, dynamic>> refreshCreditLimit();
}

class CreditRemoteDataSourceImpl implements CreditRemoteDataSource {

  final Dio dio;

  CreditRemoteDataSourceImpl(this.dio);

  // =====================================================
  // ACCOUNT
  // =====================================================

  @override
  Future<CreditAccountModel> getCreditAccount() async {
    try {
      final response = await dio.get('/credit/');
      return CreditAccountModel.fromJson(response.data);
    } on DioException catch (e) {
      throw _handleError(e);
    }
  }

  // =====================================================
  // CREDIT LINES
  // =====================================================

  @override
  Future<CursorPaginatedResponse<CreditLineModel>> getCreditLines({
    bool? hasDebt,
    String? status,
    String? cursor,
  }) async {
    try {
      final queryParams = <String, dynamic>{};
      if (hasDebt == true) queryParams['has_debt'] = 'true';
      if (status != null) queryParams['status'] = status;
      if (cursor != null) queryParams['cursor'] = cursor;

      final response = await dio.get(
        '/credit/credit_lines/',
        queryParameters: queryParams,
      );

      return CursorPaginatedResponse<CreditLineModel>.fromJson(
        response.data,
        CreditLineModel.fromJson,
      );
    } on DioException catch (e) {
      throw _handleError(e);
    }
  }


  // =====================================================
  // TRANSACTIONS
  // =====================================================
  @override
  Future<CursorPaginatedResponse<CreditTransactionModel>> getTransactions({
    String? cursor,
  }) async {
    try {
      final response = await dio.get(
        '/credit/transactions/',
        queryParameters: cursor != null ? {'cursor': cursor} : null,
      );

      return CursorPaginatedResponse<CreditTransactionModel>.fromJson(
        response.data,
        CreditTransactionModel.fromJson,
      );
    } on DioException catch (e) {
      throw _handleError(e);
    }
  }

  @override
  Future<CursorPaginatedResponse<CreditTransactionModel>> getDebts({
    String? cursor,
  }) async {
    try {
      final response = await dio.get(
        '/credit/debts/',
        queryParameters: cursor != null ? {'cursor': cursor} : null,
      );

      return CursorPaginatedResponse<CreditTransactionModel>.fromJson(
        response.data,
        CreditTransactionModel.fromJson,
      );
    } on DioException catch (e) {
      throw _handleError(e);
    }
  }

  // =====================================================
  // SPEND
  // =====================================================

  @override
  Future<CreditTransactionModel> spendCredit({
      required String creditLineId,
      required double amount,
      required String description,
      required SpendType spendType,
      String? recipientEmail,
      String? payoutMethodId,
      String? merchant,
      String? merchantCategory,
      Map<String, dynamic>? metadata,
    }) async {

    try {
      final response = await dio.post(
        '/credit/spend/',
       data: {
        'credit_line_id': creditLineId,
        'amount': amount,
        'description': description,
        'spend_type': spendType.apiValue,
        'recipient_email': ?recipientEmail,
        'payout_method_id': ?payoutMethodId,
        'merchant': ?merchant,
        'merchant_category': ?merchantCategory,
        'metadata': ?metadata,
      },
      );
      return CreditTransactionModel.fromJson(response.data);

    } on DioException catch (e) {
      throw _handleError(e);
    }
  }

   @override
  Future<SpendingAnalyticsModel> getSpendingAnalytics() async {
    try {
      final response = await dio.get('/credit/spending_analytics/');
      return SpendingAnalyticsModel.fromJson(response.data);
    } on DioException catch (e) {
      throw _handleError(e);
    }
  }

  // =====================================================
  // REPAY
  // =====================================================

  @override
  Future<CreditTransactionModel> repayCredit({
    required double amount,
    String? description,
  }) async {

    try {
      final response = await dio.post(
        '/credit/repay/',
        data: {
          'amount': amount,
          'description': description,
        },
      );

      return CreditTransactionModel.fromJson(response.data);

    } on DioException catch (e) {
      throw _handleError(e);
    }
  }

  // =====================================================
  // REFRESH CREDIT
  // =====================================================

  @override
  Future<Map<String, dynamic>> refreshCreditLimit() async {

    try {
      final response = await dio.post('/credit/refresh/');
      return response.data;

    } on DioException catch (e) {
      throw _handleError(e);
    }
  }

  @override
    Future<CreditAccountModel> getCreditSummary() async {
      try {
        final response = await dio.get('/credit/');
        return CreditAccountModel.fromJson(response.data);
      } on DioException catch (e) {
        throw _handleError(e);
      }
  }

  // =====================================================
  // ERROR HANDLER
  // =====================================================

  Exception _handleError(DioException e) {

    if (e.response != null) {

      final data = e.response!.data;

      if (data is Map) {

        if (data['error'] != null) {
          return Exception(data['error']);
        }

        if (data['message'] != null) {
          return Exception(data['message']);
        }
      }

      return Exception(
        'Server error (${e.response!.statusCode})',
      );
    }

    return Exception(
      'Network error: ${e.message}',
    );
  }
}