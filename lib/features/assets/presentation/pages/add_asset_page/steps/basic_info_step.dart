// presentation/pages/add_asset_page/steps/basic_info_step.dart

import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../../../../core/themes/app_theme.dart';
import '../../../../../../core/localization/app_localizations.dart';
import '../../../../../../core/widgets/tumiax_text_field.dart';
import '../../../../data/models/asset_category.dart';
import '../../../controllers/asset_controller.dart';
import '../../../widgets/asset_category_selector.dart';

class BasicInfoStep extends HookConsumerWidget {
  final TextEditingController titleController;
  final TextEditingController descriptionController;
  final ValueNotifier<AssetCategoryModel?> selectedCategory;
  final GlobalKey<FormState> formKey;
  final double fadeAnimation;

  const BasicInfoStep({
    super.key,
    required this.titleController,
    required this.descriptionController,
    required this.selectedCategory,
    required this.formKey,
    required this.fadeAnimation,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final t = AppLocalizations.of(context);
    final categoriesAsync = ref.watch(assetCategoryControllerProvider);

    return FadeTransition(
      opacity: AlwaysStoppedAnimation(fadeAnimation),
      child: Padding(
        padding: const EdgeInsets.all(AppTheme.defaultPadding),
        child: Form(
          key: formKey,
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 16),

                /// HEADER
                Text(t.translate('basic_info'), style: AppTheme.heading3),
                const SizedBox(height: 8),

                Text(
                  t.translate('basic_info_desc'),
                  style: AppTheme.body2.copyWith(color: Colors.grey),
                ),

                const SizedBox(height: 24),

                /// TITLE (REQUIRED)
                TumiaxTextField(
                  controller: titleController,
                  label: "${t.translate('asset_title')} *",
                  hint: t.translate('asset_title_hint'),
                  prefixIcon: Icons.title_outlined,
                  validator: (value) {
                    if (value == null || value.trim().isEmpty) {
                      return t.translate('asset_title_required');
                    }
                    return null;
                  },
                ),

                const SizedBox(height: 16),

                /// DESCRIPTION (OPTIONAL)
                TumiaxTextField(
                  controller: descriptionController,
                  label: t.translate('description'),
                  hint: t.translate('description_hint'),
                  prefixIcon: Icons.description_outlined,
                  maxLines: 3,
                ),

                const SizedBox(height: 24),

                /// CATEGORY TITLE
                Text(
                  "${t.translate('select_category')} *",
                  style: AppTheme.body1.copyWith(fontWeight: FontWeight.w600),
                ),

                const SizedBox(height: 12),

                /// CATEGORY SELECTOR
                categoriesAsync.when(
                  loading: () =>
                      const Center(child: CircularProgressIndicator()),
                  error: (e, _) => Text(
                    '${t.translate('error')}: $e',
                    style: AppTheme.body2.copyWith(color: AppTheme.errorColor),
                  ),
                  data: (categories) => Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      AssetCategorySelector(
                        categories: categories,
                        selectedCategory: selectedCategory,
                      ),

                      /// REQUIRED VALIDATION MESSAGE
                      ValueListenableBuilder<AssetCategoryModel?>(
                        valueListenable: selectedCategory,
                        builder: (context, value, _) {
                          if (value == null) {
                            return Padding(
                              padding: const EdgeInsets.only(top: 8),
                              child: Text(
                                t.translate('category_required'),
                                style: AppTheme.caption.copyWith(
                                  color: AppTheme.errorColor,
                                ),
                              ),
                            );
                          }
                          return const SizedBox.shrink();
                        },
                      ),
                    ],
                  ),
                ),

                const SizedBox(height: 24),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
