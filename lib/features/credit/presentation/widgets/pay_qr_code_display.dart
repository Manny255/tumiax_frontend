import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../../core/localization/app_localizations.dart';
import '../../../../core/themes/app_theme.dart';
import '../../../../core/widgets/user_avatar.dart';
import '../../../auth/data/models/user_model.dart';

class PayQRCodeDisplay extends ConsumerWidget {
  final UserModel user;

  const PayQRCodeDisplay({super.key, required this.user});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final t = AppLocalizations.of(context);

    // Create QR data with user's email
    // Format: TUMIAX:PAY:email@example.com
    final qrData = 'TUMIAX:PAY:${user.email}';

    return Container(
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: Colors.grey.shade200),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.05),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        children: [
          Text(t.translate("your_qr_code"), style: AppTheme.heading3),
          const SizedBox(height: 8),
          Text(
            t.translate("scan_to_pay"),
            style: AppTheme.body2.copyWith(color: Colors.grey),
          ),
          const SizedBox(height: 16),

          // QR Code
          Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(16),
              border: Border.all(color: Colors.grey.shade200),
            ),
            child: QrImageView(
              data: qrData,
              version: QrVersions.auto,
              size: 200,
              backgroundColor: Colors.white,
              errorCorrectionLevel: QrErrorCorrectLevel.H,
            ),
          ),

          const SizedBox(height: 16),

          // User Info
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
            decoration: BoxDecoration(
              color: Colors.grey.shade50,
              borderRadius: BorderRadius.circular(20),
              border: Border.all(color: Colors.grey.shade200),
            ),
            child: IntrinsicWidth(
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  UserAvatar(user: user),
                  const SizedBox(width: 12),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          user.fullName ?? user.email[0],
                          style: AppTheme.body2.copyWith(
                            fontWeight: FontWeight.w600,
                          ),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                        Text(
                          user.email,
                          style: AppTheme.caption,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ],
                    ),
                  ),

                  const SizedBox(width: 8),

                  SizedBox(
                    width: 28,
                    height: 28,
                    child: IconButton(
                      icon: const Icon(Icons.copy, size: 18),
                      color: AppTheme.primaryColor,
                      onPressed: () {
                        Clipboard.setData(ClipboardData(text: user.email));
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text(t.translate("email_copied")),
                            duration: const Duration(seconds: 1),
                            backgroundColor: AppTheme.secondaryColor,
                          ),
                        );
                      },
                      padding: EdgeInsets.zero,
                      constraints: const BoxConstraints(),
                      splashRadius: 20,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
// import 'package:qr_flutter/qr_flutter.dart';
// import 'package:hooks_riverpod/hooks_riverpod.dart';

// import '../../../../core/localization/app_localizations.dart';
// import '../../../../core/themes/app_theme.dart';
// import '../../../../core/widgets/user_avatar.dart';
// import '../../../auth/data/models/user_model.dart';

// class PayQRCodeDisplay extends ConsumerWidget {
//   final UserModel user;

//   const PayQRCodeDisplay({super.key, required this.user});

//   @override
//   Widget build(BuildContext context, WidgetRef ref) {
//     final t = AppLocalizations.of(context);

//     // Create QR data with user's email
//     // Format: TUMIAX:PAY:email@example.com
//     final qrData = 'TUMIAX:PAY:${user.email}';

//     return Container(
//       padding: const EdgeInsets.all(24),
//       decoration: BoxDecoration(
//         color: Colors.white,
//         borderRadius: BorderRadius.circular(16),
//         border: Border.all(color: Colors.grey.shade200),
//         boxShadow: [
//           BoxShadow(
//             color: Colors.grey.withOpacity(0.05),
//             blurRadius: 10,
//             offset: const Offset(0, 4),
//           ),
//         ],
//       ),
//       child: Column(
//         children: [
//           Text(t.translate("your_qr_code"), style: AppTheme.heading3),
//           const SizedBox(height: 8),
//           Text(
//             t.translate("scan_to_pay"),
//             style: AppTheme.body2.copyWith(color: Colors.grey),
//           ),
//           const SizedBox(height: 16),

//           // QR Code
//           Container(
//             padding: const EdgeInsets.all(16),
//             decoration: BoxDecoration(
//               color: Colors.white,
//               borderRadius: BorderRadius.circular(16),
//               border: Border.all(color: Colors.grey.shade200),
//             ),
//             child: QrImageView(
//               data: qrData,
//               version: QrVersions.auto,
//               size: 200,
//               backgroundColor: Colors.white,
//               errorCorrectionLevel: QrErrorCorrectLevel.H,
//             ),
//           ),

//           const SizedBox(height: 16),

//           // User Info
//           Container(
//             padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
//             decoration: BoxDecoration(
//               color: Colors.grey.shade50,
//               borderRadius: BorderRadius.circular(20),
//               border: Border.all(color: Colors.grey.shade200),
//             ),
//             child: Row(
//               mainAxisSize: MainAxisSize.min,
//               children: [
//                UserAvatar(user: user),
//                 const SizedBox(width: 12),
//                 Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     Text(
//                       overflow: TextOverflow.ellipsis,
//                       user.fullName ?? user.email[0],
//                       style: AppTheme.body2.copyWith(
//                         fontWeight: FontWeight.w600,
//                       ),
//                     ),
//                     Text(user.email, style: AppTheme.caption,
//                       overflow: TextOverflow.ellipsis,
//                     ),
//                   ],
//                 ),
//                 const SizedBox(width: 8),
//                 IconButton(
//                   icon: const Icon(Icons.copy, size: 18),
//                   color: AppTheme.primaryColor,
//                   onPressed: () {
//                     Clipboard.setData(ClipboardData(text: user.email));
//                     ScaffoldMessenger.of(context).showSnackBar(
//                       SnackBar(
//                         content: Text(t.translate("email_copied")),
//                         duration: const Duration(seconds: 1),
//                         backgroundColor: AppTheme.secondaryColor,
//                       ),
//                     );
//                   },
//                   padding: EdgeInsets.zero,
//                   constraints: const BoxConstraints(),
//                   splashRadius: 20,
//                 ),
//               ],
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
