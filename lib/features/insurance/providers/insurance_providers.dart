// lib/features/insurance/providers/insurance_providers.dart

import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../core/network/dio_client.dart';
import '../data/datasources/insurance_remote_datasource.dart';
import '../data/repositories/insurance_repository.dart';
import '../data/repositories/insurance_repository_impl.dart';
import '../domain/usecases/create_insurance_usecase.dart';
import '../domain/usecases/get_policy_for_asset_usecase.dart';
import '../domain/usecases/upload_insurance_document_usecase.dart';
import '../presentation/controllers/insurance_controller.dart';

/// =============================
/// DATASOURCE
/// =============================

final insuranceRemoteDataSourceProvider = Provider<InsuranceRemoteDataSource>((
  ref,
) {
  final dio = ref.watch(dioProvider);
  return InsuranceRemoteDataSourceImpl(dio);
});

/// =============================
/// REPOSITORY
/// =============================

final insuranceRepositoryProvider = Provider<InsuranceRepository>((ref) {
  return InsuranceRepositoryImpl(
    remoteDataSource: ref.watch(insuranceRemoteDataSourceProvider),
  );
});

/// =============================
/// USE CASES
/// =============================

final createInsuranceUsecaseProvider = Provider<CreateInsuranceUsecase>((ref) {
  return CreateInsuranceUsecase(ref.watch(insuranceRepositoryProvider));
});

final getPolicyForAssetUsecaseProvider = Provider<GetPolicyForAssetUsecase>((
  ref,
) {
  return GetPolicyForAssetUsecase(ref.watch(insuranceRepositoryProvider));
});


final uploadInsuranceDocumentUseCaseProvider =
    Provider<UploadInsuranceDocumentUseCase>((ref) {
      return UploadInsuranceDocumentUseCase(
        ref.watch(insuranceRepositoryProvider),
      );
    });


/// =============================
/// CONTROLLER
/// =============================

final insuranceControllerProvider =
    NotifierProvider<InsuranceController, InsuranceState>(
      InsuranceController.new,
    );

