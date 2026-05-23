
import 'package:dartz/dartz.dart';
import '../../../auth/domain/models/failure.dart';
import '../../data/models/asset_category.dart';
import '../../data/repositories/asset_repository.dart';

class GetAssetCategoriesUsecase {
  final AssetRepository repository;

  GetAssetCategoriesUsecase(this.repository);

  Future<Either<Failure, List<AssetCategoryModel>>> call() {
    return repository.getCategories();
  }
}
