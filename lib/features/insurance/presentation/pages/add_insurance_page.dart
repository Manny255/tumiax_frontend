import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/localization/app_localizations.dart';
import '../../../../core/themes/app_theme.dart';
import '../../../../core/widgets/tumiax_button.dart';

import '../../../../shared/document_uploader/document_uploader.dart';
import '../../../../shared/document_uploader/models/uploader_types.dart';
import '../controllers/insurance_form.dart';
import '../widgets/insurance_section.dart';

class AddInsurancePage extends HookConsumerWidget {
  const AddInsurancePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final t = AppLocalizations.of(context);

    final routerState = GoRouterState.of(context);
    final assetId = routerState.uri.queryParameters['assetId'];
    final assetTitle = routerState.uri.queryParameters['assetTitle'];

    final formKey = useMemoized(() => GlobalKey<FormState>());

    final insurance = useInsuranceForm(ref);

    Future<void> submit() async {
      if (!formKey.currentState!.validate()) return;

      await insurance.submit(assetId!);

      if (context.mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(t.translate('insurance_added')),
            backgroundColor: AppTheme.secondaryColor,
          ),
        );

        context.pop();
      }
    }

    return Scaffold(
      appBar: AppBar(title: Text(t.translate('add_insurance'),
          style: AppTheme.heading3.copyWith(color: AppTheme.primaryColor),
        )),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(AppTheme.defaultPadding),
        child: Form(
          key: formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              if (assetTitle != null) ...[
                Container(
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    color: Colors.grey.shade50,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Row(
                    children: [
                      const Icon(Icons.info_outline),
                      const SizedBox(width: 8),
                      Expanded(
                        child: Text(
                          '${t.translate('for_asset')}: $assetTitle',
                          style: AppTheme.body2,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 24),
              ],

              InsuranceSection(
                insuranceRequired: false,
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

              const SizedBox(height: 32),

              TumiaxButton(
                text: t.translate('submit'),
                onPressed: insurance.isLoading.value ? null : submit,
              ),
            ],
          ),
        ),
      ),
    );
  }
}


// import 'dart:io';

// import 'package:flutter/material.dart';
// import 'package:flutter_hooks/flutter_hooks.dart';
// import 'package:hooks_riverpod/hooks_riverpod.dart';
// import 'package:go_router/go_router.dart';

// import '../../../../core/localization/app_localizations.dart';
// import '../../../../core/themes/app_theme.dart';
// import '../../../../core/widgets/tumiax_button.dart';

// import '../../../../shared/document_uploader/document_uploader.dart';
// import '../../../../shared/document_uploader/models/uploader_types.dart';

// import '../../../insurance/data/model/create_insurance_request.dart';
// import '../../../insurance/presentation/controllers/insurance_controller.dart';
// import '../../../insurance/providers/insurance_providers.dart';

// import '../widgets/insurance_section.dart';

// class AddInsurancePage extends HookConsumerWidget {
//   const AddInsurancePage({super.key});

//   @override
//   Widget build(BuildContext context, WidgetRef ref) {
//     final t = AppLocalizations.of(context);

//     final state = GoRouterState.of(context);
//     final assetId = state.uri.queryParameters['assetId'];
//     final assetTitle = state.uri.queryParameters['assetTitle'];

//     /// FORM
//     final formKey = useMemoized(() => GlobalKey<FormState>());

//     /// CONTROLLERS
//     final providerController = useTextEditingController();
//     final policyController = useTextEditingController();
//     final expiryController = useTextEditingController();
//     final startController = useTextEditingController();
//     final coverageController = useTextEditingController();
//     final premiumController = useTextEditingController();
//     final notesController = useTextEditingController();

//     /// STATE
//     final insuranceActive = useState(true);
//     final premiumFrequency = useState<String?>('ANNUALLY');

//     final insuranceDocuments = useState<List<File>>([]);
//     final isLoading = useState(false);

//     /// CONTROLLER LISTENER
//     ref.listen<InsuranceState>(insuranceControllerProvider, (prev, next) {
//       next.whenOrNull(
//         created: (policy) async {
//           isLoading.value = false;

//           final controller = ref.read(insuranceControllerProvider.notifier);

//           /// Upload documents
//           for (var file in insuranceDocuments.value) {
//             await controller.uploadDocument(policy.id, file);
//           }

//           if (context.mounted) {
//             ScaffoldMessenger.of(context).showSnackBar(
//               SnackBar(
//                 content: Text(t.translate('insurance_added')),
//                 backgroundColor: AppTheme.secondaryColor,
//               ),
//             );

//             context.pop();
//           }
//         },
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

//     /// SUBMIT
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
//           assetId: assetId!,
//           provider: providerController.text.trim(),
//           policyNumber: policyController.text.trim(),
//           expiryDate: DateTime.parse(expiryController.text),
//           startDate: startController.text.isNotEmpty
//               ? DateTime.parse(startController.text)
//               : null,
//           active: insuranceActive.value,
//           coverageAmount: coverageController.text.isNotEmpty
//               ? double.parse(coverageController.text)
//               : null,
//           premiumAmount: premiumController.text.isNotEmpty
//               ? double.parse(premiumController.text)
//               : null,
//           premiumFrequency: premiumFrequency.value,
//           notes: notesController.text.isNotEmpty ? notesController.text : null,
//         );

//         await ref
//             .read(insuranceControllerProvider.notifier)
//             .createInsurance(request);
//       } catch (e) {
//         isLoading.value = false;
//       }
//     }

//     return Scaffold(
//       backgroundColor: Colors.white,
//       appBar: AppBar(
//         title: Text(t.translate('add_insurance'), style: AppTheme.heading3),
//       ),
//       body: SingleChildScrollView(
//         padding: const EdgeInsets.all(AppTheme.defaultPadding),
//         child: Form(
//           key: formKey,
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               /// ASSET INFO
//               if (assetTitle != null) ...[
//                 Container(
//                   padding: const EdgeInsets.all(12),
//                   decoration: BoxDecoration(
//                     color: AppTheme.lightSurface,
//                     borderRadius: BorderRadius.circular(8),
//                   ),
//                   child: Row(
//                     children: [
//                       const Icon(Icons.info_outline),
//                       const SizedBox(width: 8),
//                       Expanded(
//                         child: Text(
//                           '${t.translate('for_asset')}: $assetTitle',
//                           style: AppTheme.body2,
//                         ),
//                       ),
//                     ],
//                   ),
//                 ),
//                 const SizedBox(height: 24),
//               ],

//               /// REUSABLE INSURANCE FORM
//               InsuranceSection(
//                 insuranceRequired: false,
//                 insuranceActive: insuranceActive,
//                 providerController: providerController,
//                 policyController: policyController,
//                 expiryController: expiryController,
//                 startController: startController,
//                 coverageController: coverageController,
//                 premiumController: premiumController,
//                 notesController: notesController,
//                 premiumFrequency: premiumFrequency,
//               ),

//               const SizedBox(height: 24),

//               /// DOCUMENT UPLOADER
//               DocumentUploader(
//                 title: t.translate('insurance_document'),
//                 uploaderType: UploaderType.asset,
//                 pickType: FilePickType.imageOrPdf,
//                 filesNotifier: insuranceDocuments,
//                 maxFiles: 2,
//                 optional: false,
//               ),

//               const SizedBox(height: 32),

//               /// SUBMIT
//               TumiaxButton(
//                 text: isLoading.value
//                     ? t.translate('submitting')
//                     : t.translate('submit'),
//                 onPressed: isLoading.value ? null : submitInsurance,
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
