// lib/features/assets/domain/usecases/create_asset_usecase.dart
import 'package:dartz/dartz.dart';
import '../../../auth/domain/models/failure.dart';
import '../../data/models/asset_model.dart';
import '../../data/models/create_asset_request.dart';
import '../../data/repositories/asset_repository.dart';

class CreateAssetUsecase {
  final AssetRepository repository;

  CreateAssetUsecase(this.repository);

  Future<Either<Failure, AssetModel>> call(CreateAssetRequest request) {
    return repository.createAsset(request);
  }
}
