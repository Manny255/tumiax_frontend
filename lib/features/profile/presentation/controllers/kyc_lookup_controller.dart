import 'package:hooks_riverpod/hooks_riverpod.dart';
import '../../../../core/session/session_controller.dart';
import '../../data/models/kyc_lookup_model.dart';
import '../../providers/kyc_providers.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'kyc_lookup_controller.freezed.dart';

final kycLookupControllerProvider =
    NotifierProvider<KYCLookupController, KYCLookupState>(
      KYCLookupController.new,
    );

@freezed
class KYCLookupState with _$KYCLookupState {
  const factory KYCLookupState.initial() = _Initial;
  const factory KYCLookupState.loading() = _Loading;
  const factory KYCLookupState.loaded(KYCLookupModel lookup) = _Loaded;
  const factory KYCLookupState.error(String message) = _Error;
}

class KYCLookupController extends Notifier<KYCLookupState> {
  @override
  KYCLookupState build() {
    ref.watch(sessionProvider);
    return const KYCLookupState.initial();
  }

  Future<bool> lookup(String email) async {
    if (email.isEmpty) {
      state = const KYCLookupState.error("Email required");
      return false;
    }

    state = const KYCLookupState.loading();
    final result = await ref.read(getKYCLookupUsecaseProvider)(email);

    return result.fold(
      (failure) {
        state = KYCLookupState.error(failure.message);
        return false;
      },
      (lookup) {
        state = KYCLookupState.loaded(lookup);
        return true;
      },
    );
  }

  void reset() {
    state = const KYCLookupState.initial();
  }
}


// import 'package:hooks_riverpod/hooks_riverpod.dart';
// import 'package:freezed_annotation/freezed_annotation.dart';

// import '../../../../core/session/session_controller.dart';
// import '../../data/domain/usecases/get_kyc_lookup_usecase.dart';
// import '../../data/models/kyc_lookup_model.dart';
// import '../../providers/kyc_providers.dart';

// part 'kyc_lookup_controller.freezed.dart';

// /// =============================
// /// PROVIDER 
// /// =============================
// final kycLookupControllerProvider =
//     NotifierProvider<KYCLookupController, KYCLookupState>(
//       KYCLookupController.new,
//     );

// /// =============================
// /// STATE
// /// =============================
// @freezed
// class KYCLookupState with _$KYCLookupState {
//   const factory KYCLookupState.initial() = _Initial;

//   const factory KYCLookupState.loading() = _Loading;

//   const factory KYCLookupState.loaded(KYCLookupModel lookup) = _Loaded;

//   const factory KYCLookupState.error(String message) = _Error;
// }

// /// =============================
// /// CONTROLLER
// /// =============================
// class KYCLookupController extends Notifier<KYCLookupState> {
//   late final GetKYCLookupUsecase _lookupUsecase;

//   @override
//   KYCLookupState build() {
//     ref.read(sessionProvider); 
//     _lookupUsecase = ref.read(getKYCLookupUsecaseProvider);
//     return const KYCLookupState.initial();
//   }

//   Future<bool> lookup(String email) async {
//     if (email.isEmpty) {
//       state = const KYCLookupState.error("Email required");
//       return false;
//     }

//     state = const KYCLookupState.loading();

//     final result = await _lookupUsecase(email);

//     return result.fold(
//       (failure) {
//         state = KYCLookupState.error(failure.message);
//         return false;
//       },
//       (lookup) {
//         state = KYCLookupState.loaded(lookup);
//         return true;
//       },
//     );
//   }

//   void reset() {
//     state = const KYCLookupState.initial();
//   }
// }
