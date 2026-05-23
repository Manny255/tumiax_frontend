// lib/features/insurance/data/datasources/insurance_remote_datasource.dart

import 'dart:io';

import 'package:dio/dio.dart';
import '../exceptions/insurance_exceptions.dart';
import '../model/insurance_document_model.dart';
import '../model/insurance_policy_model.dart';
import '../model/create_insurance_request.dart';

abstract class InsuranceRemoteDataSource {
  Future<List<InsurancePolicyModel>> getPolicies();
  Future<InsurancePolicyModel> getPolicy(String id);
  Future<InsurancePolicyModel> getPolicyForAsset(String assetId);

  Future<InsurancePolicyModel> createInsuranceForAsset(
    CreateInsuranceRequest request,
  );
  Future<InsuranceDocumentModel> uploadPolicyDocument(
    int policyId,
    File file,
  );

  Future<InsurancePolicyModel> updatePolicy(
    String id,
    Map<String, dynamic> data,
  );

  Future<void> deletePolicy(String id);

  Future<InsurancePolicyModel> renewPolicy(String id, DateTime newExpiryDate);

  Future<InsurancePolicyModel> cancelPolicy(String id);
}

class InsuranceRemoteDataSourceImpl implements InsuranceRemoteDataSource {
  final Dio dio;

  InsuranceRemoteDataSourceImpl(this.dio);

  @override
  Future<List<InsurancePolicyModel>> getPolicies() async {
    try {
      final response = await dio.get('/insurance/');
      final List<dynamic> data = response.data['results'] ?? response.data;
      return data.map((json) => InsurancePolicyModel.fromJson(json)).toList();
    } on DioException catch (e) {
      throw _handleError(e);
    }
  }

  @override
  Future<InsurancePolicyModel> getPolicy(String id) async {
    try {
      final response = await dio.get('/insurance/$id/');
      return InsurancePolicyModel.fromJson(response.data);
    } on DioException catch (e) {
      throw _handleError(e);
    }
  }

  @override
  Future<InsurancePolicyModel> getPolicyForAsset(String assetId) async {
    try {
      final response = await dio.get(
        '/insurance/',
        queryParameters: {'asset': assetId},
      );

      final List<dynamic> data = response.data['results'] ?? response.data;

      if (data.isEmpty) {
        throw Exception('No insurance found for this asset');
      }

      return InsurancePolicyModel.fromJson(data.first);
    } on DioException catch (e) {
      throw _handleError(e);
    }
  }

  @override
  Future<InsurancePolicyModel> createInsuranceForAsset(
    CreateInsuranceRequest request,
  ) async {
    try {

      final response = await dio.post(
        '/insurance/',
        data: request.toJson(),
      );

      return InsurancePolicyModel.fromJson(response.data);
    } on DioException catch (e) {
      throw _handleError(e);
    }
  }

  // @override
  // Future<InsurancePolicyModel> createInsuranceForAsset(
  //   String assetId,
  //   CreateInsuranceRequest request,
  // ) async {
  //   try {
  //     final response = await dio.post(
  //       '/assets/$assetId/insurance/',
  //       data: request.toJson(),
  //     );

  //     return InsurancePolicyModel.fromJson(response.data);
  //   } on DioException catch (e) {
  //     throw _handleError(e);
  //   }
  // }


  @override
  Future<InsuranceDocumentModel> uploadPolicyDocument(
    int policyId,
    File file,
  ) async {
    try {
      final formData = FormData.fromMap({
        'file': await MultipartFile.fromFile(
          file.path,
          filename: file.path.split('/').last,
        ),
      });

      final response = await dio.post(
        '/insurance/$policyId/upload_document/',
        data: formData,
        options: Options(contentType: 'multipart/form-data'),
      );

      return InsuranceDocumentModel.fromJson(response.data);
    } on DioException catch (e) {
      throw _handleError(e);
    }
  }

  @override
  Future<InsurancePolicyModel> updatePolicy(
    String id,
    Map<String, dynamic> data,
  ) async {
    try {
      final response = await dio.patch('/insurance/$id/', data: data);
      return InsurancePolicyModel.fromJson(response.data);
    } on DioException catch (e) {
      throw _handleError(e);
    }
  }

  @override
  Future<void> deletePolicy(String id) async {
    try {
      await dio.delete('/insurance/$id/');
    } on DioException catch (e) {
      throw _handleError(e);
    }
  }

  @override
  Future<InsurancePolicyModel> renewPolicy(
    String id,
    DateTime newExpiryDate,
  ) async {
    try {
      final response = await dio.post(
        '/insurance/$id/renew/',
        data: {'expiry_date': newExpiryDate.toIso8601String()},
      );

      return InsurancePolicyModel.fromJson(response.data);
    } on DioException catch (e) {
      throw _handleError(e);
    }
  }

  @override
  Future<InsurancePolicyModel> cancelPolicy(String id) async {
    try {
      final response = await dio.post('/insurance/$id/cancel/');
      return InsurancePolicyModel.fromJson(response.data);
    } on DioException catch (e) {
      throw _handleError(e);
    }
  }

Exception _handleError(DioException e) {
    if (e.response != null) {
      final data = e.response!.data;

      if (data is Map<String, dynamic>) {
        // DRF validation errors usually return field-based errors
        final hasFieldErrors = data.values.any(
          (value) => value is List || value is String,
        );

        if (hasFieldErrors) {
          return InsuranceValidationException(
            message: 'Validation failed',
            errors: data,
          );
        }

        if (data.containsKey('detail')) {
          return Exception(data['detail'] ?? 'Unknown error');
        }

        if (data.containsKey('message')) {
          return Exception(data['message'] ?? 'Unknown error');
        }
      }

      return Exception('Server error: ${e.response!.statusCode}');
    }

    return Exception('Network error: ${e.message}');
  }
}
