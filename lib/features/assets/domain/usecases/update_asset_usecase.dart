import 'package:dartz/dartz.dart';
import '../../../auth/domain/models/failure.dart';
import '../../data/models/asset_model.dart';
import '../../data/repositories/asset_repository.dart';


class UpdateAssetUsecase {
  final AssetRepository repository;

  UpdateAssetUsecase(this.repository);

  Future<Either<Failure, AssetModel>> call(
    String id,
    Map<String, dynamic> data,
  ) {
    return repository.updateAsset(id, data);
  }
}
