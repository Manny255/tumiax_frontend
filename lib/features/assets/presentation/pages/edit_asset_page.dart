
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';

import '../../../../core/localization/app_localizations.dart';
import '../../../../core/routing/route_helpers.dart';
import '../../../../core/themes/app_theme.dart';
import '../../../../core/widgets/tumiax_button.dart';
import '../../../../core/widgets/tumiax_text_field.dart';
import '../../../../core/widgets/async_value_widget.dart';
import '../../../../core/routing/route_names.dart';

import '../../../insurance/presentation/widgets/asset_insurance_card.dart';

import '../../data/models/asset_category.dart';
import '../../data/models/asset_model.dart';
import '../controllers/asset_controller.dart';
import '../controllers/asset_detail_controller.dart';
import '../controllers/asset_edit_controller.dart';

import '../widgets/asset_category_selector.dart';
import '../widgets/asset_documents_section.dart';
import '../widgets/condition_selector.dart';

class EditAssetPage extends HookConsumerWidget {
  final String assetId;

  const EditAssetPage({super.key, required this.assetId});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final t = AppLocalizations.of(context);

    final assetAsync = ref.watch(assetDetailControllerProvider);
    final detailController = ref.read(assetDetailControllerProvider.notifier);
    final editController = ref.read(assetEditControllerProvider.notifier);
    final categoriesAsync = ref.watch(assetCategoryControllerProvider);

    // Load asset when page opens
    useEffect(() {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        detailController.loadAsset(assetId);
        editController.loadAsset(assetId);
      });
      return null;
    }, [assetId]);

    // Form controllers
    final titleController = useTextEditingController();
    final descriptionController = useTextEditingController();
    final purchasePriceController = useTextEditingController();
    final purchaseDateController = useTextEditingController();
    final locationAddressController = useTextEditingController();

    // Selected values
    final selectedCategory = useState<AssetCategoryModel?>(null);
    final selectedCondition = useState<String>('GOOD');
    final conditionScore = useState<double>(0);

    final formKey = useMemoized(() => GlobalKey<FormState>());
    final isLoading = useState(false);

  void _initForm(AssetModel asset, List<AssetCategoryModel> categories) {
      titleController.text = asset.title;
      descriptionController.text = asset.description ?? '';
      purchasePriceController.text = asset.purchasePrice?.toString() ?? '';
      purchaseDateController.text = asset.purchaseDate != null
          ? DateFormat('yyyy-MM-dd').format(asset.purchaseDate!)
          : '';
      locationAddressController.text = asset.locationAddress ?? '';

       /// AUTO SELECT CATEGORY FROM ASSET DATA
      final assetCategoryId = asset.resolvedCategory?.id;

      if (assetCategoryId != null) {
        selectedCategory.value = categories.firstWhere(
          (c) => c.id == assetCategoryId,
          orElse: () => categories.first,
        );
      } else {
        selectedCategory.value = categories.first;
      }
      selectedCondition.value = asset.condition;
      conditionScore.value = (asset.conditionScore ?? 0).toDouble();
    }

    useEffect(() {
      categoriesAsync.whenData((categories) {
        assetAsync.whenData((asset) {
          if (asset != null) {
            _initForm(asset, categories);
          }
        });
      });
      return null;
    }, [assetAsync, categoriesAsync]);

    Future<void> _submit() async {
      if (!formKey.currentState!.validate()) return;

      isLoading.value = true;

      final updates = <String, dynamic>{
        'title': titleController.text,
        'description': descriptionController.text,
        'purchase_price': double.tryParse(purchasePriceController.text),
        'purchase_date': purchaseDateController.text,
        'location_address': locationAddressController.text,
        'condition': selectedCondition.value,
        'condition_score': conditionScore.value,
      };

      final success = await editController.updateAsset(assetId, updates);

      isLoading.value = false;

      if (success && context.mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(t.translate('asset_updated')),
            backgroundColor: AppTheme.secondaryColor,
          ),
        );

        context.pop();
      }
    }

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios, color: AppTheme.primaryColor),
          onPressed: () => context.pop(),
        ),
        title: Text(
          t.translate('edit_asset'),
          style: AppTheme.heading3.copyWith(color: AppTheme.primaryColor),
        ),
      ),
      body: AsyncValueWidget<AssetModel?>(
        value: assetAsync,
        loadingHeight: 400,
        onData: (asset) {
          if (asset == null) {
            return const Center(child: Text('Asset not found'));
          }
          return SingleChildScrollView(
            padding: const EdgeInsets.all(AppTheme.defaultPadding),
            child: Form(
              key: formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    t.translate('basic_information'),
                    style: AppTheme.heading3,
                  ),
                  const SizedBox(height: 16),

                  TumiaxTextField(
                    controller: titleController,
                    label: t.translate('title'),
                    hint: t.translate('enter_asset_title'),
                    prefixIcon: Icons.title,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return t.translate('title_required');
                      }
                      return null;
                    },
                  ),

                  const SizedBox(height: 16),

                  TumiaxTextField(
                    controller: descriptionController,
                    label: t.translate('description'),
                    hint: t.translate('enter_description'),
                    prefixIcon: Icons.description,
                    maxLines: 3,
                  ),

                  const SizedBox(height: 16),

                Text(
                    t.translate('category'),
                    style: AppTheme.body1.copyWith(fontWeight: FontWeight.w600),
                  ),
                  const SizedBox(height: 8),

                  categoriesAsync.when(
                    data: (categories) => AssetCategorySelector(
                      categories: categories,
                      selectedCategory: selectedCategory,
                    ),
                    loading: () => const Padding(
                      padding: EdgeInsets.symmetric(vertical: 8),
                      child: CircularProgressIndicator(),
                    ),
                    error: (e, _) => Text(
                      t.translate('failed_to_load_categories'),
                      style: AppTheme.body2.copyWith(
                        color: AppTheme.errorColor,
                      ),
                    ),
                  ),
                  const SizedBox(height: 24),
                  Text(
                    t.translate('financial_information'),
                    style: AppTheme.heading3,
                  ),
                  const SizedBox(height: 16),

                  TumiaxTextField(
                    controller: purchasePriceController,
                    label: t.translate('purchase_price'),
                    hint: '0.00',
                    prefixIcon: Icons.attach_money,
                    keyboardType: TextInputType.number,
                  ),

                  const SizedBox(height: 16),

                  TumiaxTextField(
                    controller: purchaseDateController,
                    label: t.translate('purchase_date'),
                    hint: 'YYYY-MM-DD',
                    prefixIcon: Icons.calendar_today,
                    readOnly: true,
                    onTap: () async {
                      final date = await showDatePicker(
                        context: context,
                        initialDate: DateTime.now(),
                        firstDate: DateTime(2000),
                        lastDate: DateTime.now(),
                      );

                      if (date != null) {
                        purchaseDateController.text =
                            '${date.year}-${date.month.toString().padLeft(2, '0')}-${date.day.toString().padLeft(2, '0')}';
                      }
                    },
                  ),

                  const SizedBox(height: 24),

                  Text(
                    t.translate('condition_information'),
                    style: AppTheme.heading3,
                  ),
                  const SizedBox(height: 16),

                  ConditionSelector(
                    selectedCondition: selectedCondition,
                    conditionScore: conditionScore,
                  ),

                  const SizedBox(height: 24),

                  Text(t.translate('location'), style: AppTheme.heading3),
                  const SizedBox(height: 16),

                  TumiaxTextField(
                    controller: locationAddressController,
                    label: t.translate('address'),
                    hint: t.translate('enter_address'),
                    prefixIcon: Icons.location_on,
                  ),

                  const SizedBox(height: 24),

                  Text(t.translate('documents'), style: AppTheme.heading3),
                  const SizedBox(height: 16),

                  AssetDocumentsSection(
                    assetId: asset.id,
                    documents: asset.documents ?? [],
                  ),
                  const SizedBox(height: 24),

                  Text(t.translate('insurance'), style: AppTheme.heading3),
                  const SizedBox(height: 16),

                 AssetInsuranceCard(
                    asset: asset,
                    onAddInsurance: () {
                      context.push(
                        RouteHelpers.addInsurance(
                          assetId: asset.id,
                          assetTitle: asset.title,
                        ),
                      );
                    },
                  ),

                  const SizedBox(height: 32),

                  TumiaxButton(
                    text: t.translate('save_changes'),
                    onPressed: _submit,
                    isLoading: isLoading.value,
                  ),

                  const SizedBox(height: 16),

                  OutlinedButton(
                    onPressed: () => _confirmDelete(context, asset.id, ref, t),
                    style: OutlinedButton.styleFrom(
                      foregroundColor: AppTheme.errorColor,
                      side: const BorderSide(color: AppTheme.errorColor),
                    ),
                    child: Text(t.translate('delete_asset')),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  Future<void> _confirmDelete(
    BuildContext context,
    String assetId,
    WidgetRef ref,
    AppLocalizations t,
  ) async {
    final confirm = await showDialog<bool>(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(t.translate('delete_asset')),
        content: Text(t.translate('delete_asset_confirmation')),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context, false),
            child: Text(t.translate('cancel')),
          ),
          ElevatedButton(
            onPressed: () => Navigator.pop(context, true),
            style: ElevatedButton.styleFrom(
              backgroundColor: AppTheme.errorColor,
            ),
            child: Text(t.translate('delete')),
          ),
        ],
      ),
    );

    if (confirm == true) {
      final controller = ref.read(assetEditControllerProvider.notifier);

      final success = await controller.deleteAsset(assetId);

      if (success && context.mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(t.translate('asset_deleted')),
            backgroundColor: AppTheme.secondaryColor,
          ),
        );

        context.go(RouteNames.assets);
      }
    }
  }
}
