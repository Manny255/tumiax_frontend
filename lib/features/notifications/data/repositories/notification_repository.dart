import 'package:dartz/dartz.dart';
import '../../../../core/network/models/cursor_paginated_response.dart';
import '../../../auth/domain/models/failure.dart';
import '../../data/models/notification_model.dart';
import '../../data/models/notification_preference_model.dart';
import '../../data/models/notification_device_model.dart';

abstract class NotificationRepository {
  // Notifications
  Future<Either<Failure, CursorPaginatedResponse<NotificationModel>>>
  getNotifications({int? limit, String? cursor, bool? unreadOnly});

  Future<Either<Failure, NotificationModel>> getNotification(String id);

  Future<Either<Failure, void>> markAsRead(String id);

  Future<Either<Failure, int>> markMultipleAsRead({
    List<String>? notificationIds,
    bool markAll = false,
  });

  Future<Either<Failure, int>> markAsUnread(List<String> notificationIds);

  Future<Either<Failure, int>> archive(List<String> notificationIds);

  Future<Either<Failure, int>> getUnreadCount();

  // Preferences
  Future<Either<Failure, NotificationPreferenceModel>> getPreferences();

  Future<Either<Failure, NotificationPreferenceModel>> updatePreferences(
    Map<String, dynamic> preferences,
  );

  // Devices
  Future<Either<Failure, List<NotificationDeviceModel>>> getDevices();

  Future<Either<Failure, NotificationDeviceModel>> registerDevice(
    Map<String, dynamic> deviceData,
  );

  Future<Either<Failure, void>> deleteDevice(String id);

  Future<Either<Failure, void>> unregisterDevice(String deviceId);
}
