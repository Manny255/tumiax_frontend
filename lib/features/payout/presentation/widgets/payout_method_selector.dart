import 'package:flutter/material.dart';
import '../../../../core/localization/app_localizations.dart';
import '../../../../core/themes/app_theme.dart';
import '../../data/domain/entities/payout_method.dart';

class PayoutMethodSelector extends StatelessWidget {
  final List<PayoutMethod> payoutMethods;
  final ValueNotifier<PayoutMethod?> selectedMethod;

  const PayoutMethodSelector({
    super.key,
    required this.payoutMethods,
    required this.selectedMethod,
  });

  @override
  Widget build(BuildContext context) {
     final t = AppLocalizations.of(context);
    if (payoutMethods.isEmpty) {
      return Center(child: Text(t.translate('no_payout_methods')));
    }

    return ValueListenableBuilder<PayoutMethod?>(
      valueListenable: selectedMethod,
      builder: (context, selected, _) {
        return RadioGroup<PayoutMethod>(
          groupValue: selected,
          onChanged: (value) {
            selectedMethod.value = value;
          },
          child: Column(
            children: payoutMethods.map((method) {
              final isSelected = selected?.id == method.id;
              final isActive = method.isActive;
              final isBank = method.method == 'BT';

              return Container(
                margin: const EdgeInsets.only(bottom: 12),
                decoration: BoxDecoration(
                  border: Border.all(
                    color: isSelected
                        ? AppTheme.primaryColor
                        : isActive
                        ? Colors.grey.shade300
                        : Colors.grey.shade200,
                    width: isSelected ? 2 : 1,
                  ),
                  borderRadius: BorderRadius.circular(12),
                  color: isSelected
                      ? AppTheme.primaryColor.withValues(alpha: 0.05)
                      : Colors.white,
                ),
                child: ListTile(
                  leading: _buildLeadingIcon(isBank),
                  title: Text(
                    _buildTitle(method, isBank, t),
                    style: AppTheme.body2.copyWith(
                      fontWeight: isSelected
                          ? FontWeight.bold
                          : FontWeight.normal,
                    ),
                  ),
                  subtitle: _buildSubtitle(method, isBank),
                  trailing: _buildTrailing(method, isActive, t),
                  onTap: isActive ? () => selectedMethod.value = method : null,
                ),
              );
            }).toList(),
          ),
        );
      },
    );
  }
  /// =============================
  /// LEADING ICON
  /// =============================

  Widget _buildLeadingIcon(bool isBank) {
    return Container(
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: (isBank ? Colors.blue : Colors.green).withValues(alpha: 0.1),
        shape: BoxShape.circle,
      ),
      child: Icon(
        isBank ? Icons.account_balance : Icons.phone_android,
        color: isBank ? Colors.blue : Colors.green,
        size: 20,
      ),
    );
  }

  /// =============================
  /// TITLE
  /// =============================

 String _buildTitle(PayoutMethod method, bool isBank, AppLocalizations t) {
    if (isBank) {
      return method.bankName ?? t.translate('bank_transfer');
    }
    return method.mobileWalletProvider ?? t.translate('mobile_wallet');
  }

  /// =============================
  /// SUBTITLE
  /// =============================

  Widget _buildSubtitle(PayoutMethod method, bool isBank) {
    if (isBank) {
      final accountNumber = method.accountNumber;
      final masked = accountNumber != null && accountNumber.length >= 4
          ? '•••• ${accountNumber.substring(accountNumber.length - 4)}'
          : '';

      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (masked.isNotEmpty) Text(masked, style: AppTheme.caption),
          if (method.accountHolder != null)
            Text(method.accountHolder!, style: AppTheme.caption),
          if (method.accountCurrency != null)
            Text(method.accountCurrency!, style: AppTheme.caption),
        ],
      );
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (method.mobileWalletNumber != null)
          Text(method.mobileWalletNumber!, style: AppTheme.caption),
        if (method.mobileWalletName != null)
          Text(method.mobileWalletName!, style: AppTheme.caption),
      ],
    );
  }

  /// =============================
  /// TRAILING
  /// =============================

 Widget _buildTrailing(PayoutMethod method, bool isActive, AppLocalizations t,
  ) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        if (!isActive)
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
            decoration: BoxDecoration(
              color: Colors.orange.shade100,
              borderRadius: BorderRadius.circular(12),
            ),
            child: Text(
              t.translate('pending'),
              style: AppTheme.caption.copyWith(
                color: Colors.orange.shade800,
                fontSize: 10,
              ),
            ),
          ),
        Radio<PayoutMethod>(value: method, toggleable: false),
      ],
    );
  }
}




// import 'package:flutter/material.dart';
// import '../../../../core/themes/app_theme.dart';

// class PayoutMethodSelector extends StatelessWidget {
//   final List<Map<String, dynamic>> payoutMethods;
//   final ValueNotifier<Map<String, dynamic>?> selectedMethod;

//   const PayoutMethodSelector({
//     super.key,
//     required this.payoutMethods,
//     required this.selectedMethod,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       children: payoutMethods.map((method) {
//         final isSelected = selectedMethod.value == method;
//         final isUsable = method['isUsable'] ?? false;

//         return Container(
//           margin: const EdgeInsets.only(bottom: 12),
//           decoration: BoxDecoration(
//             border: Border.all(
//               color: isSelected
//                   ? AppTheme.primaryColor
//                   : isUsable
//                   ? Colors.grey.shade300
//                   : Colors.grey.shade200,
//               width: isSelected ? 2 : 1,
//             ),
//             borderRadius: BorderRadius.circular(12),
//             color: isSelected
//                 ? AppTheme.primaryColor.withOpacity(0.05)
//                 : Colors.white,
//           ),
//           child: ListTile(
//             leading: Container(
//               padding: const EdgeInsets.all(8),
//               decoration: BoxDecoration(
//                 color: (method['method'] == 'BT' ? Colors.blue : Colors.green)
//                     .withOpacity(0.1),
//                 shape: BoxShape.circle,
//               ),
//               child: Icon(
//                 method['method'] == 'BT'
//                     ? Icons.account_balance
//                     : Icons.phone_android,
//                 color: method['method'] == 'BT' ? Colors.blue : Colors.green,
//                 size: 20,
//               ),
//             ),
//             title: Text(
//               method['methodName'] ??
//                   (method['method'] == 'BT'
//                       ? 'Bank Transfer'
//                       : 'Mobile Wallet'),
//               style: AppTheme.body2.copyWith(
//                 fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
//               ),
//             ),
//             subtitle: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 const SizedBox(height: 4),
//                 if (method['method'] == 'BT') ...[
//                   Text(
//                     '${method['bankName']} • ${method['accountNumber']?.substring(method['accountNumber'].length - 4)}',
//                     style: AppTheme.caption,
//                   ),
//                   Text(method['accountHolder'] ?? '', style: AppTheme.caption),
//                 ] else ...[
//                   Text(
//                     method['mobileWalletProvider'] ?? '',
//                     style: AppTheme.caption,
//                   ),
//                   Text(
//                     method['mobileWalletNumber'] ?? '',
//                     style: AppTheme.caption,
//                   ),
//                 ],
//               ],
//             ),
//             trailing: Row(
//               mainAxisSize: MainAxisSize.min,
//               children: [
//                 if (!isUsable)
//                   Container(
//                     padding: const EdgeInsets.symmetric(
//                       horizontal: 8,
//                       vertical: 4,
//                     ),
//                     decoration: BoxDecoration(
//                       color: Colors.orange.shade100,
//                       borderRadius: BorderRadius.circular(12),
//                     ),
//                     child: Text(
//                       'Pending',
//                       style: AppTheme.caption.copyWith(
//                         color: Colors.orange.shade800,
//                         fontSize: 10,
//                       ),
//                     ),
//                   ),
//                 Radio<bool>(
//                   value: true,
//                   groupValue: isSelected,
//                   onChanged: isUsable
//                       ? (_) {
//                           selectedMethod.value = method;
//                         }
//                       : null,
//                   activeColor: AppTheme.primaryColor,
//                 ),
//               ],
//             ),
//             onTap: isUsable
//                 ? () {
//                     selectedMethod.value = method;
//                   }
//                 : null,
//           ),
//         );
//       }).toList(),
//     );
//   }
// }
