import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/localization/app_localizations.dart';
import '../../../../core/themes/app_theme.dart';
import '../../../../core/routing/route_names.dart';
import '../../../../core/widgets/tumiax_button.dart';
import '../../providers/payout_providers.dart';
import '../widgets/payout_method_card.dart';

class ManagePayoutMethodsPage extends HookConsumerWidget {
  const ManagePayoutMethodsPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final t = AppLocalizations.of(context);
    final payoutState = ref.watch(payoutControllerProvider);
    final controller = ref.read(payoutControllerProvider.notifier);

    // Track method being deleted
    final deletingId = useState<int?>(null);

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
          t.translate('manage_payout_methods'),
          style: AppTheme.heading3.copyWith(color: AppTheme.primaryColor),
        ),
      ),
      body: RefreshIndicator(
        onRefresh: () => controller.refresh(),
        color: AppTheme.primaryColor,
        child: payoutState.when(
          loading: () => const Center(child: CircularProgressIndicator()),

          error: (error, stack) => Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.error_outline, size: 48, color: AppTheme.errorColor),
                const SizedBox(height: 16),
                Text(
                  t.translate('error_loading_payout_methods'),
                  style: AppTheme.body1,
                ),
                const SizedBox(height: 8),
                Text(
                  error.toString(),
                  style: AppTheme.caption.copyWith(color: Colors.grey),
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

          data: (methods) {
            if (methods.isEmpty) {
              return _buildEmptyState(context, t);
            }

            // Split methods into active and pending
            final activeMethods = methods.where((m) => m.isActive).toList();
            final pendingMethods = methods.where((m) => !m.isActive).toList();

            return ListView(
              padding: const EdgeInsets.all(AppTheme.defaultPadding),
              children: [
                // Pending Methods Section
                if (pendingMethods.isNotEmpty) ...[
                  _buildSectionHeader(
                    t.translate('pending_activation'),
                    Icons.hourglass_empty,
                  ),
                  const SizedBox(height: 8),
                  ...pendingMethods.map(
                    (method) => Padding(
                      padding: const EdgeInsets.only(bottom: 12),
                      child: PayoutMethodCard(
                        method: method,
                        onDelete: () => _confirmDelete(
                          context,
                          ref,
                          method.id,
                          deletingId,
                          t,
                        ),
                        isDeleting: deletingId.value == method.id,
                      ),
                    ),
                  ),

                  // Activation Info Box (only shown when there are pending methods)
                  _buildActivationInfoBox(t),

                  const SizedBox(height: 16),
                ],

                // Active Methods Section
                if (activeMethods.isNotEmpty) ...[
                  _buildSectionHeader(
                    t.translate('active_methods'),
                    Icons.check_circle,
                  ),
                  const SizedBox(height: 8),
                  ...activeMethods.map(
                    (method) => Padding(
                      padding: const EdgeInsets.only(bottom: 12),
                      child: PayoutMethodCard(
                        method: method,
                        onDelete: () => _confirmDelete(
                          context,
                          ref,
                          method.id,
                          deletingId,
                          t,
                        ),
                        isDeleting: deletingId.value == method.id,
                      ),
                    ),
                  ),
                ],

                const SizedBox(height: 24),

                // Add New Button (at bottom)
                OutlinedButton.icon(
                  onPressed: () =>
                      context.pushNamed(RouteNames.addPayoutMethod),
                  icon: const Icon(Icons.add, color: AppTheme.primaryColor),
                  label: Text(t.translate('add_new_payout_method')),
                  style: OutlinedButton.styleFrom(
                    foregroundColor: AppTheme.primaryColor,
                    side: const BorderSide(color: AppTheme.primaryColor),
                    minimumSize: const Size(double.infinity, 50),
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }

  Widget _buildEmptyState(BuildContext context, AppLocalizations t) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(AppTheme.defaultPadding),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.account_balance_wallet,
              size: 80,
              color: Colors.grey.shade300,
            ),
            const SizedBox(height: 16),
            Text(
              t.translate('no_payout_methods'),
              style: AppTheme.heading3.copyWith(color: Colors.grey.shade600),
            ),
            const SizedBox(height: 8),
            Text(
              t.translate('add_payout_method_to_withdraw'),
              style: AppTheme.body2.copyWith(color: Colors.grey),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 24),
            TumiaxButton(
              text: t.translate('add_payout_method'),
              onPressed: () => context.pushNamed(RouteNames.addPayoutMethod),
              width: 200,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSectionHeader(String title, IconData icon) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Row(
        children: [
          Icon(icon, size: 20, color: AppTheme.primaryColor),
          const SizedBox(width: 8),
          Text(
            title,
            style: AppTheme.body1.copyWith(
              fontWeight: FontWeight.bold,
              color: AppTheme.primaryColor,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildActivationInfoBox(AppLocalizations t) {
    return Container(
      margin: const EdgeInsets.only(top: 8, bottom: 16),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.blue.shade50,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.blue.shade200),
      ),
      child: Row(
        children: [
          Icon(Icons.info_outline, color: Colors.blue.shade700, size: 24),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  t.translate('pending_activation_info'),
                  style: AppTheme.body2.copyWith(
                    fontWeight: FontWeight.bold,
                    color: Colors.blue.shade700,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  t.translate('payout_method_activation_info'),
                  style: AppTheme.caption.copyWith(color: Colors.blue.shade700),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Future<void> _confirmDelete(
    BuildContext context,
    WidgetRef ref,
    int id,
    ValueNotifier<int?> deletingId,
    AppLocalizations t,
  ) async {
    final confirmed = await showDialog<bool>(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(t.translate('delete_payout_method')),
        content: Text(t.translate('delete_payout_method_confirmation')),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context, false),
            child: Text(t.translate('cancel')),
          ),
          ElevatedButton(
            onPressed: () => Navigator.pop(context, true),
            style: ElevatedButton.styleFrom(
              backgroundColor: AppTheme.errorColor,
            ),
            child: Text(t.translate('delete')),
          ),
        ],
      ),
    );

    if (confirmed == true) {
      deletingId.value = id;
      await ref.read(payoutControllerProvider.notifier).delete(id);
      deletingId.value = null;
    }
  }
}
