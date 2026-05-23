// import 'package:flutter/material.dart';
// import 'package:flutter_hooks/flutter_hooks.dart';
// import '../../../../core/themes/app_theme.dart';
// import '../../../../core/localization/app_localizations.dart';
// import '../../../../core/widgets/tumiax_text_field.dart';

// class InsuranceSection extends HookWidget {
//   final bool insuranceRequired;
//   final ValueNotifier<bool> insuranceActive;

//   final TextEditingController providerController;
//   final TextEditingController policyController;
//   final TextEditingController expiryController;
//   final TextEditingController startController;
//   final TextEditingController coverageController;
//   final TextEditingController premiumController;
//   final TextEditingController notesController;

//   final ValueNotifier<String?> premiumFrequency;

//   const InsuranceSection({
//     super.key,
//     required this.insuranceRequired,
//     required this.insuranceActive,
//     required this.providerController,
//     required this.policyController,
//     required this.expiryController,
//     required this.startController,
//     required this.coverageController,
//     required this.premiumController,
//     required this.notesController,
//     required this.premiumFrequency,
//   });

//   @override
//   Widget build(BuildContext context) {
//     final t = AppLocalizations.of(context);

//     return ValueListenableBuilder(
//       valueListenable: insuranceActive,
//       builder: (context, active, _) {
//         /// Auto-enable if required
//         if (insuranceRequired && !active) {
//           WidgetsBinding.instance.addPostFrameCallback((_) {
//             insuranceActive.value = true;
//           });
//         }

//         return Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             _InsuranceHeader(
//               active: active,
//               requiredInsurance: insuranceRequired,
//               onToggle: (v) => insuranceActive.value = v,
//             ),

//             if (active) ...[
//               const SizedBox(height: 16),

//               /// PROVIDER
//               TumiaxTextField(
//                 controller: providerController,
//                 label: t.translate("insurance_provider"),
//                 prefixIcon: Icons.business_outlined,
//                 validator: (v) {
//                   if (v == null || v.isEmpty) {
//                     return t.translate("insurance_provider_required");
//                   }
//                   return null;
//                 },
//               ),

//               const SizedBox(height: 16),

//               /// POLICY
//               TumiaxTextField(
//                 controller: policyController,
//                 label: t.translate("policy_number"),
//                 prefixIcon: Icons.numbers_outlined,
//                 validator: (v) {
//                   if (v == null || v.isEmpty) {
//                     return t.translate("policy_number_required");
//                   }
//                   return null;
//                 },
//               ),

//               const SizedBox(height: 16),

//               /// EXPIRY DATE
//               _DateField(
//                 controller: expiryController,
//                 label: t.translate("expiry_date"),
//                 futureOnly: true,
//               ),

//               const SizedBox(height: 16),

//               /// START DATE
//               _DateField(
//                 controller: startController,
//                 label: t.translate("start_date_optional"),
//                 pastAllowed: true,
//               ),

//               const SizedBox(height: 16),

//               /// COVERAGE
//               TumiaxTextField(
//                 controller: coverageController,
//                 label: t.translate("coverage_amount"),
//                 prefixIcon: Icons.attach_money,
//                 keyboardType: TextInputType.number,
//               ),

//               const SizedBox(height: 16),

//               /// PREMIUM
//               TumiaxTextField(
//                 controller: premiumController,
//                 label: t.translate("premium_amount"),
//                 prefixIcon: Icons.payment,
//                 keyboardType: TextInputType.number,
//               ),

//               const SizedBox(height: 16),

//               /// PREMIUM FREQUENCY
//               _PremiumFrequencyDropdown(premiumFrequency: premiumFrequency),

//               const SizedBox(height: 16),

//               /// NOTES
//               TumiaxTextField(
//                 controller: notesController,
//                 label: t.translate("notes_optional"),
//                 prefixIcon: Icons.note_outlined,
//                 maxLines: 3,
//               ),
//             ],
//           ],
//         );
//       },
//     );
//   }
// }

// class _InsuranceHeader extends StatelessWidget {
//   final bool active;
//   final bool requiredInsurance;
//   final ValueChanged<bool> onToggle;

//   const _InsuranceHeader({
//     required this.active,
//     required this.requiredInsurance,
//     required this.onToggle,
//   });

//   @override
//   Widget build(BuildContext context) {
//     final t = AppLocalizations.of(context);

//     return Container(
//       padding: const EdgeInsets.all(12),
//       decoration: BoxDecoration(
//         color: AppTheme.textLight,
//         borderRadius: BorderRadius.circular(12),
//         border: Border.all(
//           color: requiredInsurance
//               ? AppTheme.secondaryColor.withValues(alpha: 0.3)
//               : AppTheme.primaryDeepBlue,
//         ),
//       ),
//       child: Row(
//         children: [
//           Icon(
//             Icons.security,
//             color: active ? AppTheme.secondaryColor : AppTheme.textSecondary,
//           ),
//           const SizedBox(width: 12),

//           Expanded(
//             child: Text(
//               t.translate("asset_insurance"),
//               style: AppTheme.body1.copyWith(fontWeight: FontWeight.w600),
//             ),
//           ),

//           if (!requiredInsurance)
//             Switch(
//               value: active,
//               onChanged: onToggle,
//               activeColor: AppTheme.secondaryColor,
//             )
//           else
//             const Icon(Icons.lock, color: AppTheme.secondaryColor),
//         ],
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

import '../../../../core/themes/app_theme.dart';
import '../../../../core/localization/app_localizations.dart';
import '../../../../core/widgets/tumiax_text_field.dart';
import '../../../../core/widgets/tumiax_button.dart';

class InsuranceSection extends HookWidget {
  final String? assetTitle;
  final bool insuranceRequired;
  final ValueNotifier<bool> insuranceActive;

  final TextEditingController providerController;
  final TextEditingController policyController;
  final TextEditingController expiryController;
  final TextEditingController startController;
  final TextEditingController coverageController;
  final TextEditingController premiumController;
  final TextEditingController notesController;

  final ValueNotifier<String?> premiumFrequency;

  const InsuranceSection({
    super.key,
    this.assetTitle,
    required this.insuranceRequired,
    required this.insuranceActive,
    required this.providerController,
    required this.policyController,
    required this.expiryController,
    required this.startController,
    required this.coverageController,
    required this.premiumController,
    required this.notesController,
    required this.premiumFrequency,
  });

  @override
  Widget build(BuildContext context) {
    final t = AppLocalizations.of(context);

      showComingSoon(BuildContext context) {
      final t = AppLocalizations.of(context);

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Row(
            children: [
              const Icon(Icons.hourglass_empty, color: Colors.white),
              const SizedBox(width: 12),
              Expanded(
                child: Text(
                  t.translate('coming_soon'),
                  style: const TextStyle(fontWeight: FontWeight.w500),
                ),
              ),
            ],
          ),
          backgroundColor: AppTheme.primaryColor,
          duration: const Duration(seconds: 2),
          behavior: SnackBarBehavior.floating,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ),
      );
    }

    return ValueListenableBuilder(
      valueListenable: insuranceActive,
      builder: (context, active, _) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            /// HEADER
            Text(
              t.translate('insurance_information'),
              style: AppTheme.heading3,
            ),

            const SizedBox(height: 8),

           /// ASSET INFO
            if (assetTitle != null) ...[
              const SizedBox(height: 12),

              if (insuranceRequired == true)
                Container(
                   margin: const EdgeInsets.only(top: 12),
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    color: AppTheme.primaryColor.withOpacity(0.08),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Icon(
                        Icons.info_outline,
                        color: AppTheme.primaryColor,
                      ),
                      const SizedBox(width: 8),
                      Expanded(
                        child: Text(
                          t.translate(
                            'insurance_required_for',
                            params: {'asset': assetTitle!},
                          ),
                          style: AppTheme.caption,
                        ),
                      ),
                    ],
                  ),
                )
              else
                  Padding(
                  padding: const EdgeInsets.only(top: 12),
                  child: Text(
                    t.translate(
                      'insurance_for',
                      params: {'asset': assetTitle!},
                    ),
                    style: AppTheme.body2.copyWith(
                      color: Colors.grey,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
            ],

            /// ACTION BUTTON TO GET INSURANCE - SHOW WHEN NO PROVIDER PROVIDED
            Container(
              margin: const EdgeInsets.only(bottom: 24),
              child: Column(
                children: [
                  Text(
                    t.translate('dont_have_insurance'),
                    style: AppTheme.caption.copyWith(
                      color: AppTheme.warningColor,
                    ),
                  ),
                  const SizedBox(height: 8),
                  TumiaxButton(
                    text: t.translate('get_insurance_action'),
                    onPressed: () {
                      showComingSoon(context);
                    },
                  ),
                ],
              ),
            ),
            /// FORM
            const SizedBox(height: 16),

              /// PROVIDER
              TumiaxTextField(
                controller: providerController,
                label: t.translate("insurance_provider"),
                prefixIcon: Icons.business_outlined,
                validator: (v) {
                  if (v == null || v.isEmpty) {
                    return t.translate("insurance_provider_required");
                  }
                  return null;
                },
              ),

              const SizedBox(height: 16),

              /// POLICY
              TumiaxTextField(
                controller: policyController,
                label: t.translate("policy_number"),
                prefixIcon: Icons.numbers_outlined,
                validator: (v) {
                  if (v == null || v.isEmpty) {
                    return t.translate("policy_number_required");
                  }
                  return null;
                },
              ),

              const SizedBox(height: 16),

              /// EXPIRY
              _DateField(
                controller: expiryController,
                label: t.translate("expiry_date"),
                futureOnly: true,
              ),

              const SizedBox(height: 16),

              /// START DATE
              _DateField(
                controller: startController,
                label: t.translate("start_date_optional"),
                pastAllowed: true,
              ),

              const SizedBox(height: 16),

              /// COVERAGE
              TumiaxTextField(
                controller: coverageController,
                label: t.translate("coverage_amount"),
                prefixIcon: Icons.attach_money,
                keyboardType: TextInputType.number,
              ),

              const SizedBox(height: 16),

              /// PREMIUM
              TumiaxTextField(
                controller: premiumController,
                label: t.translate("premium_amount"),
                prefixIcon: Icons.payment,
                keyboardType: TextInputType.number,
              ),

              const SizedBox(height: 16),

              /// FREQUENCY
              _PremiumFrequencyDropdown(premiumFrequency: premiumFrequency),

              const SizedBox(height: 16),

              /// NOTES
              TumiaxTextField(
                controller: notesController,
                label: t.translate("notes_optional"),
                prefixIcon: Icons.note_outlined,
                maxLines: 3,
              ),
            
          ],
        );
      },
    );
  }
}

class _DateField extends StatelessWidget {
  final TextEditingController controller;
  final String label;
  final bool futureOnly;
  final bool pastAllowed;

  const _DateField({
    required this.controller,
    required this.label,
    this.futureOnly = false,
    this.pastAllowed = false,
  });

  @override
  Widget build(BuildContext context) {
    return TumiaxTextField(
      controller: controller,
      label: label,
      prefixIcon: Icons.calendar_today_outlined,
      readOnly: true,
      onTap: () async {
        final now = DateTime.now();

        final date = await showDatePicker(
          context: context,
          initialDate: now,
          firstDate: pastAllowed
              ? now.subtract(const Duration(days: 365))
              : now,
          lastDate: futureOnly
              ? now.add(const Duration(days: 3650))
              : now.add(const Duration(days: 3650)),
        );

        if (date != null) {
          controller.text =
              "${date.year}-${date.month.toString().padLeft(2, '0')}-${date.day.toString().padLeft(2, '0')}";
        }
      },
    );
  }
}

class _PremiumFrequencyDropdown extends StatelessWidget {
  final ValueNotifier<String?> premiumFrequency;

  const _PremiumFrequencyDropdown({required this.premiumFrequency});

  @override
  Widget build(BuildContext context) {
    final t = AppLocalizations.of(context);

    return ValueListenableBuilder(
      valueListenable: premiumFrequency,
      builder: (context, value, _) {
        return DropdownButtonFormField<String>(
          initialValue: value,
          decoration: InputDecoration(
            labelText: t.translate("premium_frequency"),
            prefixIcon: const Icon(Icons.repeat_outlined),
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
          ),
          items: [
            DropdownMenuItem(
              value: "ANNUALLY",
              child: Text(t.translate("annually")),
            ),
            DropdownMenuItem(
              value: "MONTHLY",
              child: Text(t.translate("monthly")),
            ),
            DropdownMenuItem(
              value: "QUARTERLY",
              child: Text(t.translate("quarterly")),
            ),
          ],
          onChanged: (v) => premiumFrequency.value = v,
        );
      },
    );
  }
}




// import 'package:flutter/material.dart';
// import 'package:flutter_hooks/flutter_hooks.dart';
// import '../../../../core/themes/app_theme.dart';
// import '../../../../core/widgets/tumiax_text_field.dart';

// class InsuranceSection extends HookWidget {
//   final ValueNotifier<bool> insuranceActive;
//   final bool insuranceRequired;
//   final TextEditingController providerController;
//   final TextEditingController policyNumberController;
//   final TextEditingController expiryDateController;
//   final TextEditingController coverageAmountController;
//   final ValueNotifier<String?> selectedPremiumFrequency;

//   const InsuranceSection({
//     super.key,
//     required this.insuranceActive,
//     required this.insuranceRequired,
//     required this.providerController,
//     required this.policyNumberController,
//     required this.expiryDateController,
//     required this.coverageAmountController,
//     required this.selectedPremiumFrequency,
//   });

//   @override
//   Widget build(BuildContext context) {
//     final locale = Localizations.localeOf(context);

//     return ValueListenableBuilder<bool>(
//       valueListenable: insuranceActive,
//       builder: (context, active, child) {
//         // ✅ Auto-activate if required
//         if (insuranceRequired && !active) {
//           WidgetsBinding.instance.addPostFrameCallback((_) {
//             insuranceActive.value = true;
//           });
//         }

//         return Column(
//           children: [
//             // ===============================
//             // Insurance Toggle Header
//             // ===============================
//             Container(
//               padding: const EdgeInsets.all(12),
//               decoration: BoxDecoration(
//                 color: Colors.grey.shade50,
//                 borderRadius: BorderRadius.circular(12),
//                 border: Border.all(
//                   color: insuranceRequired
//                       ? AppTheme.secondaryColor.withOpacity(0.3)
//                       : Colors.grey.shade200,
//                 ),
//               ),
//               child: Row(
//                 children: [
//                   Icon(
//                     Icons.security,
//                     color: active ? AppTheme.secondaryColor : Colors.grey,
//                   ),
//                   const SizedBox(width: 12),
//                   Expanded(
//                     child: Column(
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       children: [
//                         Row(
//                           children: [
//                             Text(
//                               locale.languageCode == 'sw'
//                                   ? 'Bima ya Mali'
//                                   : 'Asset Insurance',
//                               style: AppTheme.body1.copyWith(
//                                 fontWeight: FontWeight.w600,
//                               ),
//                             ),
//                             if (insuranceRequired) ...[
//                               const SizedBox(width: 8),
//                               Container(
//                                 padding: const EdgeInsets.symmetric(
//                                   horizontal: 8,
//                                   vertical: 2,
//                                 ),
//                                 decoration: BoxDecoration(
//                                   color: AppTheme.secondaryColor,
//                                   borderRadius: BorderRadius.circular(12),
//                                 ),
//                                 child: Text(
//                                   locale.languageCode == 'sw'
//                                       ? 'Inahitajika'
//                                       : 'Required',
//                                   style: AppTheme.caption.copyWith(
//                                     color: Colors.white,
//                                     fontSize: 10,
//                                   ),
//                                 ),
//                               ),
//                             ],
//                           ],
//                         ),
//                         const SizedBox(height: 4),
//                         Text(
//                           active
//                               ? (locale.languageCode == 'sw'
//                                     ? 'Bima imewashwa'
//                                     : 'Insurance active')
//                               : (locale.languageCode == 'sw'
//                                     ? 'Bima haijawashwa'
//                                     : 'Insurance inactive'),
//                           style: AppTheme.caption.copyWith(
//                             color: active
//                                 ? AppTheme.secondaryColor
//                                 : Colors.grey,
//                           ),
//                         ),
//                       ],
//                     ),
//                   ),

//                   // ===============================
//                   // Switch OR Lock Icon
//                   // ===============================
//                   if (!insuranceRequired)
//                     Switch(
//                       value: active,
//                       onChanged: (value) => insuranceActive.value = value,
//                       activeColor: AppTheme.secondaryColor,
//                     )
//                   else
//                     const Icon(
//                       Icons.lock,
//                       color: AppTheme.secondaryColor,
//                       size: 20,
//                     ),
//                 ],
//               ),
//             ),

//             // ===============================
//             // Insurance Form Fields
//             // ===============================
//             if (active) ...[
//               const SizedBox(height: 16),

//               // Provider
//               TumiaxTextField(
//                 controller: providerController,
//                 label: locale.languageCode == 'sw'
//                     ? 'Mtoa Bima'
//                     : 'Insurance Provider',
//                 hint: locale.languageCode == 'sw'
//                     ? 'Mf: Jubilee, Sanlam'
//                     : 'E.g: Jubilee, Sanlam',
//                 prefixIcon: Icons.business_outlined,
//                 validator: (value) {
//                   if (active && (value == null || value.isEmpty)) {
//                     return locale.languageCode == 'sw'
//                         ? 'Mtoa bima inahitajika'
//                         : 'Insurance provider is required';
//                   }
//                   return null;
//                 },
//               ),

//               const SizedBox(height: 16),

//               // Policy Number
//               TumiaxTextField(
//                 controller: policyNumberController,
//                 label: locale.languageCode == 'sw'
//                     ? 'Namba ya Polisi'
//                     : 'Policy Number',
//                 hint: 'POL-12345',
//                 prefixIcon: Icons.numbers_outlined,
//                 validator: (value) {
//                   if (active && (value == null || value.isEmpty)) {
//                     return locale.languageCode == 'sw'
//                         ? 'Namba ya polisi inahitajika'
//                         : 'Policy number is required';
//                   }
//                   return null;
//                 },
//               ),

//               const SizedBox(height: 16),

//               // Expiry Date
//               TumiaxTextField(
//                 controller: expiryDateController,
//                 label: locale.languageCode == 'sw'
//                     ? 'Tarehe ya Mwisho'
//                     : 'Expiry Date',
//                 hint: 'YYYY-MM-DD',
//                 prefixIcon: Icons.calendar_today_outlined,
//                 readOnly: true,
//                 onTap: () async {
//                   final date = await showDatePicker(
//                     context: context,
//                     initialDate: DateTime.now().add(const Duration(days: 30)),
//                     firstDate: DateTime.now(),
//                     lastDate: DateTime.now().add(const Duration(days: 365 * 5)),
//                   );

//                   if (date != null) {
//                     expiryDateController.text =
//                         '${date.year}-${date.month.toString().padLeft(2, '0')}-${date.day.toString().padLeft(2, '0')}';
//                   }
//                 },
//                 validator: (value) {
//                   if (active && (value == null || value.isEmpty)) {
//                     return locale.languageCode == 'sw'
//                         ? 'Tarehe ya mwisho inahitajika'
//                         : 'Expiry date is required';
//                   }
//                   return null;
//                 },
//               ),

//               const SizedBox(height: 16),

//               // Coverage Amount
//               TumiaxTextField(
//                 controller: coverageAmountController,
//                 label: locale.languageCode == 'sw'
//                     ? 'Kiasi cha Bima (TZS)'
//                     : 'Coverage Amount (TZS)',
//                 hint: '0.00',
//                 prefixIcon: Icons.attach_money,
//                 keyboardType: TextInputType.number,
//               ),

//               const SizedBox(height: 16),

//               // Premium Frequency
//               DropdownButtonFormField<String>(
//                 value: selectedPremiumFrequency.value,
//                 decoration: InputDecoration(
//                   labelText: locale.languageCode == 'sw'
//                       ? 'Mara ya Malipo'
//                       : 'Premium Frequency',
//                   prefixIcon: const Icon(Icons.repeat_outlined),
//                   border: OutlineInputBorder(
//                     borderRadius: BorderRadius.circular(12),
//                   ),
//                   contentPadding: const EdgeInsets.symmetric(
//                     horizontal: 16,
//                     vertical: 12,
//                   ),
//                 ),
//                 items: [
//                   DropdownMenuItem(
//                     value: 'MONTHLY',
//                     child: Text(
//                       locale.languageCode == 'sw' ? 'Kila Mwezi' : 'Monthly',
//                     ),
//                   ),
//                   DropdownMenuItem(
//                     value: 'QUARTERLY',
//                     child: Text(
//                       locale.languageCode == 'sw'
//                           ? 'Kila Robo Mwaka'
//                           : 'Quarterly',
//                     ),
//                   ),
//                   DropdownMenuItem(
//                     value: 'ANNUALLY',
//                     child: Text(
//                       locale.languageCode == 'sw' ? 'Kila Mwaka' : 'Annually',
//                     ),
//                   ),
//                 ],
//                 onChanged: (value) {
//                   selectedPremiumFrequency.value = value;
//                 },
//               ),
//             ],
//           ],
//         );
//       },
//     );
//   }
// }



