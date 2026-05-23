import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../storage/shared_prefs_provider.dart';

/// Supported Languages
enum Language { english, swahili }

/// Locale State Provider
final localeProvider = NotifierProvider<LocaleNotifier, Locale>(
  LocaleNotifier.new,
);

class LocaleNotifier extends Notifier<Locale> {
  static const _localeKey = 'app_locale';

  late SharedPreferences _prefs;

  @override
  Locale build() {
    _prefs = ref.read(sharedPreferencesProvider);

    // Load saved locale
    final savedCode = _prefs.getString(_localeKey);

    if (savedCode != null) {
      return Locale(savedCode);
    }

    // Fallback to system locale
    final systemLocale = WidgetsBinding.instance.platformDispatcher.locale;

    if (AppLocalizations.supportedLanguages.contains(
      systemLocale.languageCode,
    )) {
      return Locale(systemLocale.languageCode);
    }

    // Default
    return const Locale('en');
  }

  /// Change locale + persist
  void setLocale(Locale locale) {
    state = locale;

    _prefs.setString(_localeKey, locale.languageCode);
  }

  /// Toggle EN ↔ SW
  void toggleLanguage() {
    final newLocale = state.languageCode == 'en'
        ? const Locale('sw')
        : const Locale('en');

    setLocale(newLocale);
  }
}

/// Localization Loader
class AppLocalizations {
  static const List<String> supportedLanguages = ['en', 'sw'];

  static const LocalizationsDelegate<AppLocalizations> delegate =
      _AppLocalizationsDelegate();

  final Locale locale;
  late final Map<String, String> _localizedStrings;

  AppLocalizations(this.locale);

  Future<bool> load() async {
    try {
      final jsonString = await rootBundle.loadString(
        'assets/translations/${locale.languageCode}.json',
      );

      final Map<String, dynamic> jsonMap = json.decode(jsonString);

      _localizedStrings = jsonMap.map(
        (key, value) => MapEntry(key, value.toString()),
      );

      return true;
    } catch (_) {
      _localizedStrings = {};
      return false;
    }
  }

  /// Translate key
  String translate(String key, {Map<String, String>? params}) {
    String text = _localizedStrings[key] ?? key;

    if (params != null) {
      params.forEach((paramKey, paramValue) {
        text = text.replaceAll('{$paramKey}', paramValue);
      });
    }

    return text;
  }

  /// 📍 Access from context
  static AppLocalizations of(BuildContext context) {
    final instance = Localizations.of<AppLocalizations>(
      context,
      AppLocalizations,
    );
    assert(instance != null, 'AppLocalizations not found in context');
    return instance!;
  }
}

/// Delegate
class _AppLocalizationsDelegate
    extends LocalizationsDelegate<AppLocalizations> {
  const _AppLocalizationsDelegate();

  @override
  bool isSupported(Locale locale) {
    return AppLocalizations.supportedLanguages.contains(locale.languageCode);
  }

  @override
  Future<AppLocalizations> load(Locale locale) async {
    final localizations = AppLocalizations(locale);
    await localizations.load();
    return localizations;
  }

  @override
  bool shouldReload(_AppLocalizationsDelegate old) => false;
}



// // lib/core/localization/app_localizations.dart

// import 'dart:convert';
// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
// import 'package:hooks_riverpod/hooks_riverpod.dart';

// enum Language { english, swahili }

// final localeProvider = NotifierProvider<LocaleNotifier, Locale>(
//   LocaleNotifier.new,
// );

// class LocaleNotifier extends Notifier<Locale> {
//   @override
//   Locale build() {
//     return const Locale('en');
//   }

//   void setLocale(Locale locale) {
//     state = locale;
//   }

//   void toggleLanguage() {
//     state = state.languageCode == 'en'
//         ? const Locale('sw')
//         : const Locale('en');
//   }
// }

// class AppLocalizations {
//   static const List<String> supportedLanguages = ['en', 'sw'];

//   static const LocalizationsDelegate<AppLocalizations> delegate =
//       _AppLocalizationsDelegate();

//   final Locale locale;
//   late final Map<String, String> _localizedStrings;

//   AppLocalizations(this.locale);

//   Future<bool> load() async {
//     try {
//       final jsonString = await rootBundle.loadString(
//         'assets/translations/${locale.languageCode}.json',
//       );

//       final Map<String, dynamic> jsonMap = json.decode(jsonString);

//       _localizedStrings = jsonMap.map(
//         (key, value) => MapEntry(key, value.toString()),
//       );

//       return true;
//     } catch (_) {
//       _localizedStrings = {};
//       return false;
//     }
//   }

//   String translate(String key, {Map<String, String>? params}) {
//     String text = _localizedStrings[key] ?? key;

//     if (params != null) {
//       params.forEach((paramKey, paramValue) {
//         text = text.replaceAll('{$paramKey}', paramValue);
//       });
//     }

//     return text;
//   }

//   static AppLocalizations of(BuildContext context) {
//     final instance = Localizations.of<AppLocalizations>(
//       context,
//       AppLocalizations,
//     );
//     assert(instance != null, 'AppLocalizations not found in context');
//     return instance!;
//   }
// }

// class _AppLocalizationsDelegate
//     extends LocalizationsDelegate<AppLocalizations> {
//   const _AppLocalizationsDelegate();

//   @override
//   bool isSupported(Locale locale) {
//     return AppLocalizations.supportedLanguages.contains(locale.languageCode);
//   }

//   @override
//   Future<AppLocalizations> load(Locale locale) async {
//     final localizations = AppLocalizations(locale);
//     await localizations.load();
//     return localizations;
//   }

//   @override
//   bool shouldReload(_AppLocalizationsDelegate old) => false;
// }
