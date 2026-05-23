import 'package:dartz/dartz.dart';

import '../../../auth/domain/models/failure.dart';
import '../../data/models/asset_model.dart';
import '../../data/repositories/asset_repository.dart';

class GetAssetsUsecase {
  final AssetRepository repository;

  GetAssetsUsecase(this.repository);

  Future<Either<Failure, List<AssetModel>>> call(GetAssetsParams params) {
    return repository.getAssets();
  }
}

class GetAssetsParams {
  const GetAssetsParams();
}
