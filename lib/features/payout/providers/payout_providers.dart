// lib/features/payout/providers/payout_providers.dart

import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../../core/network/dio_client.dart';
import '../data/datasources/payout_remote_datasource.dart';
import '../data/domain/entities/payout_method.dart';
import '../data/domain/usecases/create_payout_method.dart';
import '../data/domain/usecases/delete_payout_method.dart';
import '../data/domain/usecases/get_payout_methods.dart';
import '../data/repositories/payout_repository_impl.dart';
import '../presentation/controllers/payout_controller.dart';

/// =============================
/// DATA SOURCE
/// =============================
final payoutRemoteDataSourceProvider = Provider<PayoutRemoteDataSource>((ref) {
  final dio = ref.watch(dioProvider);
  return PayoutRemoteDataSourceImpl(dio);
});

/// =============================
/// REPOSITORY
/// =============================
final payoutRepositoryProvider = Provider((ref) {
  return PayoutRepositoryImpl(ref.watch(payoutRemoteDataSourceProvider));
});

/// =============================
/// USECASES
/// =============================
final getPayoutMethodsProvider = Provider((ref) {
  return GetPayoutMethods(ref.watch(payoutRepositoryProvider));
});

final createPayoutMethodProvider = Provider((ref) {
  return CreatePayoutMethod(ref.watch(payoutRepositoryProvider));
});

final deletePayoutMethodProvider = Provider((ref) {
  return DeletePayoutMethod(ref.watch(payoutRepositoryProvider));
});

/// =============================
/// CONTROLLER PROVIDER
/// =============================
final payoutControllerProvider =
    AsyncNotifierProvider<PayoutController, List<PayoutMethod>>(
      PayoutController.new,
    );
