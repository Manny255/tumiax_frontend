
import 'package:dartz/dartz.dart';
import '../../../auth/domain/models/failure.dart';
import '../../data/repositories/notification_repository.dart';

class MarkNotificationsReadUsecase {
  final NotificationRepository repository;

  MarkNotificationsReadUsecase(this.repository);

  Future<Either<Failure, int>> call({
    List<String>? notificationIds,
    bool markAll = false,
  }) {
    return repository.markMultipleAsRead(
      notificationIds: notificationIds,
      markAll: markAll,
    );
  }
}
