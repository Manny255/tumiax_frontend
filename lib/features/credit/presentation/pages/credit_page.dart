import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import '../../../../core/localization/app_localizations.dart';
import '../../../../core/themes/app_theme.dart';
import '../../../../core/widgets/tumiax_button.dart';
import '../../../../core/widgets/empty_state.dart';
import '../controllers/credit_account_controller.dart';
import '../controllers/credit_debts_controller.dart';
import '../widgets/debt_card.dart';
import '../widgets/repay_bottom_sheet.dart';
import '../../data/models/credit_transaction_model.dart';

class CreditPage extends HookConsumerWidget {
  const CreditPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final t = AppLocalizations.of(context);

    final debtsAsync = ref.watch(creditDebtsControllerProvider);

    Future<void> refresh() async {
      await Future.wait([
        ref.refresh(creditAccountControllerProvider.future),
        ref.refresh(creditDebtsControllerProvider.future),
      ]);
    }

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Text(
          t.translate('outstanding_balance'),
          style: AppTheme.heading3.copyWith(color: AppTheme.primaryColor),
        ),
      ),
      body: RefreshIndicator(
        onRefresh: refresh,
        color: AppTheme.primaryColor,
        child: CustomScrollView(
          slivers: [
            // =====================================================
            // DEBTS LIST
            // =====================================================
            debtsAsync.when(
              data: (response) {
                final debts = response.results;
                   if (debts.isEmpty) {
                  return SliverFillRemaining(
                    child: Center(
                      // Add Center widget here
                      child: EmptyState(
                        icon: Icons.credit_score,
                        title: t.translate('no_debts'),
                        subtitle: t.translate('no_debts_description'),
                        height: 300,
                      ),
                    ),
                  );
                }

                return SliverList(
                  delegate: SliverChildBuilderDelegate((context, index) {
                    final debt = debts[index];

                    return Padding(
                      padding: EdgeInsets.only(
                        left: AppTheme.defaultPadding,
                        right: AppTheme.defaultPadding,
                        bottom: index == debts.length - 1 ? 0 : 12,
                      ),
                      child: DebtCard(
                        debt: debt,
                        onRepay: () => _showRepayDialog(context, ref, debt),
                      ),
                    );
                  }, childCount: debts.length),
                );
              },
              loading: () => SliverList(
                delegate: SliverChildBuilderDelegate(
                  (context, index) => Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: AppTheme.defaultPadding,
                      vertical: 8,
                    ),
                    child: _buildShimmerDebtCard(),
                  ),
                  childCount: 3,
                ),
              ),
              error: (error, stack) => SliverToBoxAdapter(
                child: _buildErrorState(
                  context,
                  t,
                  error.toString(),
                  () => ref.invalidate(creditDebtsControllerProvider),
                ),
              ),
            ),

            const SliverToBoxAdapter(child: SizedBox(height: 32)),
          ],
        ),
      ),
    );
  }

  // =====================================================
  // SHIMMER LOADING CARD
  // =====================================================
  Widget _buildShimmerDebtCard() {
    return Container(
      height: 180,
      decoration: BoxDecoration(
        color: Colors.grey.shade100,
        borderRadius: BorderRadius.circular(16),
      ),
    );
  }

  // =====================================================
  // ERROR STATE
  // =====================================================
  Widget _buildErrorState(
    BuildContext context,
    AppLocalizations t,
    String error,
    VoidCallback onRetry,
  ) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(32),
        child: Column(
          children: [
            Icon(Icons.error_outline, size: 48, color: AppTheme.errorColor),
            const SizedBox(height: 16),
            Text(t.translate('error_loading_credit'), style: AppTheme.body1),
            const SizedBox(height: 8),
            Text(error, style: AppTheme.caption, textAlign: TextAlign.center),
            const SizedBox(height: 16),
            TumiaxButton(
              text: t.translate('retry'),
              onPressed: onRetry,
              width: 200,
            ),
          ],
        ),
      ),
    );
  }

  // =====================================================
  // REPAY MODAL
  // =====================================================
  void _showRepayDialog(
    BuildContext context,
    WidgetRef ref,
    CreditTransactionModel debt,
  ) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (_) => RepayBottomSheet(debt: debt),
    );
  }
}