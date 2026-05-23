// presentation/pages/add_asset_page/controllers/add_asset_controller.dart
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../../../../../../core/routing/route_names.dart';
import '../../../../../core/themes/app_theme.dart';
import '../../data/models/asset_category.dart';
import '../../data/models/asset_model.dart';


typedef AddAssetController = ({
  ValueNotifier<int> currentStep,
  PageController pageController,
  ValueNotifier<AssetModel?> createdAsset,
  ValueNotifier<bool> showInsuranceStep,
  ValueNotifier<bool> skipInsurance,
  ValueNotifier<bool> isSubmitting,

  // Controllers
  TextEditingController titleController,
  TextEditingController descriptionController,
  TextEditingController purchasePriceController,
  TextEditingController purchaseDateController,
  TextEditingController serialNumberController,
  TextEditingController currentMarketValueController,
  TextEditingController registrationNumberController,
  TextEditingController vinController,
  TextEditingController locationAddressController,

  // Selected values
  ValueNotifier<AssetCategoryModel?> selectedCategory,
  ValueNotifier<String> selectedCondition,
  ValueNotifier<double> conditionScore,

   // NEW: External Encumbrance Controllers
  TextEditingController externalLenderNameController,
  TextEditingController externalLienAmountController,

  // NEW: External Encumbrance Values
  ValueNotifier<bool> isExternallyEncumbered,

  // Documents
  ValueNotifier<List<File>> images,
  ValueNotifier<List<File>> documents,

  // Form keys
  GlobalKey<FormState> basicInfoFormKey,
  GlobalKey<FormState> valuationFormKey,
  GlobalKey<FormState> documentsFormKey,
  GlobalKey<FormState> locationFormKey,
  GlobalKey<FormState> insuranceFormKey,

  // Methods
  void Function() nextStep,
  void Function() previousStep,
  Future<void> Function() submitAsset,
  void Function(AssetModel?, BuildContext, WidgetRef) handleAssetCreated,
  void Function(Object, BuildContext) handleCreationError,
  void Function() skipInsuranceAndFinish,
  void Function() onInsuranceComplete,
  void Function(String?) goToErrorStep,
  void Function(String, {BuildContext? context}) showErrorSnack,
});

AddAssetController useAddAssetController() {
  final currentStep = useState(0);
  final pageController = usePageController();
  final createdAsset = useState<AssetModel?>(null);
  final showInsuranceStep = useState(false);
  final skipInsurance = useState(false);
  final isSubmitting = useState(false);

  // Form controllers
  final titleController = useTextEditingController();
  final descriptionController = useTextEditingController();
  final purchasePriceController = useTextEditingController();
  final purchaseDateController = useTextEditingController();
  final serialNumberController = useTextEditingController();
  final currentMarketValueController = useTextEditingController();
  final registrationNumberController = useTextEditingController();
  final vinController = useTextEditingController();
  final locationAddressController = useTextEditingController();

  // Selected values
  final selectedCategory = useState<AssetCategoryModel?>(null);
  final selectedCondition = useState<String>('GOOD');
  final conditionScore = useState(80.0);

  final externalLenderNameController = useTextEditingController();
  final externalLienAmountController = useTextEditingController();
  final isExternallyEncumbered = useState(false);

  // Documents
  final images = useState<List<File>>([]);
  final documents = useState<List<File>>([]);

  // Form keys
  final basicInfoFormKey = useMemoized(() => GlobalKey<FormState>());
  final valuationFormKey = useMemoized(() => GlobalKey<FormState>());
  final documentsFormKey = useMemoized(() => GlobalKey<FormState>());
  final locationFormKey = useMemoized(() => GlobalKey<FormState>());
  final insuranceFormKey = useMemoized(() => GlobalKey<FormState>());

  void showErrorSnack(String message, {BuildContext? context}) {
    if (context == null) return;
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(message), backgroundColor: AppTheme.errorColor),
    );
  }

  void goToErrorStep(String? step) {
    if (step == 'documents') {
      currentStep.value = 2;
      pageController.jumpToPage(2);
    } else if (step == 'valuation') {
      currentStep.value = 1;
      pageController.jumpToPage(1);
    } else if (step == 'location') {
      currentStep.value = 3;
      pageController.jumpToPage(3);
    }
  }

  // Reset external encumbrance fields when toggled off
  void resetExternalEncumbranceFields() {
    isExternallyEncumbered.addListener(() {
      if (!isExternallyEncumbered.value) {
        externalLenderNameController.clear();
        externalLienAmountController.clear();
      }
    });
  }

  // Call this after initialization
  resetExternalEncumbranceFields();


  void nextStep() {
    // Get context from the global navigator key or use a different approach
    // Since we can't access router directly, we'll need to pass context from the widget
    // This method will be called from the widget where context is available
    // We'll handle this differently - the actual navigation logic will be in the widget
  }

  void previousStep() {
    // This will be handled in the widget with context
  }

  Future<void> submitAsset() async {
    // This will be called from the widget with context
  }

  void handleAssetCreated(
    AssetModel? asset,
    BuildContext context,
    WidgetRef ref,
  ) {
    if (asset == null) return;

    createdAsset.value = asset;
    isSubmitting.value = false;

    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (!context.mounted) return;

      if (Navigator.canPop(context)) {
        Navigator.of(context, rootNavigator: true).pop();
      }

      final requiresInsurance = asset.category?.requiresInsurance ?? false;

      if (requiresInsurance && !skipInsurance.value) {
        showInsuranceStep.value = true;
        currentStep.value = 4;
        pageController.jumpToPage(4);
      } else {
        context.go(RouteNames.assets);
      }
    });
  }

  void handleCreationError(Object error, BuildContext context) {
    isSubmitting.value = false;

    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (!context.mounted) return;

      if (Navigator.canPop(context)) {
        Navigator.of(context, rootNavigator: true).pop();
      }

      showErrorSnack('Error: $error', context: context);
    });
  }

  void skipInsuranceAndFinish() {
    // This will be called from the widget with context
  }

  void onInsuranceComplete() {
    // This will be called from the widget with context
  }

  return (
    currentStep: currentStep,
    pageController: pageController,
    createdAsset: createdAsset,
    showInsuranceStep: showInsuranceStep,
    skipInsurance: skipInsurance,
    isSubmitting: isSubmitting,
    titleController: titleController,
    descriptionController: descriptionController,
    purchasePriceController: purchasePriceController,
    purchaseDateController: purchaseDateController,
    serialNumberController: serialNumberController,
    currentMarketValueController: currentMarketValueController,
    registrationNumberController: registrationNumberController,
    vinController: vinController,
    locationAddressController: locationAddressController,
    selectedCategory: selectedCategory,
    selectedCondition: selectedCondition,
    conditionScore: conditionScore,
    externalLenderNameController: externalLenderNameController,
    externalLienAmountController: externalLienAmountController,
    isExternallyEncumbered: isExternallyEncumbered,
    images: images,
    documents: documents,
    basicInfoFormKey: basicInfoFormKey,
    valuationFormKey: valuationFormKey,
    documentsFormKey: documentsFormKey,
    locationFormKey: locationFormKey,
    insuranceFormKey: insuranceFormKey,
    nextStep: nextStep,
    previousStep: previousStep,
    submitAsset: submitAsset,
    handleAssetCreated: handleAssetCreated,
    handleCreationError: handleCreationError,
    skipInsuranceAndFinish: skipInsuranceAndFinish,
    onInsuranceComplete: onInsuranceComplete,
    goToErrorStep: goToErrorStep,
    showErrorSnack: showErrorSnack,
  );
}
