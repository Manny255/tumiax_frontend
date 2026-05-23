import 'package:dartz/dartz.dart';
import '../../../auth/domain/models/failure.dart';
import '../../data/repositories/asset_repository.dart';

class ValuateAssetUsecase {
  final AssetRepository repository;

  ValuateAssetUsecase(this.repository);

  Future<Either<Failure, Map<String, dynamic>>> call(String id) {
    return repository.valuateAsset(id);
  }
}
