import 'package:dartz/dartz.dart';
import '../../../../core/network/models/cursor_paginated_response.dart';
import '../../../auth/domain/models/failure.dart';
import '../datasources/notification_remote_datasource.dart';
import '../models/notification_model.dart';
import '../models/notification_preference_model.dart';
import '../models/notification_device_model.dart';
import 'notification_repository.dart';

class NotificationRepositoryImpl implements NotificationRepository {
  final NotificationRemoteDataSource remoteDataSource;

  NotificationRepositoryImpl({required this.remoteDataSource});

  @override
  Future<Either<Failure, CursorPaginatedResponse<NotificationModel>>>
  getNotifications({int? limit, String? cursor, bool? unreadOnly}) async {
    try {
      final response = await remoteDataSource.getNotifications(
        limit: limit,
        cursor: cursor,
        unreadOnly: unreadOnly,
      );
      return Right(response);
    } catch (e) {
      return Left(Failure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, NotificationModel>> getNotification(String id) async {
    try {
      final notification = await remoteDataSource.getNotification(id);
      return Right(notification);
    } catch (e) {
      return Left(Failure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, void>> markAsRead(String id) async {
    try {
      await remoteDataSource.markAsRead(id);
      return const Right(null);
    } catch (e) {
      return Left(Failure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, int>> markMultipleAsRead({
    List<String>? notificationIds,
    bool markAll = false,
  }) async {
    try {
      final count = await remoteDataSource.markMultipleAsRead(
        notificationIds: notificationIds,
        markAll: markAll,
      );
      return Right(count);
    } catch (e) {
      return Left(Failure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, int>> markAsUnread(
    List<String> notificationIds,
  ) async {
    try {
      final count = await remoteDataSource.markAsUnread(notificationIds);
      return Right(count);
    } catch (e) {
      return Left(Failure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, int>> archive(List<String> notificationIds) async {
    try {
      final count = await remoteDataSource.archive(notificationIds);
      return Right(count);
    } catch (e) {
      return Left(Failure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, int>> getUnreadCount() async {
    try {
      final count = await remoteDataSource.getUnreadCount();
      return Right(count);
    } catch (e) {
      return Left(Failure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, NotificationPreferenceModel>> getPreferences() async {
    try {
      final preferences = await remoteDataSource.getPreferences();
      return Right(preferences);
    } catch (e) {
      return Left(Failure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, NotificationPreferenceModel>> updatePreferences(
    Map<String, dynamic> preferences,
  ) async {
    try {
      final updated = await remoteDataSource.updatePreferences(preferences);
      return Right(updated);
    } catch (e) {
      return Left(Failure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, List<NotificationDeviceModel>>> getDevices() async {
    try {
      final devices = await remoteDataSource.getDevices();
      return Right(devices);
    } catch (e) {
      return Left(Failure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, NotificationDeviceModel>> registerDevice(
    Map<String, dynamic> deviceData,
  ) async {
    try {
      final device = await remoteDataSource.registerDevice(deviceData);
      return Right(device);
    } catch (e) {
      return Left(Failure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, void>> deleteDevice(String id) async {
    try {
      await remoteDataSource.deleteDevice(id);
      return const Right(null);
    } catch (e) {
      return Left(Failure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, void>> unregisterDevice(String deviceId) async {
    try {
      await remoteDataSource.unregisterDevice(deviceId);
      return const Right(null);
    } catch (e) {
      return Left(Failure(e.toString()));
    }
  }
}
