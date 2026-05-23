// lib/core/storage/secure_storage.dart

import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final secureStorageProvider = Provider<SecureStorage>((ref) {
  return SecureStorage();
});


final flutterSecureStorageProvider = Provider<FlutterSecureStorage>((ref) {
  return const FlutterSecureStorage();
});

class SecureStorage {
  static const FlutterSecureStorage _storage = FlutterSecureStorage(
    iOptions: IOSOptions(accessibility: KeychainAccessibility.first_unlock),
  );

  /// Write value
  Future<void> write(String key, String value) async {
    await _storage.write(key: key, value: value);
  }

  /// Read value
  Future<String?> read(String key) async {
    return await _storage.read(key: key);
  }

  /// Delete value
  Future<void> delete(String key) async {
    await _storage.delete(key: key);
  }

  /// Delete all
  Future<void> deleteAll() async {
    await _storage.deleteAll();
  }

  /// Check if key exists
  Future<bool> containsKey(String key) async {
    return await _storage.containsKey(key: key);
  }

  /// Read all
  Future<Map<String, String>> readAll() async {
    return await _storage.readAll();
  }
}

/// Storage keys
class StorageKeys {
  static const String accessToken = 'access_token';
  static const String refreshToken = 'refresh_token';
  static const String userData = 'user_data';
  static const String onboardingShown = 'onboarding_shown';
  static const String themeMode = 'theme_mode';
  static const String languageCode = 'language_code';
}
