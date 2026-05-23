// lib/features/credit/presentation/widgets/transfer_button.dart

import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import '../../../../core/localization/app_localizations.dart';
import '../../../../core/themes/app_theme.dart';
import '../../../../core/widgets/tumiax_button.dart';
import '../../../payout/data/domain/entities/payout_method.dart';
import '../../data/models/credit_line_model.dart';
import '../../data/models/transfer_type.dart';
import '../../dialogs/transfer_confirmation_dialog.dart';

class TransferButton extends HookConsumerWidget {
  final TransferType transferType;
  final TextEditingController amountController;
  final TextEditingController recipientController;
  final ValueNotifier<Map<String, dynamic>?> selectedContact;
  final ValueNotifier<PayoutMethod?> selectedPayoutMethod;
  final ValueNotifier<CreditLineModel?> selectedCreditLine;
  final VoidCallback? onSuccess;

  const TransferButton({
    super.key,
    required this.transferType,
    required this.amountController,
    required this.recipientController,
    required this.selectedContact,
    required this.selectedPayoutMethod,
    required this.selectedCreditLine,
    this.onSuccess,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final t = AppLocalizations.of(context);

    return TumiaxButton(
      text: transferType == TransferType.internal
          ? t.translate('transfer_now')
          : t.translate('withdraw_now'),
      onPressed: () => _handleTransfer(context, t),
    );
  }

  Future<void> _handleTransfer(BuildContext context, AppLocalizations t) async {
    // Step 1: Hide keyboard immediately
    FocusManager.instance.primaryFocus?.unfocus();

    // Step 2: Ensure any pending keyboard operations are complete
    await Future.delayed(const Duration(milliseconds: 100));

    // Step 3: Wait for the next frame to ensure UI is stable
    await WidgetsBinding.instance.endOfFrame;

    // Step 4: Check if context is still valid before proceeding
    if (!context.mounted) return;

    if (!_validateInputs(context, t)) return;

    if (transferType == TransferType.internal) {
      final contact = selectedContact.value!;

      // Check if recipient can receive money
      if (contact['canReceive'] == false) {
        _showErrorSnackBar(
          context,
          t.translate('recipient_cannot_receive_transfers'),
        );
        return;
      }

      // Check risk score
      final riskScore = contact['riskScore'] ?? 0;
      if (riskScore > 70) {
        _showErrorSnackBar(context, t.translate('recipient_high_risk'));
        return;
      }

      // Show warning for medium risk
      if (riskScore > 50) {
        _showWarningDialog(context, t.translate('recipient_medium_risk'), () {
          _proceedWithTransfer(context, t);
        });
        return;
      }

      // Validate credit line
      if (selectedCreditLine.value == null) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(t.translate('select_asset_to_spend')),
            backgroundColor: AppTheme.errorColor,
          ),
        );
        return;
      }
    }

    _proceedWithTransfer(context, t);
  }

  void _proceedWithTransfer(BuildContext context, AppLocalizations t) {
    // Ensure keyboard is hidden one more time
    FocusManager.instance.primaryFocus?.unfocus();

    final payout = selectedPayoutMethod.value;
    final isInternal = transferType == TransferType.internal;

    final recipientName = isInternal
        ? (selectedContact.value?['name'] ?? recipientController.text)
        : _getPayoutDisplayName(payout);

    final recipientEmail = isInternal
        ? (selectedContact.value?['email'] ?? recipientController.text)
        : null;

    String? selfieUrl;
    if (isInternal) {
      selfieUrl = selectedContact.value?['selfieUrl'] as String?;
    }

    // Prepare external transfer details
    String? accountHolderName;
    String? mobileWalletName;
    String? accountNumber;
    String? mobileWalletNumber;
    String? bankName;
    String? mobileWalletProvider;

    if (!isInternal && payout != null) {
      final isBank = payout.method == 'BT';

      if (isBank) {
        accountHolderName = payout.accountHolder;
        accountNumber = payout.accountNumber;
        bankName = payout.bankName;
      } else {
        mobileWalletName = payout.mobileWalletName;
        mobileWalletNumber = payout.mobileWalletNumber;
        mobileWalletProvider = payout.mobileWalletProvider;
      }
    }

    // Use a microtask to ensure dialog shows after current call stack clears
    Future.microtask(() {
      if (!context.mounted) return;

      TransferConfirmationDialog.show(
        context: context,
        transferType: transferType,
        amount: amountController.text,
        recipient: recipientName,
        recipientEmail: recipientEmail,
        selfieUrl: selfieUrl,
        accountHolderName: accountHolderName,
        mobileWalletName: mobileWalletName,
        accountNumber: accountNumber,
        mobileWalletNumber: mobileWalletNumber,
        bankName: bankName,
        mobileWalletProvider: mobileWalletProvider,
        creditLine: selectedCreditLine.value!,
        payoutMethodId: payout?.id.toString(),
        onSuccess: onSuccess,
      );
    });
  }

  bool _validateInputs(BuildContext context, AppLocalizations t) {
    if (amountController.text.isEmpty) {
      _showErrorSnackBar(context, t.translate('enter_amount'));
      return false;
    }

    final amount = double.tryParse(amountController.text);
    if (amount == null || amount <= 0) {
      _showErrorSnackBar(context, t.translate('enter_valid_amount'));
      return false;
    }

    if (transferType == TransferType.internal) {
      if (selectedContact.value == null) {
        _showErrorSnackBar(context, t.translate('select_recipient_first'));
        return false;
      }
    } else {
      if (selectedPayoutMethod.value == null) {
        _showErrorSnackBar(context, t.translate('select_payout_method'));
        return false;
      }
    }

    return true;
  }

  String _getPayoutDisplayName(PayoutMethod? payout) {
    if (payout == null) return '';
    return payout.method == 'BT'
        ? payout.bankName ?? ''
        : payout.mobileWalletProvider ?? '';
  }

  void _showErrorSnackBar(BuildContext context, String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(message), backgroundColor: AppTheme.errorColor),
    );
  }

  void _showWarningDialog(
    BuildContext context,
    String message,
    VoidCallback onProceed,
  ) {
    final t = AppLocalizations.of(context);

    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(t.translate('warning')),
        content: Text(message),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: Text(t.translate('cancel')),
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.pop(context);
              onProceed();
            },
            style: ElevatedButton.styleFrom(backgroundColor: Colors.orange),
            child: Text(t.translate('proceed_anyway')),
          ),
        ],
      ),
    );
  }
}
