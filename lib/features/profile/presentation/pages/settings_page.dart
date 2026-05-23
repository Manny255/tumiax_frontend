import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:package_info_plus/package_info_plus.dart';

import '../../../../core/localization/app_localizations.dart';
import '../../../../core/themes/app_theme.dart';
import '../../../../core/themes/theme_provider.dart';
import '../../../auth/providers/auth_providers.dart';
import '../widgets/settings/settings_about_section.dart';
import '../widgets/settings/settings_account_section.dart';
import '../widgets/settings/settings_delete_account.dart';
import '../widgets/settings/settings_logout_button.dart';
import '../widgets/settings/settings_preferences_section.dart';
import '../widgets/settings/settings_profile_card.dart';
import '../widgets/settings/settings_section_title.dart';
import '../widgets/settings/settings_security_section.dart';
import '../widgets/settings/settings_support_section.dart';

class SettingsPage extends HookConsumerWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final t = AppLocalizations.of(context);
    final themeMode = ref.watch(themeModeProvider);
    final isAuthenticated = ref.watch(isAuthenticatedProvider);
    final user = ref.watch(userProvider);

    // Package info for version
    final packageInfo = useState<PackageInfo?>(null);

    // Load package info on init
    useEffect(() {
      PackageInfo.fromPlatform().then((info) {
        packageInfo.value = info;
      });
      return null;
    }, []);

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Text(
          t.translate("settings"),
          style: AppTheme.heading3.copyWith(color: AppTheme.primaryColor),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(AppTheme.defaultPadding),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Profile Card Section
            if (isAuthenticated && user != null)
              SettingsProfileCard(user: user)
            else if (isAuthenticated && user == null)
              const Center(child: CircularProgressIndicator()),

            const SizedBox(height: 24),

            // Account Settings Section
            SettingsSectionTitle(title: t.translate("account")),
            const SizedBox(height: 8),
            SettingsAccountSection(isAuthenticated: isAuthenticated),

            const SizedBox(height: 24),

            // Preferences Section
            SettingsSectionTitle(title: t.translate("preferences")),
            const SizedBox(height: 8),
            SettingsPreferencesSection(themeMode: themeMode),

            const SizedBox(height: 24),

            // Security Section
            SettingsSectionTitle(title: t.translate("security")),
            const SizedBox(height: 8),
            const SettingsSecuritySection(),

            const SizedBox(height: 24),

            // Support Section
            SettingsSectionTitle(title: t.translate("support")),
            const SizedBox(height: 8),
            const SettingsSupportSection(),

            const SizedBox(height: 24),

            // About Section
            SettingsSectionTitle(title: t.translate("about")),
            const SizedBox(height: 8),
            SettingsAboutSection(),

            const SizedBox(height: 32),

            // Logout Button (if authenticated)
            if (isAuthenticated) const SettingsLogoutButton(),

            const SizedBox(height: 16),

            // Delete Account (bottom, less prominent)
            if (isAuthenticated) const SettingsDeleteAccount(),
          ],
        ),
      ),
    );
  }
}
