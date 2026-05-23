import 'package:dartz/dartz.dart';
import '../../../../core/network/models/cursor_paginated_response.dart';
import '../../../auth/domain/models/failure.dart';
import '../../data/models/notification_model.dart';
import '../../data/repositories/notification_repository.dart';

class GetNotificationsUsecase {
  final NotificationRepository repository;

  GetNotificationsUsecase(this.repository);

  Future<Either<Failure, CursorPaginatedResponse<NotificationModel>>> call({
    int? limit,
    String? cursor,
    bool? unreadOnly,
  }) {
    return repository.getNotifications(
      limit: limit,
      cursor: cursor,
      unreadOnly: unreadOnly,
    );
  }
}
