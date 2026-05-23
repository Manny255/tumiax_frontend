// lib/features/assets/data/repositories/asset_repository_impl.dart
import 'package:dartz/dartz.dart';
import '../../../../core/utils/validators.dart';
import '../../../auth/domain/models/failure.dart';
import '../models/asset_model.dart';
import '../models/asset_category.dart';
import '../models/asset_document.dart';
import '../models/create_asset_request.dart';
import '../datasources/asset_remote_datasource.dart';
import 'package:file_picker/file_picker.dart';

import 'asset_repository.dart';

class AssetRepositoryImpl implements AssetRepository {
  final AssetRemoteDataSource remoteDataSource;

  AssetRepositoryImpl({required this.remoteDataSource});

  // ==================== ASSET CRUD ====================

  @override
  Future<Either<Failure, List<AssetModel>>> getAssets({
    Map<String, dynamic>? queryParams,
  }) async {
    try {
      final assets = await remoteDataSource.getAssets(queryParams: queryParams);
      return Right(assets);
    } on KycRequiredException catch (e) {
      return Left(KycRequiredFailure(e.message));
    } on AssetValidationException catch (e) {
      return Left(ValidationFailure(e.message, errors: e.errors));
    } catch (e) {
      return Left(Failure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, AssetModel>> getAsset(String id) async {
    try {
      final asset = await remoteDataSource.getAsset(id);
      return Right(asset);
    } on AssetValidationException catch (e) {
      return Left(ValidationFailure(e.message, errors: e.errors));
    } catch (e) {
      return Left(Failure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, AssetModel>> createAsset(
    CreateAssetRequest request,
  ) async {
    try {
      final asset = await remoteDataSource.createAsset(request);
      return Right(asset);
    } on AssetValidationException catch (e) {
      return Left(ValidationFailure(e.message, errors: e.errors));
    } catch (e) {
      return Left(Failure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, AssetModel>> updateAsset(
    String id,
    Map<String, dynamic> data,
  ) async {
    try {
      final asset = await remoteDataSource.updateAsset(id, data);
      return Right(asset);
    } on AssetValidationException catch (e) {
      return Left(ValidationFailure(e.message, errors: e.errors));
    } catch (e) {
      return Left(Failure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, void>> deleteAsset(String id) async {
    try {
      await remoteDataSource.deleteAsset(id);
      return const Right(null);
    } on AssetValidationException catch (e) {
      return Left(ValidationFailure(e.message, errors: e.errors));
    } catch (e) {
      return Left(Failure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, void>> deleteDocument(
    String assetId,
    String documentId,
  ) async {
    try {
      await remoteDataSource.deleteDocument(assetId, documentId);
      return const Right(null);
    } catch (e) {
      return Left(Failure(e.toString()));
    }
  }

  // ==================== ASSET LIFECYCLE ====================

  @override
  Future<Either<Failure, AssetModel>> submitAsset(String id) async {
    try {
      final asset = await remoteDataSource.submitAsset(id);
      return Right(asset);
    } on AssetValidationException catch (e) {
      return Left(ValidationFailure(e.message, errors: e.errors));
    } catch (e) {
      return Left(Failure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, Map<String, dynamic>>> valuateAsset(String id) async {
    try {
      final valuation = await remoteDataSource.valuateAsset(id);
      return Right(valuation);
    } on AssetValidationException catch (e) {
      return Left(ValidationFailure(e.message, errors: e.errors));
    } catch (e) {
      return Left(Failure(e.toString()));
    }
  }

  // ==================== DOCUMENT MANAGEMENT ====================

  @override
  Future<Either<Failure, AssetDocumentModel>> uploadDocument(
    String assetId,
    PlatformFile file, {
    String? documentType,
  }) async {
    try {
      final document = await remoteDataSource.uploadDocument(
        assetId,
        file,
        documentType: documentType,
      );
      return Right(document);
    } on AssetValidationException catch (e) {
      return Left(ValidationFailure(e.message, errors: e.errors));
    } catch (e) {
      return Left(Failure(e.toString()));
    }
  }

  // ==================== CATEGORIES ====================

  @override
  Future<Either<Failure, List<AssetCategoryModel>>> getCategories() async {
    try {
      final categories = await remoteDataSource.getCategories();
      return Right(categories);
    } on AssetValidationException catch (e) {
      return Left(ValidationFailure(e.message, errors: e.errors));
    } catch (e) {
      return Left(Failure(e.toString()));
    }
  }
}
