// lib/features/assets/domain/repositories/asset_repository.dart
import 'package:dartz/dartz.dart';
import '../../../auth/domain/models/failure.dart';
import '../../data/models/asset_model.dart';
import '../../data/models/asset_category.dart';
import '../../data/models/asset_document.dart';
import '../../data/models/create_asset_request.dart';
import 'package:file_picker/file_picker.dart';

abstract class AssetRepository {
  // Asset CRUD
  Future<Either<Failure, List<AssetModel>>> getAssets({
    Map<String, dynamic>? queryParams,
  });
  Future<Either<Failure, AssetModel>> getAsset(String id);
  Future<Either<Failure, AssetModel>> createAsset(CreateAssetRequest request);
  Future<Either<Failure, AssetModel>> updateAsset(
    String id,
    Map<String, dynamic> data,
  );
  Future<Either<Failure, void>> deleteAsset(String id);
  Future<Either<Failure, void>> deleteDocument(
    String assetId,
    String documentId,
  );

  // Asset Lifecycle
  Future<Either<Failure, AssetModel>> submitAsset(String id);
  
  Future<Either<Failure, Map<String, dynamic>>> valuateAsset(String id);

  // Document Management
  Future<Either<Failure, AssetDocumentModel>> uploadDocument(
    String assetId,
    PlatformFile file, {
    String? documentType,
  });

  // Categories
  Future<Either<Failure, List<AssetCategoryModel>>> getCategories();
}
