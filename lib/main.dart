import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

import 'config/app_config.dart';
import 'core/routing/app_router.dart';
import 'core/services/orientation_service.dart' show OrientationService;
import 'core/storage/secure_storage.dart';
import 'core/storage/shared_prefs_provider.dart';
import 'core/themes/dark_theme.dart';
import 'core/themes/light_theme.dart';
import 'core/themes/theme_provider.dart';
import 'core/localization/app_localizations.dart';

Future<void> main() async {
  // Ensure Flutter binding for async code before runApp
  WidgetsFlutterBinding.ensureInitialized();
  AppConfig.initialize(Environment.production);

  // Initialize environment
  // if (kReleaseMode) {
  //   AppConfig.initialize(Environment.production);
  // } else {
  //   AppConfig.initialize(Environment.development);
  // }

  // Lock orientation globally (lockPortraite-only for now)
  await OrientationService.lockPortrait();

  // Initialize SharedPreferences
  final sharedPreferences = await SharedPreferences.getInstance();

  // Initialize FlutterSecureStorage
  const secureStorage = FlutterSecureStorage();

  runApp(
    ProviderScope(
      overrides: [
        sharedPreferencesProvider.overrideWithValue(sharedPreferences),
        flutterSecureStorageProvider.overrideWithValue(secureStorage),
      ],
      child: const TumiaxApp(),
    ),
  );
}

class TumiaxApp extends ConsumerWidget {
  const TumiaxApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final router = ref.watch(routerProvider);
    final themeMode = ref.watch(themeModeProvider);
    final locale = ref.watch(localeProvider);

    return MaterialApp.router(
      title: 'TumiaX',
      debugShowCheckedModeBanner: AppConfig.isDevelopment,
      theme: LightTheme.theme,
      darkTheme: DarkTheme.theme,
      themeMode: themeMode,
      routerConfig: router,
      locale: locale,
      supportedLocales: const [Locale('en'), Locale('sw')],
      localizationsDelegates: const [
        AppLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      localeResolutionCallback: (locale, supportedLocales) {
        for (var supportedLocale in supportedLocales) {
          if (supportedLocale.languageCode == locale?.languageCode) {
            return supportedLocale;
          }
        }
        return const Locale('en');
      },
    );
  }
}
