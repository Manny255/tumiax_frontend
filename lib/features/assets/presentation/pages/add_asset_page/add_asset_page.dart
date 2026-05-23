// presentation/pages/add_asset_page/add_asset_page.dart

import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../../../core/routing/route_helpers.dart';
import '../../../../../core/themes/app_theme.dart';
import '../../../../../core/localization/app_localizations.dart';
import '../../../../../core/routing/route_names.dart';
import '../../../../location/providers/location_provider.dart';
import '../../../data/models/asset_model.dart';
import '../../../data/models/create_asset_request.dart';
import '../../controllers/add_asset_controller.dart';
import '../../controllers/asset_controller.dart';
import '../../widgets/asset_step_indicator.dart';
import 'steps/basic_info_step.dart';
import 'steps/valuation_step.dart';
import 'steps/documents_step.dart';
import 'steps/location_step.dart';
import 'steps/insurance_step_wrapper.dart';
import 'widgets/navigation_buttons.dart';
import 'widgets/step_animations.dart';

class AddAssetPage extends HookConsumerWidget {
  const AddAssetPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final t = AppLocalizations.of(context);
    final controller = useAddAssetController();

    final animationController = useAnimationController(
      duration: const Duration(milliseconds: 500),
    );

    final fadeAnimation = useFadeAnimation(animationController);

    useEffect(() {
      animationController.forward();
      return null;
    }, []);

    ref.listen<AsyncValue<AssetModel?>>(
      assetCreationControllerProvider,
      (previous, next) {
        next.when(
          loading: () {},
          data: (asset) {
            controller.createdAsset.value = asset;
          },
          error: (error, stack) {
            controller.isSubmitting.value = false;
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text('${t.translate('error')}: $error'),
                backgroundColor: AppTheme.errorColor,
              ),
            );
          },
        );
      },
    );

 bool validateStep() {
      final t = AppLocalizations.of(context);

      switch (controller.currentStep.value) {
        /// STEP 0 — BASIC INFO
        case 0:
          final formValid =
              controller.basicInfoFormKey.currentState?.validate() ?? false;

          final categoryValid = controller.selectedCategory.value != null;

          if (!categoryValid) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(t.translate('category_required')),
                backgroundColor: AppTheme.errorColor,
              ),
            );
          }

          return formValid && categoryValid;

        /// STEP 1 — VALUATION
        case 1:
          return controller.valuationFormKey.currentState?.validate() ?? false;

        /// STEP 2 — DOCUMENTS (ASSET PHOTO REQUIRED)
        case 2:
          final formValid =
              controller.documentsFormKey.currentState?.validate() ?? false;

          final imagesValid = controller.images.value.isNotEmpty;

          if (!imagesValid) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(t.translate('asset_images_required')),
                backgroundColor: AppTheme.errorColor,
              ),
            );
          }

          return formValid && imagesValid;

        /// STEP 3 — LOCATION
        case 3:
          return controller.locationFormKey.currentState?.validate() ?? false;

        default:
          return true;
      }
    }

    Future<void> submitAsset() async {
      final t = AppLocalizations.of(context);

      // Validate current step form
      if (!(controller.locationFormKey.currentState?.validate() ?? false)) {
        return;
      }

      // Get GPS location state
      final locationState = ref.read(locationControllerProvider);
      final location = locationState.value;

      // Ensure GPS location was captured
      if (location == null) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(t.translate('location_required')),
            backgroundColor: AppTheme.errorColor,
          ),
        );
        return;
      }

      controller.isSubmitting.value = true;

      // Show blocking loader
      showDialog(
        context: context,
        barrierDismissible: false,
        builder: (_) => const Center(child: CircularProgressIndicator()),
      );

      try {
        // NEW: Get external encumbrance data
        final externalLenderName = controller.isExternallyEncumbered.value
            ? controller.externalLenderNameController.text.trim()
            : null;

        final externalLienAmount = controller.isExternallyEncumbered.value
            ? (controller.externalLienAmountController.text.trim().isEmpty
                  ? null
                  : double.tryParse(
                      controller.externalLienAmountController.text.replaceAll(
                        ',',
                        '',
                      ),
                    ))
            : null;

        final request = CreateAssetRequest(
          category: controller.selectedCategory.value!.id,
          title: controller.titleController.text.trim(),
          description: controller.descriptionController.text.trim(),
          purchasePrice: double.parse(
            controller.purchasePriceController.text.replaceAll(',', ''),
          ),
          purchaseDate: DateTime.parse(controller.purchaseDateController.text),
          currentMarketValue: double.parse(
            controller.currentMarketValueController.text.replaceAll(',', ''),
          ),
          condition: controller.selectedCondition.value,
          conditionScore: controller.conditionScore.value.round(),
          serialNumber: controller.serialNumberController.text.trim().isEmpty
              ? null
              : controller.serialNumberController.text.trim(),
          registrationNumber:
              controller.registrationNumberController.text.trim().isEmpty
              ? null
              : controller.registrationNumberController.text.trim(),
          vin: controller.vinController.text.trim().isEmpty
              ? null
              : controller.vinController.text.trim(),

          // LOCATION DATA
          locationAddress: controller.locationAddressController.text.trim(),
          gpsAddress: location.gpsAddress,
          latitude: location.latitude,
          longitude: location.longitude,

          isExternallyEncumbered: controller.isExternallyEncumbered.value,
          externalLenderName: externalLenderName,
          externalLienAmount: externalLienAmount,

          // Files
          files: [...controller.images.value, ...controller.documents.value],
        );

        // Call backend
        await ref
            .read(assetCreationControllerProvider.notifier)
            .createAsset(request);

        // Close loader
        if (context.mounted) {
          Navigator.of(context, rootNavigator: true).pop();
        }

        controller.isSubmitting.value = false;

        // Move to Insurance step
        controller.currentStep.value = 4;
        controller.pageController.jumpToPage(4);
      } catch (e) {
        // Close loader safely
        if (context.mounted) {
          Navigator.of(context, rootNavigator: true).pop();
        }

        controller.isSubmitting.value = false;
        if (!context.mounted) return;
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('${t.translate('error')}: $e'),
            backgroundColor: AppTheme.errorColor,
          ),
        );
      }
    }

    void nextStep() async {
      if (!validateStep()) return;

      if (controller.currentStep.value < 3) {
        controller.currentStep.value++;
        controller.pageController.nextPage(
          duration: const Duration(milliseconds: 300),
          curve: Curves.easeInOut,
        );
      } else if (controller.currentStep.value == 3) {
        await submitAsset();
      }
    }

    void previousStep() {
      if (controller.currentStep.value > 0) {
        controller.currentStep.value--;
        controller.pageController.previousPage(
          duration: const Duration(milliseconds: 300),
          curve: Curves.easeInOut,
        );
      } else {
        context.pop();
      }
    }

    void finishFlow() {
      final assetId = controller.createdAsset.value?.id;

      context.go(
        assetId != null ? RouteHelpers.assetDetail(assetId) : RouteNames.assets,
      );
    }

    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
        title: Text(
          t.translate('add_asset_title'),
          style: AppTheme.heading3.copyWith(color: AppTheme.primaryColor),
        ),
      ),
      body: Column(
        children: [
          AssetStepIndicator(
            currentStep: controller.currentStep.value,
            totalSteps: 5,
          ),
          Expanded(
            child: PageView(
              controller: controller.pageController,
              physics: const NeverScrollableScrollPhysics(),
              children: [
                 // Step 1: Basic Information
                BasicInfoStep(
                  key: const ValueKey('basic_info'),
                  titleController: controller.titleController,
                  descriptionController: controller.descriptionController,
                  selectedCategory: controller.selectedCategory,
                  formKey: controller.basicInfoFormKey,
                  fadeAnimation: fadeAnimation,
                ),

                // Step 2: Valuation Details
                ValuationStep(
                  key: const ValueKey('valuation'),
                  purchasePriceController: controller.purchasePriceController,
                  purchaseDateController: controller.purchaseDateController,
                  currentMarketValueController:
                      controller.currentMarketValueController,
                  serialNumberController: controller.serialNumberController,
                  registrationNumberController:
                      controller.registrationNumberController,
                  vinController: controller.vinController,
                  selectedCondition: controller.selectedCondition,
                  conditionScore: controller.conditionScore,

                   externalLenderNameController:
                      controller.externalLenderNameController,
                  externalLienAmountController:
                      controller.externalLienAmountController,
                  isExternallyEncumbered: controller.isExternallyEncumbered,     
                  formKey: controller.valuationFormKey,
                  fadeAnimation: fadeAnimation,
                ),

                // Step 3: Document Upload
                DocumentsStep(
                  key: const ValueKey('documents'),
                  images: controller.images,
                  documents: controller.documents,
                  formKey: controller.documentsFormKey,
                  fadeAnimation: fadeAnimation,
                ),

                // Step 4: Location
                LocationStep(
                  key: const ValueKey('location'),
                  locationAddressController:
                      controller.locationAddressController,
                  formKey: controller.locationFormKey,
                  fadeAnimation: fadeAnimation,
                ),
                 InsuranceStepWrapper(
                  asset: controller.createdAsset.value,
                  formKey: controller.insuranceFormKey,
                  onComplete: finishFlow,
                  onSkip: finishFlow,
                ),
              ],
            ),
          ),
          if (controller.currentStep.value < 4)
            NavigationButtons(
              currentStep: controller.currentStep.value,
              onNext: nextStep,
              onBack: previousStep,
              isSubmitting: controller.isSubmitting.value,
            ),
        ],
      ),
    );
  }
}

