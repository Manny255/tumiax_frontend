import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import '../../../core/localization/app_localizations.dart';
import '../../../core/themes/app_theme.dart';
import '../../profile/data/models/kyc_lookup_model.dart';
import '../data/models/credit_line_model.dart';
import '../domain/enums/spend_type.dart';
import '../presentation/controllers/credit_account_controller.dart';
import '../presentation/controllers/credit_actions_controller.dart';
import '../presentation/controllers/credit_lines_controller.dart';
import '../presentation/widgets/repayment_summary_widget.dart';


class PayConfirmationDialog {
  static void show({
    required BuildContext context,
    required WidgetRef ref,
    required String amount,
    required KYCLookupModel recipient,
    String? description,
    required CreditLineModel creditLine,
  }) {
    // Hide keyboard safely
    FocusManager.instance.primaryFocus?.unfocus();

    Future.microtask(() async {
      await Future.delayed(const Duration(milliseconds: 100));
      if (!context.mounted) return;

      showDialog(
        context: context,
        builder: (dialogContext) {
          final t = AppLocalizations.of(dialogContext);
          final actionsController = ref.read(creditActionsControllerProvider);

          return AlertDialog(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16),
            ),
            title: Center(
              child: Text(
                t.translate('confirm_payment'),
                style: AppTheme.heading3.copyWith(fontWeight: FontWeight.bold),
              ),
            ),
            content: SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  /// =============================
                  /// RECIPIENT AVATAR
                  /// =============================
                  _buildRecipientAvatar(recipient),

                  const SizedBox(height: 16),

                  /// =============================
                  /// NAME
                  /// =============================
                  Text(
                    recipient.fullName ?? '',
                    textAlign: TextAlign.center,
                    style: AppTheme.body1.copyWith(fontWeight: FontWeight.bold),
                  ),

                  const SizedBox(height: 4),

                  /// =============================
                  /// EMAIL
                  /// =============================
                  Text(recipient.email, style: AppTheme.caption),

                  // const SizedBox(height: 16),

                  /// =============================
                  /// DETAILS CONTAINER
                  /// =============================
                  Container(
                    width: double.infinity,
                    padding: const EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      color: Colors.grey.shade50,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        RepaymentSummaryWidget(
                          principal: double.parse(amount),
                          hasFee: false,
                          compact: true,
                        ),
                        if (description != null &&
                            description.trim().isNotEmpty) ...[
                          const SizedBox(height: 12),
                          Text(
                            t.translate('description'),
                            style: AppTheme.caption.copyWith(
                              fontWeight: FontWeight.w600,
                              color: Colors.grey,
                            ),
                          ),
                          const SizedBox(height: 4),
                          Text(
                            description,
                            style: AppTheme.body2,
                            textAlign: TextAlign.center,
                          ),
                        ],
                      ],
                    ),
                  ),
                ],
              ),
            ),
            actions: [
              TextButton(
                onPressed: () => Navigator.pop(dialogContext),
                child: Text(t.translate('cancel')),
              ),
              ElevatedButton(
              onPressed: () async {
                  Navigator.pop(dialogContext);

                  try {
                    await actionsController.spend(
                      creditLineId: creditLine.id,
                      amount: double.parse(amount),
                      description: description ??
                          t.translate('payment_to')
                              .replaceAll('{email}', recipient.email),
                      spendType: SpendType.pay,
                      recipientEmail: recipient.email,
                    );

                    /// Refresh credit data
                    ref.invalidate(creditAccountControllerProvider);
                    ref.invalidate(creditLinesControllerProvider);

                    if (!context.mounted) return;

                    Navigator.pop(context);

                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text(t.translate('payment_successful')),
                        backgroundColor: AppTheme.secondaryColor,
                        behavior: SnackBarBehavior.floating,
                      ),
                    );
                  } catch (e) {
                    if (!context.mounted) return;

                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text(e.toString()),
                        backgroundColor: AppTheme.errorColor,
                        behavior: SnackBarBehavior.floating,
                      ),
                    );
                  }
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppTheme.secondaryColor,
                  foregroundColor: Colors.white,
                ),
                child: Text(t.translate('confirm')),
              ),
            ],
          );
        },
      );
    });
  }

  /// ============================================================
  /// RECIPIENT AVATAR
  /// ============================================================

  static Widget _buildRecipientAvatar(KYCLookupModel recipient) {
    final hasImage =
        recipient.selfieUrl != null && recipient.selfieUrl!.isNotEmpty;

    return CircleAvatar(
      radius: 40,
      backgroundColor: AppTheme.primaryColor.withOpacity(0.1),
      child: ClipOval(
        child: hasImage
            ? Image.network(
                recipient.selfieUrl!,
                width: 80,
                height: 80,
                fit: BoxFit.cover,
                errorBuilder: (_, __, ___) => _buildInitialsAvatar(recipient),
              )
            : _buildInitialsAvatar(recipient),
      ),
    );
  }

  static Widget _buildInitialsAvatar(KYCLookupModel recipient) {
      final name = recipient.fullName ?? '';
      final initials = name
        .split(' ')
        .where((e) => e.isNotEmpty)
        .map((e) => e[0])
        .take(2)
        .join()
        .toUpperCase();

    return Container(
      width: 80,
      height: 80,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: AppTheme.primaryColor,
        shape: BoxShape.circle,
      ),
      child: Text(
        initials,
        style: const TextStyle(
          fontSize: 24,
          fontWeight: FontWeight.bold,
          color: Colors.white,
        ),
      ),
    );
  }
}
