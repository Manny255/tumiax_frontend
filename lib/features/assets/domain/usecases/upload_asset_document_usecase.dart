import 'package:dartz/dartz.dart';
import 'package:file_picker/file_picker.dart';

import '../../../auth/domain/models/failure.dart';
import '../../data/models/asset_document.dart';
import '../../data/repositories/asset_repository.dart';

class UploadAssetDocumentUsecase {
  final AssetRepository repository;

  UploadAssetDocumentUsecase(this.repository);

  Future<Either<Failure, AssetDocumentModel>> call(
    String assetId,
    PlatformFile file, {
    String? documentType,
  }) {
    return repository.uploadDocument(assetId, file, documentType: documentType);
  }
}
