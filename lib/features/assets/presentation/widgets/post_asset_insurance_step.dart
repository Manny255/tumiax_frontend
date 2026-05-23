import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../../core/themes/app_theme.dart';
import '../../../../core/localization/app_localizations.dart';
import '../../../../core/widgets/tumiax_button.dart';

import '../../../assets/data/models/asset_model.dart';

import '../../../../shared/document_uploader/document_uploader.dart';
import '../../../../shared/document_uploader/models/uploader_types.dart';
import '../../../insurance/presentation/controllers/insurance_form.dart';
import '../../../insurance/presentation/widgets/insurance_section.dart';

class PostAssetInsuranceStep extends HookConsumerWidget {
  final AssetModel asset;
  final GlobalKey<FormState> formKey;
  final VoidCallback onComplete;
  final VoidCallback onSkip;

  const PostAssetInsuranceStep({
    super.key,
    required this.asset,
    required this.formKey,
    required this.onComplete,
    required this.onSkip,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final t = AppLocalizations.of(context);
    final insurance = useInsuranceForm(ref);

    Future<void> submit() async {
      if (!formKey.currentState!.validate()) return;

      await insurance.submit(asset.id);

      if (context.mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(t.translate('insurance_success')),
            backgroundColor: AppTheme.secondaryColor,
          ),
        );

        onComplete();
      }
    }

    return Form(
      key: formKey,
      child: SingleChildScrollView(
        padding: const EdgeInsets.all(AppTheme.defaultPadding),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            InsuranceSection(
              assetTitle: asset.title,
              insuranceRequired:
                  asset.resolvedCategory?.requiresInsurance ?? false,
              insuranceActive: insurance.insuranceActive,
              providerController: insurance.providerController,
              policyController: insurance.policyController,
              expiryController: insurance.expiryController,
              startController: insurance.startController,
              coverageController: insurance.coverageController,
              premiumController: insurance.premiumController,
              notesController: insurance.notesController,
              premiumFrequency: insurance.premiumFrequency,
            ),

            const SizedBox(height: 24),

            DocumentUploader(
              title: t.translate('insurance_document'),
              uploaderType: UploaderType.asset,
              pickType: FilePickType.imageOrPdf,
              filesNotifier: insurance.documents,
              maxFiles: 2,
              optional: false,
            ),

            const SizedBox(height: 24),

            TextButton(
              onPressed: onSkip,
              child: Text(t.translate('skip_finish_later')),
            ),

            const SizedBox(height: 16),

            TumiaxButton(
              text: t.translate('submit_insurance'),
              onPressed: insurance.isLoading.value ? null : submit,
            ),

            const SizedBox(height: 40),
          ],
        ),
      ),
    );
  }
}

// // presentation/widgets/post_asset_insurance_step.dart

// import 'dart:io';
// import 'package:flutter/material.dart';
// import 'package:flutter_hooks/flutter_hooks.dart';
// import 'package:hooks_riverpod/hooks_riverpod.dart';

// import '../../../../core/themes/app_theme.dart';
// import '../../../../core/localization/app_localizations.dart';
// import '../../../../core/widgets/tumiax_button.dart';
// import '../../../../core/widgets/tumiax_text_field.dart';
// import '../../../assets/data/models/asset_model.dart';
// import '../../../../shared/document_uploader/document_uploader.dart';
// import '../../../../shared/document_uploader/models/uploader_types.dart';
// import '../../../insurance/data/model/create_insurance_request.dart';
// import '../../../insurance/presentation/controllers/insurance_controller.dart';
// import '../../../insurance/providers/insurance_providers.dart';

// class PostAssetInsuranceStep extends HookConsumerWidget {
//   final AssetModel asset;
//   final GlobalKey<FormState> formKey;
//   final VoidCallback onComplete;
//   final VoidCallback onSkip;

//   const PostAssetInsuranceStep({
//     super.key,
//     required this.asset,
//     required this.formKey,
//     required this.onComplete,
//     required this.onSkip,
//   });

//   @override
//   Widget build(BuildContext context, WidgetRef ref) {
//     final t = AppLocalizations.of(context);

//     final providerController = useTextEditingController();
//     final policyNumberController = useTextEditingController();
//     final expiryDateController = useTextEditingController();
//     final coverageAmountController = useTextEditingController();
//     final premiumAmountController = useTextEditingController();
//     final startDateController = useTextEditingController();
//     final notesController = useTextEditingController();

//     final selectedPremiumFrequency = useState<String?>('ANNUALLY');
//     final insuranceDocuments = useState<List<File>>([]);
//     final isLoading = useState(false);


//   showComingSoon(BuildContext context) {
//   final t = AppLocalizations.of(context);
  
//   ScaffoldMessenger.of(context).showSnackBar(
//     SnackBar(
//       content: Row(
//         children: [
//           const Icon(Icons.hourglass_empty, color: Colors.white),
//           const SizedBox(width: 12),
//           Expanded(
//             child: Text(
//               t.translate('coming_soon'),
//               style: const TextStyle(fontWeight: FontWeight.w500),
//             ),
//           ),
//         ],
//       ),
//       backgroundColor: AppTheme.primaryColor,
//       duration: const Duration(seconds: 2),
//       behavior: SnackBarBehavior.floating,
//       shape: RoundedRectangleBorder(
//         borderRadius: BorderRadius.circular(10),
//       ),
//     ),
//   );
//   }
  
//     /// Listen to insurance creation
//     ref.listen<InsuranceState>(insuranceControllerProvider, (previous, next) {
//       next.when(
//         initial: () {},
//         loading: () {},
//         created: (policy) async {
//           isLoading.value = false;

//           if (insuranceDocuments.value.isNotEmpty) {
//             final controller = ref.read(insuranceControllerProvider.notifier);

//             for (var file in insuranceDocuments.value) {
//               await controller.uploadDocument(policy.id, file);
//             }
//           }

//           if (context.mounted) {
//             ScaffoldMessenger.of(context).showSnackBar(
//               SnackBar(
//                 content: Text(t.translate('insurance_success')),
//                 backgroundColor: AppTheme.secondaryColor,
//               ),
//             );
//             onComplete();
//           }
//         },
//         loaded: (_) {},
//         documentUploaded: (_) {},
//         error: (message) {
//           isLoading.value = false;

//           if (context.mounted) {
//             ScaffoldMessenger.of(context).showSnackBar(
//               SnackBar(
//                 content: Text(message),
//                 backgroundColor: AppTheme.errorColor,
//               ),
//             );
//           }
//         },
//       );
//     });

//     Future<void> submitInsurance() async {
//       if (!formKey.currentState!.validate()) return;

//       if (insuranceDocuments.value.isEmpty) {
//         ScaffoldMessenger.of(context).showSnackBar(
//           SnackBar(
//             content: Text(t.translate('insurance_document_required')),
//             backgroundColor: AppTheme.errorColor,
//           ),
//         );
//         return;
//       }

//       isLoading.value = true;

//       try {
//         final request = CreateInsuranceRequest(
//           assetId: asset.id,
//           provider: providerController.text.trim(),
//           policyNumber: policyNumberController.text.trim(),
//           expiryDate: DateTime.parse(expiryDateController.text),
//           startDate: startDateController.text.isNotEmpty
//               ? DateTime.parse(startDateController.text)
//               : null,
//           active: true,
//           coverageAmount: coverageAmountController.text.isNotEmpty
//               ? double.parse(coverageAmountController.text.replaceAll(',', ''))
//               : null,
//           premiumAmount: premiumAmountController.text.isNotEmpty
//               ? double.parse(premiumAmountController.text.replaceAll(',', ''))
//               : null,
//           premiumFrequency: selectedPremiumFrequency.value,
//           notes: notesController.text.isNotEmpty ? notesController.text : null,
//         );

//         await ref
//             .read(insuranceControllerProvider.notifier)
//             .createInsurance(request);
//       } catch (e) {
//         isLoading.value = false;
//         ScaffoldMessenger.of(context).showSnackBar(
//           SnackBar(
//             content: Text('${t.translate('error')}: $e'),
//             backgroundColor: AppTheme.errorColor,
//           ),
//         );
//       }
//     }

//     void handleSubmit() {
//       if (!isLoading.value) {
//             submitInsurance();
//           }
//        }


//     return Padding(
//       padding: const EdgeInsets.all(AppTheme.defaultPadding),
//       child: Form(
//         key: formKey,
//         child: SingleChildScrollView(
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               /// HEADER
//               Text(
//                 t.translate('insurance_information'),
//                 style: AppTheme.heading3,
//               ),
              
//               const SizedBox(height: 8),
//             if (asset.category?.requiresInsurance == true)
//                 Container(
//                   margin: const EdgeInsets.only(top: 12),
//                   padding: const EdgeInsets.all(12),
//                   decoration: BoxDecoration(
//                     color: AppTheme.primaryColor.withOpacity(0.08),
//                     borderRadius: BorderRadius.circular(8),
//                   ),
//                   child: Row(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       const Icon(
//                         Icons.info_outline,
//                         color: AppTheme.primaryColor,
//                       ),
//                       const SizedBox(width: 8),
//                       Expanded(
//                         child: Text(
//                           t.translate(
//                             'insurance_required_for',
//                             params: {'asset': asset.title},
//                           ),
//                           style: AppTheme.caption,
//                         ),
//                       ),
//                     ],
//                   ),
//                 )
//               else
//                 Padding(
//                   padding: const EdgeInsets.only(top: 12),
//                   child: Text(
//                     t.translate(
//                       'insurance_for',
//                       params: {'asset': asset.title},
//                     ),
//                     style: AppTheme.body2.copyWith(
//                       color: Colors.grey,
//                       fontWeight: FontWeight.w500,
//                     ),
//                   ),
//                 ),

//                /// ACTION BUTTON TO GET INSURANCE - SHOW WHEN NO PROVIDER PROVIDED
//                 Container(
//                   margin: const EdgeInsets.only(bottom: 24),
//                   child: Column(
//                     children: [
//                       Text(
//                         t.translate('dont_have_insurance'),
//                         style: AppTheme.caption.copyWith(
//                           color: AppTheme.warningColor,
//                         ),
//                       ),
//                       const SizedBox(height: 8),
//                       TumiaxButton(
//                         text: t.translate('get_insurance_action'),
//                         onPressed: () {
//                           showComingSoon(context);
//                         },
//                       ),
//                     ],
//                   ),
//                 ),

//               /// PROVIDER
//               TumiaxTextField(
//                 controller: providerController,
//                 label: t.translate('insurance_provider'),
//                 prefixIcon: Icons.business,
//                 validator: (value) {
//                   if (value == null || value.isEmpty) {
//                     return t.translate('insurance_provider_required');
//                   }
//                   return null;
//                 },
//               ),

//               const SizedBox(height: 16),

//               /// POLICY NUMBER
//               TumiaxTextField(
//                 controller: policyNumberController,
//                 label: t.translate('policy_number'),
//                 prefixIcon: Icons.numbers,
//                 validator: (value) {
//                   if (value == null || value.isEmpty) {
//                     return t.translate('policy_number_required');
//                   }
//                   return null;
//                 },
//               ),

//               const SizedBox(height: 16),

//               /// EXPIRY DATE
//               TumiaxTextField(
//                 controller: expiryDateController,
//                 label: t.translate('expiry_date'),
//                 hint: 'YYYY-MM-DD',
//                 prefixIcon: Icons.calendar_today_outlined,
//                 readOnly: true,
//                 onTap: () async {
//                   final date = await showDatePicker(
//                     context: context,
//                     initialDate: DateTime.now().add(const Duration(days: 365)),
//                     firstDate: DateTime.now(),
//                     lastDate: DateTime.now().add(const Duration(days: 3650)),
//                   );
//                   if (date != null) {
//                     expiryDateController.text =
//                         '${date.year}-${date.month.toString().padLeft(2, '0')}-${date.day.toString().padLeft(2, '0')}';
//                   }
//                 },
//                 validator: (value) {
//                   if (value == null || value.isEmpty) {
//                     return t.translate('expiry_date_required');
//                   }
//                   return null;
//                 },
//               ),

//               const SizedBox(height: 16),

//               /// START DATE
//               TumiaxTextField(
//                 controller: startDateController,
//                 label: t.translate('start_date_optional'),
//                 hint: 'YYYY-MM-DD',
//                 prefixIcon: Icons.calendar_today_outlined,
//                 readOnly: true,
//                 onTap: () async {
//                   final date = await showDatePicker(
//                     context: context,
//                     initialDate: DateTime.now(),
//                     firstDate: DateTime.now().subtract(
//                       const Duration(days: 30),
//                     ),
//                     lastDate: DateTime.now(),
//                   );
//                   if (date != null) {
//                     startDateController.text =
//                         '${date.year}-${date.month.toString().padLeft(2, '0')}-${date.day.toString().padLeft(2, '0')}';
//                   }
//                 },
//               ),

//               const SizedBox(height: 16),

//               /// COVERAGE
//               TumiaxTextField(
//                 controller: coverageAmountController,
//                 label: t.translate('coverage_amount'),
//                 prefixIcon: Icons.attach_money,
//                 keyboardType: TextInputType.number,
//               ),

//               const SizedBox(height: 16),

//               /// PREMIUM
//               TumiaxTextField(
//                 controller: premiumAmountController,
//                 label: t.translate('premium_amount'),
//                 prefixIcon: Icons.payment,
//                 keyboardType: TextInputType.number,
//               ),

//               const SizedBox(height: 16),

//               /// PREMIUM FREQUENCY
//               DropdownButtonFormField<String>(
//                 initialValue: selectedPremiumFrequency.value,
//                 decoration: InputDecoration(
//                   labelText: t.translate('premium_frequency'),
//                   prefixIcon: const Icon(Icons.update),
//                   border: OutlineInputBorder(
//                     borderRadius: BorderRadius.circular(12),
//                   ),
//                 ),
//                 items: [
//                   DropdownMenuItem(
//                     value: 'ANNUALLY',
//                     child: Text(t.translate('annually')),
//                   ),
//                   DropdownMenuItem(
//                     value: 'MONTHLY',
//                     child: Text(t.translate('monthly')),
//                   ),
//                   DropdownMenuItem(
//                     value: 'QUARTERLY',
//                     child: Text(t.translate('quarterly')),
//                   ),
//                 ],
//                 onChanged: (value) {
//                   selectedPremiumFrequency.value = value;
//                 },
//               ),

//               const SizedBox(height: 16),

//               /// NOTES
//               TumiaxTextField(
//                 controller: notesController,
//                 label: t.translate('notes_optional'),
//                 prefixIcon: Icons.note_outlined,
//                 maxLines: 3,
//               ),

//               const SizedBox(height: 24),

//               /// DOCUMENT UPLOAD
//               DocumentUploader(
//                 title: t.translate('insurance_document'),
//                 uploaderType: UploaderType.asset,
//                 pickType: FilePickType.imageOrPdf,
//                 filesNotifier: insuranceDocuments,
//                 maxFiles: 2,
//                 optional: false,
//                 // documentType: 'INSURANCE',
//               ),

//               const SizedBox(height: 16),

//               Center(
//                 child: TextButton(
//                   onPressed: isLoading.value ? null : onSkip,
//                   child: Text(t.translate('skip_finish_later')),
//                 ),
//               ),

//               const SizedBox(height: 32),

//               TumiaxButton(
//                 text: isLoading.value
//                     ? t.translate('submitting')
//                     : t.translate('submit_insurance'),
//                 onPressed: handleSubmit,
//               ),

//               const SizedBox(height: 16),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }

