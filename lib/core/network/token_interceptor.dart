// lib/core/network/token_interceptor.dart
import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../config/app_config.dart';
import '../session/auth_session_provider.dart';
import '../session/session_controller.dart';
import '../storage/secure_storage.dart';

class TokenInterceptor extends Interceptor {
  TokenInterceptor(this.ref);

  final Ref ref;

  @override
  void onRequest(
    RequestOptions options,
    RequestInterceptorHandler handler,
  ) async {
    // Skip token for auth endpoints
    if (options.path.contains('/auth/')) {
      return handler.next(options);
    }

    final token = await ref.read(secureStorageProvider).read('access_token');
    if (token != null) {
      options.headers['Authorization'] = 'Bearer $token';
    }

    handler.next(options);
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) async {
    if (err.response?.statusCode == 401) {
      try {
        final refreshToken = await ref
            .read(secureStorageProvider)
            .read('refresh_token');

        if (refreshToken != null) {
          final newToken = await _refreshToken(refreshToken);

          if (newToken != null) {
            final options = err.requestOptions;

            options.headers['Authorization'] = 'Bearer $newToken';

            final response = await Dio().fetch(options);

            return handler.resolve(response);
          }
        }

        /// Refresh failed → force logout
        await _forceLogout();
      } catch (_) {
        await _forceLogout();
      }
    }

    handler.next(err);
  }

  Future<void> _forceLogout() async {
    final storage = ref.read(secureStorageProvider);

    await storage.delete('access_token');
    await storage.delete('refresh_token');

    /// Reset router session
    ref.read(sessionProvider.notifier).resetSession();

    /// Mark user unauthenticated
    ref.read(authsessionProvider.notifier).logout();
  }

  Future<String?> _refreshToken(String refreshToken) async {
    try {
      final response = await Dio().post(
        '${AppConfig.apiBaseUrl}/auth/refresh/',
        data: {'refresh': refreshToken},
      );

      final newToken = response.data['access'];
      await ref.read(secureStorageProvider).write('access_token', newToken);
      return newToken;
    } catch (e) {
      return null;
    }
  }
}
