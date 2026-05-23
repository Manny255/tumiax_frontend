// lib/core/network/api_interceptor.dart
import 'dart:io';
import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:package_info_plus/package_info_plus.dart';

class ApiInterceptor extends Interceptor {
  final Ref ref;
  String? _cachedVersion;

  ApiInterceptor(this.ref);

  Future<String> _getAppVersion() async {
    if (_cachedVersion != null) return _cachedVersion!;
    try {
      final info = await PackageInfo.fromPlatform();
      _cachedVersion = info.version;
      return _cachedVersion!;
    } catch (e) {
      return '1.0.0';
    }
  }

  @override
  Future<void> onRequest(
    RequestOptions options,
    RequestInterceptorHandler handler,
  ) async {
    final appVersion = await _getAppVersion();

    options.headers['Accept'] = 'application/json';
    options.headers['Content-Type'] = 'application/json';
    options.headers['X-Platform'] = Platform.isAndroid ? 'android' : 'ios';
    options.headers['X-App-Version'] =
        appVersion;

    handler.next(options);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    handler.next(response);
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    if (err.response?.statusCode == 500) {
      err = err.copyWith(error: 'Server error. Please try again later.');
    } else if (err.response?.statusCode == 404) {
      err = err.copyWith(error: 'Resource not found.');
    } else if (err.type == DioExceptionType.connectionTimeout ||
        err.type == DioExceptionType.receiveTimeout) {
      err = err.copyWith(
        error: 'Connection timeout. Please check your internet.',
      );
    }
    handler.next(err);
  }
}
