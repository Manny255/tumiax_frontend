import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../../../core/localization/app_localizations.dart';
import '../../../../core/themes/app_theme.dart';
import '../../../../core/widgets/tumiax_button.dart';
import '../../data/models/app_version_model.dart';

class UpdateDialog {
  static void show({
    required BuildContext context,
    required AppVersionModel version,
    required bool isForceUpdate,
    required String currentVersion,
  }) {
    final t = AppLocalizations.of(context);

    showDialog(
      context: context,
      barrierDismissible: !isForceUpdate,
      builder: (context) => PopScope(
        canPop: !isForceUpdate,
        child: AlertDialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          title: Column(
            children: [
              Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: isForceUpdate
                      ? Colors.orange.shade50
                      : AppTheme.primaryColor.withOpacity(0.1),
                  shape: BoxShape.circle,
                ),
                child: Icon(
                  isForceUpdate
                      ? Icons.warning_amber_rounded
                      : Icons.system_update,
                  size: 32,
                  color: isForceUpdate ? Colors.orange : AppTheme.primaryColor,
                ),
              ),
              const SizedBox(height: 16),
              Text(
                isForceUpdate
                    ? t.translate('update_required')
                    : t.translate('update_available'),
                style: AppTheme.heading3,
              ),
            ],
          ),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                isForceUpdate
                    ? t.translate('force_update_message')
                    : t.translate('optional_update_message'),
                style: AppTheme.body2,
              ),
              const SizedBox(height: 16),
              _buildVersionRow(
                t.translate('current_version'),
                currentVersion,
                Colors.grey,
              ),
              const SizedBox(height: 8),
              _buildVersionRow(
                t.translate('latest_version'),
                version.version,
                AppTheme.primaryColor,
              ),
              if (version.releaseNotes != null &&
                  version.releaseNotes!.isNotEmpty) ...[
                const SizedBox(height: 16),
                Text(
                  t.translate('whats_new'),
                  style: AppTheme.body1.copyWith(fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 8),
                Text(version.releaseNotes!, style: AppTheme.body2),
              ],
            ],
          ),
          actions: [
            if (!isForceUpdate)
              TextButton(
                onPressed: () => Navigator.pop(context),
                child: Text(t.translate('later')),
              ),
            TumiaxButton(
              text: t.translate('update_now'),
              onPressed: () async {
                if (version.updateUrl != null) {
                  final url = Uri.parse(version.updateUrl!);
                  if (await canLaunchUrl(url)) {
                    await launchUrl(url);
                  }
                }
                if (!isForceUpdate) {
                  Navigator.pop(context);
                }
              },
              width: double.infinity,
            ),
          ],
        ),
      ),
    );
  }

  static Widget _buildVersionRow(String label, String version, Color color) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: color.withOpacity(0.05),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(label, style: AppTheme.caption),
          Text(
            version,
            style: AppTheme.body2.copyWith(
              fontWeight: FontWeight.bold,
              color: color,
            ),
          ),
        ],
      ),
    );
  }
}
