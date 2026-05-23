import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../../core/session/session_controller.dart';
import '../../data/models/notification_model.dart';
import '../../providers/notification_providers.dart';

class NotificationController extends AsyncNotifier<List<NotificationModel>> {
  static const int _pageSize = 20;

  final List<NotificationModel> _allNotifications = [];

  String? _nextCursor;
  bool _hasMore = true;

  bool get hasMore => _hasMore;

  /// Reactive unread count
  int get unreadCount => _allNotifications.where((n) => !n.isRead).length;

  @override
  Future<List<NotificationModel>> build() async {
    ref.watch(sessionProvider); 
    return _fetchInitial();
  }

  // ===============================
  // Initial Fetch
  // ===============================
  Future<List<NotificationModel>> _fetchInitial() async {
    _allNotifications.clear();
    _nextCursor = null;
    _hasMore = true;

    final result = await ref.read(getNotificationsUsecaseProvider)(
      limit: _pageSize,
      cursor: null,
    );

    return result.fold((failure) => throw Exception(failure.message), (
      response,
    ) {
      _allNotifications.addAll(response.results);
      _nextCursor = response.nextCursor;
      _hasMore = response.nextCursor != null;

      return List.from(_allNotifications);
    });
  }

  // ===============================
  // Refresh
  // ===============================
  Future<void> refreshNotifications() async {
    ref.invalidateSelf();
  }

  // ===============================
  // Pagination
  // ===============================
  Future<void> loadMore() async {
    if (!_hasMore || state.isLoading) return;

    final result = await ref.read(getNotificationsUsecaseProvider)(
      limit: _pageSize,
      cursor: _nextCursor,
    );

    result.fold(
      (failure) {
        state = AsyncError(failure.message, StackTrace.current);
      },
      (response) {
        _allNotifications.addAll(response.results);
        _nextCursor = response.nextCursor;
        _hasMore = response.nextCursor != null;

        state = AsyncData(List.from(_allNotifications));
      },
    );
  }

  // ===============================
  // Mark Single As Read (OPTIMISTIC)
  // ===============================
  Future<bool> markAsRead(String id) async {
    final index = _allNotifications.indexWhere((n) => n.id == id);

    if (index == -1) return false;

    final original = _allNotifications[index];

    /// optimistic update
    _allNotifications[index] = original.copyWith(isRead: true);
    state = AsyncData(List.from(_allNotifications));

    final result = await ref.read(markNotificationsReadUsecaseProvider)(
      notificationIds: [id],
    );

    return result.fold((failure) {
      /// rollback if failed
      _allNotifications[index] = original;
      state = AsyncData(List.from(_allNotifications));
      return false;
    }, (_) => true);
  }

  // ===============================
  // Mark All As Read (OPTIMISTIC)
  // ===============================
  Future<bool> markAllAsRead() async {
    final backup = List<NotificationModel>.from(_allNotifications);

    for (int i = 0; i < _allNotifications.length; i++) {
      _allNotifications[i] = _allNotifications[i].copyWith(isRead: true);
    }

    state = AsyncData(List.from(_allNotifications));

    final result = await ref.read(markNotificationsReadUsecaseProvider)(
      markAll: true,
    );

    return result.fold((failure) {
      /// rollback
      _allNotifications
        ..clear()
        ..addAll(backup);

      state = AsyncData(List.from(_allNotifications));
      return false;
    }, (_) => true);
  }

  // ===============================
  // Archive Notifications
  // ===============================
  void archive(List<String> ids) {
    _allNotifications.removeWhere((n) => ids.contains(n.id));
    state = AsyncData(List.from(_allNotifications));
  }
}

final notificationControllerProvider =
    AsyncNotifierProvider<NotificationController, List<NotificationModel>>(
      NotificationController.new,
    );

// import 'package:hooks_riverpod/hooks_riverpod.dart';
// import '../../data/models/notification_model.dart';
// import '../../domain/usecases/get_notifications_usecase.dart';
// import '../../domain/usecases/mark_notifications_read_usecase.dart';
// import '../../providers/notification_providers.dart';

// class NotificationController extends AsyncNotifier<List<NotificationModel>> {
//   static const int _pageSize = 20;

//   late final GetNotificationsUsecase _getNotificationsUsecase;
//   late final MarkNotificationsReadUsecase _markReadUsecase;

//   final List<NotificationModel> _allNotifications = [];

//   String? _nextCursor;
//   bool _hasMore = true;

//   bool get hasMore => _hasMore;

//   /// Unread count derived from state (always reactive)
//   int get unreadCount => _allNotifications.where((n) => !n.isRead).length;

//   @override
//   Future<List<NotificationModel>> build() async {
//     _getNotificationsUsecase = ref.read(getNotificationsUsecaseProvider);
//     _markReadUsecase = ref.read(markNotificationsReadUsecaseProvider);

//     return _fetchInitial();
//   }

//   // ===============================
//   // Initial Fetch
//   // ===============================
//   Future<List<NotificationModel>> _fetchInitial() async {
//     _allNotifications.clear();
//     _nextCursor = null;
//     _hasMore = true;

//     final result = await _getNotificationsUsecase(
//       limit: _pageSize,
//       cursor: null,
//     );

//     return result.fold((failure) => throw Exception(failure.message), (
//       response,
//     ) async {
//       _allNotifications.addAll(response.results);
//       _nextCursor = response.nextCursor;
//       _hasMore = response.nextCursor != null;

//       return List.from(_allNotifications);
//     });
//   }

//   // ===============================
//   // Refresh
//   // ===============================
//   Future<void> refreshNotifications() async {
//     state = const AsyncLoading();
//     state = await AsyncValue.guard(() => _fetchInitial());
//   }

//   // ===============================
//   // Pagination
//   // ===============================
//   Future<void> loadMore() async {
//     if (!_hasMore || state.isLoading) return;

//     final result = await _getNotificationsUsecase(
//       limit: _pageSize,
//       cursor: _nextCursor,
//     );

//     result.fold(
//       (failure) {
//         state = AsyncError(failure.message, StackTrace.current);
//       },
//       (response) {
//         _allNotifications.addAll(response.results);
//         _nextCursor = response.nextCursor;
//         _hasMore = response.nextCursor != null;

//         state = AsyncData(List.from(_allNotifications));
//       },
//     );
//   }

//   // ===============================
//   // Mark Single As Read (OPTIMISTIC)
//   // ===============================
//   Future<bool> markAsRead(String id) async {
//     final index = _allNotifications.indexWhere((element) => element.id == id);

//     if (index == -1) return false;

//     // 🔥 OPTIMISTIC UPDATE FIRST
//     _allNotifications[index] = _allNotifications[index].copyWith(isRead: true);

//     state = AsyncData(List.from(_allNotifications));

//     final result = await _markReadUsecase(notificationIds: [id]);

//     return result.fold((failure) {
//       // ❌ rollback if failed
//       _allNotifications[index] = _allNotifications[index].copyWith(
//         isRead: false,
//       );

//       state = AsyncData(List.from(_allNotifications));
//       return false;
//     }, (_) => true);
//   }

//   // ===============================
//   // Mark All As Read (OPTIMISTIC)
//   // ===============================
//   Future<bool> markAllAsRead() async {
//     // 🔥 optimistic
//     for (int i = 0; i < _allNotifications.length; i++) {
//       _allNotifications[i] = _allNotifications[i].copyWith(isRead: true);
//     }

//     state = AsyncData(List.from(_allNotifications));

//     final result = await _markReadUsecase(markAll: true);

//     return result.fold((failure) => false, (_) => true);
//   }

//   // ===============================
//   // Archive
//   // ===============================
//   void archive(List<String> ids) {
//     _allNotifications.removeWhere((n) => ids.contains(n.id));
//     state = AsyncData(List.from(_allNotifications));
//   }
// }

// final notificationControllerProvider =
//     AsyncNotifierProvider<NotificationController, List<NotificationModel>>(
//       NotificationController.new,
//     );
