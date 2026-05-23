import 'package:hooks_riverpod/hooks_riverpod.dart';
import '../../../core/network/dio_client.dart';
import '../data/datasources/notification_remote_datasource.dart';
import '../data/repositories/notification_repository.dart';
import '../data/repositories/notification_repository_impl.dart';
import '../domain/usecases/get_notifications_usecase.dart';
import '../domain/usecases/mark_notifications_read_usecase.dart';
import '../domain/usecases/get_unread_count_usecase.dart';

/// ===============================
/// Data Source
/// ===============================
final notificationRemoteDataSourceProvider =
    Provider<NotificationRemoteDataSource>((ref) {
      final dio = ref.watch(dioProvider);
      return NotificationRemoteDataSource(dio);
    });

/// ===============================
/// Repository
/// ===============================
final notificationRepositoryProvider = Provider<NotificationRepository>((ref) {
  return NotificationRepositoryImpl(
    remoteDataSource: ref.watch(notificationRemoteDataSourceProvider),
  );
});

/// ===============================
/// Use Cases
/// ===============================
final getNotificationsUsecaseProvider = Provider<GetNotificationsUsecase>((
  ref,
) {
  return GetNotificationsUsecase(ref.watch(notificationRepositoryProvider));
});

final markNotificationsReadUsecaseProvider =
    Provider<MarkNotificationsReadUsecase>((ref) {
      return MarkNotificationsReadUsecase(
        ref.watch(notificationRepositoryProvider),
      );
    });

final getUnreadCountUsecaseProvider = Provider<GetUnreadCountUsecase>((ref) {
  return GetUnreadCountUsecase(ref.watch(notificationRepositoryProvider));
});


// /// ===============================
// ///  Lightweight Unread Count Provider
// /// (Better for badges without rebuilding list)
// /// ===============================
// final unreadCountProvider = FutureProvider<int>((ref) async {
//   final getCount = ref.watch(getUnreadCountUsecaseProvider);
//   final result = await getCount();
//   return result.fold((failure) => 0, (count) => count);
// });
