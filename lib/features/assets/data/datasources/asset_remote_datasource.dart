// lib/features/assets/data/datasources/asset_remote_datasource.dart
import 'package:dio/dio.dart';
import 'package:file_picker/file_picker.dart';
import '../models/asset_model.dart';
import '../models/asset_category.dart';
import '../models/asset_document.dart';
import '../models/create_asset_request.dart';
import '../models/paginated_response.dart';

abstract class AssetRemoteDataSource {
  // Asset operations
  Future<List<AssetModel>> getAssets({Map<String, dynamic>? queryParams});
  Future<AssetModel> getAsset(String id);
  Future<AssetModel> createAsset(CreateAssetRequest request);
  Future<AssetModel> updateAsset(String id, Map<String, dynamic> data);
  Future<void> deleteAsset(String id);

  // Asset lifecycle
  Future<AssetModel> submitAsset(String id);
  Future<AssetModel> approveAsset(String id);
  Future<AssetModel> rejectAsset(String id, Map<String, dynamic> reasons);
  Future<Map<String, dynamic>> valuateAsset(String id);

  // Document operations
  Future<AssetDocumentModel> uploadDocument(
    String assetId,
    PlatformFile file, {
    String? documentType,
  });
  Future<void> deleteDocument(String assetId, String documentId);
  Future<AssetDocumentModel> approveDocument(String assetId, String documentId);
  Future<AssetDocumentModel> rejectDocument(
    String assetId,
    String documentId,
    String reason,
  );

  // Categories
  Future<List<AssetCategoryModel>> getCategories();
}

class AssetRemoteDataSourceImpl implements AssetRemoteDataSource {
  final Dio dio;

  AssetRemoteDataSourceImpl(this.dio);

  @override
  Future<List<AssetModel>> getAssets({
    Map<String, dynamic>? queryParams,
  }) async {
    try {
      final response = await dio.get('/assets/', queryParameters: queryParams);

      final paginatedResponse = PaginatedResponse<AssetModel>.fromJson(
        response.data,
        (json) => AssetModel.fromJson(json),
      );

      return paginatedResponse.results;
    } on DioException catch (e) {
      throw _handleError(e);
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<AssetModel> getAsset(String id) async {
    try {
      final response = await dio.get('/assets/$id/');
      return AssetModel.fromJson(response.data);
    } on DioException catch (e) {
      throw _handleError(e);
    }
  }

  @override
  Future<AssetModel> createAsset(CreateAssetRequest request) async {
    try {
      final formData = await request.toFormData();

      final response = await dio.post(
        '/assets/',
        data: formData,
        options: Options(contentType: 'multipart/form-data'),
      );

      return AssetModel.fromJson(response.data);
    } on DioException {
      rethrow;
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<AssetModel> updateAsset(String id, Map<String, dynamic> data) async {
    try {
      final response = await dio.patch('/assets/$id/', data: data);
      return AssetModel.fromJson(response.data);
    } on DioException catch (e) {
      throw _handleError(e);
    }
  }

  @override
  Future<void> deleteAsset(String id) async {
    try {
      await dio.delete('/assets/$id/');
    } on DioException catch (e) {
      throw _handleError(e);
    }
  }

  @override
  Future<AssetModel> submitAsset(String id) async {
    try {
      final response = await dio.post('/assets/$id/submit/');
      return AssetModel.fromJson(response.data);
    } on DioException catch (e) {
      throw _handleError(e);
    }
  }

  @override
  Future<AssetModel> approveAsset(String id) async {
    try {
      final response = await dio.post('/assets/$id/approve/');
      return AssetModel.fromJson(response.data);
    } on DioException catch (e) {
      throw _handleError(e);
    }
  }

  @override
  Future<AssetModel> rejectAsset(
    String id,
    Map<String, dynamic> reasons,
  ) async {
    try {
      final response = await dio.post(
        '/assets/$id/reject/',
        data: {'reasons': reasons},
      );
      return AssetModel.fromJson(response.data);
    } on DioException catch (e) {
      throw _handleError(e);
    }
  }

  @override
  Future<Map<String, dynamic>> valuateAsset(String id) async {
    try {
      final response = await dio.post('/assets/$id/valuate/');
      return response.data;
    } on DioException catch (e) {
      throw _handleError(e);
    }
  }

  @override
  Future<AssetDocumentModel> uploadDocument(
    String assetId,
    PlatformFile file, {
    String? documentType,
  }) async {
    try {
      final formData = FormData.fromMap({
        'document_type': documentType,
        'file': await MultipartFile.fromFile(file.path!, filename: file.name),
      });

      final response = await dio.post(
        '/assets/$assetId/documents/',
        data: formData,
        options: Options(contentType: 'multipart/form-data'),
      );

      return AssetDocumentModel.fromJson(response.data);
    } on DioException catch (e) {
      throw _handleError(e);
    }
  }

  @override
  Future<void> deleteDocument(String assetId, String documentId) async {
    try {
      await dio.delete('/assets/$assetId/documents/$documentId/');
    } on DioException catch (e) {
      throw _handleError(e);
    }
  }

  @override
  Future<AssetDocumentModel> approveDocument(
    String assetId,
    String documentId,
  ) async {
    try {
      final response = await dio.post(
        '/assets/$assetId/documents/$documentId/approve/',
      );
      return AssetDocumentModel.fromJson(response.data);
    } on DioException catch (e) {
      throw _handleError(e);
    }
  }

  @override
  Future<AssetDocumentModel> rejectDocument(
    String assetId,
    String documentId,
    String reason,
  ) async {
    try {
      final response = await dio.post(
        '/assets/$assetId/documents/$documentId/reject/',
        data: {'reason': reason},
      );
      return AssetDocumentModel.fromJson(response.data);
    } on DioException catch (e) {
      throw _handleError(e);
    }
  }

  @override
  Future<List<AssetCategoryModel>> getCategories() async {
    try {
      final response = await dio.get('/asset-categories/');

      List<dynamic> dataList;

      if (response.data is List) {
        dataList = response.data as List;
      } else if (response.data is Map && response.data['data'] != null) {
        dataList = response.data['data'] as List;
      } else {
        throw Exception(
          'Unexpected response format: ${response.data.runtimeType}',
        );
      }

      return dataList.map((item) {
        if (item is Map) {
          final Map<String, dynamic> jsonMap = item.map(
            (key, value) => MapEntry(key.toString(), value),
          );
          return AssetCategoryModel.fromJson(jsonMap);
        } else {
          throw Exception('Invalid item format: ${item.runtimeType}');
        }
      }).toList();
    } on DioException catch (e) {
      throw _handleError(e);
    } catch (e) {
      throw Exception('Failed to load categories: $e');
    }
  }

  Exception _handleError(DioException e) {
    if (e.response != null) {
      final data = e.response!.data;

      if (data is Map) {
        final Map<String, dynamic> typedData = Map<String, dynamic>.from(data);

        if (e.response!.statusCode == 403) {
          final detail =
              typedData['errors']?['detail'] ??
              typedData['detail'] ??
              typedData['message'];

          if (detail != null &&
              detail.toString().toLowerCase().contains('kyc')) {
            return KycRequiredException(detail.toString());
          }
        }

        if (typedData.containsKey('errors') ||
            typedData.containsKey('reasons')) {
          return AssetValidationException(
            message: 'Validation failed',
            errors: typedData,
          );
        }

        if (typedData.containsKey('message')) {
          return Exception(typedData['message'] as String? ?? 'Unknown error');
        }

        if (typedData.containsKey('detail')) {
          return Exception(typedData['detail'] as String? ?? 'Unknown error');
        }
      }

      return Exception('Server error: ${e.response!.statusCode}');
    }

    return Exception('Network error: ${e.message}');
  }
}

class AssetValidationException implements Exception {
  final String message;
  final Map<String, dynamic> errors;

  AssetValidationException({required this.message, required this.errors});

  @override
  String toString() => message;
}

class KycRequiredException implements Exception {
  final String message;

  KycRequiredException(this.message);

  @override
  String toString() => message;
}
