import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../../../core/localization/app_localizations.dart';
import '../../../../core/themes/app_theme.dart';
import '../../data/models/credit_line_model.dart';

class CreditLineCard extends StatelessWidget {
  final CreditLineModel creditLine;

  const CreditLineCard({super.key, required this.creditLine});

  @override
  Widget build(BuildContext context) {
    final t = AppLocalizations.of(context);

    final formatCurrency = NumberFormat.currency(
      locale: 'en_TZ',
      symbol: 'TZS ',
      decimalDigits: 0,
    );

    final utilization =
        (creditLine.usedAmount / creditLine.amountAsDouble) * 100;

    return Container(
      width: 200,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(6),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.05),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            /// ICON + TITLE (Same Line)
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    color: AppTheme.primaryColor.withOpacity(0.1),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: _buildAssetIcon(creditLine.asset.categoryName),
                ),
                const SizedBox(width: 8),
                Expanded(
                  child: Text(
                    creditLine.asset.title,
                    style: AppTheme.body2.copyWith(fontWeight: FontWeight.bold),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ],
            ),

            const SizedBox(height: 10),

            /// TOTAL AMOUNT
            Text(
              formatCurrency.format(creditLine.amountAsDouble),
              style: AppTheme.body1.copyWith(
                color: AppTheme.primaryColor,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 10),

            /// USED PROGRESS
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      t.translate('used'),
                      style: AppTheme.caption.copyWith(fontSize: 10),
                    ),
                    Text(
                      '${utilization.toStringAsFixed(0)}%',
                      style: AppTheme.caption.copyWith(
                        fontSize: 10,
                        fontWeight: FontWeight.bold,
                        color: utilization > 80
                            ? AppTheme.errorColor
                            : AppTheme.secondaryColor,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 4),
                ClipRRect(
                  borderRadius: BorderRadius.circular(4),
                  child: LinearProgressIndicator(
                    value: utilization / 100,
                    backgroundColor: Colors.grey.shade200,
                    valueColor: AlwaysStoppedAnimation<Color>(
                      utilization > 80
                          ? AppTheme.errorColor
                          : AppTheme.secondaryColor,
                    ),
                    minHeight: 6,
                  ),
                ),
              ],
            ),

            const SizedBox(height: 10),

            /// AVAILABLE BALANCE
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  t.translate('available'),
                  style: AppTheme.caption.copyWith(fontSize: 10),
                ),
                Text(
                  formatCurrency.format(creditLine.remainingBalanceAsDouble),
                  style: AppTheme.caption.copyWith(
                    fontSize: 10,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildAssetIcon(String? category) {
    final safeCategory = category?.toLowerCase() ?? '';

    IconData iconData;
    Color iconColor;

    switch (safeCategory) {
      case 'motorcycle':
        iconData = Icons.motorcycle;
        iconColor = Colors.orange;
        break;
      case 'car':
        iconData = Icons.directions_car;
        iconColor = Colors.blue;
        break;
      case 'house':
        iconData = Icons.home;
        iconColor = Colors.green;
        break;
      case 'land':
        iconData = Icons.landscape;
        iconColor = Colors.brown;
        break;
      default:
        iconData = Icons.attach_money;
        iconColor = AppTheme.primaryColor;
    }

    return Icon(iconData, color: iconColor, size: 20);
  }
}

// import 'package:flutter/material.dart';
// import 'package:intl/intl.dart';

// import '../../../../core/themes/app_theme.dart';
// import '../../data/models/credit_line_model.dart';

// class CreditLineCard extends StatelessWidget {
//   final CreditLineModel creditLine;

//   const CreditLineCard({super.key, required this.creditLine});

//   @override
//   Widget build(BuildContext context) {
//     final formatCurrency = NumberFormat.currency(
//       locale: 'en_TZ',
//       symbol: 'TZS ',
//       decimalDigits: 0,
//     );

//     final utilization = creditLine.usedAmount / creditLine.amountAsDouble * 100;
//     final isActive = creditLine.status == 'ACTIVE';

//     return Container(
//       width: 200,
//       decoration: BoxDecoration(
//         color: Colors.white,
//         borderRadius: BorderRadius.circular(16),
//         border: Border.all(
//           color: isActive ? AppTheme.primaryColor : Colors.grey.shade200,
//           width: isActive ? 2 : 1,
//         ),
//         boxShadow: [
//           BoxShadow(
//             color: Colors.grey.withOpacity(0.05),
//             blurRadius: 10,
//             offset: const Offset(0, 4),
//           ),
//         ],
//       ),
//       child: Stack(
//         children: [
//           // Status indicator
//           if (!isActive)
//             Positioned(
//               top: 8,
//               right: 8,
//               child: Container(
//                 padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
//                 decoration: BoxDecoration(
//                   color: Colors.grey.shade200,
//                   borderRadius: BorderRadius.circular(4),
//                 ),
//                 child: Text(
//                   creditLine.status,
//                   style: AppTheme.caption.copyWith(fontSize: 10),
//                 ),
//               ),
//             ),

//           Padding(
//             padding: const EdgeInsets.all(12),
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 // Asset image/icon
//                 Container(
//                   padding: const EdgeInsets.all(8),
//                   decoration: BoxDecoration(
//                     color: AppTheme.primaryColor.withOpacity(0.1),
//                     borderRadius: BorderRadius.circular(8),
//                   ),
//                   child: _buildAssetIcon(creditLine.asset.categoryName),
//                 ),

//                 const SizedBox(height: 8),

//                 // Asset title
//                 Text(
//                   creditLine.asset.title,
//                   style: AppTheme.body2.copyWith(fontWeight: FontWeight.bold),
//                   maxLines: 1,
//                   overflow: TextOverflow.ellipsis,
//                 ),

//                 const SizedBox(height: 4),

//                 // Amount
//                 Text(
//                   formatCurrency.format(creditLine.amountAsDouble),
//                   style: AppTheme.body1.copyWith(
//                     color: AppTheme.primaryColor,
//                     fontWeight: FontWeight.bold,
//                   ),
//                 ),

//                 const SizedBox(height: 8),

//                 // Progress indicator
//                 Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     Row(
//                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                       children: [
//                         Text(
//                           'Used',
//                           style: AppTheme.caption.copyWith(fontSize: 10),
//                         ),
//                         Text(
//                           '${utilization.toStringAsFixed(0)}%',
//                           style: AppTheme.caption.copyWith(
//                             fontSize: 10,
//                             fontWeight: FontWeight.bold,
//                             color: utilization > 80
//                                 ? AppTheme.errorColor
//                                 : AppTheme.secondaryColor,
//                           ),
//                         ),
//                       ],
//                     ),
//                     const SizedBox(height: 2),
//                     ClipRRect(
//                       borderRadius: BorderRadius.circular(2),
//                       child: LinearProgressIndicator(
//                         value: utilization / 100,
//                         backgroundColor: Colors.grey.shade200,
//                         valueColor: AlwaysStoppedAnimation<Color>(
//                           utilization > 80
//                               ? AppTheme.errorColor
//                               : AppTheme.secondaryColor,
//                         ),
//                         minHeight: 4,
//                       ),
//                     ),
//                   ],
//                 ),

//                 const SizedBox(height: 8),

//                 // Remaining balance
//                 Row(
//                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                   children: [
//                     Text(
//                       'Remaining',
//                       style: AppTheme.caption.copyWith(fontSize: 10),
//                     ),
//                     Text(
//                       formatCurrency.format(
//                         creditLine.remainingBalanceAsDouble,
//                       ),
//                       style: AppTheme.caption.copyWith(
//                         fontSize: 10,
//                         fontWeight: FontWeight.bold,
//                       ),
//                     ),
//                   ],
//                 ),
//               ],
//             ),
//           ),
//         ],
//       ),
//     );
//   }

//   Widget _buildAssetIcon(String? category) {
//     final safeCategory = category?.toLowerCase() ?? '';

//     IconData iconData;
//     Color iconColor;

//     switch (safeCategory) {
//       case 'motorcycle':
//         iconData = Icons.motorcycle;
//         iconColor = Colors.orange;
//         break;
//       case 'car':
//         iconData = Icons.directions_car;
//         iconColor = Colors.blue;
//         break;
//       case 'house':
//         iconData = Icons.home;
//         iconColor = Colors.green;
//         break;
//       case 'land':
//         iconData = Icons.landscape;
//         iconColor = Colors.brown;
//         break;
//       default:
//         iconData = Icons.attach_money;
//         iconColor = AppTheme.primaryColor;
//     }

//     return Icon(iconData, color: iconColor, size: 20);
//   }
// }
