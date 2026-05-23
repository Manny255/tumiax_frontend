// lib/features/auth/data/datasources/auth_remote_datasource.dart
import 'package:dio/dio.dart';
import '../models/auth_response.dart';
import '../models/login_request.dart';
import '../models/register_request.dart';
import '../models/resend_code_request.dart';
import '../models/user_model.dart';
import '../models/verify_email_request.dart';

abstract class AuthRemoteDataSource {
  Future<AuthResponse> login(LoginRequest request);
  Future<UserModel> register(RegisterRequest request);
  Future<AuthResponse> refreshToken(String refreshToken);
  Future<void> logout(String refreshToken);
  Future<UserModel> getCurrentUser();
  Future<void> changePassword(String oldPassword, String newPassword);
  Future<void> deleteAccount(); 
  Future<AuthResponse> verifyEmail(String email, String code);
  Future<void> resendVerificationCode(String email);
}

class AuthRemoteDataSourceImpl implements AuthRemoteDataSource {
  final Dio dio;

  AuthRemoteDataSourceImpl(this.dio);

  @override
  Future<AuthResponse> login(LoginRequest request) async {

    try {
      final response = await dio.post('/auth/login/', data: request.toJson());
      return AuthResponse.fromJson(response.data);
    } on DioException catch (e) {
      throw _handleError(e);
    }
  }
  @override
  Future<UserModel> register(RegisterRequest request) async {
    try {
      final response = await dio.post(
        '/auth/register/',
        data: request.toJson(),
      );

      return UserModel.fromJson(response.data['data']);
    } on DioException catch (e) {
      throw _handleError(e);
    }
  }

  @override
  Future<AuthResponse> refreshToken(String refreshToken) async {
    try {
      final response = await dio.post(
        '/auth/refresh/',
        data: {'refresh': refreshToken},
      );
      return AuthResponse.fromJson(response.data);
    } on DioException catch (e) {
      throw _handleError(e);
    }
  }

  @override
  Future<void> logout(String refreshToken) async {
    try {
      await dio.post('/users/logout/', data: {'refresh': refreshToken});
    } on DioException catch (e) {
      throw _handleError(e);
    }
  }

  @override
  Future<void> deleteAccount() async {
    try {
      await dio.delete('/users/delete_account/');
    } on DioException catch (e) {
      throw _handleError(e);
    }
  }

  @override
  Future<UserModel> getCurrentUser() async {
    try {
      final response = await dio.get('/users/me/');
      return UserModel.fromJson(response.data);
    } on DioException catch (e) {
      throw _handleError(e);
    }
  }

  @override
  Future<void> changePassword(String oldPassword, String newPassword) async {
    try {
      await dio.post(
        '/users/change_password/',
        data: {'old_password': oldPassword, 'new_password': newPassword},
      );
    } on DioException catch (e) {
      throw _handleError(e);
    }
  }
@override
  Future<AuthResponse> verifyEmail(String email, String code) async {
    try {
      final request = VerifyEmailRequest(email: email, code: code);
      final response = await dio.post(
        '/auth/verify-email/',
        data: request.toJson(),
      );

      return AuthResponse.fromJson(response.data);
    } on DioException catch (e) {
      throw _handleError(e);
    }
  }

@override
Future<void> resendVerificationCode(String email) async {
  try {
    final request = ResendCodeRequest(email: email);
    await dio.post('/auth/resend-code/', data: request.toJson());
  } on DioException catch (e) {
    throw _handleError(e);
  }
}

 /// Strong Production Error Handler
  Exception _handleError(DioException e) {
    if (e.response != null) {
      final data = e.response!.data;

      if (data is Map<String, dynamic>) {
        // Structured API error
        if (data.containsKey('code') && data.containsKey('message')) {
          return Exception(data['message']);
        }

        // Handle validation errors
        if (data.containsKey('errors')) {
          final errors = data['errors'];

          if (errors is Map<String, dynamic> && errors.isNotEmpty) {
            final firstField = errors.keys.first;
            final fieldErrors = errors[firstField];

            if (fieldErrors is List && fieldErrors.isNotEmpty) {
              return Exception(fieldErrors.first.toString());
            }

            if (fieldErrors is String) {
              return Exception(fieldErrors);
            }

            return Exception(fieldErrors.toString());
          }
        }

        // DRF "detail"
        if (data.containsKey('detail')) {
          return Exception(data['detail'].toString());
        }

        // Generic message
        if (data.containsKey('message')) {
          return Exception(data['message'].toString());
        }

        // Legacy fallback
        if (data.containsKey('error')) {
          return Exception(data['error'].toString());
        }
      }

      return Exception('Server error (${e.response!.statusCode})');
    }

    // Timeout
    if (e.type == DioExceptionType.connectionTimeout ||
        e.type == DioExceptionType.receiveTimeout ||
        e.type == DioExceptionType.sendTimeout) {
      return Exception('Connection timeout. Please check your internet.');
    }

    // Network error
    if (e.type == DioExceptionType.connectionError) {
      return Exception('Network error. Please check your connection.');
    }

    return Exception('Network error: ${e.message}');
  }
}
