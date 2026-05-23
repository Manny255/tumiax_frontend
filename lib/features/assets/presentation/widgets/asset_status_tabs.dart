import 'package:flutter/material.dart';
import '../../../../core/themes/app_theme.dart';
import '../../../../core/localization/app_localizations.dart';

class AssetStatusTabs extends StatelessWidget {
  final String selectedStatus;
  final Function(String) onStatusChanged;

  const AssetStatusTabs({
    super.key,
    required this.selectedStatus,
    required this.onStatusChanged,
  });

  @override
  Widget build(BuildContext context) {
    final t = AppLocalizations.of(context);

    final tabs = [
      {'id': 'all', 'label': t.translate('all'), 'icon': Icons.view_list},
      {
        'id': 'verified',
        'label': t.translate('verified'),
        'icon': Icons.verified,
      },
      {
        'id': 'pending',
        'label': t.translate('pending'),
        'icon': Icons.hourglass_empty,
      },
      {'id': 'draft', 'label': t.translate('draft'), 'icon': Icons.edit},
      {
        'id': 'rejected',
        'label': t.translate('rejected'),
        'icon': Icons.cancel,
      },
    ];

    return Container(
      height: 50,
      margin: const EdgeInsets.only(top: 8),
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.symmetric(
          horizontal: AppTheme.defaultPadding,
        ),
        itemCount: tabs.length,
        itemBuilder: (context, index) {
          final tab = tabs[index];
          final isSelected = selectedStatus == tab['id'];

          return GestureDetector(
            onTap: () => onStatusChanged(tab['id'] as String),
            child: Container(
              margin: const EdgeInsets.only(right: 8),
              padding: const EdgeInsets.symmetric(horizontal: 16),
              decoration: BoxDecoration(
                color: isSelected
                    ? AppTheme.primaryColor
                    : Colors.grey.shade100,
                borderRadius: BorderRadius.circular(25),
                border: Border.all(
                  color: isSelected
                      ? AppTheme.primaryColor
                      : Colors.grey.shade300,
                ),
              ),
              child: Row(
                children: [
                  Icon(
                    tab['icon'] as IconData,
                    size: 16,
                    color: isSelected ? Colors.white : Colors.grey.shade600,
                  ),
                  const SizedBox(width: 6),
                  Text(
                    tab['label'] as String,
                    style: AppTheme.caption.copyWith(
                      color: isSelected ? Colors.white : Colors.grey.shade700,
                      fontWeight: isSelected
                          ? FontWeight.w600
                          : FontWeight.normal,
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
