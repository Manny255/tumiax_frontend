// lib/features/settings/presentation/widgets/settings_preferences_section.dart
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../../../core/localization/app_localizations.dart';
import '../../../../../core/localization/language_selector.dart';
import '../../../../../core/themes/app_theme.dart';
import '../../../../../core/themes/theme_provider.dart';
import 'settings_tile.dart';

class SettingsPreferencesSection extends ConsumerWidget {
  final ThemeMode themeMode;

  const SettingsPreferencesSection({super.key, required this.themeMode});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final t = AppLocalizations.of(context);

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
          // Language
          SettingsTile(
            icon: Icons.language,
            title: t.translate("language"),
            trailing: const LanguageSelector(isCompact: true),
            onTap: () => _showLanguageDialog(context, ref),
          ),
          _buildDivider(),

            // Theme Mode
            SettingsTile(
              icon: Icons.brightness_4,
              title: t.translate("theme"),
              trailing: DropdownButton<ThemeMode>(
                value: themeMode,
                underline: const SizedBox(),
                icon: const Icon(
                  Icons.arrow_drop_down,
                  color: AppTheme.primaryColor,
                ),
                // onChanged: (ThemeMode? newMode) {
                //   if (newMode != null) {
                //     ref.read(themeModeProvider.notifier).setTheme(newMode);
                //   }
                // },
                onChanged: null, 
                items: [
                  DropdownMenuItem(value: ThemeMode.light, child: Text(t.translate("light"))),
                  DropdownMenuItem(value: ThemeMode.dark, child: Text(t.translate("dark"))),
                  DropdownMenuItem(
                    value: ThemeMode.system,
                    child: Text(t.translate("system")),
                  ),
                ],
              ),
            ),
          _buildDivider(),

          // Currency
          SettingsTile(
            icon: Icons.attach_money,
            title: t.translate("currency"),
            trailing: Text(
              'TZS',
              style: AppTheme.body2.copyWith(
                color: AppTheme.primaryColor,
                fontWeight: FontWeight.bold,
              ),
            ),
            onTap: () {},
          ),
          _buildDivider(),

          // Notifications
          SettingsTile(
            icon: Icons.notifications_outlined,
            title: t.translate("notifications"),
            trailing: Switch(
              value: true,
              onChanged: (value) {},
              activeThumbColor: AppTheme.primaryColor,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildDivider() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Divider(
        height: 1,
        color: Colors.grey.withValues(alpha: 0.2),
      ),
    );
  }

 void _showLanguageDialog(BuildContext context, WidgetRef ref) {
    final locale = ref.watch(localeProvider);
    final t = AppLocalizations.of(context);

    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(t.translate("select_language")),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            RadioGroup<String>(
              groupValue: locale.languageCode,
              onChanged: (value) {
                if (value != null) {
                  ref.read(localeProvider.notifier).setLocale(Locale(value));
                  Navigator.pop(context);
                }
              },
              child: Column(
                children: [
                  ListTile(
                    title: const Text('English'),
                    leading: Radio<String>(value: 'en'),
                  ),
                  ListTile(
                    title: const Text('Kiswahili'),
                    leading: Radio<String>(value: 'sw'),
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
        ],
      ),
    );
  }
}


// import 'package:flutter/material.dart';
// import 'package:hooks_riverpod/hooks_riverpod.dart';

// import '../../../../../core/localization/app_localizations.dart';
// import '../../../../../core/localization/language_selector.dart';
// import '../../../../../core/themes/app_theme.dart';
// import '../../../../../core/themes/theme_provider.dart';
// import 'settings_tile.dart';


// class SettingsPreferencesSection extends ConsumerWidget {
//   final ThemeMode themeMode;

//   const SettingsPreferencesSection({super.key, required this.themeMode});

//   @override
//   Widget build(BuildContext context, WidgetRef ref) {
//     final t = AppLocalizations.of(context);

//     return Container(
//       decoration: BoxDecoration(
//         color: Colors.white,
//         borderRadius: BorderRadius.circular(16),
//         boxShadow: [
//           BoxShadow(
//             color: Colors.grey.withOpacity(0.1),
//             blurRadius: 5,
//             offset: const Offset(0, 2),
//           ),
//         ],
//       ),
//       child: Column(
//         children: [
//           // Language
//           SettingsTile(
//             icon: Icons.language,
//             title: t.translate("language"),
//             trailing: LanguageSelector(
//               isCompact: true,
//               // textColor: AppTheme.primaryColor,
//             ),
//             onTap: () => _showLanguageDialog(context, ref),
//           ),
//           _buildDivider(),

//           // Theme Mode
//           SettingsTile(
//             icon: Icons.brightness_4,
//             title: t.translate("theme"),
//             trailing: DropdownButton<ThemeMode>(
//               value: themeMode,
//               underline: const SizedBox(),
//               icon: const Icon(
//                 Icons.arrow_drop_down,
//                 color: AppTheme.primaryColor,
//               ),
//               onChanged: (ThemeMode? newMode) {
//                 if (newMode != null) {
//                   ref.read(themeModeProvider.notifier).setTheme(newMode);
//                 }
//               },
//               items: [
//                 DropdownMenuItem(value: ThemeMode.light, child: Text(t.translate("light"))),
//                 DropdownMenuItem(value: ThemeMode.dark, child: Text(t.translate("dark"))),
//                 DropdownMenuItem(
//                   value: ThemeMode.system,
//                   child: Text(t.translate("system")),
//                 ),
//               ],
//             ),
//           ),
//           _buildDivider(),

//           // Currency
//           SettingsTile(
//             icon: Icons.attach_money,
//             title: t.translate("currency"),
//             trailing: Text(
//               'TZS',
//               style: AppTheme.body2.copyWith(
//                 color: AppTheme.primaryColor,
//                 fontWeight: FontWeight.bold,
//               ),
//             ),
//             onTap: () {
//               // TODO: Show currency selection
//             },
//           ),
//           _buildDivider(),

//           // Notifications
//           SettingsTile(
//             icon: Icons.notifications_outlined,
//             title: t.translate("notifications"),
//             trailing: Switch(
//               value: true,
//               onChanged: (value) {},
//               activeColor: AppTheme.primaryColor,
//             ),
//           ),
//         ],
//       ),
//     );
//   }

//   Widget _buildDivider() {
//     return Padding(
//       padding: const EdgeInsets.symmetric(horizontal: 16),
//       child: Divider(height: 1, color: Colors.grey.shade200),
//     );
//   }

//   void _showLanguageDialog(BuildContext context, WidgetRef ref) {
//     final locale = ref.watch(localeProvider);
//     final t = AppLocalizations.of(context);

//     showDialog(
//       context: context,
//       builder: (context) => AlertDialog(
//         title: Text(t.translate("select_language")),
//         content: Column(
//           mainAxisSize: MainAxisSize.min,
//           children: [
//             ListTile(
//               title: const Text('English'),
//               leading: Radio<String>(
//                 value: 'en',
//                 groupValue: locale.languageCode,
//                 onChanged: (value) {
//                   if (value != null) {
//                     ref
//                         .read(localeProvider.notifier)
//                         .setLocale(const Locale('en'));
//                     Navigator.pop(context);
//                   }
//                 },
//               ),
//             ),
//             ListTile(
//               title: const Text('Kiswahili'),
//               leading: Radio<String>(
//                 value: 'sw',
//                 groupValue: locale.languageCode,
//                 onChanged: (value) {
//                   if (value != null) {
//                     ref
//                         .read(localeProvider.notifier)
//                         .setLocale(const Locale('sw'));
//                     Navigator.pop(context);
//                   }
//                 },
//               ),
//             ),
//           ],
//         ),
//         actions: [
//           TextButton(
//             onPressed: () => Navigator.pop(context),
//             child: Text(t.translate("cancel")),
//           ),
//         ],
//       ),
//     );
//   }
// }
