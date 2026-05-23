// lib/features/insurance/presentation/controllers/insurance_controller.dart

import 'dart:io';

import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../data/model/insurance_document_model.dart';
import '../../data/model/insurance_policy_model.dart';
import '../../data/model/create_insurance_request.dart';
import '../../domain/usecases/create_insurance_usecase.dart';
import '../../domain/usecases/get_policy_for_asset_usecase.dart';
import '../../providers/insurance_providers.dart';

part 'insurance_controller.freezed.dart';

/// =============================
/// STATE
/// =============================

@freezed
class InsuranceState with _$InsuranceState {
  const factory InsuranceState.initial() = _Initial;
  const factory InsuranceState.loading() = _Loading;
  const factory InsuranceState.created(InsurancePolicyModel policy) = _Created;
  const factory InsuranceState.loaded(InsurancePolicyModel policy) = _Loaded;
  const factory InsuranceState.documentUploaded(
    InsuranceDocumentModel document,
  ) = _DocumentUploaded;

  const factory InsuranceState.error(String message) = _Error;
}

/// =============================
/// CONTROLLER
/// =============================

class InsuranceController extends Notifier<InsuranceState> {
  late final CreateInsuranceUsecase _createInsuranceUsecase;
  late final GetPolicyForAssetUsecase _getPolicyForAssetUsecase;

  @override
  InsuranceState build() {
    _createInsuranceUsecase = ref.read(createInsuranceUsecaseProvider);

    _getPolicyForAssetUsecase = ref.read(getPolicyForAssetUsecaseProvider);

    return const InsuranceState.initial();
  }

  /// CREATE INSURANCE FOR ASSET
  Future<InsurancePolicyModel?> createInsurance(
    CreateInsuranceRequest request,
  ) async {
    state = const InsuranceState.loading();

    final result = await _createInsuranceUsecase(request);

    return result.fold(
      (failure) {
        state = InsuranceState.error(failure.message);
        return null;
      },
      (policy) {
        state = InsuranceState.created(policy);
        return policy;
      },
    );
  }

  Future<bool> uploadDocument(int policyId, File file) async {
  final uploadUsecase = ref.read(uploadInsuranceDocumentUseCaseProvider);

  final result = await uploadUsecase(policyId, file);

  return result.fold(
    (failure) {
      state = InsuranceState.error(failure.message);
      return false;
    },
    (document) {
      state = InsuranceState.documentUploaded(document);
      return true;
    },
  );
}

  /// LOAD POLICY FOR ASSET
  Future<void> loadPolicyForAsset(String assetId) async {
    state = const InsuranceState.loading();

    final result = await _getPolicyForAssetUsecase(assetId);

    result.fold(
      (failure) => state = InsuranceState.error(failure.message),
      (policy) => state = InsuranceState.loaded(policy),
    );
  }

  void reset() {
    state = const InsuranceState.initial();
  }
}
