import 'package:dartz/dartz.dart';
import '../../../auth/domain/models/failure.dart';
import '../../data/repositories/asset_repository.dart';

class DeleteAssetUsecase {
  final AssetRepository repository;

  DeleteAssetUsecase(this.repository);

  Future<Either<Failure, void>> call(String id) {
    return repository.deleteAsset(id);
  }
}
