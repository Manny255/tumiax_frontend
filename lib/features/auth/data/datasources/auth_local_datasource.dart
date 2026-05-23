// lib/features/auth/data/datasources/auth_local_datasource.dart

import 'dart:convert';
import '../../../../core/storage/secure_storage.dart';
import '../models/auth_response.dart';
import '../models/user_model.dart';

abstract class AuthLocalDataSource {
  Future<void> saveTokens(AuthResponse tokens);
  Future<AuthResponse?> getTokens();
  Future<void> saveUser(UserModel user);
  Future<UserModel?> getUser();
  Future<void> clearAll();
}

class AuthLocalDataSourceImpl implements AuthLocalDataSource {
  final SecureStorage storage;

  AuthLocalDataSourceImpl(this.storage);

  @override
  Future<void> saveTokens(AuthResponse tokens) async {
    await storage.write(StorageKeys.accessToken, tokens.accessToken);

    await storage.write(StorageKeys.refreshToken, tokens.refreshToken);
  }

  @override
  Future<AuthResponse?> getTokens() async {
    final accessToken = await storage.read(StorageKeys.accessToken);

    final refreshToken = await storage.read(StorageKeys.refreshToken);

    if (accessToken != null && refreshToken != null) {
      return AuthResponse(accessToken: accessToken, refreshToken: refreshToken);
    }

    return null;
  }

  @override
  Future<void> saveUser(UserModel user) async {
    final userJson = json.encode(user.toJson());

    await storage.write(StorageKeys.userData, userJson);
  }

  @override
  Future<UserModel?> getUser() async {
    final userJson = await storage.read(StorageKeys.userData);

    if (userJson != null) {
      return UserModel.fromJson(json.decode(userJson));
    }

    return null;
  }

  @override
  Future<void> clearAll() async {
    await storage.deleteAll();
  }
}
