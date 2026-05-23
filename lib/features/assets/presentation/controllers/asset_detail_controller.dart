import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../data/models/asset_model.dart';
import '../../providers/asset_providers.dart';

class AssetDetailController extends AsyncNotifier<AssetModel?> {
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

  Future<void> refresh(String assetId) async {
    await loadAsset(assetId);
  }

  Future<void> submitAsset(String assetId) async {
    final result = await ref.read(submitAssetUsecaseProvider)(assetId);

    result.fold(
      (failure) => throw Exception(failure.message),
      (_) async => await refresh(assetId),
    );
  }

  Future<void> valuateAsset(String assetId) async {
    final result = await ref.read(valuateAssetUsecaseProvider)(assetId);

    result.fold(
      (failure) => throw Exception(failure.message),
      (_) async => await refresh(assetId),
    );
  }
}

final assetDetailControllerProvider =
    AsyncNotifierProvider<AssetDetailController, AssetModel?>(
      AssetDetailController.new,
    );