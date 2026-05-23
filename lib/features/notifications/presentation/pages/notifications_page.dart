
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:timeago/timeago.dart' as timeago;

import '../../../../core/localization/app_localizations.dart';
import '../../../../core/themes/app_theme.dart';
import '../../../../core/widgets/empty_state.dart';
import '../../../../core/widgets/tumiax_button.dart';
import '../../data/models/notification_model.dart';
import '../controllers/notification_controller.dart';

class NotificationsPage extends HookConsumerWidget {
  const NotificationsPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final t = AppLocalizations.of(context);
    final scrollController = useScrollController();
    final isRefreshing = useState(false);

    final notificationsAsync = ref.watch(notificationControllerProvider);
    final controller = ref.read(notificationControllerProvider.notifier);

    // Pull to refresh
    Future<void> _refresh() async {
      isRefreshing.value = true;
      await controller.refreshNotifications();
      isRefreshing.value = false;
    }

    // Pagination Listener
    useEffect(() {
      void onScroll() {
        if (scrollController.position.pixels >=
            scrollController.position.maxScrollExtent - 300) {
          controller.loadMore();
        }
      }

      scrollController.addListener(onScroll);
      return () => scrollController.removeListener(onScroll);
    }, [scrollController]);

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios, color: AppTheme.primaryColor),
          onPressed: () => context.pop(),
        ),
        title: Text(
          t.translate('notifications'),
          style: AppTheme.heading3.copyWith(color: AppTheme.primaryColor),
        ),
        actions: [
          // Mark all as read button
          if (controller.unreadCount > 0)
            Container(
              margin: const EdgeInsets.only(right: 8),
              decoration: BoxDecoration(
                color: AppTheme.primaryColor.withOpacity(0.1),
                borderRadius: BorderRadius.circular(20),
              ),
              child: IconButton(
                icon: const Icon(Icons.done_all, color: AppTheme.primaryColor),
                onPressed: () => controller.markAllAsRead(),
                tooltip: t.translate('mark_all_read'),
              ),
            ),
        ],
      ),
      body: RefreshIndicator(
        onRefresh: _refresh,
        color: AppTheme.primaryColor,
        backgroundColor: Colors.white,
        displacement: 40,
        child: notificationsAsync.when(
          loading: () => const _NotificationShimmerLoader(),

          error: (error, _) => Center(
            child: Padding(
              padding: const EdgeInsets.all(32),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    padding: const EdgeInsets.all(20),
                    decoration: BoxDecoration(
                      color: AppTheme.errorColor.withOpacity(0.1),
                      shape: BoxShape.circle,
                    ),
                    child: Icon(
                      Icons.wifi_off_rounded,
                      size: 48,
                      color: AppTheme.errorColor,
                    ),
                  ),
                  const SizedBox(height: 24),
                  Text(
                    t.translate('failed_to_load_notifications'),
                    style: AppTheme.body1.copyWith(fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    error.toString(),
                    style: AppTheme.caption.copyWith(
                      color: Colors.grey.shade600,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 24),
                  TumiaxButton(
                    text: t.translate('retry'),
                    onPressed: _refresh,
                    width: 200,
                  ),
                ],
              ),
            ),
          ),

          data: (notifications) {
            if (notifications.isEmpty) {
              return _buildEmptyState(context, t);
            }

            return ListView.builder(
              controller: scrollController,
              padding: const EdgeInsets.only(
                top: AppTheme.defaultPadding,
                bottom: AppTheme.defaultPadding,
              ),
              itemCount: notifications.length + (controller.hasMore ? 1 : 0),
              itemBuilder: (context, index) {
                if (index == notifications.length) {
                  return const _PaginationLoader();
                }

                final notification = notifications[index];

                return NotificationTile(
                  notification: notification,
                  onTap: () {
                    controller.markAsRead(notification.id);

                    // if (notification.isActionable &&
                    //     notification.actionRoute != null) {
                    //   context.push(notification.actionRoute!);
                    // }
                  },
                  onMarkRead: () => controller.markAsRead(notification.id),
                  onArchive: () => controller.archive([notification.id]),
                );
              },
            );
          },
        ),
      ),
    );
  }

  Widget _buildEmptyState(BuildContext context, AppLocalizations t) {
    return SingleChildScrollView(
      physics: const AlwaysScrollableScrollPhysics(),
      child: Container(
        height: MediaQuery.of(context).size.height - 200,
        child: EmptyState(
          icon: Icons.notifications_off_rounded,
          // iconSize: 80,
          title: t.translate('no_notifications'),
          subtitle: t.translate('no_notifications_description'),
          // action: TumiaxButton(
          //   text: t.translate('browse_assets'),
          //   onPressed: () => context.go('/assets'),
          //   width: 200,
          //   isOutlined: true,
          // ),
        ),
      ),
    );
  }
}

class NotificationTile extends StatelessWidget {
  final NotificationModel notification;
  final VoidCallback onTap;
  final VoidCallback onMarkRead;
  final VoidCallback onArchive;

  const NotificationTile({
    super.key,
    required this.notification,
    required this.onTap,
    required this.onMarkRead,
    required this.onArchive,
  });

  @override
  Widget build(BuildContext context) {
    return TweenAnimationBuilder<double>(
      tween: Tween(begin: 0.0, end: 1.0),
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeOut,
      builder: (context, value, child) {
        return Opacity(
          opacity: value,
          child: Transform.translate(
            offset: Offset(0, 20 * (1 - value)),
            child: child,
          ),
        );
      },
      child: Container(
        margin: const EdgeInsets.symmetric(
          horizontal: AppTheme.defaultPadding,
          vertical: 4,
        ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          boxShadow: notification.isRead
              ? null
              : [
                  BoxShadow(
                    color: notification.priorityColor.withOpacity(0.1),
                    blurRadius: 8,
                    offset: const Offset(0, 2),
                  ),
                ],
        ),
        child: Material(
          color: notification.isRead
              ? Colors.white
              : notification.priorityColor.withOpacity(0.02),
          borderRadius: BorderRadius.circular(16),
          child: InkWell(
            onTap: onTap,
            borderRadius: BorderRadius.circular(16),
            child: Stack(
              children: [
                // Unread indicator line
                if (!notification.isRead)
                  Positioned(
                    left: 0,
                    top: 0,
                    bottom: 0,
                    child: Container(
                      width: 4,
                      decoration: BoxDecoration(
                        color: notification.priorityColor,
                        borderRadius: const BorderRadius.horizontal(
                          left: Radius.circular(16),
                        ),
                      ),
                    ),
                  ),

                Padding(
                  padding: const EdgeInsets.all(16),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Icon with animated background
                      Container(
                        width: 48,
                        height: 48,
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            colors: [
                              notification.priorityColor.withOpacity(0.2),
                              notification.priorityColor.withOpacity(0.05),
                            ],
                            begin: Alignment.topLeft,
                            end: Alignment.bottomRight,
                          ),
                          borderRadius: BorderRadius.circular(16),
                        ),
                        child: Center(
                          child: Icon(
                            notification.icon,
                            color: notification.priorityColor,
                            size: 24,
                          ),
                        ),
                      ),

                      const SizedBox(width: 16),

                      // Content
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            // Title with category badge
                            Row(
                              children: [
                                Expanded(
                                  child: Text(
                                    notification.title,
                                    style: AppTheme.body1.copyWith(
                                      fontWeight: notification.isRead
                                          ? FontWeight.normal
                                          : FontWeight.bold,
                                    ),
                                  ),
                                ),
                                // const SizedBox(width: 8),
                                // if (notification.categoryName != null)
                                //   Container(
                                //     padding: const EdgeInsets.symmetric(
                                //       horizontal: 8,
                                //       vertical: 2,
                                //     ),
                                //     decoration: BoxDecoration(
                                //       color: notification.priorityColor
                                //           .withOpacity(0.1),
                                //       borderRadius: BorderRadius.circular(12),
                                //     ),
                                //     child: Text(
                                //       notification.categoryName!,
                                //       style: AppTheme.caption.copyWith(
                                //         color: notification.priorityColor,
                                //         fontSize: 10,
                                //         fontWeight: FontWeight.w600,
                                //       ),
                                //     ),
                                //   ),
                              ],
                            ),

                            const SizedBox(height: 8),

                            // Message
                            Text(
                              notification.message,
                              style: AppTheme.body2.copyWith(
                                color: Colors.grey.shade700,
                                height: 1.4,
                              ),
                            ),

                            const SizedBox(height: 12),

                            // Footer with time and actions
                            Row(
                              children: [
                                // Time
                                Row(
                                  children: [
                                    Icon(
                                      Icons.access_time,
                                      size: 14,
                                      color: Colors.grey.shade400,
                                    ),
                                    const SizedBox(width: 4),
                                    Text(
                                      notification.timeAgo ??
                                          timeago.format(
                                            notification.createdAt,
                                            locale: 'en_short',
                                          ),
                                      style: AppTheme.caption.copyWith(
                                        color: Colors.grey.shade500,
                                      ),
                                    ),
                                  ],
                                ),

                                const Spacer(),

                                // Action buttons
                                // if (!notification.isRead)
                                //   _buildIconButton(
                                //     icon: Icons.done,
                                //     color: AppTheme.secondaryColor,
                                //     onPressed: onMarkRead,
                                //     tooltip: 'Mark as read',
                                //   ),

                                // _buildIconButton(
                                //   icon: Icons.archive_outlined,
                                //   color: Colors.grey.shade600,
                                //   onPressed: onArchive,
                                //   tooltip: 'Archive',
                                // ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  // Widget _buildIconButton({
  //   required IconData icon,
  //   required Color color,
  //   required VoidCallback onPressed,
  //   String? tooltip,
  // }) {
  //   return Container(
  //     margin: const EdgeInsets.only(left: 4),
  //     decoration: BoxDecoration(
  //       color: color.withOpacity(0.1),
  //       borderRadius: BorderRadius.circular(8),
  //     ),
  //     child: IconButton(
  //       icon: Icon(icon, size: 18, color: color),
  //       onPressed: onPressed,
  //       tooltip: tooltip,
  //       padding: const EdgeInsets.all(6),
  //       constraints: const BoxConstraints(),
  //       splashRadius: 20,
  //     ),
  //   );
  // }
}

class _NotificationShimmerLoader extends StatelessWidget {
  const _NotificationShimmerLoader();

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: const EdgeInsets.all(AppTheme.defaultPadding),
      itemCount: 5,
      itemBuilder: (context, index) {
        return Container(
          margin: const EdgeInsets.only(bottom: 12),
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: Colors.grey.shade100,
            borderRadius: BorderRadius.circular(16),
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: 48,
                height: 48,
                decoration: BoxDecoration(
                  color: Colors.grey.shade300,
                  borderRadius: BorderRadius.circular(16),
                ),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      width: 150,
                      height: 16,
                      decoration: BoxDecoration(
                        color: Colors.grey.shade300,
                        borderRadius: BorderRadius.circular(4),
                      ),
                    ),
                    const SizedBox(height: 8),
                    Container(
                      width: double.infinity,
                      height: 12,
                      decoration: BoxDecoration(
                        color: Colors.grey.shade300,
                        borderRadius: BorderRadius.circular(4),
                      ),
                    ),
                    const SizedBox(height: 8),
                    Container(
                      width: 100,
                      height: 12,
                      decoration: BoxDecoration(
                        color: Colors.grey.shade300,
                        borderRadius: BorderRadius.circular(4),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}

class _PaginationLoader extends StatelessWidget {
  const _PaginationLoader();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      child: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              width: 20,
              height: 20,
              child: CircularProgressIndicator(
                strokeWidth: 2,
                valueColor: AlwaysStoppedAnimation<Color>(
                  AppTheme.primaryColor,
                ),
              ),
            ),
            const SizedBox(width: 12),
            Text(
              'Loading more...',
              style: AppTheme.caption.copyWith(color: Colors.grey.shade600),
            ),
          ],
        ),
      ),
    );
  }
}
