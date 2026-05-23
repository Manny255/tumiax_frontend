// lib/features/credit/presentation/widgets/debt_card.dart

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:flutter/services.dart';
import '../../../../core/localization/app_localizations.dart';
import '../../../../core/themes/app_theme.dart';
import '../../data/models/credit_transaction_model.dart';

class DebtCard extends StatelessWidget {
  final CreditTransactionModel debt;
  final VoidCallback onRepay;
  final bool showFullDetails;

  const DebtCard({
    super.key,
    required this.debt,
    required this.onRepay,
    this.showFullDetails = true,
  });

  @override
  Widget build(BuildContext context) {
    final t = AppLocalizations.of(context);
    final isDark = Theme.of(context).brightness == Brightness.dark;

    final currency = NumberFormat.currency(
      locale: 'en_TZ',
      symbol: 'TZS ',
      decimalDigits: 0,
    );

    final amount = debt.amountAsDouble;
    final originalInterest = debt.originalInterest5PercentAsDouble;
    final latePenalties = debt.latePenaltiesAccruedAsDouble;
    final totalInterestAccrued = debt.interestAccruedAsDouble;
    final regularInterestAccrued = debt.regularInterestAccruedAsDouble;
    final totalDue = debt.totalDueAsDouble;
    final remainingPrincipal = debt.remainingAmountAsDouble;

    final feeAmount = debt.feeAmountAsDouble;
    final remainingFee = debt.remainingFeeAsDouble;

    final totalOriginalDebt = amount + originalInterest + feeAmount;
    final totalRemaining =
        remainingPrincipal + totalInterestAccrued + remainingFee;
    final totalPaid = totalOriginalDebt - totalRemaining;

    final progress = totalOriginalDebt == 0
        ? 0.0
        : (totalPaid / totalOriginalDebt).clamp(0.0, 1.0);

    final additionalRegularInterest =
        (regularInterestAccrued - originalInterest).clamp(0.0, double.infinity);

    final dueDateFormatted = debt.dueDate != null
        ? DateFormat('MMM dd, yyyy').format(DateTime.parse(debt.dueDate!))
        : t.translate('no_due_date');

    final isOverdue = debt.isOverdue;
    final daysOverdue = debt.daysOverdue ?? 0;
    final hasLatePenalties = latePenalties > 0;

    final daysUntilDue = !isOverdue && debt.dueDate != null
        ? DateTime.parse(debt.dueDate!).difference(DateTime.now()).inDays
        : 0;

    // Check if cycle 2+ (show cycle badge only when cycle >= 2)
    final showCycleBadge = (debt.cycleNumber ?? 1) >= 2;

    // Show pay now suggestion when:
    // - Due within 7 days, OR
    // - Already overdue
    final showPayNowSuggestion =
        (daysUntilDue > 0 && daysUntilDue <= 7) || isOverdue;

    return Container(
      decoration: BoxDecoration(
        color: isDark ? Colors.grey.shade900 : Colors.white,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
          color: isOverdue
              ? AppTheme.errorColor.withValues(alpha: 0.4)
              : isDark
              ? Colors.grey.shade800
              : Colors.grey.shade200,
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withValues(alpha: isDark ? 0.02 : 0.05),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Header with cycle badge (only shows for cycle 2+)
            _buildHeader(
              context,
              t,
              dueDateFormatted,
              isOverdue,
              daysOverdue,
              daysUntilDue,
              showCycleBadge,
            ),

            const SizedBox(height: 16),

            // Interest breakdown
            if (showFullDetails) ...[
              _buildInterestBreakdown(
                context,
                t,
                currency,
                amount,
                originalInterest,
                additionalRegularInterest,
                latePenalties,
                totalDue,
                isOverdue,
                hasLatePenalties,
                feeAmount,
              ),
              const SizedBox(height: 16),
            ],

            // Progress section
            _buildTotalProgressSection(
              context,
              t,
              currency,
              progress,
              totalPaid,
              totalOriginalDebt,
              isOverdue,
            ),

            // 🆕 Pay now suggestion (only when close to due or overdue)
            if (showPayNowSuggestion) ...[
              const SizedBox(height: 12),
              _buildPayNowSuggestion(
                context,
                t,
                currency,
                isOverdue,
                daysUntilDue,
                totalDue,
              ),
            ],

            // Warning message for overdue/late penalties
            if (isOverdue || hasLatePenalties) ...[
              const SizedBox(height: 12),
              _buildWarningMessage(
                context,
                t,
                isOverdue,
                daysOverdue,
                latePenalties,
                currency,
              ),
            ],

            const SizedBox(height: 20),

            // Action buttons
            _buildActionButtons(context, t, isOverdue),
          ],
        ),
      ),
    );
  }

  // =========================================================
  // HEADER WIDGET - With Cycle Badge (only for cycle 2+)
  // =========================================================
  Widget _buildHeader(
    BuildContext context,
    AppLocalizations t,
    String dueDateFormatted,
    bool isOverdue,
    int daysOverdue,
    int daysUntilDue,
    bool showCycleBadge,
  ) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final createdDateFormatted = DateFormat(
      'MMM dd, yyyy',
    ).format(DateTime.parse(debt.createdAt));
    final screenWidth = MediaQuery.of(context).size.width;
    final isSmallScreen = screenWidth < 360;
    final cycleNumber = debt.cycleNumber ?? 1;

    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Icon container
        Container(
          padding: const EdgeInsets.all(10),
          decoration: BoxDecoration(
            color: isOverdue
                ? AppTheme.errorColor.withValues(alpha: 0.1)
                : AppTheme.primaryColor.withValues(alpha: 0.1),
            borderRadius: BorderRadius.circular(12),
          ),
          child: Icon(
            isOverdue ? Icons.warning_amber_rounded : Icons.credit_card_rounded,
            color: isOverdue ? AppTheme.errorColor : AppTheme.primaryColor,
            size: 20,
          ),
        ),
        const SizedBox(width: 12),

        // Asset and date info
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Title row with badges
              Row(
                children: [
                  // Title
                  Expanded(
                    child: Text(
                      debt.asset?.title ??
                          debt.description ??
                          t.translate('credit_spend'),
                      style: AppTheme.body1.copyWith(
                        fontWeight: FontWeight.bold,
                        color: isDark ? Colors.white : Colors.black87,
                      ),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),

                  // 🆕 Cycle badge (only shows for cycle 2+)
                  if (showCycleBadge && !isSmallScreen) ...[
                    const SizedBox(width: 8),
                    Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 8,
                        vertical: 3,
                      ),
                      decoration: BoxDecoration(
                        color: Colors.orange.shade50,
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(color: Colors.orange.shade200),
                      ),
                      child: Text(
                        t.translate(
                          'cycle_label',
                          params: {'number': cycleNumber.toString()},
                        ),
                        style: AppTheme.caption.copyWith(
                          color: Colors.orange.shade700,
                          fontWeight: FontWeight.bold,
                          fontSize: 10,
                        ),
                      ),
                    ),
                  ],

                  // Overdue badge
                  if (isOverdue && !isSmallScreen) ...[
                    const SizedBox(width: 8),
                    Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 8,
                        vertical: 3,
                      ),
                      decoration: BoxDecoration(
                        color: AppTheme.errorColor.withValues(alpha: 0.1),
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(
                          color: AppTheme.errorColor.withValues(alpha: 0.3),
                        ),
                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          const SizedBox(width: 3),
                          Text(
                            isSmallScreen
                                ? t.translate('overdue_short')
                                : t.translate('overdue'),
                            style: AppTheme.caption.copyWith(
                              color: AppTheme.errorColor,
                              fontWeight: FontWeight.bold,
                              fontSize: isSmallScreen ? 9 : 11,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ],
              ),

              // Cycle badge on separate line for small screens
              if (showCycleBadge && isSmallScreen) ...[
                const SizedBox(height: 4),
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 8,
                    vertical: 3,
                  ),
                  decoration: BoxDecoration(
                    color: Colors.orange.shade50,
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(color: Colors.orange.shade200),
                  ),
                  child: Text(
                    'Cycle $cycleNumber',
                    style: AppTheme.caption.copyWith(
                      color: Colors.orange.shade700,
                      fontWeight: FontWeight.bold,
                      fontSize: 9,
                    ),
                  ),
                ),
              ],

              // Overdue badge on separate line for small screens
              if (isOverdue && isSmallScreen) ...[
                const SizedBox(height: 4),
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 8,
                    vertical: 3,
                  ),
                  decoration: BoxDecoration(
                    color: AppTheme.errorColor.withValues(alpha: 0.1),
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(
                      color: AppTheme.errorColor.withValues(alpha: 0.3),
                    ),
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      // Icon(
                      //   Icons.warning_amber_rounded,
                      //   size: 12,
                      //   color: AppTheme.errorColor,
                      // ),
                      // const SizedBox(width: 3),
                      Text(
                        t.translate('overdue_short'),
                        style: AppTheme.caption.copyWith(
                          color: AppTheme.errorColor,
                          fontWeight: FontWeight.bold,
                          fontSize: 9,
                        ),
                      ),
                    ],
                  ),
                ),
              ],

              const SizedBox(height: 4),

              // Due date row
              Wrap(
                spacing: 6,
                runSpacing: 4,
                crossAxisAlignment: WrapCrossAlignment.center,
                children: [
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(
                        Icons.calendar_today_rounded,
                        size: 12,
                        color: isOverdue
                            ? AppTheme.errorColor
                            : isDark
                            ? Colors.grey.shade400
                            : Colors.grey.shade600,
                      ),
                      const SizedBox(width: 4),
                      Flexible(
                        child: Text(
                          '${t.translate('due')}: $dueDateFormatted',
                          style: AppTheme.caption.copyWith(
                            color: isOverdue
                                ? AppTheme.errorColor
                                : isDark
                                ? Colors.grey.shade400
                                : Colors.grey.shade600,
                            fontWeight: isOverdue
                                ? FontWeight.bold
                                : FontWeight.normal,
                          ),
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ],
                  ),

                  // Days overdue badge
                  if (isOverdue && daysOverdue > 0)
                    Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 6,
                        vertical: 2,
                      ),
                      decoration: BoxDecoration(
                        color: AppTheme.errorColor.withValues(alpha: 0.15),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Text(
                        isSmallScreen
                            ? '+$daysOverdue${t.translate('days_short')}'
                            : '+$daysOverdue ${t.translate('days')}',
                        style: AppTheme.caption.copyWith(
                          color: AppTheme.errorColor,
                          fontSize: 10,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),

                  // Days left badge
                  if (!isOverdue && daysUntilDue > 0 && daysUntilDue <= 7)
                    Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 6,
                        vertical: 2,
                      ),
                      decoration: BoxDecoration(
                        color: AppTheme.warningColor.withValues(alpha: 0.15),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Text(
                        isSmallScreen
                            ? '$daysUntilDue${t.translate('days_left_short')}'
                            : '$daysUntilDue ${t.translate('days_left')}',
                        style: AppTheme.caption.copyWith(
                          color: AppTheme.warningColor,
                          fontSize: 10,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                ],
              ),

              const SizedBox(height: 2),

              // Created date
              Row(
                children: [
                  Icon(
                    Icons.history_toggle_off_rounded,
                    size: 10,
                    color: isDark ? Colors.grey.shade500 : Colors.grey.shade500,
                  ),
                  const SizedBox(width: 4),
                  Flexible(
                    child: Text(
                      '${t.translate('created_short')}: $createdDateFormatted',
                      style: AppTheme.caption.copyWith(
                        color: isDark
                            ? Colors.grey.shade500
                            : Colors.grey.shade500,
                        fontSize: 11,
                      ),
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }

  // =========================================================
  // INTEREST BREAKDOWN WIDGET
  // =========================================================
  Widget _buildInterestBreakdown(
    BuildContext context,
    AppLocalizations t,
    NumberFormat currency,
    double originalPrincipal,
    double originalInterest,
    double additionalRegularInterest,
    double latePenalties,
    double totalDue,
    bool isOverdue,
    bool hasLatePenalties,
    double feeAmount,
  ) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final hasFee = feeAmount > 0;

    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: isOverdue
            ? AppTheme.errorColor.withValues(alpha: 0.03)
            : isDark
            ? Colors.grey.shade800.withValues(alpha: 0.5)
            : Colors.grey.shade50,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: isOverdue
              ? AppTheme.errorColor.withValues(alpha: 0.15)
              : isDark
              ? Colors.grey.shade700
              : Colors.grey.shade200,
        ),
      ),
      child: Column(
        children: [
          // Principal
          _buildBreakdownRow(
            label: t.translate('principal'),
            amount: currency.format(originalPrincipal),
            color: isDark ? Colors.grey.shade300 : Colors.grey.shade800,
          ),

          const SizedBox(height: 6),

          // Fee (if exists)
          if (hasFee) ...[
            _buildBreakdownRow(
              label: t.translate('transfer_fee'),
              amount: currency.format(feeAmount),
              color: isDark ? Colors.grey.shade300 : Colors.grey.shade800,
            ),
            const SizedBox(height: 6),
          ],

          // Original 5% Interest
          _buildBreakdownRow(
            label: t.translate('interest_5_percent'),
            amount: currency.format(originalInterest),
            color: isDark ? Colors.grey.shade300 : Colors.grey.shade800,
          ),

          // Additional Regular Interest (if any)
          if (additionalRegularInterest > 0) ...[
            const SizedBox(height: 6),
            _buildBreakdownRow(
              label: t.translate('additional_interest'),
              amount: currency.format(additionalRegularInterest),
              color: Colors.orange.shade400,
            ),
          ],

          // Late Penalties (if any)
          if (latePenalties > 0) ...[
            const SizedBox(height: 6),
            _buildBreakdownRow(
              label: t.translate('late_penalties_18_percent'),
              amount: currency.format(latePenalties),
              color: AppTheme.errorColor,
            ),
          ],

          const SizedBox(height: 8),
          Divider(
            height: 1,
            color: isDark ? Colors.grey.shade700 : Colors.grey.shade300,
          ),
          const SizedBox(height: 8),

          // Total Due
          _buildBreakdownRow(
            label: t.translate('total_due'),
            amount: currency.format(totalDue),
            color: isOverdue ? AppTheme.errorColor : AppTheme.primaryColor,
            isBold: true,
            fontSize: 16,
          ),
        ],
      ),
    );
  }

  // =========================================================
  // PROGRESS SECTION WIDGET (Simplified)
  // =========================================================
  Widget _buildTotalProgressSection(
    BuildContext context,
    AppLocalizations t,
    NumberFormat currency,
    double progress,
    double totalPaid,
    double totalOriginalDebt,
    bool isOverdue,
  ) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: Text(
                t.translate('payment_progress'),
                style: AppTheme.caption.copyWith(
                  fontWeight: FontWeight.w600,
                  color: isDark ? Colors.grey.shade300 : Colors.grey.shade700,
                ),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
            ),
            const SizedBox(width: 8),
            Text(
              '${(progress * 100).toStringAsFixed(0)}%',
              style: AppTheme.caption.copyWith(
                fontWeight: FontWeight.bold,
                color: isOverdue ? AppTheme.errorColor : AppTheme.primaryColor,
              ),
            ),
          ],
        ),
        const SizedBox(height: 4),
        Align(
          alignment: Alignment.centerRight,
          child: RichText(
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            textAlign: TextAlign.right,
            text: TextSpan(
              children: [
                TextSpan(
                  text: currency.format(totalPaid),
                  style: AppTheme.caption.copyWith(
                    fontWeight: FontWeight.bold,
                    color: AppTheme.primaryColor,
                  ),
                ),
                TextSpan(
                  text: ' / ',
                  style: AppTheme.caption.copyWith(
                    color: isDark ? Colors.grey.shade500 : Colors.grey.shade600,
                  ),
                ),
                TextSpan(
                  text: currency.format(totalOriginalDebt),
                  style: AppTheme.caption.copyWith(
                    color: isDark ? Colors.grey.shade400 : Colors.grey.shade600,
                  ),
                ),
              ],
            ),
          ),
        ),
        const SizedBox(height: 6),
        ClipRRect(
          borderRadius: BorderRadius.circular(4),
          child: LinearProgressIndicator(
            value: progress,
            backgroundColor: isDark
                ? Colors.grey.shade800
                : Colors.grey.shade200,
            valueColor: AlwaysStoppedAnimation<Color>(
              isOverdue ? AppTheme.errorColor : AppTheme.primaryColor,
            ),
            minHeight: 8,
          ),
        ),
      ],
    );
  }

// lib/features/credit/presentation/widgets/debt_card.dart

  // =========================================================
  // 🆕 PAY NOW SUGGESTION WIDGET - With Amount Comparison
  // =========================================================
  Widget _buildPayNowSuggestion(
    BuildContext context,
    AppLocalizations t,
    NumberFormat currency,
    bool isOverdue,
    int daysUntilDue,
    double totalDue,
  ) {
    final now = DateTime.now();
    final dueDate = debt.dueDate != null ? DateTime.parse(debt.dueDate!) : null;

    // Calculate what user would pay if they wait until after due date
    double amountIfLate;
    String dateText;

    if (isOverdue) {
      // Already overdue - show what they'd pay if they wait another 30 days
      amountIfLate = _calculateAmountAfterNextCycle(totalDue);
      final nextCycleDate = now.add(const Duration(days: 30));
      dateText = DateFormat('MMM dd').format(nextCycleDate);
    } else if (dueDate != null) {
      // Not yet due - show what they'd pay if they miss the due date
      amountIfLate = _calculateAmountAfterNextCycle(totalDue);
      dateText = DateFormat(
        'MMM dd',
      ).format(dueDate.add(const Duration(days: 1)));
    } else {
      return const SizedBox.shrink();
    }

    final savings = amountIfLate - totalDue;

    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.blue.shade50,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.blue.shade200),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(
                Icons.lightbulb_outline_rounded,
                size: 20,
                color: Colors.blue.shade700,
              ),
              const SizedBox(width: 8),
              Expanded(
                child: Text(
                  t.translate('pay_now_save'),
                  style: AppTheme.caption.copyWith(
                    color: Colors.blue.shade900,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 8),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    t.translate('pay_today'),
                    style: AppTheme.caption.copyWith(
                      color: Colors.grey.shade600,
                      fontSize: 11,
                    ),
                  ),
                  Text(
                    currency.format(totalDue),
                    style: AppTheme.body2.copyWith(
                      fontWeight: FontWeight.bold,
                      color: Colors.green.shade700,
                    ),
                  ),
                ],
              ),
              Icon(
                Icons.arrow_forward_rounded,
                size: 16,
                color: Colors.grey.shade400,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                    isOverdue
                        ? t.translate('if_you_wait_30_days')
                        : t
                              .translate('if_missed')
                              .replaceAll('{date}', dateText),
                    style: AppTheme.caption.copyWith(
                      color: Colors.grey.shade600,
                      fontSize: 11,
                    ),
                  ),
                  Text(
                    currency.format(amountIfLate),
                    style: AppTheme.body2.copyWith(
                      fontWeight: FontWeight.bold,
                      color: Colors.red.shade700,
                    ),
                  ),
                ],
              ),
            ],
          ),
          const SizedBox(height: 8),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
            decoration: BoxDecoration(
              color: Colors.green.shade100,
              borderRadius: BorderRadius.circular(8),
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(
                  Icons.savings_rounded,
                  size: 14,
                  color: Colors.green.shade700,
                ),
                const SizedBox(width: 4),
                Text(
                  t
                      .translate('you_save')
                      .replaceAll('{amount}', currency.format(savings)),
                  style: AppTheme.caption.copyWith(
                    color: Colors.green.shade800,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  // Helper: Calculate amount after next cycle (5% interest + 1.5% penalty)
  double _calculateAmountAfterNextCycle(double currentBalance) {
    final interest = currentBalance * 0.05;
    final penalty = currentBalance * 0.015;
    return currentBalance + interest + penalty;
  }
  // =========================================================
  // WARNING MESSAGE WIDGET
  // =========================================================
  Widget _buildWarningMessage(
    BuildContext context,
    AppLocalizations t,
    bool isOverdue,
    int daysOverdue,
    double latePenalties,
    NumberFormat currency,
  ) {
    return Container(
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: AppTheme.warningColor.withValues(alpha: 0.08),
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: AppTheme.warningColor.withValues(alpha: 0.2)),
      ),
      child: Row(
        children: [
          Icon(
            Icons.warning_amber_rounded,
            size: 16,
            color: AppTheme.warningColor,
          ),
          const SizedBox(width: 8),
          Expanded(
            child: Text(
              isOverdue
                  ? t
                        .translate('overdue_warning_message')
                        .replaceAll('{days}', daysOverdue.toString())
                  : t
                        .translate('late_penalty_warning')
                        .replaceAll('{amount}', currency.format(latePenalties)),
              style: AppTheme.caption.copyWith(
                color: AppTheme.warningColor,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
        ],
      ),
    );
  }

  // =========================================================
  // ACTION BUTTONS WIDGET
  // =========================================================
  Widget _buildActionButtons(
    BuildContext context,
    AppLocalizations t,
    bool isOverdue,
  ) {
    return Row(
      children: [
        Expanded(
          child: ElevatedButton(
            onPressed: onRepay,
            style: ElevatedButton.styleFrom(
              backgroundColor: isOverdue
                  ? AppTheme.errorColor
                  : AppTheme.secondaryColor,
              foregroundColor: Colors.white,
              padding: const EdgeInsets.symmetric(vertical: 14),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              elevation: 0,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Icon(Icons.payments_rounded, size: 20),
                const SizedBox(width: 8),
                Text(
                  isOverdue
                      ? t.translate('repay_now_urgent')
                      : t.translate('repay_now'),
                  style: AppTheme.body1.copyWith(
                    fontWeight: FontWeight.w600,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ),
        ),
        const SizedBox(width: 8),
        Container(
          decoration: BoxDecoration(
            border: Border.all(color: Colors.grey.shade300),
            borderRadius: BorderRadius.circular(12),
          ),
          child: IconButton(
            onPressed: () => _showDetailsBottomSheet(context, t),
            icon: const Icon(Icons.more_horiz_rounded),
            color: Colors.grey.shade600,
          ),
        ),
      ],
    );
  }

  // =========================================================
  // HELPER: Breakdown Row
  // =========================================================
  Widget _buildBreakdownRow({
    required String label,
    required String amount,
    required Color color,
    bool isBold = false,
    IconData? icon,
    double fontSize = 14,
    String? tooltip,
    bool indent = false,
  }) {
    Widget row = Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            if (indent) const SizedBox(width: 16),
            if (icon != null) ...[
              Icon(icon, size: 16, color: color),
              const SizedBox(width: 4),
            ],
            Text(
              label,
              style: AppTheme.body2.copyWith(
                color: Colors.grey.shade600,
                fontSize: fontSize - 1,
              ),
            ),
          ],
        ),
        Text(
          amount,
          style: (isBold ? AppTheme.body1 : AppTheme.body2).copyWith(
            color: color,
            fontWeight: isBold ? FontWeight.bold : FontWeight.w600,
            fontSize: fontSize,
          ),
        ),
      ],
    );

    if (tooltip != null) {
      return Tooltip(message: tooltip, child: row);
    }
    return row;
  }

// =========================================================
  // DETAILS BOTTOM SHEET 
  // =========================================================
  void _showDetailsBottomSheet(BuildContext context, AppLocalizations t) {
    final currency = NumberFormat.currency(
      locale: 'en_TZ',
      symbol: 'TZS ',
      decimalDigits: 0,
    );

    // Format UUID to show first 8 and last 4 characters
    final shortId = _formatUuid(debt.id);

    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (bottomSheetContext) {
        return DraggableScrollableSheet(
          initialChildSize: 0.5,
          minChildSize: 0.3,
          maxChildSize: 0.8,
          expand: false,
          builder: (draggableContext, scrollController) {
            return Container(
              padding: const EdgeInsets.all(20),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Handle bar
                  Center(
                    child: Container(
                      width: 40,
                      height: 4,
                      decoration: BoxDecoration(
                        color: Colors.grey.shade300,
                        borderRadius: BorderRadius.circular(2),
                      ),
                    ),
                  ),
                  const SizedBox(height: 16),

                  Text(
                    t.translate('transaction_details'),
                    style: AppTheme.heading3,
                  ),
                  const SizedBox(height: 16),

                  // Scrollable content
                  Expanded(
                    child: ListView(
                      controller: scrollController,
                      children: [
                        // Transaction ID with copy button
                        _buildDetailRowWithCopy(
                          draggableContext,
                          t,
                          t.translate('transaction_id'),
                          debt.id,
                          shortId,
                        ),

                        const Divider(height: 1),

                        _buildDetailRow(
                          t.translate('created'),
                          DateFormat(
                            'MMM dd, yyyy HH:mm',
                          ).format(DateTime.parse(debt.createdAt)),
                        ),

                        const Divider(height: 1),

                        if (debt.dueDate != null) ...[
                          _buildDetailRow(
                            t.translate('due'),
                            DateFormat(
                              'MMM dd, yyyy',
                            ).format(DateTime.parse(debt.dueDate!)),
                          ),
                          const Divider(height: 1),
                        ],

                        _buildDetailRow(
                          t.translate('status'),
                          debt.isOverdue
                              ? t.translate('overdue')
                              : t.translate('active'),
                          valueColor: debt.isOverdue
                              ? AppTheme.errorColor
                              : Colors.green,
                        ),

                        const Divider(height: 1),

                        _buildDetailRow(
                          t.translate('interest_rate'),
                          debt.interestRateDisplay,
                        ),

                        const Divider(height: 1),

                        _buildDetailRow(
                          t.translate('principal_amount'),
                          currency.format(debt.amountAsDouble),
                        ),
                        const Divider(height: 1),

                          // Fee (if exists)
                        if (debt.hasFee) ...[
                          _buildDetailRow(
                            t.translate('transfer_fee'),
                            currency.format(debt.feeAmountAsDouble),
                          ),
                        ],

                        const Divider(height: 1),

                        _buildDetailRow(
                          t.translate('original_interest'),
                          currency.format(
                            debt.originalInterest5PercentAsDouble,
                          ),
                        ),

                        if (debt.latePenaltiesAccruedAsDouble > 0) ...[
                          const Divider(height: 1),
                          _buildDetailRow(
                            t.translate('late_penalties'),
                            currency.format(debt.latePenaltiesAccruedAsDouble),
                            valueColor: AppTheme.errorColor,
                          ),
                        ],

                        const Divider(height: 1),

                        _buildDetailRow(
                          t.translate('total_due'),
                          currency.format(debt.totalDueAsDouble),
                          valueColor: AppTheme.primaryColor,
                          isBold: true,
                        ),

                        if (debt.lastInterestCalculation != null) ...[
                          const Divider(height: 1),
                          _buildDetailRow(
                            t.translate('last_interest_calc'),
                            DateFormat('MMM dd, yyyy HH:mm').format(
                              DateTime.parse(debt.lastInterestCalculation!),
                            ),
                          ),
                        ],

                        if (debt.description != null &&
                            debt.description!.isNotEmpty) ...[
                          const Divider(height: 1),
                          _buildDetailRow(
                            t.translate('description'),
                            debt.description!,
                          ),
                        ],

                        const SizedBox(height: 20),
                      ],
                    ),
                  ),

                  // Close button
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () => Navigator.pop(draggableContext),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: AppTheme.primaryColor,
                        foregroundColor: Colors.white,
                        padding: const EdgeInsets.symmetric(vertical: 14),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                      child: Text(t.translate('close')),
                    ),
                  ),
                ],
              ),
            );
          },
        );
      },
    );
  }


  String _formatUuid(String uuid) {
    if (uuid.length <= 12) return uuid;
    return '${uuid.substring(0, 8)}...${uuid.substring(uuid.length - 4)}';
  }

  Widget _buildDetailRowWithCopy(
    BuildContext context,
    AppLocalizations t,
    String label,
    String fullValue,
    String displayValue,
  ) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 12),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: 120,
            child: Text(
              label,
              style: AppTheme.body2.copyWith(color: Colors.grey.shade600),
            ),
          ),
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: Text(
                    displayValue,
                    style: AppTheme.body2.copyWith(
                      fontWeight: FontWeight.w500,
                      fontFamily: 'monospace',
                    ),
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                const SizedBox(width: 8),
                InkWell(
                  onTap: () {
                    Clipboard.setData(ClipboardData(text: fullValue));
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text(t.translate('transaction_id_copied')),
                        duration: const Duration(seconds: 2),
                        behavior: SnackBarBehavior.floating,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                    );
                  },
                  borderRadius: BorderRadius.circular(20),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Icon(
                      Icons.copy_rounded,
                      size: 18,
                      color: Colors.grey.shade500,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildDetailRow(
    String label,
    String value, {
    Color? valueColor,
    bool isBold = false,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 12),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: 120,
            child: Text(
              label,
              style: AppTheme.body2.copyWith(color: Colors.grey.shade600),
            ),
          ),
          Expanded(
            child: Text(
              value,
              style: AppTheme.body2.copyWith(
                fontWeight: isBold ? FontWeight.bold : FontWeight.w500,
                color: valueColor,
              ),
              overflow: TextOverflow.ellipsis,
              maxLines: 2,
            ),
          ),
        ],
      ),
    );
  }
}


// // lib/features/credit/presentation/widgets/debt_card.dart

// import 'package:flutter/material.dart';
// import 'package:intl/intl.dart';
// import 'package:flutter/services.dart';
// import '../../../../core/localization/app_localizations.dart';
// import '../../../../core/themes/app_theme.dart';
// import '../../data/models/credit_transaction_model.dart';

// class DebtCard extends StatelessWidget {
//   final CreditTransactionModel debt;
//   final VoidCallback onRepay;
//   final bool showFullDetails;

//   const DebtCard({
//     super.key,
//     required this.debt,
//     required this.onRepay,
//     this.showFullDetails = true,
//   });

//   @override
//   Widget build(BuildContext context) {
//     final t = AppLocalizations.of(context);
//     final isDark = Theme.of(context).brightness == Brightness.dark;

//     final currency = NumberFormat.currency(
//       locale: 'en_TZ',
//       symbol: 'TZS ',
//       decimalDigits: 0,
//     );

//     final amount = debt.amountAsDouble; 
//     final originalInterest = debt.originalInterest5PercentAsDouble;
//     final latePenalties = debt.latePenaltiesAccruedAsDouble;
//     final totalInterestAccrued = debt.interestAccruedAsDouble;
//     final regularInterestAccrued = debt.regularInterestAccruedAsDouble;
//     final totalDue = debt.totalDueAsDouble;
//     final remainingPrincipal = debt.remainingAmountAsDouble;


//     final feeAmount = debt.feeAmountAsDouble;
//     final remainingFee = debt.remainingFeeAsDouble;

//     //  Calculate total original debt (principal, fee + original 5% interest)
//     // final totalOriginalDebt = amount + originalInterest;

//     final totalOriginalDebt = amount + originalInterest + feeAmount;

//     //  Calculate total remaining (remaining principal, fee + all accrued interest)
//     final totalRemaining =
//         remainingPrincipal + totalInterestAccrued + remainingFee;

//     //  Calculate total paid
//     final totalPaid = totalOriginalDebt - totalRemaining;

//     // Progress based on TOTAL debt (including interest)
//     final progress = totalOriginalDebt == 0
//         ? 0.0
//         : (totalPaid / totalOriginalDebt).clamp(0.0, 1.0);

//     // Additional regular interest
//     final additionalRegularInterest =
//         (regularInterestAccrued - originalInterest).clamp(0.0, double.infinity);

//     // =====================================================
//     // DATE FORMATTING
//     // =====================================================
//     final dueDateFormatted = debt.dueDate != null
//         ? DateFormat('MMM dd, yyyy').format(DateTime.parse(debt.dueDate!))
//         : t.translate('no_due_date');

//     final isOverdue = debt.isOverdue;
//     final daysOverdue = debt.daysOverdue ?? 0;
//     final hasLatePenalties = latePenalties > 0;

//     // Calculate days until due (if not overdue)
//     final daysUntilDue = !isOverdue && debt.dueDate != null
//         ? DateTime.parse(debt.dueDate!).difference(DateTime.now()).inDays
//         : 0;

//     return Container(
//       decoration: BoxDecoration(
//         color: isDark ? Colors.grey.shade900 : Colors.white,
//         borderRadius: BorderRadius.circular(16),
//         border: Border.all(
//           color: isOverdue
//               ? AppTheme.errorColor.withOpacity(0.4)
//               : isDark
//               ? Colors.grey.shade800
//               : Colors.grey.shade200,
//         ),
//         boxShadow: [
//           BoxShadow(
//             color: Colors.grey.withOpacity(isDark ? 0.02 : 0.05),
//             blurRadius: 10,
//             offset: const Offset(0, 4),
//           ),
//         ],
//       ),
//       child: Padding(
//         padding: const EdgeInsets.all(16),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             // ===================================
//             // HEADER SECTION
//             // ===================================
//             _buildHeader(
//               context,
//               t,
//               dueDateFormatted,
//               isOverdue,
//               daysOverdue,
//               daysUntilDue,
//             ),

//             const SizedBox(height: 16),

//             // ===================================
//             // INTEREST BREAKDOWN SECTION
//             // ===================================
//             if (showFullDetails) ...[
//               _buildInterestBreakdown(
//                 context,
//                 t,
//                 currency,
//                 amount,
//                 originalInterest,
//                 additionalRegularInterest,
//                 latePenalties,
//                 totalDue,
//                 isOverdue,
//                 hasLatePenalties,
//                 feeAmount,
//               ),
//               const SizedBox(height: 16),
//             ],

//             // ===================================
//             // PROGRESS SECTION
//             // ===================================
//             _buildTotalProgressSection(
//               context,
//               t,
//               currency,
//               progress,
//               totalPaid,
//               totalOriginalDebt,
//               totalRemaining,
//               amount,
//               remainingPrincipal,
//               totalInterestAccrued,
//               originalInterest,
//               isOverdue,
//             ),
//             // ===================================
//             // WARNING MESSAGES
//             // ===================================
//             if (isOverdue || hasLatePenalties) ...[
//               const SizedBox(height: 12),
//               _buildWarningMessage(
//                 context,
//                 t,
//                 isOverdue,
//                 daysOverdue,
//                 latePenalties,
//                 currency,
//               ),
//             ],

//             const SizedBox(height: 20),

//             // ===================================
//             // ACTION BUTTONS
//             // ===================================
//             _buildActionButtons(context, t, isOverdue),
//           ],
//         ),
//       ),
//     );
//   }

// // =========================================================
//   // HEADER WIDGET - FIXED
//   // =========================================================
//   Widget _buildHeader(
//     BuildContext context,
//     AppLocalizations t,
//     String dueDateFormatted,
//     bool isOverdue,
//     int daysOverdue,
//     int daysUntilDue,
//   ) {
//     final isDark = Theme.of(context).brightness == Brightness.dark;
//     final createdDateFormatted = DateFormat(
//       'MMM dd, yyyy',
//     ).format(DateTime.parse(debt.createdAt));

//     final screenWidth = MediaQuery.of(context).size.width;
//     final isSmallScreen = screenWidth < 360;

//     return Row(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         // Icon container
//         Container(
//           padding: const EdgeInsets.all(10),
//           decoration: BoxDecoration(
//             color: isOverdue
//                 ? AppTheme.errorColor.withOpacity(0.1)
//                 : AppTheme.primaryColor.withOpacity(0.1),
//             borderRadius: BorderRadius.circular(12),
//           ),
//           child: Icon(
//             isOverdue ? Icons.warning_amber_rounded : Icons.credit_card_rounded,
//             color: isOverdue ? AppTheme.errorColor : AppTheme.primaryColor,
//             size: 20,
//           ),
//         ),
//         const SizedBox(width: 12),

//         // Asset and date info
//         Expanded(
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               // ✅ Title row with overdue badge inline
//               Row(
//                 children: [
//                   // Title with ellipsis
//                   Expanded(
//                     child: Text(
//                       debt.asset?.title ??
//                           debt.description ??
//                           t.translate('credit_spend'),
//                       style: AppTheme.body1.copyWith(
//                         fontWeight: FontWeight.bold,
//                         color: isDark ? Colors.white : Colors.black87,
//                       ),
//                       maxLines: 1,
//                       overflow: TextOverflow.ellipsis,
//                     ),
//                   ),

//                   // ✅ Overdue badge - positioned right next to title
//                   if (isOverdue && !isSmallScreen) ...[
//                     const SizedBox(width: 8),
//                     Container(
//                       padding: const EdgeInsets.symmetric(
//                         horizontal: 8,
//                         vertical: 3,
//                       ),
//                       decoration: BoxDecoration(
//                         color: AppTheme.errorColor.withOpacity(0.1),
//                         borderRadius: BorderRadius.circular(10),
//                         border: Border.all(
//                           color: AppTheme.errorColor.withOpacity(0.3),
//                         ),
//                       ),
//                       child: Row(
//                         mainAxisSize: MainAxisSize.min,
//                         children: [
//                           Icon(
//                             Icons.warning_amber_rounded,
//                             size: 12,
//                             color: AppTheme.errorColor,
//                           ),
//                           const SizedBox(width: 3),
//                           Text(
//                             isSmallScreen
//                                 ? t.translate('overdue_short')
//                                 : t.translate('overdue'),
//                             style: AppTheme.caption.copyWith(
//                               color: AppTheme.errorColor,
//                               fontWeight: FontWeight.bold,
//                               fontSize: isSmallScreen ? 9 : 11,
//                             ),
//                           ),
//                         ],
//                       ),
//                     ),
//                   ],
//                 ],
//               ),

//               // ✅ Overdue badge on separate line for small screens
//               if (isOverdue && isSmallScreen) ...[
//                 const SizedBox(height: 4),
//                 Container(
//                   padding: const EdgeInsets.symmetric(
//                     horizontal: 8,
//                     vertical: 3,
//                   ),
//                   decoration: BoxDecoration(
//                     color: AppTheme.errorColor.withOpacity(0.1),
//                     borderRadius: BorderRadius.circular(10),
//                     border: Border.all(
//                       color: AppTheme.errorColor.withOpacity(0.3),
//                     ),
//                   ),
//                   child: Row(
//                     mainAxisSize: MainAxisSize.min,
//                     children: [
//                       Icon(
//                         Icons.warning_amber_rounded,
//                         size: 12,
//                         color: AppTheme.errorColor,
//                       ),
//                       const SizedBox(width: 3),
//                       Text(
//                         t.translate('overdue_short'),
//                         style: AppTheme.caption.copyWith(
//                           color: AppTheme.errorColor,
//                           fontWeight: FontWeight.bold,
//                           fontSize: 9,
//                         ),
//                       ),
//                     ],
//                   ),
//                 ),
//               ],

//               const SizedBox(height: 4),

//               // Due date row
//               Wrap(
//                 spacing: 6,
//                 runSpacing: 4,
//                 crossAxisAlignment: WrapCrossAlignment.center,
//                 children: [
//                   Row(
//                     mainAxisSize: MainAxisSize.min,
//                     children: [
//                       Icon(
//                         Icons.calendar_today_rounded,
//                         size: 12,
//                         color: isOverdue
//                             ? AppTheme.errorColor
//                             : isDark
//                             ? Colors.grey.shade400
//                             : Colors.grey.shade600,
//                       ),
//                       const SizedBox(width: 4),
//                       Flexible(
//                         child: Text(
//                           '${t.translate('due')}: $dueDateFormatted',
//                           style: AppTheme.caption.copyWith(
//                             color: isOverdue
//                                 ? AppTheme.errorColor
//                                 : isDark
//                                 ? Colors.grey.shade400
//                                 : Colors.grey.shade600,
//                             fontWeight: isOverdue
//                                 ? FontWeight.bold
//                                 : FontWeight.normal,
//                           ),
//                           overflow: TextOverflow.ellipsis,
//                         ),
//                       ),
//                     ],
//                   ),

//                   // Days overdue badge
//                   if (isOverdue && daysOverdue > 0)
//                     Container(
//                       padding: const EdgeInsets.symmetric(
//                         horizontal: 6,
//                         vertical: 2,
//                       ),
//                       decoration: BoxDecoration(
//                         color: AppTheme.errorColor.withOpacity(0.15),
//                         borderRadius: BorderRadius.circular(8),
//                       ),
//                       child: Text(
//                         isSmallScreen
//                             ? '+$daysOverdue${t.translate('days_short')}'
//                             : '+$daysOverdue ${t.translate('days')}',
//                         style: AppTheme.caption.copyWith(
//                           color: AppTheme.errorColor,
//                           fontSize: 10,
//                           fontWeight: FontWeight.bold,
//                         ),
//                       ),
//                     ),

//                   // Days left badge
//                   if (!isOverdue && daysUntilDue > 0 && daysUntilDue <= 7)
//                     Container(
//                       padding: const EdgeInsets.symmetric(
//                         horizontal: 6,
//                         vertical: 2,
//                       ),
//                       decoration: BoxDecoration(
//                         color: AppTheme.warningColor.withOpacity(0.15),
//                         borderRadius: BorderRadius.circular(8),
//                       ),
//                       child: Text(
//                         isSmallScreen
//                             ? '$daysUntilDue${t.translate('days_left_short')}'
//                             : '$daysUntilDue ${t.translate('days_left')}',
//                         style: AppTheme.caption.copyWith(
//                           color: AppTheme.warningColor,
//                           fontSize: 10,
//                           fontWeight: FontWeight.bold,
//                         ),
//                       ),
//                     ),
//                 ],
//               ),

//               const SizedBox(height: 2),

//               // Created date
//               Row(
//                 children: [
//                   Icon(
//                     Icons.history_toggle_off_rounded,
//                     size: 10,
//                     color: isDark ? Colors.grey.shade500 : Colors.grey.shade500,
//                   ),
//                   const SizedBox(width: 4),
//                   Flexible(
//                     child: Text(
//                       '${t.translate('created_short')}: $createdDateFormatted',
//                       style: AppTheme.caption.copyWith(
//                         color: isDark
//                             ? Colors.grey.shade500
//                             : Colors.grey.shade500,
//                         fontSize: 11,
//                       ),
//                       overflow: TextOverflow.ellipsis,
//                     ),
//                   ),
//                 ],
//               ),
//             ],
//           ),
//         ),
//       ],
//     );
//   }

//   // =========================================================
//   // INTEREST BREAKDOWN WIDGET
//   // =========================================================
//   Widget _buildInterestBreakdown(
//     BuildContext context,
//     AppLocalizations t,
//     NumberFormat currency,
//     double originalPrincipal,
//     double originalInterest,
//     double additionalRegularInterest,
//     double latePenalties,
//     double totalDue,
//     bool isOverdue,
//     bool hasLatePenalties,
//     double feeAmount,
//   ) {
//     final isDark = Theme.of(context).brightness == Brightness.dark;
//     final hasFee = feeAmount > 0;

//     return Container(
//       padding: const EdgeInsets.all(12),
//       decoration: BoxDecoration(
//         color: isOverdue
//             ? AppTheme.errorColor.withOpacity(0.03)
//             : isDark
//             ? Colors.grey.shade800.withOpacity(0.5)
//             : Colors.grey.shade50,
//         borderRadius: BorderRadius.circular(12),
//         border: Border.all(
//           color: isOverdue
//               ? AppTheme.errorColor.withOpacity(0.15)
//               : isDark
//               ? Colors.grey.shade700
//               : Colors.grey.shade200,
//         ),
//       ),
//       child: Column(
//         children: [
//           // Principal
//           _buildBreakdownRow(
//             label: t.translate('principal'),
//             amount: currency.format(originalPrincipal),
//             color: isDark ? Colors.grey.shade300 : Colors.grey.shade800,
//             tooltip: t.translate('principal_tooltip'),
//           ),

//           const SizedBox(height: 6),

//           // Fee (if exists)
//           if (hasFee) ...[
//             _buildBreakdownRow(
//               label: t.translate('transfer_fee'),
//               amount: currency.format(feeAmount),
//               color: isDark ? Colors.grey.shade300 : Colors.grey.shade800,
//             ),
//           ],

//           const SizedBox(height: 6),

//           // Original 5% Interest
//           _buildBreakdownRow(
//             label: t.translate('interest_5_percent'),
//             amount: currency.format(originalInterest),
//             color: isDark ? Colors.grey.shade300 : Colors.grey.shade800,
//             tooltip: t.translate('interest_5_percent_tooltip'),
//           ),

//           // Additional Regular Interest (if any)
//           if (additionalRegularInterest > 0) ...[
//             const SizedBox(height: 6),
//             _buildBreakdownRow(
//               label: t.translate('additional_interest'),
//               amount: currency.format(additionalRegularInterest),
//               color: Colors.orange.shade400,
//               tooltip: t.translate('additional_interest_tooltip'),
//               // indent: true,
//             ),
//           ],

//           // Late Penalties (if any)
//           if (latePenalties > 0) ...[
//             const SizedBox(height: 6),
//             _buildBreakdownRow(
//               label: t.translate('late_penalties_18_percent'),
//               amount: currency.format(latePenalties),
//               color: AppTheme.errorColor,
//               icon: Icons.warning_amber_rounded,
//               tooltip: t.translate('late_penalties_tooltip'),
//             ),
//           ],

//           const SizedBox(height: 8),
//           Divider(
//             height: 1,
//             color: isDark ? Colors.grey.shade700 : Colors.grey.shade300,
//           ),
//           const SizedBox(height: 8),

//           // Total Due
//           _buildBreakdownRow(
//             label: t.translate('total_due'),
//             amount: currency.format(totalDue),
//             color: isOverdue ? AppTheme.errorColor : AppTheme.primaryColor,
//             isBold: true,
//             fontSize: 16,
//             tooltip: t.translate('total_due_tooltip'),
//           ),
//         ],
//       ),
//     );
//   }

//  // =========================================================
//   // PROGRESS SECTION WIDGET
//   // =========================================================
//   Widget _buildTotalProgressSection(
//     BuildContext context,
//     AppLocalizations t,
//     NumberFormat currency,
//     double progress,
//     double totalPaid,
//     double totalOriginalDebt,
//     double totalRemaining,
//     double originalPrincipal,
//     double remainingPrincipal,
//     double totalInterestAccrued,
//     double originalInterest,
//     bool isOverdue,
//   ) {
//     final isDark = Theme.of(context).brightness == Brightness.dark;

//     return Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         // ===================================
//         // ROW 1: TITLE + PERCENT ONLY
//         // ===================================
//         Row(
//           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//           children: [
//             Expanded(
//               child: Text(
//                 t.translate('payment_progress'),
//                 style: AppTheme.caption.copyWith(
//                   fontWeight: FontWeight.w600,
//                   color: isDark ? Colors.grey.shade300 : Colors.grey.shade700,
//                 ),
//                 maxLines: 1,
//                 overflow: TextOverflow.ellipsis,
//               ),
//             ),

//             const SizedBox(width: 8),

//             Text(
//               '${(progress * 100).toStringAsFixed(0)}%',
//               style: AppTheme.caption.copyWith(
//                 fontWeight: FontWeight.bold,
//                 color: isOverdue ? AppTheme.errorColor : AppTheme.primaryColor,
//               ),
//             ),
//           ],
//         ),

//         const SizedBox(height: 4),

//         // ===================================
//         // ROW 2: AMOUNT
//         // ===================================
//         Align(
//           alignment: Alignment.centerRight,
//           child: RichText(
//             maxLines: 1,
//             overflow: TextOverflow.ellipsis,
//             textAlign: TextAlign.right,
//             text: TextSpan(
//               children: [
//                 TextSpan(
//                   text: currency.format(totalPaid),
//                   style: AppTheme.caption.copyWith(
//                     fontWeight: FontWeight.bold,
//                     color: AppTheme.primaryColor,
//                   ),
//                 ),
//                 TextSpan(
//                   text: ' / ',
//                   style: AppTheme.caption.copyWith(
//                     color: isDark ? Colors.grey.shade500 : Colors.grey.shade600,
//                   ),
//                 ),
//                 TextSpan(
//                   text: currency.format(totalOriginalDebt),
//                   style: AppTheme.caption.copyWith(
//                     color: isDark ? Colors.grey.shade400 : Colors.grey.shade600,
//                   ),
//                 ),
//               ],
//             ),
//           ),
//         ),
//         const SizedBox(height: 6),

//         // ===================================
//         // PROGRESS BAR
//         // ===================================
//         ClipRRect(
//           borderRadius: BorderRadius.circular(4),
//           child: LinearProgressIndicator(
//             value: progress,
//             backgroundColor: isDark
//                 ? Colors.grey.shade800
//                 : Colors.grey.shade200,
//             valueColor: AlwaysStoppedAnimation<Color>(
//               isOverdue ? AppTheme.errorColor : AppTheme.primaryColor,
//             ),
//             minHeight: 8,
//           ),
//         ),
//       ],
//     );
//   }

//   // =========================================================
//   // WARNING MESSAGE WIDGET
//   // =========================================================
//   Widget _buildWarningMessage(
//     BuildContext context,
//     AppLocalizations t,
//     bool isOverdue,
//     int daysOverdue,
//     double latePenalties,
//     NumberFormat currency,
//   ) {
//     return Container(
//       padding: const EdgeInsets.all(10),
//       decoration: BoxDecoration(
//         color: AppTheme.warningColor.withOpacity(0.08),
//         borderRadius: BorderRadius.circular(8),
//         border: Border.all(color: AppTheme.warningColor.withOpacity(0.2)),
//       ),
//       child: Row(
//         children: [
//           Icon(
//             Icons.warning_amber_rounded,
//             size: 16,
//             color: AppTheme.warningColor,
//           ),
//           const SizedBox(width: 8),
//           Expanded(
//             child: Text(
//               isOverdue
//                   ? t
//                         .translate('overdue_warning_message')
//                         .replaceAll('{days}', daysOverdue.toString())
//                   : t
//                         .translate('late_penalty_warning')
//                         .replaceAll('{amount}', currency.format(latePenalties)),
//               style: AppTheme.caption.copyWith(
//                 color: AppTheme.warningColor,
//                 fontWeight: FontWeight.w500,
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }

//   // =========================================================
//   // ACTION BUTTONS WIDGET
//   // =========================================================
//   Widget _buildActionButtons(
//     BuildContext context,
//     AppLocalizations t,
//     bool isOverdue,
//   ) {
//     return Row(
//       children: [
//         Expanded(
//           child: ElevatedButton(
//             onPressed: onRepay,
//             style: ElevatedButton.styleFrom(
//               backgroundColor: isOverdue
//                   ? AppTheme.errorColor
//                   : AppTheme.secondaryColor,
//               foregroundColor: Colors.white,
//               padding: const EdgeInsets.symmetric(vertical: 14),
//               shape: RoundedRectangleBorder(
//                 borderRadius: BorderRadius.circular(12),
//               ),
//               elevation: 0,
//             ),
//             child: Row(
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: [
//                 const Icon(Icons.payments_rounded, size: 20),
//                 const SizedBox(width: 8),
//                 Text(
//                   isOverdue
//                       ? t.translate('repay_now_urgent')
//                       : t.translate('repay_now'),
//                   style: AppTheme.body1.copyWith(
//                     fontWeight: FontWeight.w600,
//                     color: Colors.white,
//                   ),
//                 ),
//               ],
//             ),
//           ),
//         ),
//         const SizedBox(width: 8),
//         // View details button
//         Container(
//           decoration: BoxDecoration(
//             border: Border.all(color: Colors.grey.shade300),
//             borderRadius: BorderRadius.circular(12),
//           ),
//           child: IconButton(
//             onPressed: () {
//               _showDetailsBottomSheet(context, t);
//             },
//             icon: const Icon(Icons.more_horiz_rounded),
//             color: Colors.grey.shade600,
//           ),
//         ),
//       ],
//     );
//   }

//   // =========================================================
//   // HELPER: Breakdown Row
//   // =========================================================
//   Widget _buildBreakdownRow({
//     required String label,
//     required String amount,
//     required Color color,
//     bool isBold = false,
//     IconData? icon,
//     double fontSize = 14,
//     String? tooltip,
//     bool indent = false,
//   }) {
//     Widget row = Row(
//       mainAxisAlignment: MainAxisAlignment.spaceBetween,
//       children: [
//         Row(
//           children: [
//             if (indent) const SizedBox(width: 16),
//             if (icon != null) ...[
//               Icon(icon, size: 16, color: color),
//               const SizedBox(width: 4),
//             ],
//             Text(
//               label,
//               style: AppTheme.body2.copyWith(
//                 color: Colors.grey.shade600,
//                 fontSize: fontSize - 1,
//               ),
//             ),
//           ],
//         ),
//         Text(
//           amount,
//           style: (isBold ? AppTheme.body1 : AppTheme.body2).copyWith(
//             color: color,
//             fontWeight: isBold ? FontWeight.bold : FontWeight.w600,
//             fontSize: fontSize,
//           ),
//         ),
//       ],
//     );

//     if (tooltip != null) {
//       return Tooltip(message: tooltip, child: row);
//     }

//     return row;
//   }

//  // =========================================================
//   // DETAILS BOTTOM SHEET 
//   // =========================================================
//   void _showDetailsBottomSheet(BuildContext context, AppLocalizations t) {
//     final currency = NumberFormat.currency(
//       locale: 'en_TZ',
//       symbol: 'TZS ',
//       decimalDigits: 0,
//     );

//     // Format UUID to show first 8 and last 4 characters
//     final shortId = _formatUuid(debt.id);

//     showModalBottomSheet(
//       context: context,
//       isScrollControlled: true,
//       shape: const RoundedRectangleBorder(
//         borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
//       ),
//       builder: (bottomSheetContext) {
//         return DraggableScrollableSheet(
//           initialChildSize: 0.5,
//           minChildSize: 0.3,
//           maxChildSize: 0.8,
//           expand: false,
//           builder: (draggableContext, scrollController) {
//             return Container(
//               padding: const EdgeInsets.all(20),
//               child: Column(
//                 mainAxisSize: MainAxisSize.min,
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   // Handle bar
//                   Center(
//                     child: Container(
//                       width: 40,
//                       height: 4,
//                       decoration: BoxDecoration(
//                         color: Colors.grey.shade300,
//                         borderRadius: BorderRadius.circular(2),
//                       ),
//                     ),
//                   ),
//                   const SizedBox(height: 16),

//                   Text(
//                     t.translate('transaction_details'),
//                     style: AppTheme.heading3,
//                   ),
//                   const SizedBox(height: 16),

//                   // Scrollable content
//                   Expanded(
//                     child: ListView(
//                       controller: scrollController,
//                       children: [
//                         // Transaction ID with copy button
//                         _buildDetailRowWithCopy(
//                           draggableContext,
//                           t,
//                           t.translate('transaction_id'),
//                           debt.id,
//                           shortId,
//                         ),

//                         const Divider(height: 1),

//                         _buildDetailRow(
//                           t.translate('created'),
//                           DateFormat(
//                             'MMM dd, yyyy HH:mm',
//                           ).format(DateTime.parse(debt.createdAt)),
//                         ),

//                         const Divider(height: 1),

//                         if (debt.dueDate != null) ...[
//                           _buildDetailRow(
//                             t.translate('due'),
//                             DateFormat(
//                               'MMM dd, yyyy',
//                             ).format(DateTime.parse(debt.dueDate!)),
//                           ),
//                           const Divider(height: 1),
//                         ],

//                         _buildDetailRow(
//                           t.translate('status'),
//                           debt.isOverdue
//                               ? t.translate('overdue')
//                               : t.translate('active'),
//                           valueColor: debt.isOverdue
//                               ? AppTheme.errorColor
//                               : Colors.green,
//                         ),

//                         const Divider(height: 1),

//                         _buildDetailRow(
//                           t.translate('interest_rate'),
//                           debt.interestRateDisplay,
//                         ),

//                         const Divider(height: 1),

//                         _buildDetailRow(
//                           t.translate('principal_amount'),
//                           currency.format(debt.amountAsDouble),
//                         ),
//                         const Divider(height: 1),

//                           // Fee (if exists)
//                         if (debt.hasFee) ...[
//                           _buildDetailRow(
//                             t.translate('transfer_fee'),
//                             currency.format(debt.feeAmountAsDouble),
//                           ),
//                         ],

//                         const Divider(height: 1),

//                         _buildDetailRow(
//                           t.translate('original_interest'),
//                           currency.format(
//                             debt.originalInterest5PercentAsDouble,
//                           ),
//                         ),

//                         if (debt.latePenaltiesAccruedAsDouble > 0) ...[
//                           const Divider(height: 1),
//                           _buildDetailRow(
//                             t.translate('late_penalties'),
//                             currency.format(debt.latePenaltiesAccruedAsDouble),
//                             valueColor: AppTheme.errorColor,
//                           ),
//                         ],

//                         const Divider(height: 1),

//                         _buildDetailRow(
//                           t.translate('total_due'),
//                           currency.format(debt.totalDueAsDouble),
//                           valueColor: AppTheme.primaryColor,
//                           isBold: true,
//                         ),

//                         if (debt.lastInterestCalculation != null) ...[
//                           const Divider(height: 1),
//                           _buildDetailRow(
//                             t.translate('last_interest_calc'),
//                             DateFormat('MMM dd, yyyy HH:mm').format(
//                               DateTime.parse(debt.lastInterestCalculation!),
//                             ),
//                           ),
//                         ],

//                         if (debt.description != null &&
//                             debt.description!.isNotEmpty) ...[
//                           const Divider(height: 1),
//                           _buildDetailRow(
//                             t.translate('description'),
//                             debt.description!,
//                           ),
//                         ],

//                         const SizedBox(height: 20),
//                       ],
//                     ),
//                   ),

//                   // Close button
//                   SizedBox(
//                     width: double.infinity,
//                     child: ElevatedButton(
//                       onPressed: () => Navigator.pop(draggableContext),
//                       style: ElevatedButton.styleFrom(
//                         backgroundColor: AppTheme.primaryColor,
//                         foregroundColor: Colors.white,
//                         padding: const EdgeInsets.symmetric(vertical: 14),
//                         shape: RoundedRectangleBorder(
//                           borderRadius: BorderRadius.circular(12),
//                         ),
//                       ),
//                       child: Text(t.translate('close')),
//                     ),
//                   ),
//                 ],
//               ),
//             );
//           },
//         );
//       },
//     );
//   }

//   // Helper: Format UUID to short version
//   String _formatUuid(String uuid) {
//     if (uuid.length <= 12) return uuid;
//     return '${uuid.substring(0, 8)}...${uuid.substring(uuid.length - 4)}';
//   }

//   Widget _buildDetailRowWithCopy(
//     BuildContext context,
//     AppLocalizations t,
//     String label,
//     String fullValue,
//     String displayValue,
//   ) {
//     return Padding(
//       padding: const EdgeInsets.symmetric(vertical: 12),
//       child: Row(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           SizedBox(
//             width: 120,
//             child: Text(
//               label,
//               style: AppTheme.body2.copyWith(color: Colors.grey.shade600),
//             ),
//           ),
//           Expanded(
//             child: Row(
//               children: [
//                 Expanded(
//                   child: Text(
//                     displayValue,
//                     style: AppTheme.body2.copyWith(
//                       fontWeight: FontWeight.w500,
//                       fontFamily: 'monospace',
//                     ),
//                     overflow: TextOverflow.ellipsis,
//                   ),
//                 ),
//                 const SizedBox(width: 8),
//                 InkWell(
//                   onTap: () {
//                     Clipboard.setData(ClipboardData(text: fullValue));
//                     // Use the passed context and localization
//                     ScaffoldMessenger.of(context).showSnackBar(
//                       SnackBar(
//                         content: Text(t.translate('transaction_id_copied')),
//                         duration: const Duration(seconds: 2),
//                         behavior: SnackBarBehavior.floating,
//                         shape: RoundedRectangleBorder(
//                           borderRadius: BorderRadius.circular(8),
//                         ),
//                       ),
//                     );
//                   },
//                   borderRadius: BorderRadius.circular(20),
//                   child: Padding(
//                     padding: const EdgeInsets.all(8.0),
//                     child: Icon(
//                       Icons.copy_rounded,
//                       size: 18,
//                       color: Colors.grey.shade500,
//                     ),
//                   ),
//                 ),
//               ],
//             ),
//           ),
//         ],
//       ),
//     );
//   }

//   // Helper: Detail row
//   Widget _buildDetailRow(
//     String label,
//     String value, {
//     Color? valueColor,
//     bool isBold = false,
//   }) {
//     return Padding(
//       padding: const EdgeInsets.symmetric(vertical: 12),
//       child: Row(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           SizedBox(
//             width: 120,
//             child: Text(
//               label,
//               style: AppTheme.body2.copyWith(color: Colors.grey.shade600),
//             ),
//           ),
//           Expanded(
//             child: Text(
//               value,
//               style: AppTheme.body2.copyWith(
//                 fontWeight: isBold ? FontWeight.bold : FontWeight.w500,
//                 color: valueColor,
//               ),
//               overflow: TextOverflow.ellipsis,
//               maxLines: 2,
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
