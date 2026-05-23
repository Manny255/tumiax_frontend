import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';

import '../../../../core/themes/app_theme.dart';
import '../../../../core/localization/app_localizations.dart';

class SpendingChart extends StatelessWidget {
  final double totalAmount;
  final List<double> weeklyData;
  final List<String> weekDays;

  const SpendingChart({
    super.key,
    required this.totalAmount,
    required this.weeklyData,
    required this.weekDays,
  });

  @override
  Widget build(BuildContext context) {
    final t = AppLocalizations.of(context);

    return Container(
      height: 200,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withValues(alpha: 0.1),
            blurRadius: 10,
            offset: const Offset(0, 5),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildHeader(t, totalAmount),
          const SizedBox(height: 20),
          Expanded(child: _buildBarChart(weeklyData)),
        ],
      ),
    );
  }

  Widget _buildHeader(AppLocalizations t, double total) {
    return Row(
      children: [
        Expanded(
          child: Text(
            t.translate('spending_insights'),
            style: AppTheme.heading3,
            overflow: TextOverflow.ellipsis,
          ),
        ),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
          decoration: BoxDecoration(
            color: AppTheme.primaryColor.withValues(alpha: 0.1),
            borderRadius: BorderRadius.circular(20),
          ),
          child: Text(
            'TZS ${_formatAmount(total)}',
            style: AppTheme.caption.copyWith(
              color: AppTheme.primaryColor,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildBarChart(List<double> data) {
    // Find the maximum value in the data to set appropriate Y-axis scale
    final double maxValue = data.isNotEmpty
        ? data.reduce((a, b) => a > b ? a : b)
        : 0.0;

    // Calculate a nice round number for maxY (round up to nearest 10,000 or 20,000 etc)
    final yInterval = _calculateYInterval(maxValue);
    final maxY = (maxValue / yInterval).ceil() * yInterval;

    return BarChart(
      BarChartData(
        alignment: BarChartAlignment.spaceAround,
        maxY: maxY.toDouble(),
        barTouchData: BarTouchData(
          enabled: true,
          touchTooltipData: BarTouchTooltipData(
            getTooltipItem: (group, groupIndex, rod, rodIndex) {
              // Format the actual amount with commas
              final value = rod.toY;
              return BarTooltipItem(
                'TZS ${_formatAmount(value)}',
                const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              );
            },
          ),
        ),
        titlesData: FlTitlesData(
          show: true,
          bottomTitles: AxisTitles(
            sideTitles: SideTitles(
              showTitles: true,
              getTitlesWidget: _buildBottomTitles,
            ),
          ),
          leftTitles: AxisTitles(
            sideTitles: SideTitles(
              showTitles: true,
              reservedSize: 40,
              getTitlesWidget: (value, meta) {
                // Format left axis labels (show in K or full numbers)
                if (value == 0) return const Text('');
                return Padding(
                  padding: const EdgeInsets.only(right: 8),
                  child: Text(
                    _formatAxisLabel(value),
                    style: AppTheme.caption.copyWith(fontSize: 10),
                  ),
                );
              },
            ),
          ),
          rightTitles: const AxisTitles(
            sideTitles: SideTitles(showTitles: false),
          ),
          topTitles: const AxisTitles(
            sideTitles: SideTitles(showTitles: false),
          ),
        ),
        borderData: FlBorderData(show: false),
        gridData: FlGridData(
          show: true,
          drawVerticalLine: false,
          horizontalInterval: yInterval / 2,
          getDrawingHorizontalLine: (value) {
            return FlLine(
              color: Colors.grey.withValues(alpha: 0.1),
              strokeWidth: 1,
            );
          },
        ),
        barGroups: List.generate(
          data.length,
          (i) => _makeBarData(
            i,
            data[i],
            i == 3 ? AppTheme.secondaryColor : AppTheme.primaryColor,
          ),
        ),
      ),
    );
  }

Widget _buildBottomTitles(double value, TitleMeta meta) {
    if (value.toInt() >= 0 && value.toInt() < weekDays.length) {
      return Padding(
        padding: const EdgeInsets.only(top: 8),
        child: Text(
          weekDays[value.toInt()],
          style: AppTheme.caption.copyWith(fontSize: 11),
        ),
      );
    }

    return const SizedBox.shrink();
  }

  BarChartGroupData _makeBarData(int x, double y, Color color) {
    return BarChartGroupData(
      x: x,
      barRods: [
        BarChartRodData(
          toY: y,
          width: 16,
          borderRadius: BorderRadius.circular(4),
          color: color,
          backDrawRodData: BackgroundBarChartRodData(
            show: true,
            toY: 0,
            color: Colors.transparent,
          ),
        ),
      ],
    );
  }

  String _formatAmount(double amount) {
    if (amount >= 1000000) {
      // Show in millions (M)
      return '${(amount / 1000000).toStringAsFixed(1)}M';
    } else if (amount >= 1000) {
      // Show in thousands (K)
      return '${(amount / 1000).toStringAsFixed(0)}K';
    } else {
      // Show full amount
      return amount.toStringAsFixed(0);
    }
  }

  String _formatAxisLabel(double value) {
    if (value >= 1000000) {
      return '${(value / 1000000).toStringAsFixed(1)}M';
    } else if (value >= 1000) {
      return '${(value / 1000).toStringAsFixed(0)}K';
    } else {
      return value.toStringAsFixed(0);
    }
  }

  double _calculateYInterval(double maxValue) {
    if (maxValue <= 10000) return 2000;
    if (maxValue <= 20000) return 5000;
    if (maxValue <= 50000) return 10000;
    if (maxValue <= 100000) return 20000;
    if (maxValue <= 200000) return 50000;
    return 100000;
  }
}
