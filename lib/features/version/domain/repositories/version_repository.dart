import 'package:dartz/dartz.dart';
import '../../../auth/domain/models/failure.dart';
import '../../data/models/app_version_model.dart';

abstract class VersionRepository {
  Future<Either<Failure, AppVersionModel>> getLatestVersion();
  Future<Either<Failure, String>> getCurrentVersion();
}
