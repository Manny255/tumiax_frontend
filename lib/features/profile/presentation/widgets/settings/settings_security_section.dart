import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../../../core/localization/app_localizations.dart';
import '../../../../../core/routing/route_names.dart';
import '../../../../../core/themes/app_theme.dart';
import 'settings_tile.dart';

class SettingsSecuritySection extends ConsumerWidget {
  const SettingsSecuritySection({super.key});

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
          SettingsTile(
            icon: Icons.lock_outline,
            title: t.translate("change_password"),
            onTap: () => context.push(RouteNames.changePassword),
          ),
          // _buildDivider(),
          // SettingsTile(
          //   icon: Icons.fingerprint,
          //   title: t.translate("biometric_login"),
          //   trailing: Switch(
          //     value: false,
          //     onChanged: (value) {},
          //     activeColor: AppTheme.primaryColor,
          //   ),
          // ),
          // _buildDivider(),
          // SettingsTile(
          //   icon: Icons.pin_outlined,
          //   title: t.translate("app_pin"),
          //   trailing: Switch(
          //     value: false,
          //     onChanged: (value) {},
          //     activeColor: AppTheme.primaryColor,
          //  ),
          // ),
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
