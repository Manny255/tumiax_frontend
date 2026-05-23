import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../../../core/localization/app_localizations.dart';
import '../../../../../core/routing/route_names.dart';
import 'settings_tile.dart';

class SettingsAccountSection extends ConsumerWidget {
  final bool isAuthenticated;

  const SettingsAccountSection({super.key, required this.isAuthenticated});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final t = AppLocalizations.of(context);

    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.1),
            blurRadius: 5,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        children: [
          if (isAuthenticated) ...[
            SettingsTile(
              icon: Icons.person_outline,
              title: t.translate("profile"),
              onTap: () => context.push(RouteNames.profile),
            ),
            _buildDivider(),
            SettingsTile(
              icon: Icons.verified_user_outlined,
              title: t.translate("kyc_verification"),
              // subtitle: t.translate("not_verified"),
              onTap: () => context.push(RouteNames.kycVerification),
            ),
          ] else ...[
            SettingsTile(
              icon: Icons.login,
              title: t.translate("login"),
              onTap: () => context.go(RouteNames.login),
            ),
            _buildDivider(),
            SettingsTile(
              icon: Icons.person_add,
              title: t.translate("register"),
              onTap: () => context.go(RouteNames.register),
            ),
          ],
        ],
      ),
    );
  }

  Widget _buildDivider() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Divider(height: 1, color: Colors.grey.shade200),
    );
  }
}
