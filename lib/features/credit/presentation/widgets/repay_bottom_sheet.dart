// repay_bottom_sheet.dart

import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:intl/intl.dart';

import '../../../../core/localization/app_localizations.dart';
import '../../../../core/themes/app_theme.dart';
import '../../../../core/widgets/tumiax_button.dart';
import '../../../../core/widgets/tumiax_text_field.dart';
import '../controllers/credit_account_controller.dart';
import '../controllers/credit_debts_controller.dart';
import '../../../wallet/presentation/controllers/balance_controller.dart';
import '../controllers/credit_actions_controller.dart';
import '../../data/models/credit_transaction_model.dart';
import '../controllers/credit_lines_controller.dart';

class RepayBottomSheet extends HookConsumerWidget {
  final CreditTransactionModel debt;

  const RepayBottomSheet({super.key, required this.debt});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final t = AppLocalizations.of(context);

    final currencyFormat = NumberFormat.currency(
      locale: 'en_TZ',
      symbol: 'TZS ',
      decimalDigits: 0,
    );

    final amountController = useTextEditingController();
    final isLoading = useState(false);
    final formKey = useMemoized(() => GlobalKey<FormState>());

    final actionsController = ref.read(creditActionsControllerProvider);
    final balanceState = ref.watch(balanceControllerProvider);

    final localizedDescription = t.translate('credit_repayment');
    /// SAFE BALANCE EXTRACTION
    final double currentBalance = balanceState.maybeWhen(
      data: (data) => data.balance.balance,
      orElse: () => 0.0,
    );

    /// FIXED: bool variable, NOT function
    final bool hasNoBalance = balanceState.hasValue && currentBalance <= 0;

    bool insufficientBalance(double amount) {
      return currentBalance < amount;
    }

    Future<void> _submit() async {
      if (!formKey.currentState!.validate()) return;

      final enteredAmount = double.parse(amountController.text);

      if (insufficientBalance(enteredAmount)) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(t.translate('insufficient_balance')),
            backgroundColor: AppTheme.errorColor,
            behavior: SnackBarBehavior.floating,
          ),
        );
        return;
      }

      isLoading.value = true;

      try {
        await actionsController.repay(
          amount: enteredAmount,
          description: localizedDescription,
        );

        /// Refresh credit data
        ref.invalidate(creditAccountControllerProvider);
        ref.invalidate(creditDebtsControllerProvider);
        ref.invalidate(creditLinesControllerProvider);

        /// Refresh balance
        ref.invalidate(balanceControllerProvider);

        if (context.mounted) {
          Navigator.pop(context);

          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(t.translate('repay_successful')),
              backgroundColor: AppTheme.secondaryColor,
              behavior: SnackBarBehavior.floating,
            ),
          );
        }
      } catch (e) {
        if (context.mounted) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(e.toString()),
              backgroundColor: AppTheme.errorColor,
              behavior: SnackBarBehavior.floating,
            ),
          );
        }
      } finally {
        isLoading.value = false;
      }
    }

    return Container(
      padding: const EdgeInsets.all(AppTheme.defaultPadding),
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      child: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            /// HANDLE
            Center(
              child: Container(
                width: 40,
                height: 4,
                decoration: BoxDecoration(
                  color: Colors.grey.shade300,
                  borderRadius: BorderRadius.circular(2),
                ),
              ),
            ),

            const SizedBox(height: 20),

            /// TITLE
            Center(
              child: Text(t.translate('repay_debt'), style: AppTheme.heading3),
            ),
            /// BALANCE CARD
            balanceState.when(
              loading: () => const SizedBox(),
              error: (_, __) => const SizedBox(),
              data: (data) => Container(
                padding: const EdgeInsets.all(14),
                decoration: BoxDecoration(
                  color: AppTheme.secondaryColor.withValues(alpha: 0.05),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      t.translate('available_balance'),
                      style: AppTheme.body2,
                    ),
                    Text(
                      currencyFormat.format(data.balance.balance),
                      style: AppTheme.body1.copyWith(
                        fontWeight: FontWeight.bold,
                        color: AppTheme.secondaryColor,
                      ),
                    ),
                  ],
                ),
              ),
            ),

            /// LOW BALANCE WARNING
            if (hasNoBalance)
              Container(
                margin: const EdgeInsets.only(top: 12),
                padding: const EdgeInsets.all(14),
                decoration: BoxDecoration(
                  color: AppTheme.errorColor.withValues(alpha: 0.06),
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(
                    color: AppTheme.errorColor.withValues(alpha: 0.25),
                  ),
                ),
                child: Row(
                  children: [
                    Icon(
                      Icons.account_balance_wallet_outlined,
                      color: AppTheme.errorColor,
                      size: 22,
                    ),
                    const SizedBox(width: 12),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            t.translate('insufficient_balance'),
                            style: AppTheme.body2.copyWith(
                              fontWeight: FontWeight.w600,
                              color: AppTheme.errorColor,
                            ),
                          ),
                          const SizedBox(height: 4),
                          GestureDetector(
                            onTap: () {
                              Navigator.pop(context);
                              // context.push(RouteNames.addFunds);
                            },
                            child: Text(
                              t.translate('add_funds'),
                              style: AppTheme.body2.copyWith(
                                color: AppTheme.primaryColor,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Icon(
                      Icons.arrow_forward_ios,
                      size: 14,
                      color: AppTheme.primaryColor,
                    ),
                  ],
                ),
              ),

            const SizedBox(height: 20),

            /// AMOUNT FIELD
            Form(
              key: formKey,
              child: Column(
                children: [
                  TumiaxTextField(
                    controller: amountController,
                    label: t.translate('repayment_amount'),
                    hint: t.translate('enter_amount'),
                    prefixIcon: Icons.attach_money,
                    keyboardType: TextInputType.number,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return t.translate('enter_amount');
                      }

                      final amount = double.tryParse(value);

                      if (amount == null || amount <= 0) {
                        return t.translate('enter_valid_amount');
                      }

                      if (insufficientBalance(amount)) {
                        return t.translate('insufficient_balance');
                      }

                      return null;
                    },
                  ),

                ],
              ),
            ),

            const SizedBox(height: 24),

            /// REPAY BUTTON
            TumiaxButton(
              text: t.translate('repay_now'),
              onPressed: hasNoBalance ? null : () => _submit(),
              isLoading: isLoading.value,
            ),

            const SizedBox(height: 8),
          ],
        ),
      ),
    );
  }
}


// // repay_bottom_sheet.dart

// import 'package:flutter/material.dart';
// import 'package:flutter_hooks/flutter_hooks.dart';
// import 'package:hooks_riverpod/hooks_riverpod.dart';
// import 'package:intl/intl.dart';

// import '../../../../core/localization/app_localizations.dart';
// import '../../../../core/themes/app_theme.dart';
// import '../../../../core/widgets/tumiax_button.dart';
// import '../../../../core/widgets/tumiax_text_field.dart';
// import '../controllers/credit_account_controller.dart';
// import '../controllers/credit_debts_controller.dart';
// import '../../../wallet/presentation/controllers/balance_controller.dart';
// import '../controllers/credit_actions_controller.dart';
// import '../../data/models/credit_transaction_model.dart';
// import '../controllers/credit_lines_controller.dart';

// class RepayBottomSheet extends HookConsumerWidget {
//   final CreditTransactionModel debt;

//   const RepayBottomSheet({super.key, required this.debt});

//   @override
//   Widget build(BuildContext context, WidgetRef ref) {
//     final t = AppLocalizations.of(context);

//     final currencyFormat = NumberFormat.currency(
//       locale: 'en_TZ',
//       symbol: 'TZS ',
//       decimalDigits: 0,
//     );

//     final amountController = useTextEditingController();
//     final isLoading = useState(false);
//     final formKey = useMemoized(() => GlobalKey<FormState>());

//     final actionsController = ref.read(creditActionsControllerProvider);

//     final balanceState = ref.watch(balanceControllerProvider);

//     /// SAFE BALANCE EXTRACTION
//     final double currentBalance = balanceState.maybeWhen(
//       data: (data) => data.balance.balance,
//       orElse: () => 0.0,
//     );

//     /// FIXED: bool variable, NOT function
//     final bool hasNoBalance = balanceState.hasValue && currentBalance <= 0;

//     bool insufficientBalance(double amount) {
//       return currentBalance < amount;
//     }

//     Future<void> _submit() async {
//       if (!formKey.currentState!.validate()) return;

//       final enteredAmount = double.parse(amountController.text);

//       if (insufficientBalance(enteredAmount)) {
//         ScaffoldMessenger.of(context).showSnackBar(
//           SnackBar(
//             content: Text(t.translate('insufficient_balance')),
//             backgroundColor: AppTheme.errorColor,
//             behavior: SnackBarBehavior.floating,
//           ),
//         );
//         return;
//       }

//       isLoading.value = true;

//       try {
//         await actionsController.repay(amount: enteredAmount);
//           /// Refresh credit data
//           ref.invalidate(creditAccountControllerProvider);
//           ref.invalidate(creditDebtsControllerProvider);
//           ref.invalidate(creditLinesControllerProvider);
//           /// Refresh balance
//           ref.invalidate(balanceControllerProvider);

//         if (context.mounted) {
//           Navigator.pop(context);

//           ScaffoldMessenger.of(context).showSnackBar(
//             SnackBar(
//               content: Text(t.translate('repay_successful')),
//               backgroundColor: AppTheme.secondaryColor,
//               behavior: SnackBarBehavior.floating,
//             ),
//           );
//         }
//       } catch (e) {
//         if (context.mounted) {
//           ScaffoldMessenger.of(context).showSnackBar(
//             SnackBar(
//               content: Text(e.toString()),
//               backgroundColor: AppTheme.errorColor,
//               behavior: SnackBarBehavior.floating,
//             ),
//           );
//         }
//       } finally {
//         isLoading.value = false;
//       }
//     }

//     return Container(
//       padding: const EdgeInsets.all(AppTheme.defaultPadding),
//       decoration: const BoxDecoration(
//         color: Colors.white,
//         borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
//       ),
//       child: SingleChildScrollView(
//         child: Column(
//           mainAxisSize: MainAxisSize.min,
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             /// HANDLE
//             Center(
//               child: Container(
//                 width: 40,
//                 height: 4,
//                 decoration: BoxDecoration(
//                   color: Colors.grey.shade300,
//                   borderRadius: BorderRadius.circular(2),
//                 ),
//               ),
//             ),

//             const SizedBox(height: 20),

//             /// TITLE
//             Center(
//               child: Text(t.translate('repay_debt'), style: AppTheme.heading3),
//             ),

//             const SizedBox(height: 20),

//             /// BALANCE CARD
//             balanceState.when(
//               loading: () => const SizedBox(),

//               error: (_, __) => const SizedBox(),

//               data: (data) => Container(
//                 padding: const EdgeInsets.all(14),
//                 decoration: BoxDecoration(
//                   color: AppTheme.primaryColor.withValues(alpha: 0.05),
//                   borderRadius: BorderRadius.circular(12),
//                 ),
//                 child: Row(
//                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                   children: [
//                     Text(
//                       t.translate('available_balance'),
//                       style: AppTheme.body2,
//                     ),

//                     Text(
//                       currencyFormat.format(data.balance.balance),
//                       style: AppTheme.body1.copyWith(
//                         fontWeight: FontWeight.bold,
//                         color: AppTheme.primaryColor,
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//             ),

//             /// LOW BALANCE WARNING
//             if (hasNoBalance)
//               Container(
//                 margin: const EdgeInsets.only(top: 12),
//                 padding: const EdgeInsets.all(14),
//                 decoration: BoxDecoration(
//                   color: AppTheme.errorColor.withValues(alpha: 0.06),
//                   borderRadius: BorderRadius.circular(12),
//                   border: Border.all(
//                     color: AppTheme.errorColor.withValues(alpha: 0.25),
//                   ),
//                 ),
//                 child: Row(
//                   children: [
//                     Icon(
//                       Icons.account_balance_wallet_outlined,
//                       color: AppTheme.errorColor,
//                       size: 22,
//                     ),

//                     const SizedBox(width: 12),

//                     Expanded(
//                       child: Column(
//                         crossAxisAlignment: CrossAxisAlignment.start,
//                         children: [
//                           Text(
//                             t.translate('insufficient_balance'),
//                             style: AppTheme.body2.copyWith(
//                               fontWeight: FontWeight.w600,
//                               color: AppTheme.errorColor,
//                             ),
//                           ),

//                           const SizedBox(height: 4),

//                           GestureDetector(
//                             onTap: () {
//                               Navigator.pop(context);

//                               // context.push(RouteNames.addFunds);
//                             },
//                             child: Text(
//                               t.translate('add_funds'),
//                               style: AppTheme.body2.copyWith(
//                                 color: AppTheme.primaryColor,
//                                 fontWeight: FontWeight.bold,
//                               ),
//                             ),
//                           ),
//                         ],
//                       ),
//                     ),

//                     Icon(
//                       Icons.arrow_forward_ios,
//                       size: 14,
//                       color: AppTheme.primaryColor,
//                     ),
//                   ],
//                 ),
//               ),

//             const SizedBox(height: 20),

//             /// AMOUNT FIELD
//             Form(
//               key: formKey,
//               child: TumiaxTextField(
//                 controller: amountController,
//                 label: t.translate('repayment_amount'),
//                 hint: t.translate('enter_amount'),
//                 prefixIcon: Icons.attach_money,
//                 keyboardType: TextInputType.number,
//                 validator: (value) {
//                   if (value == null || value.isEmpty) {
//                     return t.translate('enter_amount');
//                   }

//                   final amount = double.tryParse(value);

//                   if (amount == null || amount <= 0) {
//                     return t.translate('enter_valid_amount');
//                   }

//                   if (insufficientBalance(amount)) {
//                     return t.translate('insufficient_balance');
//                   }

//                   return null;
//                 },
//               ),
//             ),

//             const SizedBox(height: 24),

//             /// REPAY BUTTON
//             TumiaxButton(
//               text: t.translate('repay_now'),

//               onPressed: hasNoBalance ? null : () => _submit(),

//               isLoading: isLoading.value,
//             ),

//             const SizedBox(height: 8),
//           ],
//         ),
//       ),
//     );
//   }
// }
