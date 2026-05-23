import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import '../../../../core/localization/app_localizations.dart';
import '../../../../core/themes/app_theme.dart';

class TransferBalanceCard extends StatelessWidget {
  final AsyncValue creditState;

  const TransferBalanceCard({super.key, required this.creditState});

  @override
  Widget build(BuildContext context) {
    final t = AppLocalizations.of(context);

    return creditState.when(
      data: (creditAccount) => _buildBalanceCard(creditAccount, t),
      loading: () => Container(
        height: 120,
        alignment: Alignment.center,
        child: const CircularProgressIndicator(),
      ),
      error: (error, stack) => _buildErrorCard(t),
    );
  }

  Widget _buildBalanceCard(creditAccount, AppLocalizations t) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [AppTheme.primaryColor, Color(0xFF1a4a7a)],
        ),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            t.translate('available_balance'),
            style: AppTheme.caption.copyWith(color: Colors.white70),
          ),
          const SizedBox(height: 8),
          Text(
            'TZS ${creditAccount.availableCredit}',
            style: const TextStyle(
              color: Colors.white,
              fontSize: 28,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 8),
          LinearProgressIndicator(
            value: creditAccount.utilizationRatio / 100,
            backgroundColor: Colors.white.withOpacity(0.2),
            valueColor: const AlwaysStoppedAnimation<Color>(Colors.white),
          ),
        ],
      ),
    );
  }

  Widget _buildErrorCard(AppLocalizations t) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppTheme.errorColor.withValues(alpha: 0.1),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Text(
        t.translate("failed_to_load_credit"),
        style: AppTheme.body2.copyWith(color: AppTheme.errorColor),
      ),
    );
  }
}
