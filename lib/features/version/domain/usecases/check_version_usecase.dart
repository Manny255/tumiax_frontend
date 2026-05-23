import 'package:dartz/dartz.dart';
import '../../../auth/domain/models/failure.dart';
import '../../data/models/app_version_model.dart';
import '../repositories/version_repository.dart';

class CheckVersionUsecase {
  final VersionRepository repository;

  CheckVersionUsecase(this.repository);

  Future<Either<Failure, VersionCheckResult>> call() async {
    // Get current version
    final currentResult = await repository.getCurrentVersion();

    return currentResult.fold((failure) => Left(failure), (
      currentVersion,
    ) async {
      // Get latest version
      final latestResult = await repository.getLatestVersion();

      return latestResult.fold((failure) => Left(failure), (latestVersion) {
        final needsUpdate = latestVersion.compareVersion(currentVersion) < 0;
        final isCompatible = latestVersion.isCompatible(currentVersion);

        return Right(
          VersionCheckResult(
            currentVersion: currentVersion,
            latestVersion: latestVersion,
            needsUpdate: needsUpdate,
            isCompatible: isCompatible,
          ),
        );
      });
    });
  }
}

class VersionCheckResult {
  final String currentVersion;
  final AppVersionModel latestVersion;
  final bool needsUpdate;
  final bool isCompatible;

  VersionCheckResult({
    required this.currentVersion,
    required this.latestVersion,
    required this.needsUpdate,
    required this.isCompatible,
  });

  bool get isForceUpdate => needsUpdate && !isCompatible;
  bool get isOptionalUpdate => needsUpdate && isCompatible;
}
