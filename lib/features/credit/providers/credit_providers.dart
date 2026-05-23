import 'package:hooks_riverpod/hooks_riverpod.dart';
import '../../../core/network/dio_client.dart';
import '../domain/usecases/get_credit_line_usecase.dart';
import '../data/datasources/credit_remote_datasource.dart';
import '../data/repositories/credit_repository.dart';
import '../data/repositories/credit_repository_impl.dart';
import '../domain/usecases/get_credit_account_usecase.dart';
import '../domain/usecases/get_debt_usecase.dart';
import '../domain/usecases/get_spending_analytics_usecase.dart';
import '../domain/usecases/spend_credit_usecase.dart';
import '../domain/usecases/repay_credit_usecase.dart';
import '../domain/usecases/get_credit_transactions_usecase.dart';

// Data Source
final creditRemoteDataSourceProvider = Provider<CreditRemoteDataSource>((ref) {
  final dio = ref.watch(dioProvider);
  return CreditRemoteDataSourceImpl(dio);
});

// Repository
final creditRepositoryProvider = Provider<CreditRepository>((ref) {
  return CreditRepositoryImpl(
    remoteDataSource: ref.watch(creditRemoteDataSourceProvider),
  );
});

// UseCases
final getCreditAccountUsecaseProvider = Provider<GetCreditAccountUsecase>((
  ref,
) {
  return GetCreditAccountUsecase(ref.watch(creditRepositoryProvider));
});

final spendCreditUsecaseProvider = Provider<SpendCreditUsecase>((ref) {
  return SpendCreditUsecase(ref.watch(creditRepositoryProvider));
});

final repayCreditUsecaseProvider = Provider<RepayCreditUsecase>((ref) {
  return RepayCreditUsecase(ref.watch(creditRepositoryProvider));
});

final getCreditTransactionsUsecaseProvider =
    Provider<GetCreditTransactionsUsecase>((ref) {
      return GetCreditTransactionsUsecase(ref.watch(creditRepositoryProvider));
    });

final getCreditLinesUsecaseProvider = Provider<GetCreditLineUsecase>((ref) {
  return GetCreditLineUsecase(ref.watch(creditRepositoryProvider));
});

final getDebtsUsecaseProvider = Provider<GetDebtsUsecase>((ref) {
  return GetDebtsUsecase(ref.watch(creditRepositoryProvider));
});

final getSpendingAnalyticsUsecaseProvider =
    Provider<GetSpendingAnalyticsUsecase>((ref) {
      return GetSpendingAnalyticsUsecase(ref.watch(creditRepositoryProvider));
    });
