import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../../core/localization/app_localizations.dart';
import '../../../../core/themes/app_theme.dart';
import '../../../../core/routing/route_names.dart';
import '../../../../core/widgets/async_value_widget.dart';
import '../../../../core/widgets/empty_state.dart';
import '../../../../shared/widgets/custom_app_bar.dart';
import '../../../auth/data/models/user_model.dart';
import '../../../auth/providers/auth_providers.dart';
import '../../../credit/presentation/controllers/credit_account_controller.dart';
import '../../../credit/presentation/controllers/credit_transactions_controller.dart';
import '../../../credit/presentation/controllers/spending_analytics_controller.dart';
import '../../../credit/presentation/widgets/credit_transactions_list.dart';
import '../../../credit/presentation/widgets/credit_line_card.dart';
import '../widgets/credit_card_widget.dart';
import '../widgets/quick_actions.dart';
import '../widgets/section_header.dart';
import '../widgets/spending_chart.dart';

class HomePage extends HookConsumerWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final scrollController = useScrollController();
    final isScrolled = useState(false);
    final t = AppLocalizations.of(context);

    // Watch spending analytics
    final spendingAsync = ref.watch(spendingAnalyticsControllerProvider);

    // Watch current user
    final user = ref.watch(userProvider);

    useEffect(() {
      void onScroll() {
        isScrolled.value = scrollController.offset > 50;
      }

      scrollController.addListener(onScroll);
      return () => scrollController.removeListener(onScroll);
    }, [scrollController]);

    if (user == null) {
        return const SizedBox.shrink();
      }

    final firstName = user.firstName;

    return Scaffold(
      body: CustomScrollView(
        controller: scrollController,
        slivers: [
          CustomAppBar(
            isScrolled: isScrolled.value,
            userName: firstName,
            onNotificationPressed: () {
              context.push(RouteNames.notifications);
            },
          ),
          SliverPadding(
            padding: const EdgeInsets.all(AppTheme.defaultPadding),
            sliver: SliverList(
              delegate: SliverChildListDelegate([
                const SizedBox(height: 8),
                _buildCreditSection(ref, t),
                const SizedBox(height: 24),
                const QuickActions(),
                const SizedBox(height: 24),
                _buildCreditLinesSection(ref, t, context),
                const SizedBox(height: 24),

                // Spending Chart
                spendingAsync.when(
                  data: (analytics) => SpendingChart(
                    totalAmount: analytics.totalSpent,
                    weeklyData: analytics.weeklySpending,
                    weekDays: analytics.weekDays,
                  ),
                  loading: () => const SizedBox(
                    height: 200,
                    child: Center(child: CircularProgressIndicator()),
                  ),
                  error: (error, stack) => SizedBox(
                    height: 200,
                    child: Center(
                      child: Text(
                        t.translate('error_loading_spending_data'),
                        style: AppTheme.body1,
                      ),
                    ),
                  ),
                ),

                const SizedBox(height: 24),
                _buildTransactionsSection(ref, t, context),
                const SizedBox(height: 40),
              ]),
            ),
          ),
        ],
      ),
      floatingActionButton: _buildFloatingActionButton(ref, t, context, user),
    );
  }

   Widget _buildCreditSection(WidgetRef ref, AppLocalizations t) {
      return AsyncValueWidget(
        value: ref.watch(creditAccountControllerProvider),
        loadingHeight: 180,
        onData: (credit) => CreditCardWidget(
          creditAccount: credit,
          onReveal: () {
            ref.invalidate(creditAccountControllerProvider);
          },
        ),
        onRetry: () => ref.invalidate(creditAccountControllerProvider),
      );
    }

  Widget _buildCreditLinesSection(
      WidgetRef ref,
      AppLocalizations t,
      BuildContext context,
    ) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SectionHeader(
            title: t.translate('my_assets'),
            seeAllRoute: RouteNames.assets,
            padding: const EdgeInsets.symmetric(horizontal: 16),
          ),
          const SizedBox(height: 12),
          AsyncValueWidget(
            value: ref.watch(creditAccountControllerProvider),
            loadingHeight: 180,
            onData: (creditAccount) {
              final creditLines = creditAccount.creditLines;

              if (creditLines.isEmpty) {
                return EmptyState(
                  icon: Icons.credit_card_outlined,
                  title: t.translate('no_assets_yet'),
                  subtitle: t.translate('add_first_asset'),
                  height: 140,
                );
              }

              return SizedBox(
                height: 180,
                child: ListView.separated(
                  scrollDirection: Axis.horizontal,
                  itemCount: creditLines.length > 5 ? 5 : creditLines.length,
                  separatorBuilder: (context, index) => const SizedBox(width: 12),
                  itemBuilder: (_, index) =>
                      CreditLineCard(creditLine: creditLines[index]),
                ),
              );
            },
            onRetry: () => ref.invalidate(creditAccountControllerProvider),
          ),
        ],
      );
    }

  Widget _buildTransactionsSection(
      WidgetRef ref,
      AppLocalizations t,
      BuildContext context,
    ) {
      final transactionsAsync = ref.watch(creditTransactionsControllerProvider);

      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SectionHeader(
            title: t.translate('recent_transactions'),
            seeAllRoute: RouteNames.transactions,
            padding: const EdgeInsets.symmetric(horizontal: 16),
          ),
          transactionsAsync.when(
            data: (transactions) {
              if (transactions.isEmpty) {
                return EmptyState(
                  icon: Icons.receipt_long,
                  title: t.translate('no_transactions_yet'),
                  subtitle: t.translate('start_by_spending'),
                  height: 200,
                );
              }
              return CreditTransactionsList(
                transactions: transactions.take(5).toList(),
              );
            },
            loading: () => const SizedBox(
              height: 200,
              child: Center(child: CircularProgressIndicator()),
            ),
            error: (error, stack) => SizedBox(
              height: 200,
              child: Center(
                child: Text(
                  t.translate('error_loading_recent_transactions'),
                  style: AppTheme.body1,
                ),
              ),
            ),
          ),
        ],
      );
    }

  Widget _buildFloatingActionButton(
    WidgetRef ref,
    AppLocalizations t,
    BuildContext context,
    UserModel user,
  ) {
    final status = user.kycStatus;

    // Button color
    Color buttonColor;
    switch (status) {
      case KycStatus.verified:
        buttonColor = AppTheme.secondaryColor;
        break;
      case KycStatus.pending:
        buttonColor = AppTheme.primaryColor;
        break;
      case KycStatus.none:
        buttonColor = AppTheme.warningColor;
        break;
    }

    return FloatingActionButton.extended(
      onPressed: () {
        if (status == KycStatus.verified) {
          context.push(RouteNames.addAsset);
        } else {
          context.push(RouteNames.kycVerification);
        }
      },
      backgroundColor: buttonColor,
      icon: Icon(switch (status) {
        KycStatus.verified => Icons.add,
        KycStatus.pending => Icons.hourglass_empty,
        KycStatus.none => Icons.verified_user_outlined,
      }, color: Colors.white),
      label: Text(
        switch (status) {
          KycStatus.verified => t.translate('add_asset'),
          KycStatus.pending => t.translate('verifying'),
          KycStatus.none => t.translate('complete_profile'),
        },
        style: const TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }
}
