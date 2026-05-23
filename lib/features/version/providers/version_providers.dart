import 'package:hooks_riverpod/hooks_riverpod.dart';
import '../../../core/network/dio_client.dart';
import '../data/datasources/version_remote_datasource.dart';
import '../domain/repositories/version_repository.dart';
import '../domain/repositories/version_repository_impl.dart';
import '../domain/usecases/check_version_usecase.dart';

/// ===============================
/// Data Source
/// ===============================
final versionRemoteDataSourceProvider = Provider<VersionRemoteDataSource>((
  ref,
) {
  final dio = ref.watch(dioProvider);
  return VersionRemoteDataSource(dio);
});

/// ===============================
/// Repository
/// ===============================
final versionRepositoryProvider = Provider<VersionRepository>((ref) {
  return VersionRepositoryImpl(
    remoteDataSource: ref.watch(versionRemoteDataSourceProvider),
  );
});

/// ===============================
/// Use Cases
/// ===============================
final checkVersionUsecaseProvider = Provider<CheckVersionUsecase>((ref) {
  return CheckVersionUsecase(ref.watch(versionRepositoryProvider));
});

/// ===============================
/// Providers
/// ===============================
final versionCheckProvider = FutureProvider<VersionCheckResult>((ref) async {
  final usecase = ref.watch(checkVersionUsecaseProvider);
  final result = await usecase();
  return result.fold(
    (failure) => throw Exception(failure.message),
    (result) => result,
  );
});

/// Simple provider for current version only
final currentVersionProvider = FutureProvider<String>((ref) async {
  final repo = ref.watch(versionRepositoryProvider);
  final result = await repo.getCurrentVersion();
  return result.fold(
    (failure) => throw Exception(failure.message),
    (version) => version,
  );
});
