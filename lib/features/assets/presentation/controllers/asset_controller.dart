// lib/features/assets/presentation/controllers/asset_controller.dart
import 'package:hooks_riverpod/hooks_riverpod.dart';
import '../../../../core/session/session_controller.dart' show sessionProvider;
import '../../../auth/domain/models/failure.dart';
import '../../data/models/asset_category.dart';
import '../../data/models/asset_model.dart';
import '../../data/models/create_asset_request.dart';
import '../../domain/usecases/get_assets_usecase.dart';
import '../../providers/asset_providers.dart';

class AssetListController extends AsyncNotifier<List<AssetModel>> {
@override
  Future<List<AssetModel>> build() async {
    ref.watch(sessionProvider);
    return []; // initial state only
  }

  Future<void> fetchAssets() async {
    state = const AsyncLoading();

    final result = await ref.read(getAssetsUsecaseProvider)(
      const GetAssetsParams(),
    );

    state = result.fold((failure) {
      if (failure is KycRequiredFailure) {
        return AsyncError(failure, StackTrace.current);
      }
      return AsyncError(Exception(failure.message), StackTrace.current);
    }, (assets) => AsyncData(assets));
  }

  Future<void> refreshAssets() async {
    await fetchAssets();
  }
}

// ===============================
// Asset Creation Controller
// ===============================
class AssetCreationController extends AsyncNotifier<AssetModel?> {
  @override
  Future<AssetModel?> build() async {
    return null;
  }

  Future<bool> createAsset(CreateAssetRequest request) async {
    state = const AsyncLoading();

    final result = await ref.read(createAssetUsecaseProvider)(request);

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

  Future<bool> submitAsset(String assetId) async {
    state = const AsyncLoading();

    final result = await ref.read(submitAssetUsecaseProvider)(assetId);

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

  void reset() {
    state = const AsyncData(null);
  }
}

// ===============================
// Asset Category Controller
// ===============================
class AssetCategoryController extends AsyncNotifier<List<AssetCategoryModel>> {
  @override
  Future<List<AssetCategoryModel>> build() async {
    return _fetchCategories();
  }

  Future<List<AssetCategoryModel>> _fetchCategories() async {
    final result = await ref.read(getAssetCategoriesUsecaseProvider)();

    return result.fold(
      (failure) => throw Exception(failure.message),
      (categories) => categories,
    );
  }

  bool requiresInsurance(String? categoryName) {
    if (categoryName == null) return false;
    return categoryName == 'Car' || categoryName == 'Motorcycle';
  }
}

// ===============================
// Providers
// ===============================
final assetListControllerProvider =
    AsyncNotifierProvider<AssetListController, List<AssetModel>>(
      AssetListController.new,
    );

final assetCreationControllerProvider =
    AsyncNotifierProvider<AssetCreationController, AssetModel?>(
      AssetCreationController.new,
    );

final assetCategoryControllerProvider =
    AsyncNotifierProvider<AssetCategoryController, List<AssetCategoryModel>>(
      AssetCategoryController.new,
    );
