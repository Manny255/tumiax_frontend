// lib/features/dashboard/presentation/widgets/credit_card_widget.dart

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../../../core/themes/app_theme.dart';
import '../../../../core/localization/app_localizations.dart';
import '../../../credit/data/models/credit_account_model.dart';

class CreditCardWidget extends StatefulWidget {
  final CreditAccountModel creditAccount;
  final VoidCallback? onReveal;

  const CreditCardWidget({
    super.key,
    required this.creditAccount,
    this.onReveal,
  });

  @override
  State<CreditCardWidget> createState() => _CreditCardWidgetState();
}

class _CreditCardWidgetState extends State<CreditCardWidget> {
  bool _isVisible = false;

  void _toggleVisibility() {
    final newValue = !_isVisible;

    setState(() {
      _isVisible = newValue;
    });

    /// Notify parent when revealing
    if (newValue) {
      widget.onReveal?.call();
    }

    /// Auto hide after 10 seconds
    if (newValue) {
      Future.delayed(const Duration(seconds: 10), () {
        if (mounted) {
          setState(() => _isVisible = false);
        }
      });
    }
  }

  String _maskAmount() => 'TZS ••••••';

  @override
  Widget build(BuildContext context) {
    final formatCurrency = NumberFormat.currency(
      locale: 'en_TZ',
      symbol: 'TZS ',
      decimalDigits: 0,
    );

    final t = AppLocalizations.of(context);

    final utilization = widget.creditAccount.utilizationRatio;
    final isHighUtilization = utilization > 80;

    String formatOrMask(double amount) {
      return _isVisible ? formatCurrency.format(amount) : _maskAmount();
    }

    return Container(
      height: 220,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            AppTheme.primaryColor,
            AppTheme.primaryColor.withValues(alpha: 0.8),
            isHighUtilization
                ? AppTheme.errorColor.withValues(alpha: 0.3)
                : AppTheme.secondaryColor.withValues(alpha: 0.3),
          ],
        ),
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: AppTheme.primaryColor.withValues(alpha: 0.3),
            blurRadius: 15,
            offset: const Offset(0, 8),
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            /// Header
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(
                  height: 60,
                  width: 60,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(8),
                    child: Image.asset(
                      'assets/images/tumiax-icon.png',
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Row(
                  children: [
                    IconButton(
                      onPressed: _toggleVisibility,
                      icon: Icon(
                        _isVisible ? Icons.visibility : Icons.visibility_off,
                        color: Colors.white,
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 8,
                        vertical: 4,
                      ),
                      decoration: BoxDecoration(
                        color: isHighUtilization
                            ? AppTheme.errorColor
                            : Colors.white.withValues(alpha: 0.2),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Text(
                        '${utilization.toStringAsFixed(1)}%',
                        style: AppTheme.caption.copyWith(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),

            const SizedBox(height: 16),

            Text(
              formatOrMask(widget.creditAccount.creditLimitAsDouble),
              style: const TextStyle(
                color: Colors.white,
                fontSize: 28,
                fontWeight: FontWeight.bold,
                fontFamily: 'Poppins',
              ),
            ),

            const SizedBox(height: 8),

            Row(
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        t.translate('used'),
                        style: AppTheme.caption.copyWith(
                          color: Colors.white.withValues(alpha: 0.7),
                        ),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        formatOrMask(widget.creditAccount.usedAmountAsDouble),
                        style: AppTheme.body1.copyWith(
                          color: Colors.white,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        t.translate('available'),
                        style: AppTheme.caption.copyWith(
                          color: Colors.white.withValues(alpha: 0.7),
                        ),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        formatOrMask(widget.creditAccount.availableCredit),
                        style: AppTheme.body1.copyWith(
                          color: Colors.white,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),

            // const Spacer(),

            // ClipRRect(
            //   borderRadius: BorderRadius.circular(4),
            //   child: LinearProgressIndicator(
            //     value: utilization / 100,
            //     backgroundColor: Colors.white.withValues(alpha: 0.2),
            //     valueColor: AlwaysStoppedAnimation<Color>(
            //       isHighUtilization
            //           ? AppTheme.errorColor
            //           : AppTheme.secondaryColor,
            //     ),
            //     minHeight: 6,
            //   ),
            // ),
          ],
        ),
      ),
    );
  }
}
