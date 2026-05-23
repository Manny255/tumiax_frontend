import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../../core/localization/app_localizations.dart';
import '../../../../core/themes/app_theme.dart';
import '../../../auth/data/models/user_model.dart';
import '../../../auth/providers/auth_providers.dart';

class ProfilePage extends HookConsumerWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final t = AppLocalizations.of(context);

    /// synchronous user
    final user = ref.watch(userProvider);

    /// guard 
    if (user == null) {
      return const SizedBox.shrink();
    }

    return Scaffold(
      backgroundColor: Colors.white,

      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,

        title: Text(
          t.translate('profile'),
          style: AppTheme.heading3.copyWith(color: AppTheme.primaryColor),
        ),
      ),

      body: SingleChildScrollView(
        padding: const EdgeInsets.all(AppTheme.defaultPadding),

        child: Column(children: [_buildAccountInfo(context, user, t)]),
      ),
    );
  }

  /*
  ==========================
  ACCOUNT INFO CARD
  ==========================
  */

  Widget _buildAccountInfo(
    BuildContext context,
    UserModel user,
    AppLocalizations t,
  ) {
    return Container(
      width: double.infinity,

      padding: const EdgeInsets.all(20),

      decoration: BoxDecoration(
        color: Colors.white,

        borderRadius: BorderRadius.circular(16),

        border: Border.all(color: Colors.grey.shade200),

        boxShadow: [
          BoxShadow(
            color: Colors.grey.withValues(alpha: 0.05),
            blurRadius: 10,
            offset: const Offset(0, 2),
          ),
        ],
      ),

      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,

        children: [
          /*
          HEADER
          */
          Row(
            children: [
              Container(
                padding: const EdgeInsets.all(8),

                decoration: BoxDecoration(
                  color: AppTheme.primaryColor.withValues(alpha: 0.1),

                  borderRadius: BorderRadius.circular(8),
                ),

                child: Icon(
                  Icons.info_outline,
                  size: 16,
                  color: AppTheme.primaryColor,
                ),
              ),

              const SizedBox(width: 12),

              Text(
                t.translate('account_information'),

                style: AppTheme.body1.copyWith(fontWeight: FontWeight.bold),
              ),
            ],
          ),

          const SizedBox(height: 20),

          /*
          EMAIL
          */
          _buildInfoRow(
            icon: Icons.email_outlined,

            label: t.translate('email'),

            value: user.email,
          ),

          const Padding(
            padding: EdgeInsets.symmetric(vertical: 12),

            child: Divider(height: 1),
          ),

          /*
          MEMBER SINCE
          */
          _buildInfoRow(
            icon: Icons.calendar_today_outlined,

            label: t.translate('member_since'),

            value: _formatDate(user.createdAt, t),
          ),

          const Padding(
            padding: EdgeInsets.symmetric(vertical: 12),

            child: Divider(height: 1),
          ),

          /*
          KYC STATUS
          */
          _buildInfoRow(
            icon: user.isVerified ? Icons.verified : Icons.pending_outlined,

            label: t.translate('verification'),

            value: user.isVerified
                ? t.translate('verified')
                : t.translate('pending'),

            valueColor: user.isVerified ? Colors.green : Colors.orange,
          ),
        ],
      ),
    );
  }

  /*
  ==========================
  INFO ROW
  ==========================
  */

  Widget _buildInfoRow({
    required IconData icon,
    required String label,
    required String value,
    Color? valueColor,
  }) {
    return Row(
      children: [
        Icon(icon, size: 18, color: Colors.grey.shade600),

        const SizedBox(width: 12),

        Expanded(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,

            children: [
              Text(
                label,

                style: AppTheme.caption.copyWith(color: Colors.grey.shade600),
              ),

              Text(
                value,

                style: AppTheme.body2.copyWith(
                  fontWeight: FontWeight.w600,

                  color: valueColor,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  /*
  ==========================
  DATE FORMATTER
  ==========================
  */

  String _formatDate(DateTime date, AppLocalizations t) {
    final now = DateTime.now();

    final difference = now.difference(date);

    if (difference.inDays > 365) {
      final years = (difference.inDays / 365).floor();

      return years == 1
          ? t.translate('year_ago', params: {'count': '$years'})
          : t.translate('years_ago', params: {'count': '$years'});
    }

    if (difference.inDays > 30) {
      final months = (difference.inDays / 30).floor();

      return months == 1
          ? t.translate('month_ago', params: {'count': '$months'})
          : t.translate('months_ago', params: {'count': '$months'});
    }

    final days = difference.inDays;

    return days == 1
        ? t.translate('day_ago', params: {'count': '$days'})
        : t.translate('days_ago', params: {'count': '$days'});
  }
}
