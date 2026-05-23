// // lib/features/assets/providers/asset_providers.dart
// import 'package:hooks_riverpod/hooks_riverpod.dart';
// import '../../../core/network/dio_client.dart';
// import '../data/datasources/asset_remote_datasource.dart';
// import '../data/repositories/asset_repository_impl.dart';
// import '../domain/repositories/asset_repository.dart';

// // ===============================
// // Data Sources
// // ===============================
// final assetRemoteDataSourceProvider = Provider<AssetRemoteDataSource>((ref) {
//   final dio = ref.watch(dioProvider);
//   return AssetRemoteDataSourceImpl(dio);
// });

// // ===============================
// // Repository
// // ===============================
// final assetRepositoryProvider = Provider<AssetRepository>((ref) {
//   return AssetRepositoryImpl(
//     remoteDataSource: ref.watch(assetRemoteDataSourceProvider),
//   );
// });

// // ===============================
// // Use Cases
// // ===============================

// /// Get Assets
// final getAssetsUsecaseProvider = Provider<GetAssetsUsecase>((ref) {
//   return GetAssetsUsecase(ref.watch(assetRepositoryProvider));
// });

// /// Get Asset by ID
// final getAssetUsecaseProvider = Provider<GetAssetUsecase>((ref) {
//   return GetAssetUsecase(ref.watch(assetRepositoryProvider));
// });

// /// Create Asset
// final createAssetUsecaseProvider = Provider<CreateAssetUsecase>((ref) {
//   return CreateAssetUsecase(ref.watch(assetRepositoryProvider));
// });

// /// Update Asset
// final updateAssetUsecaseProvider = Provider<UpdateAssetUsecase>((ref) {
//   return UpdateAssetUsecase(ref.watch(assetRepositoryProvider));
// });

// /// Delete Asset
// final deleteAssetUsecaseProvider = Provider<DeleteAssetUsecase>((ref) {
//   return DeleteAssetUsecase(ref.watch(assetRepositoryProvider));
// });

// /// Submit Asset for Review
// final submitAssetUsecaseProvider = Provider<SubmitAssetUsecase>((ref) {
//   return SubmitAssetUsecase(ref.watch(assetRepositoryProvider));
// });

// /// Valuate Asset
// final valuateAssetUsecaseProvider = Provider<ValuateAssetUsecase>((ref) {
//   return ValuateAssetUsecase(ref.watch(assetRepositoryProvider));
// });

// /// Get Asset Categories
// final getAssetCategoriesUsecaseProvider = Provider<GetAssetCategoriesUsecase>((
//   ref,
// ) {
//   return GetAssetCategoriesUsecase(ref.watch(assetRepositoryProvider));
// });

// // ===============================
// // State Providers (Controllers)
// // ===============================

// /// Asset List Controller
// final assetListControllerProvider =
//     AsyncNotifierProvider<AssetListController, List<AssetModel>>(
//       AssetListController.new,
//     );

// /// Asset Detail Controller (Family)
// final assetDetailControllerProvider =
//     FutureProvider.family<AssetModel?, String>((ref, assetId) async {
//       if (assetId.isEmpty) return null;
//       final repository = ref.watch(assetRepositoryProvider);
//       final result = await GetAssetUsecase(repository)(assetId);

//       return result.fold(
//         (failure) => throw Exception(failure.message),
//         (asset) => asset,
//       );
//     });

// /// Asset Creation Controller
// final assetCreationControllerProvider =
//     AsyncNotifierProvider<AssetCreationController, AssetModel?>(
//       AssetCreationController.new,
//     );

// /// Asset Category Controller
// final assetCategoryControllerProvider =
//     AsyncNotifierProvider<AssetCategoryController, List<AssetCategoryModel>>(
//       AssetCategoryController.new,
//     );

// // ===============================
// // Helper Providers
// // ===============================

// /// Selected Asset ID (for detail view)
// final selectedAssetIdProvider = StateProvider<String>((ref) => '');

// /// Asset Form State Provider
// final assetFormStateProvider = StateProvider<Map<String, dynamic>>((ref) => {});

// /// Current Step in Add Asset Flow
// final assetFormStepProvider = StateProvider<int>((ref) => 0);

// /// Filter Provider for Assets List
// final assetFilterProvider = StateProvider<Map<String, dynamic>>((ref) => {});

// /// Search Query Provider
// final assetSearchQueryProvider = StateProvider<String>((ref) => '');

// // ===============================
// // Filtered Assets Provider
// // ===============================
// final filteredAssetsProvider = Provider<List<AssetModel>>((ref) {
//   final assetsAsync = ref.watch(assetListControllerProvider);
//   final filter = ref.watch(assetFilterProvider);
//   final searchQuery = ref.watch(assetSearchQueryProvider).toLowerCase();

//   if (assetsAsync is! AsyncData<List<AssetModel>>) {
//     return [];
//   }

//   var assets = assetsAsync.value;

//   // Apply status filter
//   if (filter.containsKey('status') &&
//       filter['status'] != null &&
//       filter['status'] != 'ALL') {
//     assets = assets
//         .where((asset) => asset.verificationStatus == filter['status'])
//         .toList();
//   }

//   // Apply category filter
//   if (filter.containsKey('category') &&
//       filter['category'] != null &&
//       filter['category'] != 'ALL') {
//     assets = assets
//         .where(
//           (asset) =>
//               asset.categoryName == filter['category'] ||
//               asset.category?.name == filter['category'],
//         )
//         .toList();
//   }

//   // Apply search
//   if (searchQuery.isNotEmpty) {
//     assets = assets.where((asset) {
//       return asset.title.toLowerCase().contains(searchQuery) ||
//           (asset.description?.toLowerCase().contains(searchQuery) ?? false) ||
//           (asset.serialNumber?.toLowerCase().contains(searchQuery) ?? false);
//     }).toList();
//   }

//   return assets;
// });

// /// Assets requiring insurance
// final assetsRequiringInsuranceProvider = Provider<List<AssetModel>>((ref) {
//   final assetsAsync = ref.watch(assetListControllerProvider);

//   if (assetsAsync is! AsyncData<List<AssetModel>>) {
//     return [];
//   }

//   return assetsAsync.value.where((asset) {
//     final category = asset.categoryName ?? asset.category?.name;
//     return category == 'Car' || category == 'Motorcycle';
//   }).toList();
// });

// /// Assets with expiring insurance
// final assetsWithExpiringInsuranceProvider = Provider<List<AssetModel>>((ref) {
//   final assetsAsync = ref.watch(assetListControllerProvider);

//   if (assetsAsync is! AsyncData<List<AssetModel>>) {
//     return [];
//   }

//   final now = DateTime.now();
//   final thirtyDaysFromNow = now.add(const Duration(days: 30));

//   return assetsAsync.value.where((asset) {
//     if (asset.insurancePolicy == null) return false;
//     final expiry = asset.insurancePolicy!.expiryDate;
//     return expiry.isAfter(now) && expiry.isBefore(thirtyDaysFromNow);
//   }).toList();
// });


// lib/features/assets/providers/asset_providers.dart
import 'package:hooks_riverpod/hooks_riverpod.dart';
import '../../../core/network/dio_client.dart';
import '../data/datasources/asset_remote_datasource.dart';
import '../data/repositories/asset_repository.dart';
import '../data/repositories/asset_repository_impl.dart';
import '../domain/usecases/delete_asset_document_usecase.dart';
import '../domain/usecases/delete_asset_usecase.dart';
import '../domain/usecases/get_asset_usecase.dart';
import '../domain/usecases/get_assets_usecase.dart';
import '../domain/usecases/create_asset_usecase.dart';
import '../domain/usecases/submit_asset_usecase.dart';
import '../domain/usecases/get_asset_categories_usecase.dart';
import '../domain/usecases/update_asset_usecase.dart';
import '../domain/usecases/upload_asset_document_usecase.dart';
import '../domain/usecases/valuate_asset_usecase.dart';

/// ===============================
/// Data Source
/// ===============================
final assetRemoteDataSourceProvider = Provider<AssetRemoteDataSource>((ref) {
  final dio = ref.watch(dioProvider);
  return AssetRemoteDataSourceImpl(dio);
});

/// ===============================
/// Repository
/// ===============================
final assetRepositoryProvider = Provider<AssetRepository>((ref) {
  return AssetRepositoryImpl(
    remoteDataSource: ref.watch(assetRemoteDataSourceProvider),
  );
});

/// ===============================
/// Use Cases
/// ===============================

/// Get Assets
final getAssetsUsecaseProvider = Provider<GetAssetsUsecase>((ref) {
  return GetAssetsUsecase(ref.watch(assetRepositoryProvider));
});

/// Get Single Asset
final getAssetUsecaseProvider = Provider<GetAssetUsecase>((ref) {
  return GetAssetUsecase(ref.watch(assetRepositoryProvider));
});

/// Create Asset
final createAssetUsecaseProvider = Provider<CreateAssetUsecase>((ref) {
  return CreateAssetUsecase(ref.watch(assetRepositoryProvider));
});

/// Submit Asset
final submitAssetUsecaseProvider = Provider<SubmitAssetUsecase>((ref) {
  return SubmitAssetUsecase(ref.watch(assetRepositoryProvider));
});

/// Valuate Asset
final valuateAssetUsecaseProvider = Provider<ValuateAssetUsecase>((ref) {
  return ValuateAssetUsecase(ref.watch(assetRepositoryProvider));
});

/// Get Asset Categories
final getAssetCategoriesUsecaseProvider = Provider<GetAssetCategoriesUsecase>((
  ref,
) {
  return GetAssetCategoriesUsecase(ref.watch(assetRepositoryProvider));
});
// Add to your existing asset_providers.dart

/// Delete Asset
final deleteAssetUsecaseProvider = Provider<DeleteAssetUsecase>((ref) {
  return DeleteAssetUsecase(ref.watch(assetRepositoryProvider));
});

final deleteAssetDocumentUsecaseProvider = Provider<DeleteAssetDocumentUsecase>(
  (ref) {
    return DeleteAssetDocumentUsecase(ref.watch(assetRepositoryProvider));
  },
);

/// Update Asset
final updateAssetUsecaseProvider = Provider<UpdateAssetUsecase>((ref) {
  return UpdateAssetUsecase(ref.watch(assetRepositoryProvider));
});

final uploadAssetDocumentUsecaseProvider = Provider<UploadAssetDocumentUsecase>(
  (ref) {
    return UploadAssetDocumentUsecase(ref.watch(assetRepositoryProvider));
  },
);
