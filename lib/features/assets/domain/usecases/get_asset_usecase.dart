import 'package:dartz/dartz.dart';
import '../../../auth/domain/models/failure.dart';
import '../../data/models/asset_model.dart';
import '../../data/repositories/asset_repository.dart';

class GetAssetUsecase {
  final AssetRepository repository;

  GetAssetUsecase(this.repository);

  Future<Either<Failure, AssetModel>> call(String id) {
    return repository.getAsset(id);
  }
}
