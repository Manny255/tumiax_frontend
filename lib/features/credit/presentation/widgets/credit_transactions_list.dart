import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../../../core/localization/app_localizations.dart';
import '../../../../core/themes/app_theme.dart';
import '../../data/models/credit_transaction_model.dart';

class CreditTransactionsList extends StatelessWidget {
  final List<CreditTransactionModel> transactions;

  const CreditTransactionsList({super.key, required this.transactions});

  @override
  Widget build(BuildContext context) {
    final t = AppLocalizations.of(context);

    if (transactions.isEmpty) {
      return Center(
        child: Padding(
          padding: const EdgeInsets.all(32.0),
          child: Column(
            children: [
              Icon(
                Icons.receipt_long_rounded,
                size: 48,
                color: Colors.grey.shade400,
              ),
              const SizedBox(height: 16),
              Text(
                t.translate('no_transactions_yet'),
                style: AppTheme.body1.copyWith(color: Colors.grey.shade600),
              ),
            ],
          ),
        ),
      );
    }

    return ListView.separated(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: transactions.length,
      separatorBuilder: (_, __) => const SizedBox(height: 8),
      itemBuilder: (context, index) {
        return CreditTransactionTile(transaction: transactions[index]);
      },
    );
  }
}

class CreditTransactionTile extends StatelessWidget {
  final CreditTransactionModel transaction;

  const CreditTransactionTile({super.key, required this.transaction});

  @override
  Widget build(BuildContext context) {
    final t = AppLocalizations.of(context);
    final isDark = Theme.of(context).brightness == Brightness.dark;

    final formatCurrency = NumberFormat.currency(
      locale: 'en_TZ',
      symbol: 'TZS ',
      decimalDigits: 0,
    );

    final formatDate = DateFormat('MMM dd, HH:mm');
    final isSpend = transaction.transactionType == 'SPEND';
    final isRepay = transaction.transactionType == 'REPAY';
    final isInterest = transaction.transactionType == 'INTEREST';
    final date = DateTime.parse(transaction.createdAt);

    // Determine the display amount
    double displayAmount;
    String prefix;
    Color amountColor;
    IconData iconData;
    Color iconBgColor;

    if (isSpend) {
      final totalSpent =
          transaction.amountAsDouble +
          transaction.originalInterest5PercentAsDouble;
      displayAmount = totalSpent;
      prefix = '-';
      amountColor = AppTheme.errorColor;
      iconData = Icons.arrow_upward;
      iconBgColor = AppTheme.errorColor.withOpacity(0.1);
    } else if (isRepay) {
      displayAmount = transaction.amountAsDouble;
      prefix = '+';
      amountColor = AppTheme.secondaryColor;
      iconData = Icons.arrow_downward;
      iconBgColor = AppTheme.secondaryColor.withOpacity(0.1);
    } else if (isInterest) {
      displayAmount = transaction.amountAsDouble;
      prefix = '-';
      amountColor = Colors.orange.shade700;
      iconData = Icons.percent_rounded;
      iconBgColor = Colors.orange.shade50;
    } else {
      displayAmount = transaction.amountAsDouble;
      prefix = transaction.amountAsDouble >= 0 ? '+' : '';
      amountColor = Colors.grey.shade600;
      iconData = Icons.swap_horiz_rounded;
      iconBgColor = Colors.grey.shade100;
    }

    // Get description based on transaction type
    String description;
    if (isSpend) {
      description =
          transaction.description ??
          t.translate('credit_spend');
    } else if (isRepay) {
      description = transaction.description ?? t.translate('repayment');
    } else if (isInterest) {
      description = transaction.description ?? t.translate('interest_charge');
    } else {
      description = transaction.description ?? t.translate('transaction');
    }

    // Get icon color
    final iconColor = isSpend
        ? AppTheme.errorColor
        : isRepay
        ? AppTheme.secondaryColor
        : Colors.orange.shade700;

    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: isDark ? Colors.grey.shade900 : Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: isDark ? Colors.grey.shade800 : Colors.grey.shade200,
        ),
      ),
      child: Row(
        children: [
          // Icon
          Container(
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: iconBgColor,
              shape: BoxShape.circle,
            ),
            child: Icon(iconData, color: iconColor, size: 16),
          ),

          const SizedBox(width: 12),

          // Details
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // // const SizedBox(height: 4),
                //   Text(
                //   description,
                //   style: AppTheme.body2.copyWith(fontWeight: FontWeight.w600),
                //   maxLines: 1,
                //   overflow: TextOverflow.ellipsis,
                // ),
                // const SizedBox(height: 4),
                Text(
                  description,
                  style: AppTheme.body2.copyWith(fontWeight: FontWeight.w600),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                const SizedBox(height: 4),
                if (transaction.asset != null)
                  Text(
                    transaction.asset!.title,
                    style: AppTheme.caption,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                Row(
                  children: [
                    Text(
                      formatDate.format(date),
                      style: AppTheme.caption.copyWith(
                        color: isDark
                            ? Colors.grey.shade500
                            : Colors.grey.shade600,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),

          // Amount and badges
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              // Main amount
              Text(
                '$prefix ${formatCurrency.format(displayAmount)}',
                style: AppTheme.body1.copyWith(
                  color: amountColor,
                  fontWeight: FontWeight.bold,
                ),
              ),

              // Interest badge (for SPEND)
              if (isSpend &&
                  transaction.originalInterest5PercentAsDouble > 0) ...[
                const SizedBox(height: 4),
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 6,
                    vertical: 2,
                  ),
                  decoration: BoxDecoration(
                    color: Colors.orange.shade50,
                    borderRadius: BorderRadius.circular(4),
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(
                        Icons.percent_rounded,
                        size: 10,
                        color: Colors.orange.shade700,
                      ),
                      const SizedBox(width: 2),
                      Text(
                        formatCurrency.format(
                          transaction.originalInterest5PercentAsDouble,
                        ),
                        style: AppTheme.caption.copyWith(
                          fontSize: 10,
                          color: Colors.orange.shade700,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                ),
              ],

              // Late penalty badge
              if (transaction.latePenaltiesAccruedAsDouble > 0) ...[
                const SizedBox(height: 4),
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 6,
                    vertical: 2,
                  ),
                  decoration: BoxDecoration(
                    color: AppTheme.errorColor.withOpacity(0.1),
                    borderRadius: BorderRadius.circular(4),
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(
                        Icons.warning_amber_rounded,
                        size: 10,
                        color: AppTheme.errorColor,
                      ),
                      const SizedBox(width: 2),
                      Text(
                        formatCurrency.format(
                          transaction.latePenaltiesAccruedAsDouble,
                        ),
                        style: AppTheme.caption.copyWith(
                          fontSize: 10,
                          color: AppTheme.errorColor,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ],
          ),
        ],
      ),
    );
  }
}

// import 'package:flutter/material.dart';
// import 'package:intl/intl.dart';

// import '../../../../core/themes/app_theme.dart';
// import '../../data/models/credit_transaction_model.dart';

// class CreditTransactionsList extends StatelessWidget {
//   final List<CreditTransactionModel> transactions;

//   const CreditTransactionsList({super.key, required this.transactions});

//   @override
//   Widget build(BuildContext context) {
//     return ListView.separated(
//       shrinkWrap: true,
//       physics: const NeverScrollableScrollPhysics(),
//       itemCount: transactions.length,
//       separatorBuilder: (_, __) => const SizedBox(height: 8),
//       itemBuilder: (context, index) {
//         return CreditTransactionTile(transaction: transactions[index]);
//       },
//     );
//   }
// }

// class CreditTransactionTile extends StatelessWidget {
//   final CreditTransactionModel transaction;

//   const CreditTransactionTile({super.key, required this.transaction});

//   @override
//   Widget build(BuildContext context) {
//     final formatCurrency = NumberFormat.currency(
//       locale: 'en_TZ',
//       symbol: 'TZS ',
//       decimalDigits: 0,
//     );

//     final formatDate = DateFormat('MMM dd, HH:mm');
//     final isSpend = transaction.transactionType == 'SPEND';
//     final date = DateTime.parse(transaction.createdAt);

//     return Container(
//       padding: const EdgeInsets.all(12),
//       decoration: BoxDecoration(
//         color: Colors.white,
//         borderRadius: BorderRadius.circular(12),
//         border: Border.all(color: Colors.grey.shade200),
//       ),
//       child: Row(
//         children: [
//           // Icon
//           Container(
//             padding: const EdgeInsets.all(10),
//             decoration: BoxDecoration(
//               color: isSpend
//                   ? AppTheme.errorColor.withOpacity(0.1)
//                   : AppTheme.secondaryColor.withOpacity(0.1),
//               shape: BoxShape.circle,
//             ),
//             child: Icon(
//               isSpend ? Icons.arrow_upward : Icons.arrow_downward,
//               color: isSpend ? AppTheme.errorColor : AppTheme.secondaryColor,
//               size: 16,
//             ),
//           ),

//           const SizedBox(width: 12),

//           // Details
//           Expanded(
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 Text(
//                   transaction.description ?? (isSpend ? 'Spend' : 'Repayment'),
//                   style: AppTheme.body2.copyWith(fontWeight: FontWeight.w600),
//                 ),
//                 const SizedBox(height: 4),
//                 if (transaction.asset != null)
//                   Text(transaction.asset!.title, style: AppTheme.caption),
//                 Text(formatDate.format(date), style: AppTheme.caption),
//               ],
//             ),
//           ),

//           // Amount and balance
//           Column(
//             crossAxisAlignment: CrossAxisAlignment.end,
//             children: [
//               Text(
//                 '${isSpend ? '-' : '+'} ${formatCurrency.format(transaction.amountAsDouble)}',
//                 style: AppTheme.body1.copyWith(
//                   color: isSpend
//                       ? AppTheme.errorColor
//                       : AppTheme.secondaryColor,
//                   fontWeight: FontWeight.bold,
//                 ),
//               ),
//               const SizedBox(height: 2),
//               Text(
//                 formatCurrency.format(transaction.runningBalanceAsDouble),
//                 style: AppTheme.caption,
//               ),
//             ],
//           ),
//         ],
//       ),
//     );
//   }
// }
