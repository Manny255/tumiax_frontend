
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/themes/app_theme.dart';
import '../../../../core/localization/app_localizations.dart';

class SectionHeader extends StatelessWidget {
  final String title;
  final String? seeAllRoute;
  final VoidCallback? onSeeAllPressed;
  final EdgeInsetsGeometry padding;

  const SectionHeader({
    super.key,
    required this.title,
    this.seeAllRoute,
    this.onSeeAllPressed,
    this.padding = EdgeInsets.zero,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: Text(
              title,
              style: AppTheme.heading3,
              overflow: TextOverflow.ellipsis,
            ),
          ),
          if (seeAllRoute != null || onSeeAllPressed != null)
            TextButton(
              onPressed:
                  onSeeAllPressed ??
                  (seeAllRoute != null
                      ? () => context.push(seeAllRoute!)
                      : null),
              child: Text(AppLocalizations.of(context).translate('see_all')),
            ),
        ],
      ),
    );
  }
}

// class SectionHeader extends StatelessWidget {
//   final String title;
//   final String? seeAllRoute;
//   final VoidCallback? onSeeAllPressed;

//   const SectionHeader({
//     super.key,
//     required this.title,
//     this.seeAllRoute,
//     this.onSeeAllPressed,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return Row(
//       mainAxisAlignment: MainAxisAlignment.spaceBetween,
//       children: [
//         Expanded(
//           child: Text(
//             title,
//             style: AppTheme.heading3,
//             overflow: TextOverflow.ellipsis,
//           ),
//         ),
//         if (seeAllRoute != null || onSeeAllPressed != null)
//           TextButton(
//             onPressed:
//                 onSeeAllPressed ??
//                 (seeAllRoute != null ? () => context.push(seeAllRoute!) : null),
//             child: Text(AppLocalizations.of(context).translate('see_all')),
//           ),
//       ],
//     );
//   }
// }
