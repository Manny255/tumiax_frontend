// lib/features/assets/domain/usecases/submit_asset_usecase.dart
import 'package:dartz/dartz.dart';
import '../../../auth/domain/models/failure.dart';
import '../../data/models/asset_model.dart';
import '../../data/repositories/asset_repository.dart';

class SubmitAssetUsecase {
  final AssetRepository repository;

  SubmitAssetUsecase(this.repository);

  Future<Either<Failure, AssetModel>> call(String assetId) {
    return repository.submitAsset(assetId);
  }
}
