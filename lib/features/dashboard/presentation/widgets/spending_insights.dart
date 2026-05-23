// import 'package:flutter/material.dart';
// import '../../../credit/data/models/spending_analytics_model.dart';
// import '../../../../core/themes/app_theme.dart';
// import '../../../../core/localization/app_localizations.dart';

// class SpendingInsights extends StatelessWidget {
//   final SpendingAnalyticsModel analytics;

//   const SpendingInsights({super.key, required this.analytics});

//   @override
//   Widget build(BuildContext context) {
//     final t = AppLocalizations.of(context);

//     return Container(
//       padding: const EdgeInsets.all(16),
//       decoration: BoxDecoration(
//         color: Colors.white,
//         borderRadius: BorderRadius.circular(20),
//         boxShadow: [
//           BoxShadow(
//             color: Colors.grey.withValues(alpha: 0.1),
//             blurRadius: 10,
//             offset: const Offset(0, 5),
//           ),
//         ],
//       ),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           Text(t.translate('spending_insights'), style: AppTheme.heading3),
//           const SizedBox(height: 16),

//           Row(
//             children: [
//               Expanded(
//                 child: _buildInsightCard(
//                   icon: Icons.trending_up,
//                   label: t.translate('weekly_total'),
//                   value: 'TZS ${_formatAmount(analytics.totalWeeklySpending)}',
//                   color: analytics.isSpendingIncreasing
//                       ? Colors.orange
//                       : Colors.green,
//                 ),
//               ),
//               const SizedBox(width: 12),
//               Expanded(
//                 child: _buildInsightCard(
//                   icon: Icons.show_chart,
//                   label: t.translate('daily_average'),
//                   value: 'TZS ${_formatAmount(analytics.averageDailySpending)}',
//                   color: AppTheme.primaryColor,
//                 ),
//               ),
//             ],
//           ),

//           const SizedBox(height: 12),

//           if (analytics.highestSpendingDay != null)
//             _buildInsightRow(
//               icon: Icons.star,
//               label: t.translate('highest_spending_day'),
//               value:
//                   '${analytics.highestSpendingDay} (TZS ${_formatAmount(analytics.highestSpendingAmount)})',
//             ),

//           const SizedBox(height: 8),

//           _buildInsightRow(
//             icon: Icons.compare_arrows,
//             label: t.translate('vs_last_week'),
//             value: analytics.formattedWeekOverWeekChange,
//             valueColor: analytics.weekOverWeekChange > 0
//                 ? Colors.red
//                 : analytics.weekOverWeekChange < 0
//                 ? Colors.green
//                 : Colors.grey,
//           ),
//         ],
//       ),
//     );
//   }

//   Widget _buildInsightCard({
//     required IconData icon,
//     required String label,
//     required String value,
//     required Color color,
//   }) {
//     return Container(
//       padding: const EdgeInsets.all(12),
//       decoration: BoxDecoration(
//         color: color.withValues(alpha: 0.1),
//         borderRadius: BorderRadius.circular(12),
//       ),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           Icon(icon, color: color, size: 20),
//           const SizedBox(height: 8),
//          Text(
//             label,
//             style: AppTheme.caption.copyWith(color: Colors.grey[600]),
//             maxLines: 1,
//             overflow: TextOverflow.ellipsis,
//           ),
//           const SizedBox(height: 4),
//           Text(
//             value,
//             style: AppTheme.body1.copyWith(
//               color: color,
//               fontWeight: FontWeight.bold,
//             ),
//             maxLines: 1,
//             overflow: TextOverflow.ellipsis,
//           ),
//         ],
//       ),
//     );
//   }

// Widget _buildInsightRow({
//     required IconData icon,
//     required String label,
//     required String value,
//     Color? valueColor,
//   }) {
//     return Row(
//       children: [
//         Icon(icon, size: 18, color: Colors.grey[600]),
//         const SizedBox(width: 8),

//         /// Make label flexible
//         Expanded(
//           child: Text(
//             label,
//             style: AppTheme.body2.copyWith(color: Colors.grey[600]),
//             maxLines: 1,
//             overflow: TextOverflow.ellipsis,
//           ),
//         ),

//         const SizedBox(width: 8),

//         /// Value also protected
//         Flexible(
//           child: Text(
//             value,
//             textAlign: TextAlign.end,
//             maxLines: 1,
//             overflow: TextOverflow.ellipsis,
//             style: AppTheme.body2.copyWith(
//               color: valueColor ?? Colors.black,
//               fontWeight: FontWeight.w600,
//             ),
//           ),
//         ),
//       ],
//     );
//   }

//   String _formatAmount(double amount) {
//     if (amount >= 1000000) {
//       return '${(amount / 1000000).toStringAsFixed(1)}M';
//     } else if (amount >= 1000) {
//       return '${(amount / 1000).toStringAsFixed(0)}K';
//     } else {
//       return amount.toStringAsFixed(0);
//     }
//   }
// }
