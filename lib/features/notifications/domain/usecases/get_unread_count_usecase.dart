import 'package:dartz/dartz.dart';
import '../../../auth/domain/models/failure.dart';
import '../../data/repositories/notification_repository.dart';

class GetUnreadCountUsecase {
  final NotificationRepository repository;

  GetUnreadCountUsecase(this.repository);

  Future<Either<Failure, int>> call() {
    return repository.getUnreadCount();
  }
}
