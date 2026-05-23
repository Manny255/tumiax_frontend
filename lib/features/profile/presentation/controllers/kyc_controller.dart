// lib/features/profile/presentation/controllers/kyc_controller.dart

import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../core/session/session_controller.dart';
import '../../data/models/kyc_model.dart';
import '../../providers/kyc_providers.dart';

part 'kyc_controller.freezed.dart';

/// =============================
/// STATE
/// =============================
@freezed
class KYCState with _$KYCState {
  const factory KYCState.initial() = _Initial;
  const factory KYCState.loading() = _Loading;

  const factory KYCState.loaded({
    KYCProfile? profile,
    KYCDraft? draft,
    KYCStatus? status,
  }) = _Loaded;

  const factory KYCState.submitting() = _Submitting;
  const factory KYCState.submitted(KYCProfile profile) = _Submitted;
  const factory KYCState.error(String message) = _Error;
  const factory KYCState.draftSaved() = _DraftSaved;
}

/// =============================
/// CONTROLLER
/// =============================
class KYCController extends Notifier<KYCState> {
  @override
  KYCState build() {
    ref.watch(sessionProvider);
    return const KYCState.initial();
  }

  /// =============================
  /// LOAD PROFILE + STATUS
  /// =============================
  Future<void> loadKYCData() async {
    state = const KYCState.loading();

    final profileResult = await ref.read(getKYCProfileUsecaseProvider)();

    final statusResult = await ref.read(getKYCStatusUsecaseProvider)();

    profileResult.fold((failure) => state = KYCState.error(failure.message), (
      profile,
    ) {
      statusResult.fold((failure) => state = KYCState.error(failure.message), (
        status,
      ) {
        state = KYCState.loaded(profile: profile, status: status);
      });
    });
  }

  /// =============================
  /// LOAD DRAFT
  /// =============================
  Future<void> loadKYCDraft() async {
    final result = await ref.read(getKYCDraftUsecaseProvider)();

    result.fold((failure) => state = KYCState.error(failure.message), (draft) {
      state = state.maybeWhen(
        loaded: (profile, _, status) =>
            KYCState.loaded(profile: profile, draft: draft, status: status),
        orElse: () => KYCState.loaded(draft: draft),
      );
    });
  }

  /// =============================
  /// SUBMIT KYC
  /// =============================
  Future<void> submitKYC(KYCSubmission request) async {
    state = const KYCState.submitting();

    final result = await ref.read(submitKYCUsecaseProvider)(request);

    result.fold(
      (failure) => state = KYCState.error(failure.message),
      (profile) => state = KYCState.submitted(profile),
    );
  }

  /// =============================
  /// SUBMIT KYC WITH FILES
  /// =============================
  Future<bool> submitKYCWithFiles(KYCSubmissionWithFiles submission) async {
    state = const KYCState.submitting();

    final result = await ref.read(submitKYCWithFilesUsecaseProvider)(
      submission,
    );

    return result.fold(
      (failure) {
        state = KYCState.error(failure.message);
        return false;
      },
      (profile) {
        state = KYCState.submitted(profile);
        return true;
      },
    );
  }

  /// =============================
  /// SAVE DRAFT
  /// =============================
  Future<void> saveDraft(KYCDraft draft) async {
    final result = await ref.read(saveKYCDraftUsecaseProvider)(draft);

    result.fold(
      (failure) => state = KYCState.error(failure.message),
      (_) => state = const KYCState.draftSaved(),
    );
  }

  /// =============================
  /// RESET
  /// =============================
  void resetState() {
    state = const KYCState.initial();
  }

  /// =============================
  /// SAVE CURRENT STEP
  /// =============================
  Future<void> saveCurrentStep(
    int step,
    Map<String, dynamic> personalInfo,
    Map<String, dynamic> addressInfo,
    Map<String, dynamic> employmentInfo,
    Map<String, dynamic> idInfo,
    List<String> documentPaths,
  ) async {
    final draft = KYCDraft(
      currentStep: step,
      personalInfo: personalInfo,
      addressInfo: addressInfo,
      employmentInfo: employmentInfo,
      idInfo: idInfo,
      documentPaths: documentPaths,
      lastUpdated: DateTime.now(),
    );

    await saveDraft(draft);
  }
}

// // lib/features/profile/presentation/controllers/kyc_controller.dart

// import 'package:hooks_riverpod/hooks_riverpod.dart';
// import 'package:freezed_annotation/freezed_annotation.dart';

// import '../../../../core/session/session_controller.dart';
// import '../../data/domain/usecases/get_kyc_draft_usecase.dart';
// import '../../data/domain/usecases/get_kyc_profile_usecase.dart';
// import '../../data/domain/usecases/get_kyc_status_usecase.dart';
// import '../../data/domain/usecases/save_kyc_draft_usecase.dart';
// import '../../data/domain/usecases/submit_kyc_usecase.dart';
// import '../../data/models/kyc_model.dart';
// import '../../providers/kyc_providers.dart';

// part 'kyc_controller.freezed.dart';

// /// =============================
// /// STATE
// /// =============================
// @freezed
// class KYCState with _$KYCState {
//   const factory KYCState.initial() = _Initial;
//   const factory KYCState.loading() = _Loading;

//   const factory KYCState.loaded({
//     KYCProfile? profile,
//     KYCDraft? draft,
//     KYCStatus? status,
//   }) = _Loaded;

//   const factory KYCState.submitting() = _Submitting;
//   const factory KYCState.submitted(KYCProfile profile) = _Submitted;
//   const factory KYCState.error(String message) = _Error;
//   const factory KYCState.draftSaved() = _DraftSaved;
// }

// /// =============================
// /// CONTROLLER 
// /// =============================
// class KYCController extends Notifier<KYCState> {
//   late final GetKYCProfileUsecase _getKYCProfileUsecase;
//   late final SubmitKYCUsecase _submitKYCUsecase;
//   late final SaveKYCDraftUsecase _saveKYCDraftUsecase;
//   late final GetKYCDraftUsecase _getKYCDraftUsecase;
//   late final GetKYCStatusUsecase _getKYCStatusUsecase;

//   @override
//   KYCState build() {
//     ref.watch(sessionProvider);
//     // Access dependencies via ref
//     _getKYCProfileUsecase = ref.read(getKYCProfileUsecaseProvider);
//     _submitKYCUsecase = ref.read(submitKYCUsecaseProvider);
//     _saveKYCDraftUsecase = ref.read(saveKYCDraftUsecaseProvider);
//     _getKYCDraftUsecase = ref.read(getKYCDraftUsecaseProvider);
//     _getKYCStatusUsecase = ref.read(getKYCStatusUsecaseProvider);

//     return const KYCState.initial();
//   }

//   /// =============================
//   /// LOAD PROFILE
//   /// =============================
// Future<void> loadKYCData() async {
//     state = const KYCState.loading();

//     final profileFuture = _getKYCProfileUsecase();
//     final statusFuture = _getKYCStatusUsecase();

//     final profileResult = await profileFuture;
//     final statusResult = await statusFuture;

//     profileResult.fold((failure) => state = KYCState.error(failure.message), (
//       profile,
//     ) {
//       statusResult.fold((failure) => state = KYCState.error(failure.message), (
//         status,
//       ) {
//         state = KYCState.loaded(profile: profile, status: status);
//       });
//     });
//   }

//   /// =============================
//   /// LOAD DRAFT
//   /// =============================
//   Future<void> loadKYCDraft() async {
//     final result = await _getKYCDraftUsecase();

//     result.fold((failure) => state = KYCState.error(failure.message), (draft) {
//       state = state.maybeWhen(
//         loaded: (profile, _, status) =>
//             KYCState.loaded(profile: profile, draft: draft, status: status),
//         orElse: () => KYCState.loaded(draft: draft),
//       );
//     });
//   }

//   /// =============================
//   /// SUBMIT KYC
//   /// =============================
//   Future<void> submitKYC(KYCSubmission request) async {
//     state = const KYCState.submitting();

//     final result = await _submitKYCUsecase(request);

//     result.fold(
//       (failure) => state = KYCState.error(failure.message),
//       (profile) => state = KYCState.submitted(profile),
//     );
//   }

//    /// =============================
//   /// SUBMIT KYC WITH FILES
//   /// =============================
// Future<bool> submitKYCWithFiles(KYCSubmissionWithFiles submission) async {
//     state = const KYCState.submitting();

//     final submitUsecase = ref.read(submitKYCWithFilesUsecaseProvider);
//     final result = await submitUsecase(submission);

//     return result.fold(
//       (failure) {
//         state = KYCState.error(failure.message);
//         return false;
//       },
//       (profile) {
//         state = KYCState.submitted(profile);
//         return true;
//       },
//     );
//   }


//   /// =============================
//   /// SAVE DRAFT
//   /// =============================
//   Future<void> saveDraft(KYCDraft draft) async {
//     final result = await _saveKYCDraftUsecase(draft);

//     result.fold(
//       (failure) => state = KYCState.error(failure.message),
//       (_) => state = const KYCState.draftSaved(),
//     );
//   }

//   void resetState() {
//     state = const KYCState.initial();
//   }

//   /// =============================
//   /// SAVE CURRENT STEP
//   /// =============================
//   Future<void> saveCurrentStep(
//     int step,
//     Map<String, dynamic> personalInfo,
//     Map<String, dynamic> addressInfo,
//     Map<String, dynamic> employmentInfo,
//     Map<String, dynamic> idInfo,
//     List<String> documentPaths,
//   ) async {
//     final draft = KYCDraft(
//       currentStep: step,
//       personalInfo: personalInfo,
//       addressInfo: addressInfo,
//       employmentInfo: employmentInfo,
//       idInfo: idInfo,
//       documentPaths: documentPaths,
//       lastUpdated: DateTime.now(),
//     );

//     await saveDraft(draft);
//   }
// }

