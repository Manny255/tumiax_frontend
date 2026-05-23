import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/themes/app_theme.dart';
import '../../../../core/localization/app_localizations.dart';
import '../../../../core/routing/route_names.dart';

import '../../../auth/providers/auth_providers.dart';
import '../../providers/kyc_providers.dart';
import '../../data/models/kyc_model.dart';
import '../controllers/kyc_controller.dart';
import '../controllers/kyc_draft_mapper.dart';
import '../controllers/kyc_form_controller.dart';
import '../controllers/kyc_form_keys.dart';
import '../widgets/kyc_step_indicator.dart';
import '../widgets/kyc_personal_info_step.dart';
import '../widgets/kyc_address_step.dart';
import '../widgets/kyc_employment_step.dart';
import '../widgets/kyc_id_step.dart';
import '../widgets/kyc_documents_step.dart';
import '../widgets/kyc_navigation_buttons.dart';

class KYCPage extends HookConsumerWidget {
  const KYCPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final t = AppLocalizations.of(context);
    final kycState = ref.watch(kycControllerProvider);
    final kycController = ref.read(kycControllerProvider.notifier);

    final controllers = KYCFormControllers();
    final keys = KYCFormKeys();

    const totalSteps = 5;
    final currentStep = useState(0);

    final pageController = usePageController();

   
    useEffect(() {
      kycController.loadKYCDraft();
      return null;
    }, []);


   useEffect(() {
      final draft = kycState.whenOrNull(loaded: (_, draft, _) => draft);

      if (draft != null) {
        currentStep.value = draft.currentStep;

        WidgetsBinding.instance.addPostFrameCallback((_) {
          if (pageController.hasClients) {
            pageController.jumpToPage(currentStep.value);
          }
        });

        KYCDraftMapper.populateFromDraft(draft, controllers);
      }

      return null;
    }, [kycState]);


    /// ANIMATION
    final animationController = useAnimationController(
      duration: const Duration(milliseconds: 500),
    );

    final fadeAnimation = animationController.drive(
      Tween<double>(
        begin: 0.0,
        end: 1.0,
      ).chain(CurveTween(curve: Curves.easeIn)),
    );

    useEffect(() {
      animationController.forward();
      return null;
    }, []);

    // Save draft function
    Future<void> _saveDraft() async {
      // Collect current form data
      final personalInfo = {
        'fullName': controllers.fullNameController.text,
        'phone': controllers.phoneController.text,
        'dateOfBirth': controllers.dateOfBirthController.text,
        'nationality': controllers.nationalityController.text,
      };

      final addressInfo = {
        'address': controllers.addressController.text,
        'city': controllers.cityController.text,
        'state': controllers.stateController.text,
        'postalCode': controllers.postalCodeController.text,
        'country': controllers.countryController.text,
      };

      final employmentInfo = {
        'employmentStatus': controllers.employmentStatusController.text,
        'occupation': controllers.occupationController.text,
        'employer': controllers.employerController.text,
        'annualIncome': controllers.annualIncomeController.text,
      };

      final idInfo = {
        'idType': controllers.idTypeController.text,
        'idNumber': controllers.idNumberController.text,
        'idCountry': controllers.idCountryController.text,
        'idExpiryDate': controllers.idExpiryDateController.text,
      };

      final documentPaths = [
        if (controllers.idFrontFile.value != null)
          controllers.idFrontFile.value!.path,
        if (controllers.idBackFile.value != null)
          controllers.idBackFile.value!.path,
        if (controllers.selfieFile.value != null)
          controllers.selfieFile.value!.path,
        if (controllers.proofOfAddressFile.value != null)
          controllers.proofOfAddressFile.value!.path,
      ];

      await kycController.saveCurrentStep(
        currentStep.value,
        personalInfo,
        addressInfo,
        employmentInfo,
        idInfo,
        documentPaths,
      );

      if (context.mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(t.translate('progress_saved')),
            backgroundColor: AppTheme.secondaryColor,
            duration: const Duration(seconds: 1),
            behavior: SnackBarBehavior.floating,
          ),
        );
      }
    }

   Future<void> _submitKYC() async {
      if (!context.mounted) return;

      // Validate required date fields first
      if (controllers.dateOfBirthController.text.isEmpty) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(t.translate('select_required_dates')),
            backgroundColor: AppTheme.errorColor,
            behavior: SnackBarBehavior.floating,
          ),
        );
        return;
      }

      // Check if documents are uploaded
      if (controllers.idFrontFile.value == null ||
          controllers.idBackFile.value == null ||
          controllers.selfieFile.value == null) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(t.translate('upload_required_documents')),
            backgroundColor: AppTheme.errorColor,
            behavior: SnackBarBehavior.floating,
          ),
        );
        return;
      }

      BuildContext? dialogContext;

      try {
       DateTime? idExpiryDate;

        if (controllers.idExpiryDateController.text.isNotEmpty) {
          idExpiryDate = DateTime.parse(
            controllers.idExpiryDateController.text,
          );
        }

        final dateOfBirth = DateTime.parse(
          controllers.dateOfBirthController.text,
        );

        if (!context.mounted) return;

        // Show loading dialog
        showDialog(
          context: context,
          barrierDismissible: false,
          builder: (BuildContext ctx) {
            dialogContext = ctx;
            return Center(
              child: Container(
                padding: const EdgeInsets.all(24),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const CircularProgressIndicator(),
                    const SizedBox(height: 16),
                    Text(
                      t.translate('uploading_documents'),
                      style: const TextStyle(fontSize: 16),
                    ),
                  ],
                ),
              ),
            );
          },
        );

        // Create submission data (without files)
        final submissionData = KYCSubmission(
          fullName: controllers.fullNameController.text.trim(),
          dateOfBirth: dateOfBirth,
          nationality: controllers.nationalityController.text.trim(),
          idType: controllers.idTypeController.text.trim(),
          idNumber: controllers.idNumberController.text.trim(),
          phoneNumber: controllers.phoneController.text.trim(),
          idCountry: controllers.idCountryController.text.trim(),
          idExpiryDate: idExpiryDate,
          addressLine1: controllers.addressController.text.trim(),
          addressLine2: null,
          city: controllers.cityController.text.trim(),
          state: controllers.stateController.text.trim(),
          postalCode: controllers.postalCodeController.text.trim(),
          country: controllers.countryController.text.trim(),
          employmentStatus: controllers.employmentStatusController.text.trim(),
          occupation: controllers.occupationController.text.isNotEmpty
              ? controllers.occupationController.text.trim()
              : null,
          employer: controllers.employerController.text.isNotEmpty
              ? controllers.employerController.text.trim()
              : null,
          annualIncome: controllers.annualIncomeController.text.isNotEmpty
              ? controllers.annualIncomeController.text.trim()
              : null
        );

        // Create submission with files
        final submissionWithFiles = KYCSubmissionWithFiles(
          data: submissionData,
          idFrontFile: controllers.idFrontFile.value,
          idBackFile: controllers.idBackFile.value,
          selfieFile: controllers.selfieFile.value,
          proofOfAddressFile: controllers.proofOfAddressFile.value,
        );

        // Submit using the new method
        final success = await kycController.submitKYCWithFiles(
          submissionWithFiles,
        );

        // Close dialog if still showing
      // Close dialog
        if (dialogContext != null && dialogContext!.mounted) {
          Navigator.of(dialogContext!, rootNavigator: true).pop();
        }

        if (!context.mounted) return;

        if (!success) {
          final errorMessage = ref
              .read(kycControllerProvider)
              .maybeWhen(
                error: (message) => message,
                orElse: () => t.translate('something_went_wrong'),
              );

          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(errorMessage),
              backgroundColor: AppTheme.errorColor,
              behavior: SnackBarBehavior.floating,
            ),
          );
          return;
        }
        // Force a refresh
        ref.invalidate(userProvider);
       

        // SUCCESS 
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(t.translate('kyc_submitted_success')),
            backgroundColor: AppTheme.secondaryColor,
            behavior: SnackBarBehavior.floating,
          ),
        );

        // Navigate 
        await Future.delayed(const Duration(milliseconds: 500));

        if (context.mounted) {
          context.go(RouteNames.home);
        }

        controllers.clearAll();
        kycController.resetState();

      } catch (e) {
        // Close dialog if error
        if (dialogContext != null && dialogContext!.mounted) {
          try {
            Navigator.of(dialogContext!, rootNavigator: true).pop();
          } catch (_) {}
        }

        if (context.mounted) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text('${t.translate('something_went_wrong')}: $e'),
              backgroundColor: AppTheme.errorColor,
              behavior: SnackBarBehavior.floating,
            ),
          );
        }
      }
    }

    void nextStep() async {
      // Validate current step
      bool isValid = false;

      switch (currentStep.value) {
        case 0:
          isValid = keys.personalInfoFormKey.currentState?.validate() ?? false;
          break;
        case 1:
          isValid = keys.addressFormKey.currentState?.validate() ?? false;
          break;
        case 2:
          isValid = keys.employmentFormKey.currentState?.validate() ?? false;
          break;
        case 3:
          isValid = keys.idFormKey.currentState?.validate() ?? false;
          break;
        case 4:
          isValid = keys.documentsFormKey.currentState?.validate() ?? false;
          break;
      }

      if (isValid) {
        if (currentStep.value < totalSteps - 1) {
          currentStep.value = currentStep.value + 1;
          await pageController.nextPage(
            duration: const Duration(milliseconds: 300),
            curve: Curves.easeInOut,
          );
          // Auto-save on step change
          _saveDraft();
        } else {
          // Don't await here to avoid blocking UI
          _submitKYC();
        }
      }
    }

    void previousStep() async {
      if (currentStep.value > 0) {
        currentStep.value--;
        await pageController.previousPage(
          duration: const Duration(milliseconds: 300),
          curve: Curves.easeInOut,
        );
        // Auto-save on step change
        _saveDraft();
      } else {
        if (context.canPop()) {
          context.pop();
        }
      }
    }

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        automaticallyImplyLeading: false, 
        title: Text(
          t.translate('kyc_profile'),
          style: AppTheme.heading3.copyWith(color: AppTheme.primaryColor),
        ),
        // actions: [
        //   // Save draft button
        //   IconButton(
        //     icon: const Icon(Icons.save_outlined, color: AppTheme.primaryColor),
        //     onPressed: _saveDraft,
        //     tooltip: t.translate('save'),
        //   ),
        // ],
      ),
      body: Column(
        children: [
          KYCStepIndicator(
            currentStep: currentStep.value,
            includeEmploymentStep: true, // Always true now
          ),
          Expanded(
            child: PageView(
              controller: pageController,
              physics: const NeverScrollableScrollPhysics(),
              children: [
                KYCPersonalInfoStep(
                  formKey: keys.personalInfoFormKey,
                  fullNameController: controllers.fullNameController,
                  // emailController: controllers.emailController,
                  phoneController: controllers.phoneController,
                  dateOfBirthController: controllers.dateOfBirthController,
                  fadeAnimation: fadeAnimation,
                ),
                KYCAddressStep(
                  formKey: keys.addressFormKey,
                  addressController: controllers.addressController,
                  cityController: controllers.cityController,
                  stateController: controllers.stateController,
                  postalCodeController: controllers.postalCodeController,
                  countryController: controllers.countryController,
                  fadeAnimation: fadeAnimation,
                ),
                KYCEmploymentStep(
                  formKey: keys.employmentFormKey,
                  employmentStatusController:
                      controllers.employmentStatusController,
                  occupationController: controllers.occupationController,
                  employerController: controllers.employerController,
                  annualIncomeController: controllers.annualIncomeController,
                  fadeAnimation: fadeAnimation,
                ),
                KYCIdStep(
                  formKey: keys.idFormKey,
                  idTypeController: controllers.idTypeController,
                  idNumberController: controllers.idNumberController,
                  idExpiryDateController: controllers.idExpiryDateController,
                  fadeAnimation: fadeAnimation,
                ),
                KYCDocumentsStep(
                  userId: controllers.idNumberController.text,
                  formKey: keys.documentsFormKey,
                  idFrontFile: controllers.idFrontFile,
                  idBackFile: controllers.idBackFile,
                  selfieFile: controllers.selfieFile,
                  proofOfAddressFile: controllers.proofOfAddressFile,
                  fadeAnimation: fadeAnimation,
                ),
              ],
            ),
          ),
          KYCNavigationButtons(
            currentStep: currentStep.value,
            totalSteps: totalSteps,
            onNext: nextStep,
            onBack: previousStep,
          ),
        ],
      ),
    );
  }
}
