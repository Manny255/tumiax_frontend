import 'package:flutter/material.dart';
import '../../../../core/themes/app_theme.dart';
import '../../../../core/localization/app_localizations.dart';
import '../../data/models/asset_category.dart';

class AssetCategorySelector extends StatelessWidget {
  final List<AssetCategoryModel> categories;
  final ValueNotifier<AssetCategoryModel?> selectedCategory;

  const AssetCategorySelector({
    super.key,
    required this.categories,
    required this.selectedCategory,
  });

  @override
  Widget build(BuildContext context) {
    final t = AppLocalizations.of(context);

    return ValueListenableBuilder<AssetCategoryModel?>(
      valueListenable: selectedCategory,
      builder: (context, selected, child) {
        return Wrap(
          spacing: 8,
          runSpacing: 8,
          children: categories.map((category) {
            return _buildCategoryChip(context, category, selected, t);
          }).toList(),
        );
      },
    );
  }

  Widget _buildCategoryChip(
    BuildContext context,
    AssetCategoryModel category,
    AssetCategoryModel? selected,
    AppLocalizations t,
  ) {
    final isSelected = selected?.id == category.id;

    return FilterChip(
      label: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            _mapIcon(category.icon),
            size: 16,
            color: isSelected ? Colors.white : AppTheme.primaryColor,
          ),
          const SizedBox(width: 4),

          /// LOCALIZED NAME
          Text(t.translate(category.name)),
        ],
      ),
      selected: isSelected,
      onSelected: (value) {
        selectedCategory.value = value ? category : null;
      },
      backgroundColor: Colors.grey.shade50,
      selectedColor: AppTheme.primaryColor,
      checkmarkColor: Colors.white,
      labelStyle: TextStyle(
        color: isSelected ? Colors.white : AppTheme.primaryColor,
        fontWeight: isSelected ? FontWeight.w600 : FontWeight.normal,
      ),
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
        side: BorderSide(
          color: isSelected ? AppTheme.primaryColor : Colors.grey.shade300,
        ),
      ),
    );
  }

  IconData _mapIcon(String? iconName) {
    if (iconName == null || iconName.isEmpty) {
      return Icons.category;
    }

    switch (iconName.toLowerCase()) {
      case 'car':
        return Icons.directions_car;
      case 'motorcycle':
        return Icons.motorcycle;
      case 'house':
        return Icons.home;
      case 'land':
        return Icons.landscape;
      default:
        return Icons.category;
    }
  }
}
