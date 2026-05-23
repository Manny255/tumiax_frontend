import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../../../core/localization/app_localizations.dart';
import '../../../../../core/routing/route_names.dart';
import '../../../../../core/themes/app_theme.dart';
import '../../../../../core/widgets/tumiax_button.dart';
import '../../../../auth/providers/auth_providers.dart';


class SettingsLogoutButton extends ConsumerWidget {
  const SettingsLogoutButton({super.key});

Future<void> _handleLogout(BuildContext context, WidgetRef ref) async {
    await ref.read(authControllerProvider.notifier).logout();

    if (context.mounted) {
      context.go(RouteNames.login);
    }
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final t = AppLocalizations.of(context);

    return TumiaxButton(
      text: t.translate("logout"),
      onPressed: () => _showLogoutDialog(context, ref),
      isOutlined: true,
      color: AppTheme.errorColor,
    );
  }

  void _showLogoutDialog(BuildContext context, WidgetRef ref) {
    final t = AppLocalizations.of(context);

    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(t.translate("logout")),
        content: Text(t.translate("logout_confirmation")),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: Text(t.translate("cancel")),
          ),
          ElevatedButton(
            onPressed: () async {
              Navigator.pop(context);
              await _handleLogout(context, ref);
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: AppTheme.errorColor,
            ),
            child: Text(t.translate("logout")),
          ),
    
          
        ],
      ),
    );
  }
}
