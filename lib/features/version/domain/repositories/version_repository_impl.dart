import 'package:dartz/dartz.dart';
import '../../../auth/domain/models/failure.dart';
import '../../data/datasources/version_remote_datasource.dart';
import '../../data/models/app_version_model.dart';
import '../../domain/repositories/version_repository.dart';


class VersionRepositoryImpl implements VersionRepository {
  final VersionRemoteDataSource remoteDataSource;

  VersionRepositoryImpl({required this.remoteDataSource});

  @override
  Future<Either<Failure, AppVersionModel>> getLatestVersion() async {
    try {
      final version = await remoteDataSource.getLatestVersion();
      return Right(version);
    } catch (e) {
      return Left(Failure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, String>> getCurrentVersion() async {
    try {
      final version = await remoteDataSource.getCurrentVersion();
      return Right(version);
    } catch (e) {
      return Left(Failure(e.toString()));
    }
  }
}
