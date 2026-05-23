import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/localization/app_localizations.dart';
import '../../../../core/routing/route_names.dart';
import '../../../../core/themes/app_theme.dart';
import '../../../payout/data/domain/entities/payout_method.dart';
import '../../../payout/providers/payout_providers.dart';
import '../../../payout/presentation/widgets/payout_method_selector.dart';

class ExternalTransferSection extends HookConsumerWidget {
  final ValueNotifier<PayoutMethod?> selectedPayoutMethod;

  const ExternalTransferSection({
    super.key,
    required this.selectedPayoutMethod,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final t = AppLocalizations.of(context);
    final payoutState = ref.watch(payoutControllerProvider);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          t.translate('select_payout_method'),
          style: AppTheme.body1.copyWith(fontWeight: FontWeight.w600),
        ),
        const SizedBox(height: 12),

        payoutState.when(
          loading: () => const Center(
            child: Padding(
              padding: EdgeInsets.symmetric(vertical: 24),
              child: CircularProgressIndicator(),
            ),
          ),
          error: (e, _) => _buildErrorState(e, ref, t),
          data: (methods) => _buildPayoutMethodsList(methods, context, t),
        ),
      ],
    );
  }

  Widget _buildErrorState(Object error, WidgetRef ref, AppLocalizations t) {
    return Column(
      children: [
        Text(error.toString(), style: const TextStyle(color: Colors.red)),
        const SizedBox(height: 8),
        TextButton(
          onPressed: () {
            ref.read(payoutControllerProvider.notifier).refresh();
          },
          child: Text(t.translate('retry')),
        ),
      ],
    );
  }

  Widget _buildPayoutMethodsList(
    List<PayoutMethod> methods,
    BuildContext context,
    AppLocalizations t,
  ) {
    // Filter to only active methods for withdrawal
    final activeMethods = methods.where((m) => m.isActive).toList();

    if (activeMethods.isEmpty) {
      return _buildEmptyPayoutMethods(context, t);
    }

    /// Auto select first active method
     WidgetsBinding.instance.addPostFrameCallback((_) {
      if (selectedPayoutMethod.value == null && activeMethods.isNotEmpty) {
        selectedPayoutMethod.value = activeMethods.first;
      }
    });
    return Column(
      children: [
        PayoutMethodSelector(
          payoutMethods: activeMethods,
          selectedMethod: selectedPayoutMethod,
        ),
        const SizedBox(height: 16),
        _buildAddMethodButton(context, t),
        const SizedBox(height: 8),
        _buildManageMethodsLink(context, t),
        const SizedBox(height: 24),
      ],
    );
  }

  Widget _buildAddMethodButton(BuildContext context, AppLocalizations t) {
    return OutlinedButton.icon(
      onPressed: () {
        context.pushNamed(RouteNames.addPayoutMethod);
      },
      icon: const Icon(Icons.add, color: AppTheme.primaryColor),
      label: Text(t.translate('add_payout_method')),
      style: OutlinedButton.styleFrom(
        foregroundColor: AppTheme.primaryColor,
        side: const BorderSide(color: AppTheme.primaryColor),
        minimumSize: const Size(double.infinity, 50),
      ),
    );
  }

  Widget _buildManageMethodsLink(BuildContext context, AppLocalizations t) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          t.translate('manage_your_payout_methods'),
          style: AppTheme.caption.copyWith(color: Colors.grey),
        ),
        TextButton(
          onPressed: () {
            context.pushNamed(RouteNames.managePayoutMethods);
          },
          style: TextButton.styleFrom(
            padding: const EdgeInsets.symmetric(horizontal: 8),
            minimumSize: Size.zero,
            tapTargetSize: MaterialTapTargetSize.shrinkWrap,
          ),
          child: Text(
            t.translate('manage'),
            style: AppTheme.caption.copyWith(
              color: AppTheme.primaryColor,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildEmptyPayoutMethods(BuildContext context, AppLocalizations t) {
    return Container(
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: Colors.grey.shade50,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.grey.shade200),
      ),
      child: Column(
        children: [
          Icon(
            Icons.account_balance_wallet,
            size: 48,
            color: Colors.grey.shade400,
          ),
          const SizedBox(height: 12),
          Text(
            t.translate('no_payout_methods'),
            style: AppTheme.body2.copyWith(
              fontWeight: FontWeight.w600,
              color: Colors.grey.shade700,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            t.translate('add_payout_method_to_withdraw'),
            style: AppTheme.caption.copyWith(color: Colors.grey.shade600),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 16),
          _buildAddMethodButton(context, t),
          const SizedBox(height: 16),
          _buildManageMethodsLink(context, t),
        ],
      ),
    );
  }
}
