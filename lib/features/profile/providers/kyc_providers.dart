// lib/features/profile/providers/kyc_providers.dart

import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../core/network/dio_client.dart';
import '../../../core/storage/secure_storage.dart';
import '../../../core/storage/shared_prefs_provider.dart';
import '../data/datasources/kyc_remote_datasource.dart';
import '../data/datasources/kyc_local_datasource.dart';
import '../data/domain/usecases/get_kyc_draft_usecase.dart';
import '../data/domain/usecases/get_kyc_lookup_usecase.dart';
import '../data/domain/usecases/get_kyc_profile_usecase.dart';
import '../data/domain/usecases/get_kyc_status_usecase.dart';
import '../data/domain/usecases/save_kyc_draft_usecase.dart';
import '../data/domain/usecases/submit_kyc_usecase.dart';
import '../data/models/kyc_model.dart';
import '../data/repositories/kyc_repository.dart';
import '../data/repositories/kyc_repository_impl.dart';
import '../presentation/controllers/kyc_controller.dart';


/// =============================
/// DATASOURCES
/// =============================

final kycRemoteDataSourceProvider = Provider<KYCRemoteDataSource>((ref) {
  final dio = ref.watch(dioProvider);
  return KYCRemoteDataSourceImpl(dio);
});

final kycLocalDataSourceProvider = Provider<KYCLocalDataSource>((ref) {
  final secureStorage = ref.watch(flutterSecureStorageProvider);
  final prefs = ref.watch(sharedPreferencesProvider);

  return KYCLocalDataSourceImpl(secureStorage: secureStorage, prefs: prefs);
});

/// =============================
/// REPOSITORY
/// =============================

final kycRepositoryProvider = Provider<KYCRepository>((ref) {
  return KYCRepositoryImpl(
    remoteDataSource: ref.watch(kycRemoteDataSourceProvider),
    localDataSource: ref.watch(kycLocalDataSourceProvider),
  );
});

/// =============================
/// USE CASES
/// =============================

final getKYCProfileUsecaseProvider = Provider<GetKYCProfileUsecase>((ref) {
  return GetKYCProfileUsecase(ref.watch(kycRepositoryProvider));
});

final submitKYCUsecaseProvider = Provider<SubmitKYCUsecase>((ref) {
  return SubmitKYCUsecase(ref.watch(kycRepositoryProvider));
});

final saveKYCDraftUsecaseProvider = Provider<SaveKYCDraftUsecase>((ref) {
  return SaveKYCDraftUsecase(ref.watch(kycRepositoryProvider));
});

final getKYCDraftUsecaseProvider = Provider<GetKYCDraftUsecase>((ref) {
  return GetKYCDraftUsecase(ref.watch(kycRepositoryProvider));
});

final getKYCStatusUsecaseProvider = Provider<GetKYCStatusUsecase>((ref) {
  return GetKYCStatusUsecase(ref.watch(kycRepositoryProvider));
});

final getKYCLookupUsecaseProvider = Provider<GetKYCLookupUsecase>((ref) {
  return GetKYCLookupUsecase(ref.watch(kycRepositoryProvider));
});

/// =============================
/// CONTROLLER
/// =============================

final kycControllerProvider = NotifierProvider<KYCController, KYCState>(
  KYCController.new,
);

/// =============================
/// OPTIONAL: Direct Async Profile Provider
/// =============================

final kycProfileProvider = FutureProvider.autoDispose<KYCProfile>((ref) async {
  final getProfile = ref.watch(getKYCProfileUsecaseProvider);
  final result = await getProfile();

  return result.fold(
    (failure) => throw Exception(failure.message),
    (profile) => profile,
  );
});

final submitKYCWithFilesUsecaseProvider = Provider<SubmitKYCWithFilesUsecase>((
  ref,
) {
  return SubmitKYCWithFilesUsecase(ref.watch(kycRepositoryProvider));
});
