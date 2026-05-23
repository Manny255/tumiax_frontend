import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../../../core/localization/app_localizations.dart';
import '../../../../../core/routing/route_names.dart';
import '../../../../../core/themes/app_theme.dart';
import '../../../../auth/presentation/controllers/auth_controller.dart';
import '../../../../auth/providers/auth_providers.dart';

class SettingsDeleteAccount extends ConsumerStatefulWidget {
  const SettingsDeleteAccount({super.key});

  @override
  ConsumerState<SettingsDeleteAccount> createState() =>
      _SettingsDeleteAccountState();
}

class _SettingsDeleteAccountState extends ConsumerState<SettingsDeleteAccount> {
  bool _isLoading = false;


    late final ProviderSubscription<AuthState> _authSub;

  @override
  void initState() {
    super.initState();

    _authSub = ref.listenManual<AuthState>(authControllerProvider, (
      previous,
      next,
    ) {
      final t = AppLocalizations.of(context);

      next.maybeWhen(
        loading: () {
          if (mounted) {
            setState(() => _isLoading = true);
          }
        },

        error: (message) {
          if (mounted) {
            setState(() => _isLoading = false);
            _showErrorSnackBar(context, message);
          }
        },

        accountDeleted: () {
          if (!mounted) return;

          setState(() => _isLoading = false);

          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(t.translate("account_deletion_scheduled")),
              backgroundColor: Colors.green,
              duration: const Duration(seconds: 5),
            ),
          );

          Navigator.of(
            context,
          ).pushNamedAndRemoveUntil(RouteNames.login, (route) => false);
        },

        orElse: () {
          if (mounted) {
            setState(() => _isLoading = false);
          }
        },
      );
    });
  }

  @override
  void dispose() {
    _authSub.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final t = AppLocalizations.of(context);

    return Center(
      child: _isLoading
          ? const SizedBox(
              height: 20,
              width: 20,
              child: CircularProgressIndicator(strokeWidth: 2),
            )
          : TextButton(
              onPressed: _showDeleteAccountDialog,
              style: TextButton.styleFrom(foregroundColor: Colors.grey),
              child: Text(
                t.translate("delete_account"),
                style: AppTheme.caption,
              ),
            ),
    );
  }

  void _showDeleteAccountDialog() {
    final t = AppLocalizations.of(context);

    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(t.translate("delete_account")),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Main confirmation message
            Text(t.translate("delete_account_confirmation")),

            const SizedBox(height: 16),

            // Warning about credit/payments
            Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: AppTheme.warningColor.withValues(alpha: 0.1),
                borderRadius: BorderRadius.circular(8),
                border: Border.all(
                  color: AppTheme.warningColor.withValues(alpha: 0.3),
                ),
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Icon(
                    Icons.info_outline,
                    color: AppTheme.warningColor,
                    size: 20,
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: Text(
                      t.translate("delete_account_restrictions"),
                      style: TextStyle(
                        color: AppTheme.warningColor,
                        fontSize: 14,
                      ),
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 8),

            // Note about reversibility
            Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: AppTheme.infoColor.withValues(alpha: 0.1),
                borderRadius: BorderRadius.circular(8),
                border: Border.all(
                  color: AppTheme.infoColor.withValues(alpha: 0.3),
                ),
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Icon(Icons.restore, color: AppTheme.infoColor, size: 20),
                  const SizedBox(width: 12),
                  Expanded(
                    child: Text(
                      t.translate("delete_account_reversible"),
                      style: TextStyle(color: AppTheme.infoColor, fontSize: 14),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: Text(t.translate("cancel")),
          ),
          TextButton(
            onPressed: () {
              Navigator.pop(context);
              _deleteAccount();
            },
            style: TextButton.styleFrom(foregroundColor: AppTheme.errorColor),
            child: Text(t.translate("delete")),
          ),
        ],
      ),
    );
  }

  Future<void> _deleteAccount() async {
    setState(() {
      _isLoading = true;
    });

    await ref.read(authControllerProvider.notifier).deleteAccount();
  }

  void _showErrorSnackBar(BuildContext context, String message) {
    final t = AppLocalizations.of(context);

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        backgroundColor: AppTheme.errorColor,
        duration: const Duration(seconds: 4),
        action: SnackBarAction(
          label: t.translate("dismiss"),
          textColor: Colors.white,
          onPressed: () {
            ScaffoldMessenger.of(context).hideCurrentSnackBar();
          },
        ),
      ),
    );
  }
}

