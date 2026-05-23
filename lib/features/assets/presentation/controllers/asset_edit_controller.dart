import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../data/models/asset_model.dart';
import '../../providers/asset_providers.dart';

class AssetEditController extends AsyncNotifier<AssetModel?> {
  @override
  Future<AssetModel?> build() async {
    return null;
  }

  Future<void> loadAsset(String assetId) async {
    state = const AsyncLoading();

    final result = await ref.read(getAssetUsecaseProvider)(assetId);

    state = result.fold(
      (failure) => AsyncError(failure.message, StackTrace.current),
      (asset) => AsyncData(asset),
    );
  }

  Future<bool> updateAsset(String assetId, Map<String, dynamic> updates) async {
    state = const AsyncLoading();

    final result = await ref.read(updateAssetUsecaseProvider)(assetId, updates);

    return result.fold(
      (failure) {
        state = AsyncError(failure.message, StackTrace.current);
        return false;
      },
      (asset) {
        state = AsyncData(asset);
        return true;
      },
    );
  }

  Future<bool> deleteAsset(String assetId) async {
    state = const AsyncLoading();

    final result = await ref.read(deleteAssetUsecaseProvider)(assetId);

    return result.fold((failure) {
      state = AsyncError(failure.message, StackTrace.current);
      return false;
    }, (_) => true);
  }

  Future<bool> deleteDocument(String assetId, String documentId) async {
    final result = await ref.read(deleteAssetDocumentUsecaseProvider)(
      assetId,
      documentId,
    );

    return result.fold(
      (failure) {
        state = AsyncError(failure.message, StackTrace.current);
        return false;
      },
      (_) async {
        await loadAsset(assetId);
        return true;
      },
    );
  }

  Future<bool> uploadDocument(
    String assetId,
    PlatformFile file, {
    String? documentType,
  }) async {
    final result = await ref.read(uploadAssetDocumentUsecaseProvider)(
      assetId,
      file,
      documentType: documentType,
    );

    return result.fold(
      (failure) {
        state = AsyncError(failure.message, StackTrace.current);
        return false;
      },
      (_) async {
        await loadAsset(assetId);
        return true;
      },
    );
  }

  Future<bool> uploadDocumentFromFile(
    String assetId,
    File file, {
    String? documentType,
  }) async {
    final platformFile = PlatformFile(
      name: file.path.split('/').last,
      path: file.path,
      size: await file.length(),
    );

    final result = await ref.read(uploadAssetDocumentUsecaseProvider)(
      assetId,
      platformFile,
      documentType: documentType,
    );

    return result.fold((failure) {
      state = AsyncError(failure.message, StackTrace.current);
      return false;
    }, (_) => true);
  }

  Future<void> refresh(String assetId) async {
    await loadAsset(assetId);
  }
}

final assetEditControllerProvider =
    AsyncNotifierProvider<AssetEditController, AssetModel?>(
      AssetEditController.new,
    );
