import 'dart:io';

import 'package:device_info_plus/device_info_plus.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:url_launcher/url_launcher.dart';

import '../localization/app_localizations.dart';
import '../../features/auth/providers/auth_providers.dart';

class SupportEmailService {
  static Future<void> sendSupportEmail({
    required BuildContext context,
    required WidgetRef ref,
  }) async {
    final t = AppLocalizations.of(context);

    /// get user
    final user = ref.read(userProvider);
    final userEmail = user?.email ?? 'Not logged in';

    final deviceInfo = DeviceInfoPlugin();
    final packageInfo = await PackageInfo.fromPlatform();

    String device = "Unknown";
    String os = "Unknown";

    if (Platform.isAndroid) {
      final android = await deviceInfo.androidInfo;
      device = android.model;
      os = "Android ${android.version.release}";
    }

    if (Platform.isIOS) {
      final ios = await deviceInfo.iosInfo;
      device = ios.utsname.machine;
      os = "iOS ${ios.systemVersion}";
    }

    final subject = Uri.encodeComponent(t.translate("support_request_subject"));

    final body = Uri.encodeComponent("""
${t.translate("describe_issue")}

------------------------

${t.translate("email")}: $userEmail
${t.translate("app_version")}: ${packageInfo.version}
${t.translate("device")}: $device
${t.translate("os_version")}: $os
""");

    final uri = Uri.parse(
      "mailto:support@tumiax.com?subject=$subject&body=$body",
    );

    try {
      await launchUrl(uri, mode: LaunchMode.externalApplication);
    } catch (_) {
      if (context.mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text(t.translate("no_email_app_found"))),
        );
      }
    }
  }
}
