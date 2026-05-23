import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../../../core/localization/app_localizations.dart';
import '../../../../../core/themes/app_theme.dart';
import '../../../../version/providers/version_providers.dart';
import '../../../../version/presentation/widgets/update_dialog.dart';
import 'settings_tile.dart';

class SettingsAboutSection extends ConsumerWidget {
  const SettingsAboutSection({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final t = AppLocalizations.of(context);
    final versionCheckAsync = ref.watch(versionCheckProvider);
    final currentVersionAsync = ref.watch(currentVersionProvider);

    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withValues(alpha: 0.1),
            blurRadius: 5,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        children: [
          // App Version Tile
          currentVersionAsync.when(
            data: (currentVersion) {
              return SettingsTile(
                icon: Icons.info_outline,
                title: t.translate("app_version"),
                trailing: versionCheckAsync.when(
                  data: (result) {
                    return Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          currentVersion,
                          style: AppTheme.body2.copyWith(
                            color: result.needsUpdate
                                ? AppTheme.primaryColor
                                : Colors.grey,
                            fontWeight: result.needsUpdate
                                ? FontWeight.bold
                                : FontWeight.normal,
                          ),
                        ),
                        if (result.needsUpdate) ...[
                          const SizedBox(width: 8),
                          Container(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 6,
                              vertical: 2,
                            ),
                            decoration: BoxDecoration(
                              color: AppTheme.primaryColor.withValues(
                                alpha: 0.1,
                              ),
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: Text(
                              t.translate('new_version_available'),
                              style: AppTheme.caption.copyWith(
                                color: AppTheme.primaryColor,
                                fontSize: 10,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ],
                      ],
                    );
                  },
                  loading: () => Text(
                    currentVersion,
                    style: AppTheme.body2.copyWith(color: Colors.grey),
                  ),
                  error: (_, _) => Text(
                    currentVersion,
                    style: AppTheme.body2.copyWith(color: Colors.grey),
                  ),
                ),
                onTap: () async {
                  final messenger = ScaffoldMessenger.of(context);

                  // Refresh and get the new value
                  final refreshed = await ref.refresh(
                    versionCheckProvider.future,
                  );

                  if (context.mounted) {
                    if (refreshed.needsUpdate) {
                      UpdateDialog.show(
                        context: context,
                        version: refreshed.latestVersion,
                        isForceUpdate: refreshed.isForceUpdate,
                        currentVersion: refreshed.currentVersion,
                      );
                    } else {
                      messenger.showSnackBar(
                        SnackBar(
                          content: Text(t.translate('app_up_to_date')),
                          backgroundColor: AppTheme.secondaryColor,
                          behavior: SnackBarBehavior.floating,
                        ),
                      );
                    }
                  }
                },
              );
            },
            loading: () => SettingsTile(
              icon: Icons.info_outline,
              title: t.translate("app_version"),
              trailing: const CircularProgressIndicator(),
            ),
            error: (_, _) => SettingsTile(
              icon: Icons.info_outline,
              title: t.translate("app_version"),
              trailing: Text(t.translate("error")),
            ),
          ),

          _buildDivider(),

          // Terms of Service
          SettingsTile(
            icon: Icons.description_outlined,
            title: t.translate("terms_of_service"),
            onTap: () => _launchURL('https://tumiax.com/terms'),
          ),

          _buildDivider(),

          // Privacy Policy
          SettingsTile(
            icon: Icons.privacy_tip_outlined,
            title: t.translate("privacy_policy"),
            onTap: () => _launchURL('https://tumiax.com/privacy'),
          ),

          _buildDivider(),

          // Rate Us
          SettingsTile(
            icon: Icons.star_outline,
            title: t.translate("rate_us"),
            onTap: () => _launchStore(context),
          ),
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

  Future<void> _launchURL(String url) async {
    final uri = Uri.parse(url);

    if (await canLaunchUrl(uri)) {
      await launchUrl(uri, mode: LaunchMode.externalApplication);
    }
  }

  Future<void> _launchStore(BuildContext context) async {
    final packageName = 'com.tumiax.app';

    final url = Theme.of(context).platform == TargetPlatform.iOS
        ? 'https://apps.apple.com/app/id$packageName'
        : 'market://details?id=$packageName';

    try {
      await _launchURL(url);
    } catch (_) {
      if (!context.mounted) return;
      if (Theme.of(context).platform != TargetPlatform.iOS) {
        await _launchURL(
          'https://play.google.com/store/apps/details?id=$packageName',
        );
      }
    }
  }
}
