// lib/features/credit/presentation/widgets/repayment_summary_widget.dart

import 'package:flutter/material.dart';
import '../../../../core/localization/app_localizations.dart';
import '../../../../core/themes/app_theme.dart';
import 'credit_calculation_service.dart';

class RepaymentSummaryWidget extends StatelessWidget {
  final double principal;
  final bool hasFee;
  final bool compact;
  final int dueDays;

  const RepaymentSummaryWidget({
    super.key,
    required this.principal,
    this.hasFee = false,
    this.compact = false,
    this.dueDays = 30,
  });

  @override
  Widget build(BuildContext context) {
    final t = AppLocalizations.of(context);
    final isDark = Theme.of(context).brightness == Brightness.dark;

    final interest = CreditCalculationService.calculateInterest(principal);
    final fee = hasFee
        ? CreditCalculationService.calculateExternalTransferFee(principal)
        : 0.0;
    final total = CreditCalculationService.calculateTotalToRepay(
      principal: principal,
      fee: fee,
    );

    final secondaryTextColor = isDark
        ? Colors.grey.shade400
        : Colors.grey.shade600;

    final primaryTextColor = isDark ? Colors.white : Colors.black87;

    return Container(
      padding: EdgeInsets.all(compact ? 12 : 16),
      decoration: BoxDecoration(
        color: isDark ? Colors.grey.shade800 : Colors.grey.shade50,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: isDark ? Colors.grey.shade700 : Colors.grey.shade200,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (!compact) ...[
            Row(
              children: [
                Text(
                  t.translate('repayment_summary'),
                   style: AppTheme.body1.copyWith(
                    fontWeight: FontWeight.bold,
                    color: primaryTextColor,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),
          ],

          // Principal
          _buildRow(
            t.translate('amount'),
            CreditCalculationService.formatCurrency(principal),
            valueColor: primaryTextColor,
          ),

          const SizedBox(height: 8),

          // Interest
          _buildRow(
            t.translate('interest_5_percent'),
            CreditCalculationService.formatCurrency(interest),
            valueColor: secondaryTextColor,
          ),

          // Fee (if applicable)
          if (hasFee && fee > 0) ...[
            const SizedBox(height: 8),
            _buildRow(
              t.translate('transfer_fee'),
              CreditCalculationService.formatCurrency(fee),
              valueColor: secondaryTextColor,
              subtitle: t.translate(
                CreditCalculationService.getFeeTierKey(principal),
              ),
            ),
          ],

          const SizedBox(height: 8),
          Divider(
            height: 1,
            color: isDark ? Colors.grey.shade700 : Colors.grey.shade300,
          ),
          const SizedBox(height: 8),

          // Total
          _buildRow(
            t.translate('total'),
            CreditCalculationService.formatCurrency(total),
            icon: Icons.payments_rounded,
            valueColor: AppTheme.primaryColor,
            isBold: true,
          ),

          const SizedBox(height: 8),

          // Due date
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Icon(Icons.calendar_today, size: 14, color: secondaryTextColor),
              const SizedBox(width: 6),
              Text(
                t.translate('pay_before'),
                style: AppTheme.caption.copyWith(color: secondaryTextColor),
              ),
              const SizedBox(width: 4),
              Text(
                CreditCalculationService.getDueDateString(dueDays),
                style: AppTheme.caption.copyWith(
                  color: Colors.grey.shade600,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildRow(
    String label,
    String value, {
    IconData? icon,
    Color? valueColor,
    String? subtitle,
    bool isBold = false,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                if (icon != null) ...[
                  Icon(
                    icon,
                    size: 16,
                    color: valueColor ?? Colors.grey.shade600,
                  ),
                  const SizedBox(width: 6),
                ],
                Text(
                  label,
                  style: AppTheme.body2.copyWith(color: Colors.grey.shade600),
                ),
              ],
            ),
            Text(
              value,
              style: AppTheme.body2.copyWith(
                color: valueColor ?? Colors.black87,
                fontWeight: isBold ? FontWeight.bold : FontWeight.w600,
              ),
            ),
          ],
        ),
        if (subtitle != null)
          Padding(
            padding: const EdgeInsets.only(top: 2, left: 2),
            child: Text(
              subtitle,
              style: AppTheme.caption.copyWith(
                color: Colors.grey.shade500,
                fontSize: 10,
              ),
            ),
          ),
      ],
    );
  }
}
