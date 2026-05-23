import 'dart:convert';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../models/kyc_model.dart';

abstract class KYCLocalDataSource {
  Future<void> saveDraft(KYCDraft draft);
  Future<KYCDraft?> getDraft();
  Future<void> clearDraft();
  Future<void> saveDocumentPath(String key, String path);
  Future<String?> getDocumentPath(String key);
}

class KYCLocalDataSourceImpl implements KYCLocalDataSource {
  final FlutterSecureStorage secureStorage;
  final SharedPreferences prefs;

  KYCLocalDataSourceImpl({required this.secureStorage, required this.prefs});

  static const String _draftKey = 'kyc_draft';
  static const String _documentPrefix = 'kyc_doc_';

  @override
  Future<void> saveDraft(KYCDraft draft) async {
    final jsonString = json.encode(draft.toJson());
    await secureStorage.write(key: _draftKey, value: jsonString);
  }

  @override
  Future<KYCDraft?> getDraft() async {
    final jsonString = await secureStorage.read(key: _draftKey);
    if (jsonString != null) {
      try {
        final json = jsonDecode(jsonString);
        return KYCDraft.fromJson(json);
      } catch (e) {
        return null;
      }
    }
    return null;
  }

  @override
  Future<void> clearDraft() async {
    await secureStorage.delete(key: _draftKey);
    // Also clear document paths
    final keys = await secureStorage.readAll();
    for (final key in keys.keys) {
      if (key.startsWith(_documentPrefix)) {
        await secureStorage.delete(key: key);
      }
    }
  }

  @override
  Future<void> saveDocumentPath(String key, String path) async {
    await secureStorage.write(key: '$_documentPrefix$key', value: path);
  }

  @override
  Future<String?> getDocumentPath(String key) async {
    return await secureStorage.read(key: '$_documentPrefix$key');
  }
}
