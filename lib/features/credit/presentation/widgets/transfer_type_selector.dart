import 'package:flutter/material.dart';
import '../../../../core/localization/app_localizations.dart';
import '../../../../core/themes/app_theme.dart';
import '../../data/models/transfer_type.dart';

class TransferTypeSelector extends StatelessWidget {
  final ValueNotifier<TransferType> transferType;

  const TransferTypeSelector({super.key, required this.transferType});

  @override
  Widget build(BuildContext context) {
    final t = AppLocalizations.of(context);

    return Container(
      padding: const EdgeInsets.all(4),
      decoration: BoxDecoration(
        color: Colors.grey.shade100,
        borderRadius: BorderRadius.circular(30),
      ),
      child: Row(
        children: [
          Expanded(
            child: _buildTypeOption(
              label: t.translate('internal_transfer'),
              icon: Icons.swap_horiz,
              isSelected: transferType.value == TransferType.internal,
              onTap: () => transferType.value = TransferType.internal,
            ),
          ),
          Expanded(
            child: _buildTypeOption(
              label: t.translate('external_transfer'),
              icon: Icons.account_balance,
              isSelected: transferType.value == TransferType.external,
              onTap: () => transferType.value = TransferType.external,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTypeOption({
    required String label,
    required IconData icon,
    required bool isSelected,
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 12),
        decoration: BoxDecoration(
          color: isSelected ? AppTheme.primaryColor : Colors.transparent,
          borderRadius: BorderRadius.circular(30),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              icon,
              size: 18,
              color: isSelected ? Colors.white : Colors.grey,
            ),
            const SizedBox(width: 8),
            Text(
              label,
              style: AppTheme.body2.copyWith(
                color: isSelected ? Colors.white : Colors.grey,
                fontWeight: isSelected ? FontWeight.w600 : FontWeight.normal,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
