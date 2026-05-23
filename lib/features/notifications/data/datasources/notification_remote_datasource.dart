import 'package:dio/dio.dart';
import '../../../../core/network/models/cursor_paginated_response.dart';
import '../models/notification_model.dart';
import '../models/notification_preference_model.dart';
import '../models/notification_device_model.dart';

class NotificationRemoteDataSource {
  final Dio dio;

  NotificationRemoteDataSource(this.dio);

  // =====================================================
  // GET /notifications/
  // =====================================================
  Future<CursorPaginatedResponse<NotificationModel>> getNotifications({
    int? limit,
    String? cursor,
    bool? unreadOnly,
  }) async {
    try {
      final response = await dio.get(
        '/notifications/',
        queryParameters: {
          'limit': ?limit,
          'cursor': ?cursor,
          if (unreadOnly == true) 'unread': true,
        },
      );

      return CursorPaginatedResponse<NotificationModel>.fromJson(
        response.data,
        (json) => NotificationModel.fromJson(json),
      );
    } on DioException catch (e) {
      throw _handleError(e);
    }
  }

  // =====================================================
  // GET /notifications/{id}/
  // =====================================================
  Future<NotificationModel> getNotification(String id) async {
    try {
      final response = await dio.get('/notifications/$id/');
      return NotificationModel.fromJson(response.data);
    } on DioException catch (e) {
      throw _handleError(e);
    }
  }

  // =====================================================
  // POST /notifications/{id}/read/
  // =====================================================
  Future<void> markAsRead(String id) async {
    try {
      await dio.post('/notifications/$id/read/');
    } on DioException catch (e) {
      throw _handleError(e);
    }
  }

  // =====================================================
  // POST /notifications/mark-read/
  // =====================================================
  Future<int> markMultipleAsRead({
    List<String>? notificationIds,
    bool markAll = false,
  }) async {
    try {
      final response = await dio.post(
        '/notifications/mark_read/',
        data: {
          if (notificationIds != null) 'notification_ids': notificationIds,
          'mark_all': markAll,
        },
      );
      return response.data['marked_read_count'] ?? 0;
    } on DioException catch (e) {
      throw _handleError(e);
    }
  }

  // =====================================================
  // POST /notifications/mark-unread/
  // =====================================================
  Future<int> markAsUnread(List<String> notificationIds) async {
    try {
      final response = await dio.post(
        '/notifications/mark-unread/',
        data: {'notification_ids': notificationIds},
      );
      return response.data['marked_unread_count'] ?? 0;
    } on DioException catch (e) {
      throw _handleError(e);
    }
  }

  // =====================================================
  // POST /notifications/archive/
  // =====================================================
  Future<int> archive(List<String> notificationIds) async {
    try {
      final response = await dio.post(
        '/notifications/archive/',
        data: {'notification_ids': notificationIds},
      );
      return response.data['archived_count'] ?? 0;
    } on DioException catch (e) {
      throw _handleError(e);
    }
  }

  // =====================================================
  // GET /notifications/unread-count/
  // =====================================================
  Future<int> getUnreadCount() async {
    try {
      final response = await dio.get('/notifications/unread_count/');
      return response.data['unread_count'] ?? 0;
    } on DioException catch (e) {
      throw _handleError(e);
    }
  }

  // =====================================================
  // GET /notifications/preferences/
  // =====================================================
  Future<NotificationPreferenceModel> getPreferences() async {
    try {
      final response = await dio.get('/notifications/preferences/');
      return NotificationPreferenceModel.fromJson(response.data);
    } on DioException catch (e) {
      throw _handleError(e);
    }
  }

  // =====================================================
  // POST /notifications/preferences/update-preferences/
  // =====================================================
  Future<NotificationPreferenceModel> updatePreferences(
    Map<String, dynamic> preferences,
  ) async {
    try {
      final response = await dio.post(
        '/notifications/preferences/update_preferences/',
        data: preferences,
      );
      return NotificationPreferenceModel.fromJson(response.data);
    } on DioException catch (e) {
      throw _handleError(e);
    }
  }

  // =====================================================
  // GET /notifications/devices/
  // =====================================================
  Future<List<NotificationDeviceModel>> getDevices() async {
    try {
      final response = await dio.get('/notifications/devices/');
      return (response.data as List)
          .map((json) => NotificationDeviceModel.fromJson(json))
          .toList();
    } on DioException catch (e) {
      throw _handleError(e);
    }
  }

  // =====================================================
  // POST /notifications/devices/
  // =====================================================
  Future<NotificationDeviceModel> registerDevice(
    Map<String, dynamic> deviceData,
  ) async {
    try {
      final response = await dio.post(
        '/notifications/devices/',
        data: deviceData,
      );
      return NotificationDeviceModel.fromJson(response.data);
    } on DioException catch (e) {
      throw _handleError(e);
    }
  }

  // =====================================================
  // DELETE /notifications/devices/{id}/
  // =====================================================
  Future<void> deleteDevice(String id) async {
    try {
      await dio.delete('/notifications/devices/$id/');
    } on DioException catch (e) {
      throw _handleError(e);
    }
  }

  // =====================================================
  // POST /notifications/devices/unregister/
  // =====================================================
  Future<void> unregisterDevice(String deviceId) async {
    try {
      await dio.post(
        '/notifications/devices/unregister/',
        data: {'device_id': deviceId},
      );
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
      if (data is Map && data.containsKey('error')) {
        return Exception(data['error']);
      }
      return Exception('Server error: ${e.response!.statusCode}');
    }
    return Exception('Network error: ${e.message}');
  }
}
