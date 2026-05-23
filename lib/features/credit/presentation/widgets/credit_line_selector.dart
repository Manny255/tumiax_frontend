import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:tumiax_frontend/features/assets/data/models/asset_model.dart';

import '../../../../core/localization/app_localizations.dart';
import '../../../../core/themes/app_theme.dart';
import '../../../../core/widgets/empty_state.dart';
import '../../data/models/credit_line_model.dart';
import '../controllers/credit_lines_controller.dart';

typedef OnCreditLineSelected = void Function(CreditLineModel selectedLine);

class CreditLineSelector extends ConsumerWidget {
  final OnCreditLineSelected? onSelected;
  final CreditLineModel? initialSelected;
  final bool showOnlyActive;
  final bool showOnlyWithBalance;
  final String? title;
  final String? emptyMessage;

  const CreditLineSelector({
    super.key,
    this.onSelected,
    this.initialSelected,
    this.showOnlyActive = true,
    this.showOnlyWithBalance = true,
    this.title,
    this.emptyMessage,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final t = AppLocalizations.of(context);
    final linesAsync = ref.watch(creditLinesControllerProvider);
    final formatCurrency = NumberFormat.currency(
      locale: 'en_TZ',
      symbol: 'TZS ',
      decimalDigits: 0,
    );

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (title != null) ...[
          Text(
            title!,
            style: AppTheme.body1.copyWith(fontWeight: FontWeight.w600),
          ),
          const SizedBox(height: 12),
        ],

        linesAsync.when(
          data: (response) {
            var lines = response.results;

            // Apply filters
            if (showOnlyActive) {
              lines = lines.where((line) => line.status == 'ACTIVE').toList();
            }
            if (showOnlyWithBalance) {
              lines = lines
                  .where((line) => line.remainingBalanceAsDouble > 0)
                  .toList();
            }

            if (lines.isEmpty) {
              return EmptyState(
                icon: Icons.credit_card_off_outlined,
                title: t.translate('no_credit_lines'),
                subtitle: emptyMessage ?? t.translate('no_credit_lines_desc'),
                height: 120,
              );
            }

            return SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: lines.map((line) {
                  final isSelected = initialSelected?.id == line.id;

                  return Padding(
                    padding: const EdgeInsets.only(right: 12),
                    child: _CreditLineChip(
                      line: line,
                      isSelected: isSelected,
                      formatCurrency: formatCurrency,
                      onTap: () => onSelected?.call(line),
                    ),
                  );
                }).toList(),
              ),
            );
          },
          loading: () => const Center(
            child: Padding(
              padding: EdgeInsets.symmetric(vertical: 16),
              child: CircularProgressIndicator(),
            ),
          ),
          error: (error, stack) => Center(
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 16),
              child: Text(t.translate('error_loading_assets_for_spend'),
                style: AppTheme.caption.copyWith(color: AppTheme.errorColor),
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class _CreditLineChip extends StatelessWidget {
  final CreditLineModel line;
  final bool isSelected;
  final NumberFormat formatCurrency;
  final VoidCallback onTap;

  const _CreditLineChip({
    required this.line,
    required this.isSelected,
    required this.formatCurrency,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final available = line.availableAmount;
    final utilization =
        ((line.amountAsDouble - line.remainingBalanceAsDouble) /
                line.amountAsDouble *
                100)
            .round();

    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(12),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        padding: const EdgeInsets.all(12),
        width: 160,
        decoration: BoxDecoration(
          color: isSelected ? AppTheme.primaryColor : Colors.white,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(
            color: isSelected ? AppTheme.primaryColor : Colors.grey.shade200,
            width: isSelected ? 2 : 1,
          ),
          boxShadow: isSelected
              ? [
                  BoxShadow(
                    color: AppTheme.primaryColor.withOpacity(0.3),
                    blurRadius: 8,
                    offset: const Offset(0, 2),
                  ),
                ]
              : null,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Asset icon and name
            Row(
              children: [
                Container(
                  padding: const EdgeInsets.all(4),
                  decoration: BoxDecoration(
                    color: (isSelected ? Colors.white : AppTheme.primaryColor)
                        .withOpacity(0.1),
                    borderRadius: BorderRadius.circular(6),
                  ),
                  child: Icon(
                    _getAssetIcon(line.asset.categoryName),
                    size: 14,
                    color: isSelected ? Colors.white : AppTheme.primaryColor,
                  ),
                ),
                const SizedBox(width: 6),
                Expanded(
                  child: Text(
                    line.asset.title,
                    style: AppTheme.caption.copyWith(
                      color: isSelected ? Colors.white : Colors.grey.shade700,
                      fontWeight: FontWeight.w600,
                    ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ],
            ),

            const SizedBox(height: 8),

            // Available amount
            Text(
              formatCurrency.format(available),
              style: AppTheme.body2.copyWith(
                color: isSelected ? Colors.white : AppTheme.primaryColor,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 4),

            // Utilization indicator
            Row(
              children: [
                Expanded(
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(2),
                    child: LinearProgressIndicator(
                      value: utilization / 100,
                      backgroundColor: (isSelected ? Colors.white : Colors.grey)
                          .withOpacity(0.2),
                      valueColor: AlwaysStoppedAnimation<Color>(
                        isSelected ? Colors.white : AppTheme.primaryColor,
                      ),
                      minHeight: 4,
                    ),
                  ),
                ),
                const SizedBox(width: 6),
                Text(
                  '$utilization%',
                  style: AppTheme.caption.copyWith(
                    color: isSelected
                        ? Colors.white.withOpacity(0.8)
                        : Colors.grey,
                    fontSize: 10,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  IconData _getAssetIcon(String? category) {
    switch (category?.toLowerCase()) {
      case 'motorcycle':
        return Icons.motorcycle;
      case 'car':
        return Icons.directions_car;
      case 'house':
        return Icons.home;
      case 'land':
        return Icons.landscape;
      default:
        return Icons.attach_money;
    }
  }
}
