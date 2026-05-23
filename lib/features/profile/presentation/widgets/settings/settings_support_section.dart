import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../../../core/localization/app_localizations.dart';
import '../../../../../core/services/support_email_service.dart';
import 'settings_tile.dart';

class SettingsSupportSection extends ConsumerWidget {
  const SettingsSupportSection({super.key});

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
            icon: Icons.help_outline,
            title: t.translate("faq"),
            onTap: () => _launchURL('https://tumiax.com/faq'),
          ),
          _buildDivider(),
          SettingsTile(
            icon: Icons.support_agent,
            title: t.translate("contact_support"),
            onTap: () => SupportEmailService.sendSupportEmail(
              context: context,
              ref: ref
            ),
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
      await launchUrl(uri);
    }
  }
}
