import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../../core/network/models/cursor_paginated_response.dart';
import '../../../../core/session/session_controller.dart';
import '../../data/models/credit_line_model.dart';
import '../../providers/credit_providers.dart';

class CreditLinesController
    extends AsyncNotifier<CursorPaginatedResponse<CreditLineModel>> {
  @override
  Future<CursorPaginatedResponse<CreditLineModel>> build() async {
    ref.watch(sessionProvider); 
    return _fetch();
  }

  Future<CursorPaginatedResponse<CreditLineModel>> _fetch({
    bool? hasDebt,
    String? status,
  }) async {
    final result = await ref.read(getCreditLinesUsecaseProvider)(
      hasDebt: hasDebt,
      status: status,
    );

    return result.fold(
      (failure) => throw failure.message,
      (data) => data,
    );
  }

  Future<void> refresh({bool? hasDebt, String? status}) async {
    ref.invalidateSelf();
  }
}

final creditLinesControllerProvider =
    AsyncNotifierProvider<CreditLinesController, CursorPaginatedResponse<CreditLineModel>>(
      CreditLinesController.new,
    );
