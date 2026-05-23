import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/localization/app_localizations.dart';
import '../../../../core/themes/app_theme.dart';
import '../data/models/credit_line_model.dart';
import '../data/models/transfer_type.dart';
import '../domain/enums/spend_type.dart';
import '../presentation/controllers/credit_account_controller.dart';
import '../presentation/controllers/credit_actions_controller.dart';
import '../presentation/controllers/credit_lines_controller.dart';
import '../presentation/widgets/repayment_summary_widget.dart';

class TransferConfirmationDialog {
  static void show({
    required BuildContext context,
    required TransferType transferType,
    required String amount,
    required String recipient,
    String? recipientEmail,
    String? selfieUrl,
    String? accountHolderName,
    String? mobileWalletName,
    String? accountNumber,
    String? mobileWalletNumber,
    String? bankName,
    String? mobileWalletProvider,
    required CreditLineModel creditLine,
    String? payoutMethodId,
    VoidCallback? onSuccess,
  }) {
    if (!context.mounted) return;

    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (_) => _TransferConfirmationDialogContent(
        transferType: transferType,
        amount: amount,
        recipient: recipient,
        recipientEmail: recipientEmail,
        selfieUrl: selfieUrl,
        accountHolderName: accountHolderName,
        mobileWalletName: mobileWalletName,
        accountNumber: accountNumber,
        mobileWalletNumber: mobileWalletNumber,
        bankName: bankName,
        mobileWalletProvider: mobileWalletProvider,
        creditLine: creditLine,
        payoutMethodId: payoutMethodId,
        onSuccess: onSuccess,
      ),
    );
  }
}

class _TransferConfirmationDialogContent extends ConsumerStatefulWidget {
  final TransferType transferType;
  final String amount;
  final String recipient;
  final String? recipientEmail;
  final String? selfieUrl;
  final String? accountHolderName;
  final String? mobileWalletName;
  final String? accountNumber;
  final String? mobileWalletNumber;
  final String? bankName;
  final String? mobileWalletProvider;
  final CreditLineModel creditLine;
  final String? payoutMethodId;
  final VoidCallback? onSuccess;

  const _TransferConfirmationDialogContent({
    required this.transferType,
    required this.amount,
    required this.recipient,
    this.recipientEmail,
    this.selfieUrl,
    this.accountHolderName,
    this.mobileWalletName,
    this.accountNumber,
    this.mobileWalletNumber,
    this.bankName,
    this.mobileWalletProvider,
    required this.creditLine,
    this.payoutMethodId,
    this.onSuccess,
  });

  @override
  ConsumerState<_TransferConfirmationDialogContent> createState() =>
      _TransferConfirmationDialogContentState();
}

class _TransferConfirmationDialogContentState
    extends ConsumerState<_TransferConfirmationDialogContent> {
  bool _isLoading = false;

  @override
  Widget build(BuildContext context) {
    final t = AppLocalizations.of(context);
    final isInternal = widget.transferType == TransferType.internal;

    return AlertDialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      title: Center(
        child: Text(
          isInternal
              ? t.translate('confirm_transfer')
              : t.translate('confirm_withdrawal'),
          style: AppTheme.heading3.copyWith(fontWeight: FontWeight.bold),
        ),
      ),
      content: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            if (isInternal) _buildRecipientAvatar() else _buildMethodIcon(),

            const SizedBox(height: 16),

            _buildRecipientInfo(t),

            if (widget.recipientEmail != null && isInternal) ...[
              const SizedBox(height: 4),
              Text(widget.recipientEmail!, style: AppTheme.caption),
            ],

            if (!isInternal) ...[
              const SizedBox(height: 8),
              _buildExternalDetails(t),
            ],

            const SizedBox(height: 16),
            _buildAmount(),

            if (!isInternal) ...[
              const SizedBox(height: 16),
              _buildExternalWarning(t),
            ],
          ],
        ),
      ),
      actions: [
        TextButton(
          onPressed: _isLoading ? null : () => Navigator.pop(context),
          child: Text(t.translate('cancel')),
        ),
        ElevatedButton(
          onPressed: _isLoading ? null : () => _confirmTransfer(t),
          child: _isLoading
              ? const SizedBox(
                  width: 18,
                  height: 18,
                  child: CircularProgressIndicator(strokeWidth: 2),
                )
              : Text(t.translate('confirm')),
        ),
      ],
    );
  }

 Future<void> _confirmTransfer(AppLocalizations t) async {
    if (_isLoading) return;

    setState(() => _isLoading = true);

    try {
      final controller = ref.read(creditActionsControllerProvider);

      final isInternal = widget.transferType == TransferType.internal;

      final spendType = isInternal
          ? SpendType.transferInternal
          : SpendType.transferExternal;

      await controller.spend(
        creditLineId: widget.creditLine.id,
        amount: double.parse(widget.amount),
        description: isInternal
            ? t.translate('transfer_to_named', params: {'name': widget.recipient})
            : t.translate('withdrawal_to_named', params: {'name': widget.recipient}),
        spendType: spendType,
        recipientEmail: isInternal ? widget.recipientEmail : null,
        payoutMethodId: isInternal ? null : widget.payoutMethodId,
        metadata: {"recipient_name": widget.recipient},
      );

      /// Refresh credit data
      ref.invalidate(creditAccountControllerProvider);
      ref.invalidate(creditLinesControllerProvider);

      if (!mounted) return;

      Navigator.pop(context);
      widget.onSuccess?.call();

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            isInternal
                ? t.translate('transfer_successful')
                : t.translate('withdrawal_request_submitted'),
          ),
          backgroundColor: AppTheme.secondaryColor,
        ),
      );
    } catch (e) {
      if (!mounted) return;

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(e.toString()),
          backgroundColor: AppTheme.errorColor,
        ),
      );
    } finally {
      if (mounted) {
        setState(() => _isLoading = false);
      }
    }
  }

 Widget _buildAmount() {
    final amount = double.tryParse(widget.amount) ?? 0;
    final isInternal = widget.transferType == TransferType.internal;

    return RepaymentSummaryWidget(
      principal: amount,
      hasFee: !isInternal,
      compact: true,
    );
  }

  Widget _buildRecipientInfo(AppLocalizations t) {
    final isInternal = widget.transferType == TransferType.internal;

    return Column(
      children: [
        Text(
          isInternal ? t.translate('transfer_to') : t.translate('withdraw_to'),
          style: AppTheme.body2,
        ),
        const SizedBox(height: 4),
        Text(
          widget.recipient,
          style: AppTheme.body1.copyWith(fontWeight: FontWeight.bold),
        ),
      ],
    );
  }
Widget _buildRecipientAvatar() {
    return CircleAvatar(
      radius: 36,
      backgroundColor: AppTheme.primaryColor.withOpacity(0.1),
      child: ClipOval(
        child: (widget.selfieUrl != null && widget.selfieUrl!.isNotEmpty)
            ? Image.network(
                widget.selfieUrl!,
                width: 72,
                height: 72,
                fit: BoxFit.cover,
                errorBuilder: (_, __, ___) => _buildInitialsAvatar(),
              )
            : _buildInitialsAvatar(),
      ),
    );
  }

  Widget _buildInitialsAvatar() {
    final initials = widget.recipient
        .split(' ')
        .where((e) => e.isNotEmpty)
        .map((e) => e[0])
        .take(2)
        .join()
        .toUpperCase();

    return Container(
      width: 72,
      height: 72,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: AppTheme.primaryColor,
        shape: BoxShape.circle,
      ),
      child: Text(
        initials,
        style: const TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.bold,
          color: Colors.white,
        ),
      ),
    );
  }

  Widget _buildMethodIcon() {
    final isBank = widget.bankName != null;

    return Container(
      width: 72,
      height: 72,
      decoration: BoxDecoration(
        color: (isBank ? Colors.blue : Colors.green).withOpacity(0.1),
        shape: BoxShape.circle,
      ),
      child: Icon(
        isBank ? Icons.account_balance : Icons.phone_android,
        color: isBank ? Colors.blue : Colors.green,
        size: 36,
      ),
    );
  }

  Widget _buildExternalDetails(AppLocalizations t) {
    final isBank = widget.bankName != null;
    final name = isBank ? widget.accountHolderName : widget.mobileWalletName;

    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.grey.shade50,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: Colors.grey.shade200),
      ),
      child: Column(
        children: [
          if (name != null)
            _buildDetailRow(label: t.translate('account_name'), value: name),
          if (isBank && widget.accountNumber != null)
            _buildDetailRow(
              label: t.translate('account_number'),
              value:
                  '•••• ${widget.accountNumber!.substring(widget.accountNumber!.length - 4)}',
            ),
          if (!isBank && widget.mobileWalletNumber != null)
            _buildDetailRow(
              label: t.translate('phone_number'),
              value: widget.mobileWalletNumber!,
            ),
        ],
      ),
    );
  }

  Widget _buildDetailRow({required String label, required String value}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(label, style: AppTheme.caption),
          Flexible(
            child: Text(
              value,
              textAlign: TextAlign.right,
              style: AppTheme.body2.copyWith(fontWeight: FontWeight.bold),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildExternalWarning(AppLocalizations t) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.orange.shade50,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: Colors.orange.shade200),
      ),
      child: Row(
        children: [
          Icon(Icons.warning_amber, color: Colors.orange.shade700, size: 20),
          const SizedBox(width: 8),
          Expanded(
            child: Text(
              t.translate('external_transfer_warning'),
              style: AppTheme.caption.copyWith(
                color: Colors.orange.shade700,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
        ],
      ),
    );
  }
}


// import 'package:flutter/material.dart';
// import '../../../../core/localization/app_localizations.dart';
// import '../../../../core/themes/app_theme.dart';
// import '../data/models/credit_line_model.dart';
// import '../data/models/transfer_type.dart';

// class TransferConfirmationDialog {
//   static void show({
//     required BuildContext context,
//     required TransferType transferType,
//     required String amount,
//     required String recipient,
//     String? recipientEmail,
//     String? selfieUrl,
//     String? accountHolderName,
//     String? mobileWalletName,
//     String? accountNumber,
//     String? mobileWalletNumber,
//     String? bankName,
//     String? mobileWalletProvider,
//     required CreditLineModel creditLine,
//   }) {
//     // Ensure we're showing dialog with a valid context
//     if (!context.mounted) return;

//     // Use addPostFrameCallback to ensure dialog shows after current frame
//     WidgetsBinding.instance.addPostFrameCallback((_) {
//       if (!context.mounted) return;

//       showDialog(
//         context: context,
//         barrierDismissible: true,
//         builder: (dialogContext) => _TransferConfirmationDialogContent(
//           transferType: transferType,
//           amount: amount,
//           recipient: recipient,
//           recipientEmail: recipientEmail,
//           selfieUrl: selfieUrl,
//           accountHolderName: accountHolderName,
//           mobileWalletName: mobileWalletName,
//           accountNumber: accountNumber,
//           mobileWalletNumber: mobileWalletNumber,
//           bankName: bankName,
//           mobileWalletProvider: mobileWalletProvider,
//         ),
//       );
//     });
//   }
// }

// class _TransferConfirmationDialogContent extends StatelessWidget {
//   final TransferType transferType;
//   final String amount;
//   final String recipient;
//   final String? recipientEmail;
//   final String? selfieUrl;
//   final String? accountHolderName;
//   final String? mobileWalletName;
//   final String? accountNumber;
//   final String? mobileWalletNumber;
//   final String? bankName;
//   final String? mobileWalletProvider;

//   const _TransferConfirmationDialogContent({
//     required this.transferType,
//     required this.amount,
//     required this.recipient,
//     this.recipientEmail,
//     this.selfieUrl,
//     this.accountHolderName,
//     this.mobileWalletName,
//     this.accountNumber,
//     this.mobileWalletNumber,
//     this.bankName,
//     this.mobileWalletProvider,
//   });

//   @override
//   Widget build(BuildContext context) {
//     final t = AppLocalizations.of(context);

//     return AlertDialog(
//       shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
//        title: Center(
//         child: Text(
//           transferType == TransferType.internal
//               ? t.translate('confirm_transfer')
//               : t.translate('confirm_withdrawal'),
//           style: AppTheme.heading3.copyWith(fontWeight: FontWeight.bold),
//         ),
//       ),
//       content: SingleChildScrollView(
//         // Add scroll view to handle overflow
//         child: Column(
//           mainAxisSize: MainAxisSize.min,
//           children: [
//             if (transferType == TransferType.internal) _buildRecipientAvatar(),
//             if (transferType == TransferType.external) _buildMethodIcon(),
//             const SizedBox(height: 16),
//             _buildRecipientInfo(t),
//             if (recipientEmail != null &&
//                 transferType == TransferType.internal) ...[
//               const SizedBox(height: 4),
//               Text(recipientEmail!, style: AppTheme.caption),
//             ],
//             if (transferType == TransferType.external) ...[
//               const SizedBox(height: 8),
//               _buildExternalDetails(t),
//             ],
//             const SizedBox(height: 16),
//             _buildAmount(),
//             if (transferType == TransferType.external) ...[
//               const SizedBox(height: 16),
//               _buildExternalWarning(t),
//             ],
//           ],
//         ),
//       ),
//       actions: [
//         TextButton(
//           onPressed: () => Navigator.pop(context),
//           child: Text(t.translate('cancel')),
//         ),
//         ElevatedButton(
//           onPressed: () => _confirmTransfer(context, t),
//           child: Text(t.translate('confirm')),
//         ),
//       ],
//     );
//   }

//   Widget _buildMethodIcon() {
//     final isBank = bankName != null;
//     return Container(
//       width: 72,
//       height: 72,
//       decoration: BoxDecoration(
//         color: (isBank ? Colors.blue : Colors.green).withOpacity(0.1),
//         shape: BoxShape.circle,
//       ),
//       child: Icon(
//         isBank ? Icons.account_balance : Icons.phone_android,
//         color: isBank ? Colors.blue : Colors.green,
//         size: 36,
//       ),
//     );
//   }

//   Widget _buildRecipientInfo(AppLocalizations t) {
//     return Column(
//       children: [
//         Text(
//           transferType == TransferType.internal
//               ? t.translate('transfer_to')
//               : t.translate('withdraw_to'),
//           style: AppTheme.body2,
//         ),
//         const SizedBox(height: 4),
//         Text(
//           recipient,
//           style: AppTheme.body1.copyWith(fontWeight: FontWeight.bold),
//         ),
//       ],
//     );
//   }

//   Widget _buildExternalDetails(AppLocalizations t) {
//     final isBank = bankName != null;
//     final name = isBank ? accountHolderName : mobileWalletName;

//     return Container(
//       padding: const EdgeInsets.all(12),
//       decoration: BoxDecoration(
//         color: Colors.grey.shade50,
//         borderRadius: BorderRadius.circular(8),
//         border: Border.all(color: Colors.grey.shade200),
//       ),
//       child: Column(
//         children: [
//           if (name != null && name.isNotEmpty)
//             _buildDetailRow(
//               icon: Icons.person,
//               label: t.translate('account_name'),
//               value: name,
//               isBold: true,
//             ),
//           if (isBank && accountNumber != null)
//             _buildDetailRow(
//               icon: Icons.numbers,
//               label: t.translate('account_number'),
//               value: _maskAccountNumber(accountNumber!),
//             ),
//           if (!isBank && mobileWalletNumber != null)
//             _buildDetailRow(
//               icon: Icons.phone,
//               label: t.translate('phone_number'),
//               value: mobileWalletNumber!,
//             ),
//         ],
//       ),
//     );
//   }

//   Widget _buildDetailRow({
//     required IconData icon,
//     required String label,
//     required String value,
//     bool isBold = false,
//   }) {
//     return Padding(
//       padding: const EdgeInsets.symmetric(vertical: 4),
//       child: Row(
//         children: [
//           Icon(icon, size: 16, color: Colors.grey.shade600),
//           const SizedBox(width: 8),
//           Expanded(
//             child: Row(
//               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//               children: [
//                 Text(
//                   '$label:',
//                   style: AppTheme.caption.copyWith(color: Colors.grey.shade700),
//                 ),
//                 const SizedBox(width: 8),
//                 Flexible(
//                   child: Text(
//                     value,
//                     style: (isBold ? AppTheme.body2 : AppTheme.caption)
//                         .copyWith(
//                           fontWeight: isBold
//                               ? FontWeight.bold
//                               : FontWeight.normal,
//                         ),
//                     textAlign: TextAlign.right,
//                   ),
//                 ),
//               ],
//             ),
//           ),
//         ],
//       ),
//     );
//   }

//   String _maskAccountNumber(String accountNumber) {
//     if (accountNumber.length <= 4) return accountNumber;
//     return '•••• ${accountNumber.substring(accountNumber.length - 4)}';
//   }

//   Widget _buildRecipientAvatar() {
//     return CircleAvatar(
//       radius: 36,
//       backgroundColor: AppTheme.primaryColor.withOpacity(0.1),
//       child: ClipOval(
//         child: (selfieUrl != null && selfieUrl!.isNotEmpty)
//             ? Image.network(
//                 selfieUrl!,
//                 width: 72,
//                 height: 72,
//                 fit: BoxFit.cover,
//                 errorBuilder: (_, __, ___) => _buildInitialsAvatar(),
//               )
//             : _buildInitialsAvatar(),
//       ),
//     );
//   }

//   Widget _buildInitialsAvatar() {
//     final initials = recipient
//         .split(' ')
//         .where((e) => e.isNotEmpty)
//         .map((e) => e[0])
//         .take(2)
//         .join()
//         .toUpperCase();

//     return Container(
//       width: 72,
//       height: 72,
//       alignment: Alignment.center,
//       decoration: BoxDecoration(
//         color: AppTheme.primaryColor,
//         shape: BoxShape.circle,
//       ),
//       child: Text(
//         initials,
//         style: const TextStyle(
//           fontSize: 20,
//           fontWeight: FontWeight.bold,
//           color: Colors.white,
//         ),
//       ),
//     );
//   }

//   Widget _buildAmount() {
//     return Container(
//       padding: const EdgeInsets.all(12),
//       decoration: BoxDecoration(
//         color: Colors.grey.shade100,
//         borderRadius: BorderRadius.circular(8),
//       ),
//       child: Text(
//         'TZS $amount',
//         style: AppTheme.heading3.copyWith(color: AppTheme.primaryColor),
//       ),
//     );
//   }

//   Widget _buildExternalWarning(AppLocalizations t) {
//     return Container(
//       padding: const EdgeInsets.all(12),
//       decoration: BoxDecoration(
//         color: Colors.orange.shade50,
//         borderRadius: BorderRadius.circular(8),
//         border: Border.all(color: Colors.orange.shade200),
//       ),
//       child: Row(
//         children: [
//           Icon(Icons.warning_amber, color: Colors.orange.shade700, size: 20),
//           const SizedBox(width: 8),
//           Expanded(
//             child: Text(
//               t.translate('external_transfer_warning'),
//               style: AppTheme.caption.copyWith(
//                 color: Colors.orange.shade700,
//                 fontWeight: FontWeight.w500,
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }

//   void _confirmTransfer(BuildContext context, AppLocalizations t) {
//     Navigator.pop(context); // Close dialog

//     // Use microtask to ensure navigation happens after dialog is closed
//     Future.microtask(() {
//       if (!context.mounted) return;
//       Navigator.pop(context); // Go back to previous screen

//       ScaffoldMessenger.of(context).showSnackBar(
//         SnackBar(
//           content: Text(
//             transferType == TransferType.internal
//                 ? t.translate('transfer_successful')
//                 : t.translate('withdrawal_request_submitted'),
//           ),
//           backgroundColor: AppTheme.secondaryColor,
//           behavior: SnackBarBehavior.floating,
//         ),
//       );
//     });
//   }
// }

