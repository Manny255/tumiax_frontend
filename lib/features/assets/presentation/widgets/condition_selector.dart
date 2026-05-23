import 'package:flutter/material.dart';
import '../../../../core/themes/app_theme.dart';
import '../../../../core/localization/app_localizations.dart';

class ConditionSelector extends StatelessWidget {
  final ValueNotifier<String> selectedCondition;
  final ValueNotifier<double> conditionScore;

  const ConditionSelector({
    super.key,
    required this.selectedCondition,
    required this.conditionScore,
  });

  @override
  Widget build(BuildContext context) {
    final t = AppLocalizations.of(context);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          t.translate('condition'),
          style: AppTheme.body1.copyWith(fontWeight: FontWeight.w600),
        ),
        const SizedBox(height: 12),
        ValueListenableBuilder<String>(
          valueListenable: selectedCondition,
          builder: (context, selected, child) {
            return Wrap(
              spacing: 8,
              runSpacing: 8,
              children: [
                _buildConditionChip(
                  context,
                  'EXCELLENT',
                  t.translate('excellent'),
                  selected,
                ),
                _buildConditionChip(
                  context,
                  'GOOD',
                  t.translate('good'),
                  selected,
                ),
                _buildConditionChip(
                  context,
                  'FAIR',
                  t.translate('fair'),
                  selected,
                ),
                _buildConditionChip(
                  context,
                  'POOR',
                  t.translate('poor'),
                  selected,
                ),
              ],
            );
          },
        ),
        const SizedBox(height: 16),
        ValueListenableBuilder<double>(
          valueListenable: conditionScore,
          builder: (context, score, child) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(t.translate('condition_score'), style: AppTheme.body2),
                    Text(
                      '${score.round()}%',
                      style: AppTheme.body1.copyWith(
                        fontWeight: FontWeight.bold,
                        color: _getScoreColor(score),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 8),
                Slider(
                  value: score,
                  onChanged: (value) {
                    conditionScore.value = value;

                    if (value >= 80) {
                      selectedCondition.value = 'EXCELLENT';
                    } else if (value >= 60) {
                      selectedCondition.value = 'GOOD';
                    } else if (value >= 40) {
                      selectedCondition.value = 'FAIR';
                    } else {
                      selectedCondition.value = 'POOR';
                    }
                  },
                  min: 0,
                  max: 100,
                  divisions: 20,
                  activeColor: _getScoreColor(score),
                  inactiveColor: Colors.grey.shade300,
                ),
              ],
            );
          },
        ),
      ],
    );
  }

  Widget _buildConditionChip(
    BuildContext context,
    String value,
    String label,
    String selected,
  ) {
    final isSelected = selected == value;

    return FilterChip(
      label: Text(label),
      selected: isSelected,
      onSelected: (isSelected) {
        if (isSelected) {
          selectedCondition.value = value;

          switch (value) {
            case 'EXCELLENT':
              conditionScore.value = 90;
              break;
            case 'GOOD':
              conditionScore.value = 75;
              break;
            case 'FAIR':
              conditionScore.value = 50;
              break;
            case 'POOR':
              conditionScore.value = 25;
              break;
          }
        }
      },
      backgroundColor: Colors.grey.shade50,
      selectedColor: _getConditionColor(value),
      labelStyle: TextStyle(
        color: isSelected ? Colors.white : Colors.grey.shade700,
        fontWeight: isSelected ? FontWeight.w600 : FontWeight.normal,
      ),
    );
  }

  Color _getConditionColor(String condition) {
    switch (condition) {
      case 'EXCELLENT':
        return Colors.green;
      case 'GOOD':
        return Colors.blue;
      case 'FAIR':
        return Colors.orange;
      case 'POOR':
        return Colors.red;
      default:
        return AppTheme.primaryColor;
    }
  }

  Color _getScoreColor(double score) {
    if (score >= 80) return Colors.green;
    if (score >= 60) return Colors.blue;
    if (score >= 40) return Colors.orange;
    return Colors.red;
  }
}
