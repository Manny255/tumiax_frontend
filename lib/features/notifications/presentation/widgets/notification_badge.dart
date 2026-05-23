import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import '../../../../core/themes/app_theme.dart';
import '../controllers/notification_controller.dart';

class NotificationBadge extends ConsumerWidget {
  final Color? color;
  final double size;

  const NotificationBadge({super.key, this.color, this.size = 18});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final notificationsAsync = ref.watch(notificationControllerProvider);

    final count = notificationsAsync.maybeWhen(
      data: (_) =>
          ref.read(notificationControllerProvider.notifier).unreadCount,
      orElse: () => 0,
    );

    if (count == 0) return const SizedBox.shrink();

    return Container(
      padding: const EdgeInsets.all(4),
      decoration: BoxDecoration(
        color: color ?? Colors.red,
        shape: BoxShape.circle,
      ),
      constraints: BoxConstraints(minWidth: size, minHeight: size),
      child: Center(
        child: Text(
          count > 99 ? '99+' : count.toString(),
          style: TextStyle(
            color: AppTheme.textLight,
            fontSize: size * 0.6,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
