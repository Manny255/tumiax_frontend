import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../../core/localization/app_localizations.dart';
import '../../../../core/themes/app_theme.dart';
import '../../../../core/widgets/tumiax_button.dart';
import '../../../../core/widgets/tumiax_text_field.dart';
import '../../providers/payout_providers.dart';

class AddPayoutMethodPage extends HookConsumerWidget {
  const AddPayoutMethodPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final t = AppLocalizations.of(context);
    final controller = ref.read(payoutControllerProvider.notifier);

    final formKey = useMemoized(() => GlobalKey<FormState>());
    final isSubmitting = useState(false);
    final methodType = useState('Mo');

    /// =============================
    /// CONTROLLERS
    /// =============================

    final bankNameController = useTextEditingController();
    final accountNumberController = useTextEditingController();
    final accountHolderController = useTextEditingController();
    final swiftCodeController = useTextEditingController();
    final routingNumberController = useTextEditingController();
    final ibanController = useTextEditingController();
    final accountCurrencyController = useTextEditingController(text: 'TZS');

    final mobileProviderController = useTextEditingController();
    final mobileNumberController = useTextEditingController();
    final mobileNameController = useTextEditingController();

    /// =============================
    /// ERROR LISTENER
    /// =============================

    ref.listen(payoutControllerProvider, (previous, next) {
      next.whenOrNull(
        error: (e, _) {
          isSubmitting.value = false;
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text(e.toString()), backgroundColor: Colors.red),
          );
        },
      );
    });

    /// =============================
    /// SUBMIT
    /// =============================

    Future<void> submit() async {
      FocusScope.of(context).unfocus();

      if (!formKey.currentState!.validate()) return;

      isSubmitting.value = true;

      Map<String, dynamic> data;

      if (methodType.value == 'BT') {
        data = {
          "method": "BT",
          "bank_name": bankNameController.text.trim(),
          "account_number": accountNumberController.text.trim(),
          "account_holder": accountHolderController.text.trim(),
          "swift_code": swiftCodeController.text.trim(),
          "routing_number": routingNumberController.text.trim(),
          "iban": ibanController.text.trim(),
          "currency": accountCurrencyController.text.trim(),
        };
      } else {
        data = {
          "method": "Mo",
          "mobile_wallet_provider": mobileProviderController.text.trim(),
          "mobile_wallet_number": mobileNumberController.text.trim(),
          "mobile_wallet_name": mobileNameController.text.trim(),
        };
      }

      await controller.create(data);

      isSubmitting.value = false;

      if (context.mounted) {
        Navigator.pop(context);

        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(t.translate('payout_method_added')),
            backgroundColor: AppTheme.secondaryColor,
          ),
        );
      }
    }

    /// =============================
    /// UI
    /// =============================

    return Scaffold(
      appBar: AppBar(
        title: Text(
          t.translate('add_payout_method'),
          style: AppTheme.heading3.copyWith(color: AppTheme.primaryColor),
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios, color: AppTheme.primaryColor),
          onPressed: () => context.pop(),
        ),
      ),
      body: Stack(
        children: [
          SafeArea(
            child: Form(
              key: formKey,
              child: SingleChildScrollView(
                padding: const EdgeInsets.all(AppTheme.defaultPadding),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _buildMethodTypeSelector(methodType, t),
                    const SizedBox(height: 24),

                    if (methodType.value == 'BT')
                      _buildBankTransferForm(
                        t,
                        bankNameController,
                        accountNumberController,
                        accountHolderController,
                        accountCurrencyController,
                      )
                    else
                      _buildMobileWalletForm(
                        t,
                        mobileProviderController,
                        mobileNumberController,
                        mobileNameController,
                      ),

                    const SizedBox(height: 40),

                    TumiaxButton(
                      text: t.translate('submit'),
                      onPressed: submit,
                      isLoading: isSubmitting.value,
                    ),
                  ],
                ),
              ),
            ),
          ),

          /// Loading Overlay
          if (isSubmitting.value)
            Container(color: Colors.black.withValues(alpha: 0.1)),
        ],
      ),
    );
  }

  /// =============================
  /// METHOD SELECTOR
  /// =============================

Widget _buildMethodTypeSelector(
    ValueNotifier<String> type,
    AppLocalizations t,
  ) {
    return Container(
      padding: const EdgeInsets.all(4),
      decoration: BoxDecoration(
        color: Colors.grey.shade100,
        borderRadius: BorderRadius.circular(30),
      ),
      child: Row(
        children: [
          Expanded(
            child: _buildTypeOption(
              label: t.translate('mobile_wallet'),
              icon: Icons.phone_android,
              selected: type.value == 'Mo',
              onSelected: () => type.value = 'Mo',
            ),
          ),
          Expanded(
            child: _buildTypeOption(
              label: t.translate('bank_transfer'),
              icon: Icons.account_balance,
              selected: type.value == 'BT',
              onSelected: () => type.value = 'BT',
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTypeOption({
    required String label,
    required IconData icon,
    required bool selected,
    required VoidCallback onSelected,
  }) {
    return GestureDetector(
      onTap: onSelected,
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 12),
        decoration: BoxDecoration(
          color: selected ? AppTheme.primaryColor : Colors.transparent,
          borderRadius: BorderRadius.circular(30),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, size: 18, color: selected ? Colors.white : Colors.grey),
            const SizedBox(width: 8),
            Text(
              label,
              style: AppTheme.body2.copyWith(
                color: selected ? Colors.white : Colors.grey,
                fontWeight: selected ? FontWeight.w600 : FontWeight.normal,
              ),
            ),
          ],
        ),
      ),
    );
  }

  /// =============================
  /// FORMS
  /// =============================

  Widget _buildBankTransferForm(
    AppLocalizations t,
    TextEditingController bank,
    TextEditingController number,
    TextEditingController holder,
    TextEditingController currency,
  ) {
    return Column(
      children: [
        TumiaxTextField(
          controller: bank,
          label: t.translate('bank_name'),
          validator: (v) => v!.isEmpty ? t.translate('required') : null,
        ),
        const SizedBox(height: 12),
        TumiaxTextField(
          controller: number,
          label: t.translate('account_number'),
          keyboardType: TextInputType.number,
          validator: (v) => v!.isEmpty ? t.translate('required') : null,
        ),
        const SizedBox(height: 12),
        TumiaxTextField(
          controller: holder,
          label: t.translate('account_holder'),
          validator: (v) => v!.isEmpty ? t.translate('required') : null,
        ),
        const SizedBox(height: 12),
        TumiaxTextField(controller: currency, label: t.translate('currency')),
      ],
    );
  }

  Widget _buildMobileWalletForm(
    AppLocalizations t,
    TextEditingController provider,
    TextEditingController number,
    TextEditingController name,
  ) {
    return Column(
      children: [
        TumiaxTextField(
          controller: provider,
          label: t.translate('mobile_wallet_provider'),
          validator: (v) => v!.isEmpty ? t.translate('required') : null,
        ),
        const SizedBox(height: 12),
        TumiaxTextField(
          controller: number,
          label: t.translate('mobile_wallet_number'),
          keyboardType: TextInputType.phone,
          validator: (v) => v!.isEmpty ? t.translate('required') : null,
        ),
        const SizedBox(height: 12),
        TumiaxTextField(
          controller: name,
          label: t.translate('account_name'),
          validator: (v) => v!.isEmpty ? t.translate('required') : null,
        ),
      ],
    );
  }
}



// import 'package:flutter/material.dart';
// import 'package:flutter_hooks/flutter_hooks.dart';
// import 'package:hooks_riverpod/hooks_riverpod.dart';

// import '../../../../core/localization/app_localizations.dart';
// import '../../../../core/themes/app_theme.dart';
// import '../../../../core/widgets/tumiax_button.dart';
// import '../../../../core/widgets/tumiax_text_field.dart';

// class AddPayoutMethodBottomSheet extends HookConsumerWidget {
//   const AddPayoutMethodBottomSheet({super.key});

//   @override
//   Widget build(BuildContext context, WidgetRef ref) {
//     final t = AppLocalizations.of(context);
//     final methodType = useState(
//       'Mo',
//     ); // 'Mo' for Mobile Wallet, 'BT' for Bank Transfer

//     // Bank Transfer controllers
//     final bankNameController = useTextEditingController();
//     final accountNumberController = useTextEditingController();
//     final accountHolderController = useTextEditingController();
//     final swiftCodeController = useTextEditingController();
//     final routingNumberController = useTextEditingController();
//     final ibanController = useTextEditingController();
//     final accountCurrencyController = useTextEditingController(text: 'TZS');

//     // Mobile Wallet controllers
//     final mobileProviderController = useTextEditingController();
//     final mobileNumberController = useTextEditingController();
//     final mobileNameController = useTextEditingController();

//     return Container(
//       padding: const EdgeInsets.all(AppTheme.defaultPadding),
//       decoration: const BoxDecoration(
//         color: Colors.white,
//         borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
//       ),
//       child: Column(
//         mainAxisSize: MainAxisSize.min,
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           // Handle
//           Center(
//             child: Container(
//               width: 40,
//               height: 4,
//               decoration: BoxDecoration(
//                 color: Colors.grey.shade300,
//                 borderRadius: BorderRadius.circular(2),
//               ),
//             ),
//           ),

//           const SizedBox(height: 20),

//           // Title
//           Text(t.translate('add_payout_method'), style: AppTheme.heading3),

//           const SizedBox(height: 16),

//           // Method Type Selector
//           _buildMethodTypeSelector(methodType, t),

//           const SizedBox(height: 24),

//           // Form based on selected type
//           if (methodType.value == 'BT')
//             _buildBankTransferForm(
//               t,
//               bankNameController,
//               accountNumberController,
//               accountHolderController,
//               swiftCodeController,
//               routingNumberController,
//               ibanController,
//               accountCurrencyController,
//             )
//           else
//             _buildMobileWalletForm(
//               t,
//               mobileProviderController,
//               mobileNumberController,
//               mobileNameController,
//             ),

//           const SizedBox(height: 24),

//           // Info about activation delay
//           Container(
//             padding: const EdgeInsets.all(12),
//             decoration: BoxDecoration(
//               color: Colors.blue.shade50,
//               borderRadius: BorderRadius.circular(8),
//             ),
//             child: Row(
//               children: [
//                 Icon(Icons.info_outline, color: Colors.blue.shade700, size: 20),
//                 const SizedBox(width: 12),
//                 Expanded(
//                   child: Text(
//                     t.translate('new_payout_method_activation_info'),
//                     style: AppTheme.caption.copyWith(
//                       color: Colors.blue.shade700,
//                     ),
//                   ),
//                 ),
//               ],
//             ),
//           ),

//           const SizedBox(height: 24),

//           // Submit Button
//           TumiaxButton(
//             text: t.translate('submit'),
//             onPressed: () {
//               // TODO: Submit payout method
//               Navigator.pop(context);
//               ScaffoldMessenger.of(context).showSnackBar(
//                 SnackBar(
//                   content: Text(t.translate('payout_method_added')),
//                   backgroundColor: AppTheme.secondaryColor,
//                 ),
//               );
//             },
//           ),

//           const SizedBox(height: 8),
//         ],
//       ),
//     );
//   }

//   Widget _buildMethodTypeSelector(
//     ValueNotifier<String> type,
//     AppLocalizations t,
//   ) {
//     return Container(
//       padding: const EdgeInsets.all(4),
//       decoration: BoxDecoration(
//         color: Colors.grey.shade100,
//         borderRadius: BorderRadius.circular(30),
//       ),
//       child: Row(
//         children: [
//           Expanded(
//             child: _buildTypeOption(
//               label: t.translate('mobile_wallet'),
//               icon: Icons.phone_android,
//               isSelected: type.value == 'Mo',
//               onTap: () => type.value = 'Mo',
//             ),
//           ),
//           Expanded(
//             child: _buildTypeOption(
//               label: t.translate('bank_transfer'),
//               icon: Icons.account_balance,
//               isSelected: type.value == 'BT',
//               onTap: () => type.value = 'BT',
//             ),
//           ),
//         ],
//       ),
//     );
//   }

//   Widget _buildTypeOption({
//     required String label,
//     required IconData icon,
//     required bool isSelected,
//     required VoidCallback onTap,
//   }) {
//     return GestureDetector(
//       onTap: onTap,
//       child: Container(
//         padding: const EdgeInsets.symmetric(vertical: 12),
//         decoration: BoxDecoration(
//           color: isSelected ? AppTheme.primaryColor : Colors.transparent,
//           borderRadius: BorderRadius.circular(30),
//         ),
//         child: Row(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             Icon(
//               icon,
//               size: 18,
//               color: isSelected ? Colors.white : Colors.grey,
//             ),
//             const SizedBox(width: 8),
//             Text(
//               label,
//               style: AppTheme.body2.copyWith(
//                 color: isSelected ? Colors.white : Colors.grey,
//                 fontWeight: isSelected ? FontWeight.w600 : FontWeight.normal,
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }

//   Widget _buildBankTransferForm(
//     AppLocalizations t,
//     TextEditingController bankNameController,
//     TextEditingController accountNumberController,
//     TextEditingController accountHolderController,
//     TextEditingController swiftCodeController,
//     TextEditingController routingNumberController,
//     TextEditingController ibanController,
//     TextEditingController accountCurrencyController,
//   ) {
//     return Column(
//       children: [
//         TumiaxTextField(
//           controller: bankNameController,
//           label: t.translate('bank_name'),
//           hint: t.translate('enter_bank_name'),
//           prefixIcon: Icons.account_balance,
//         ),
//         const SizedBox(height: 12),
//         TumiaxTextField(
//           controller: accountNumberController,
//           label: t.translate('account_number'),
//           hint: t.translate('enter_account_number'),
//           prefixIcon: Icons.numbers,
//           keyboardType: TextInputType.number,
//         ),
//         const SizedBox(height: 12),
//         TumiaxTextField(
//           controller: accountHolderController,
//           label: t.translate('account_holder'),
//           hint: t.translate('enter_account_holder'),
//           prefixIcon: Icons.person_outline,
//         ),
//         const SizedBox(height: 12),
//         Row(
//           children: [
//             Expanded(
//               child: TumiaxTextField(
//                 controller: accountCurrencyController,
//                 label: t.translate('currency'),
//                 hint: 'TZS',
//                 prefixIcon: Icons.attach_money,
//               ),
//             ),
//             const SizedBox(width: 12),
//             Expanded(
//               child: TumiaxTextField(
//                 controller: swiftCodeController,
//                 label: t.translate('swift_code'),
//                 hint: 'SWIFT/BIC',
//                 prefixIcon: Icons.code,
//               ),
//             ),
//           ],
//         ),
//         const SizedBox(height: 12),
//         TumiaxTextField(
//           controller: routingNumberController,
//           label: t.translate('routing_number'),
//           hint: t.translate('enter_routing_number'),
//           prefixIcon: Icons.route,
//         ),
//         const SizedBox(height: 12),
//         TumiaxTextField(
//           controller: ibanController,
//           label: t.translate('iban'),
//           hint: t.translate('enter_iban_optional'),
//           prefixIcon: Icons.numbers,
//         ),
//       ],
//     );
//   }

//   Widget _buildMobileWalletForm(
//     AppLocalizations t,
//     TextEditingController providerController,
//     TextEditingController numberController,
//     TextEditingController nameController,
//   ) {
//     return Column(
//       children: [
//         TumiaxTextField(
//           controller: providerController,
//           label: t.translate('mobile_wallet_provider'),
//           hint: t.translate('enter_provider'),
//           prefixIcon: Icons.business,
//         ),
//         const SizedBox(height: 12),
//         TumiaxTextField(
//           controller: numberController,
//           label: t.translate('mobile_wallet_number'),
//           hint: t.translate('enter_phone_number'),
//           prefixIcon: Icons.phone_android,
//           keyboardType: TextInputType.phone,
//         ),
//         const SizedBox(height: 12),
//         TumiaxTextField(
//           controller: nameController,
//           label: t.translate('account_name'),
//           hint: t.translate('enter_account_name'),
//           prefixIcon: Icons.person_outline,
//         ),
//       ],
//     );
//   }
// }
