import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/localization/app_localizations.dart';
import '../../../../core/themes/app_theme.dart';
import '../../../../core/widgets/empty_state.dart';
import '../../../../core/widgets/tumiax_button.dart';
import '../controllers/credit_transactions_controller.dart';
import '../widgets/credit_transactions_list.dart';

class TransactionsListPage extends HookConsumerWidget {
  const TransactionsListPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final t = AppLocalizations.of(context);
    final scrollController = useScrollController();

    final transactionsAsync = ref.watch(creditTransactionsControllerProvider);
    final controller = ref.read(creditTransactionsControllerProvider.notifier);

    // For tracking loading more state
    final isLoadingMore = useState(false);

    // Pagination listener
    useEffect(() {
      void onScroll() {
        if (scrollController.position.pixels >=
            scrollController.position.maxScrollExtent - 300) {
          if (!isLoadingMore.value) {
            isLoadingMore.value = true;
            controller.loadMore().then((_) {
              isLoadingMore.value = false;
            });
          }
        }
      }

      scrollController.addListener(onScroll);
      return () => scrollController.removeListener(onScroll);
    }, [scrollController]);

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios, color: AppTheme.primaryColor),
          onPressed: () => context.pop(),
        ),
        title: Text(
          t.translate('transactions'),
          style: AppTheme.heading3.copyWith(color: AppTheme.primaryColor),
        ),
      ),
      body: RefreshIndicator(
        onRefresh: () => controller.refresh(),
        color: AppTheme.primaryColor,
        child: transactionsAsync.when(
          loading: () => const Center(child: CircularProgressIndicator()),

          error: (error, stack) => Center(
            child: Padding(
              padding: const EdgeInsets.all(32),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.error_outline,
                    size: 48,
                    color: AppTheme.errorColor,
                  ),
                  const SizedBox(height: 16),
                  Text(
                    t.translate('failed_to_load_transactions'),
                    style: AppTheme.body1,
                  ),
                  const SizedBox(height: 8),
                  Text(
                    error.toString(),
                    style: AppTheme.caption,
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 16),
                  TumiaxButton(
                    text: t.translate('retry'),
                    onPressed: () => controller.refresh(),
                    width: 200,
                  ),
                ],
              ),
            ),
          ),
          data: (transactions) {
            if (transactions.isEmpty) {
              return EmptyState(
                icon: Icons.receipt_long,
                title: t.translate('no_transactions'),
                subtitle: t.translate('no_transactions_description'),
              );
            }

            return ListView(
              controller: scrollController,
              padding: const EdgeInsets.all(AppTheme.defaultPadding),
              children: [
                CreditTransactionsList(transactions: transactions),
                if (isLoadingMore.value)
                  const Padding(
                    padding: EdgeInsets.all(16),
                    child: Center(child: CircularProgressIndicator()),
                  ),
              ],
            );
          },
        ),
      ),
    );
  }
}
