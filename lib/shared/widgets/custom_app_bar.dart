import 'package:flutter/material.dart';
import '../../core/localization/app_localizations.dart';
import '../../core/themes/app_theme.dart';
import '../../features/notifications/presentation/widgets/notification_badge.dart';


class CustomAppBar extends StatelessWidget {
  final bool isScrolled;
  final String? userName;
  final VoidCallback onNotificationPressed;

  const CustomAppBar({
    super.key,
    required this.isScrolled,
    this.userName,
    required this.onNotificationPressed,
  });

  @override
  Widget build(BuildContext context) {
    final t = AppLocalizations.of(context);
    final name = userName;

    final greeting = (name != null && name.isNotEmpty)
        ? t.translate('hello_user').replaceAll('{name}', name)
        : t.translate('hello');

    return SliverAppBar(
      expandedHeight: 120,
      floating: true,
      pinned: true,
      backgroundColor: isScrolled ? AppTheme.primaryColor : Colors.transparent,

      flexibleSpace: FlexibleSpaceBar(
        titlePadding: const EdgeInsets.symmetric(horizontal: 16),
        title: Text(
          greeting,
          style: TextStyle(
            color: isScrolled ? Colors.white : AppTheme.primaryColor,
            fontWeight: FontWeight.w600,
          ),
          overflow: TextOverflow.ellipsis,
        ),
        background: const DecoratedBox(
          decoration: BoxDecoration(gradient: AppTheme.primaryGradient),
        ),
      ),

      actions: [
        Stack(
          clipBehavior: Clip.none,
          children: [
            IconButton(
              iconSize: 30,
              icon: const Icon(Icons.notifications_outlined),
              onPressed: onNotificationPressed,
              color: isScrolled ? Colors.white : AppTheme.primaryColor,
            ),
            Positioned(
              right: 6,
              top: 6,
              child: const NotificationBadge(size: 16, color: AppTheme.primaryColor),
            ),
          ],
        ),
        const SizedBox(width: 12),
      ],
    );
  }
}


// class CustomAppBar extends StatelessWidget {
//   final bool isScrolled;
//   final String? userName;
//   final int notificationCount;
//   final VoidCallback? onNotificationPressed;

//   const CustomAppBar({
//     super.key,
//     required this.isScrolled,
//     this.userName,
//     this.notificationCount = 0,
//     this.onNotificationPressed,
//   });

//   @override
//   Widget build(BuildContext context) {
//     final t = AppLocalizations.of(context);
//     final name = userName;
//     final greeting = (name != null && name.isNotEmpty)
//         ? t.translate('hello_user').replaceAll('{name}', name)
//         : t.translate('hello');

//     return SliverAppBar(
//       expandedHeight: 120,
//       floating: true,
//       pinned: true,
//       backgroundColor: isScrolled ? AppTheme.primaryColor : Colors.transparent,

//       flexibleSpace: FlexibleSpaceBar(
//         titlePadding: const EdgeInsets.symmetric(horizontal: 16),
//         title: Text(
//           greeting,
//           style: TextStyle(
//             color: isScrolled ? Colors.white : AppTheme.primaryColor,
//             fontWeight: FontWeight.w600,
//           ),
//           overflow: TextOverflow.ellipsis,
//         ),
//         background: const DecoratedBox(
//           decoration: BoxDecoration(gradient: AppTheme.primaryGradient),
//         ),
//       ),

//       // 👇 Notification always visible
//       actions: [
//         Stack(
//           clipBehavior: Clip.none,
//           children: [
//             IconButton(
//               iconSize: 35,
//               icon: const Icon(Icons.notifications_outlined),
//               onPressed:
//                   onNotificationPressed ??
//                   () {
//                     ScaffoldMessenger.of(context).showSnackBar(
//                       const SnackBar(
//                         content: Text('Notifications coming soon!'),
//                       ),
//                     );
//                   },
//               color: isScrolled ? Colors.white : AppTheme.primaryColor,
//             ),
//             if (notificationCount > 0)
//               Positioned(
//                 right: 8,
//                 top: 8,
//                 child: Container(
//                   padding: const EdgeInsets.all(2),
//                   decoration: BoxDecoration(
//                     color: Colors.red,
//                     borderRadius: BorderRadius.circular(10),
//                   ),
//                   constraints: const BoxConstraints(
//                     minWidth: 16,
//                     minHeight: 16,
//                   ),
//                   child: Text(
//                     notificationCount > 99
//                         ? '99+'
//                         : notificationCount.toString(),
//                     style: const TextStyle(
//                       color: Colors.white,
//                       fontSize: 10,
//                       fontWeight: FontWeight.bold,
//                     ),
//                     textAlign: TextAlign.center,
//                   ),
//                 ),
//               ),
//           ],
//         ),
//         const SizedBox(width: 12),
//       ],
//     );
//   }
// }
