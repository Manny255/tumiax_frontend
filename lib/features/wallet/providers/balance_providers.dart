// C:\Users\DABC\Desktop\TumiaX\tumiax_frontend\lib\features\balance\providers\balance_providers.dart
import 'package:hooks_riverpod/hooks_riverpod.dart';
import '../../../core/network/dio_client.dart';
import '../data/datasources/wallet_remote_datasource.dart';
import '../data/repositories/wallet_repository.dart';
import '../data/repositories/wallet_repository_impl.dart';
import '../domain/usecases/deposit_usecase.dart';
import '../domain/usecases/get_balance_transactions_usecase.dart';
import '../domain/usecases/get_balance_usecase.dart';
import '../domain/usecases/withdraw_usecase.dart';


/// ===============================
/// Data Source
/// ===============================
final walletRemoteDataSourceProvider = Provider<WalletRemoteDataSource>((
  ref,
) {
  final dio = ref.watch(dioProvider);
  return WalletRemoteDataSource(dio);
});

/// ===============================
/// Repository
/// ===============================
final walletRepositoryProvider = Provider<WalletRepository>((ref) {
  return WalletRepositoryImpl(
    remoteDataSource: ref.watch(walletRemoteDataSourceProvider),
  );
});

/// ===============================
/// Use Cases
/// ===============================
final getBalanceUsecaseProvider = Provider<GetBalanceUsecase>((ref) {
  return GetBalanceUsecase(ref.watch(walletRepositoryProvider));
});

final depositUsecaseProvider = Provider<DepositUsecase>((ref) {
  return DepositUsecase(ref.watch(walletRepositoryProvider));
});

final withdrawUsecaseProvider = Provider<WithdrawUsecase>((ref) {
  return WithdrawUsecase(ref.watch(walletRepositoryProvider ));
});

final getBalanceTransactionsUsecaseProvider =
    Provider<GetBalanceTransactionsUsecase>((ref) {
      return GetBalanceTransactionsUsecase(
        ref.watch(walletRepositoryProvider),
      );
    });

// /// ===============================
// /// Controller
// /// ===============================
// final balanceControllerProvider =
//     AsyncNotifierProvider<BalanceController, BalanceData>(
//       BalanceController.new,
//     );

