import 'dart:io';
import 'package:dio/dio.dart';
import 'package:package_info_plus/package_info_plus.dart';
import '../models/app_version_model.dart';

class VersionRemoteDataSource {
  final Dio dio;

  VersionRemoteDataSource(this.dio);

  /// Get latest version from backend
  Future<AppVersionModel> getLatestVersion() async {
    try {
      final platform = _getPlatform();

      final response = await dio.get(
        '/version/latest/',
        queryParameters: {'platform': platform},
      );

      return AppVersionModel.fromJson(response.data);
    } on DioException catch (e) {
      throw _handleError(e);
    }
  }

  /// Get current app version
  Future<String> getCurrentVersion() async {
    final info = await PackageInfo.fromPlatform();
    return info.version;
  }

  /// Get platform string for backend
  String _getPlatform() {
    if (Platform.isAndroid) return 'android';
    if (Platform.isIOS) return 'ios';
    return 'android';
  }

  Exception _handleError(DioException e) {
    if (e.response != null) {
      final data = e.response!.data;
      if (data is Map && data.containsKey('error')) {
        return Exception(data['error']);
      }
      if (data is Map && data.containsKey('message')) {
        return Exception(data['message']);
      }
      return Exception('Server error: ${e.response!.statusCode}');
    }
    return Exception('Network error: ${e.message}');
  }
}
