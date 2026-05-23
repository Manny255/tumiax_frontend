
import 'package:dartz/dartz.dart';
import '../../../auth/domain/models/failure.dart';
import '../../data/repositories/asset_repository.dart';

class DeleteAssetDocumentUsecase {
  final AssetRepository repository;

  DeleteAssetDocumentUsecase(this.repository);

  Future<Either<Failure, void>> call(String assetId, String documentId) {
    return repository.deleteDocument(assetId, documentId);
  }
}
