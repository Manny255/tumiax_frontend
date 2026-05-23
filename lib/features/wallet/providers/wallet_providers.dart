import 'package:hooks_riverpod/hooks_riverpod.dart';
import '../../../core/network/dio_client.dart';
import '../data/datasources/wallet_remote_datasource.dart';
import '../data/repositories/wallet_repository.dart';
import '../data/repositories/wallet_repository_impl.dart';
import '../domain/usecases/get_transactions_usecase.dart';

/// ===============================
/// Data Source
/// ===============================
final walletRemoteDataSourceProvider = Provider<WalletRemoteDataSource>((ref) {
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
/// UseCase
/// ===============================
final getTransactionsUsecaseProvider = Provider<GetTransactionsUsecase>((ref) {
  return GetTransactionsUsecase(ref.watch(walletRepositoryProvider));
});
