import 'package:flutter/material.dart';
import '../../../../core/themes/app_theme.dart';
import '../../../../core/localization/app_localizations.dart';

class KYCStepIndicator extends StatelessWidget {
  final int currentStep;
  final bool includeEmploymentStep;

  const KYCStepIndicator({
    super.key,
    required this.currentStep,
    this.includeEmploymentStep = false,
  });

  @override
  Widget build(BuildContext context) {
    final t = AppLocalizations.of(context);

    final steps = includeEmploymentStep
        ? [
            _StepData(0, t.translate('personal_step'), Icons.person),
            _StepData(1, t.translate('address_step'), Icons.home),
            _StepData(2, t.translate('employment_step'), Icons.work),
            _StepData(3, t.translate('id_step'), Icons.badge),
            _StepData(4, t.translate('docs_step'), Icons.upload_file),
          ]
        : [
            _StepData(0, t.translate('personal_step'), Icons.person),
            _StepData(1, t.translate('address_step'), Icons.home),
            _StepData(2, t.translate('id_step'), Icons.badge),
            _StepData(3, t.translate('docs_step'), Icons.upload_file),
          ];

    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: AppTheme.defaultPadding,
        vertical: 16,
      ),
      child: Row(children: _buildStepsWithLines(context, steps)),
    );
  }

  List<Widget> _buildStepsWithLines(
    BuildContext context,
    List<_StepData> steps,
  ) {
    List<Widget> widgets = [];

    for (int i = 0; i < steps.length; i++) {
      // Add step
      widgets.add(
        _buildStep(context, steps[i].step, steps[i].label, steps[i].icon),
      );

      // Add line if not last step
      if (i < steps.length - 1) {
        widgets.add(_buildStepLine(context, steps[i].step));
      }
    }

    return widgets;
  }

  Widget _buildStep(
    BuildContext context,
    int step,
    String label,
    IconData icon,
  ) {
    final isCompleted = currentStep > step;
    final isCurrent = currentStep == step;

    // Colors
    Color backgroundColor;
    Color iconColor = Colors.white;

    if (isCompleted) {
      backgroundColor = AppTheme.secondaryColor;
    } else if (isCurrent) {
      backgroundColor = AppTheme.primaryColor;
    } else {
      backgroundColor = Colors.grey.shade200;
      iconColor = Colors.grey.shade600;
    }

    return Expanded(
      child: Column(
        children: [
          Container(
            width: 40,
            height: 40,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: backgroundColor,
              boxShadow: isCurrent
                  ? [
                      BoxShadow(
                        color: AppTheme.primaryColor.withOpacity(0.3),
                        blurRadius: 8,
                        offset: const Offset(0, 2),
                      ),
                    ]
                  : null,
            ),
            child: Center(
              child: isCompleted
                  ? const Icon(Icons.check, color: Colors.white, size: 20)
                  : Icon(icon, color: iconColor, size: 20),
            ),
          ),
          const SizedBox(height: 4),
          Text(
            label,
            style: AppTheme.caption.copyWith(
              color: isCurrent
                  ? AppTheme.primaryColor
                  : (isCompleted ? AppTheme.secondaryColor : Colors.grey),
              fontWeight: isCurrent ? FontWeight.w600 : FontWeight.normal,
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }

  Widget _buildStepLine(BuildContext context, int step) {
    final isActive = currentStep > step;

    return Container(
      width: 20,
      height: 2,
      margin: const EdgeInsets.only(bottom: 24),
      decoration: BoxDecoration(
        color: isActive ? AppTheme.secondaryColor : Colors.grey.shade300,
        borderRadius: BorderRadius.circular(1),
      ),
    );
  }
}

// Helper class for step data
class _StepData {
  final int step;
  final String label;
  final IconData icon;

  _StepData(this.step, this.label, this.icon);
}

// import 'package:flutter/material.dart';
// import '../../../../core/themes/app_theme.dart';

// class KYCStepIndicator extends StatelessWidget {
//   final int currentStep;

//   const KYCStepIndicator({super.key, required this.currentStep});

//   @override
//   Widget build(BuildContext context) {

//     return Container(
//       padding: const EdgeInsets.symmetric(
//         horizontal: AppTheme.defaultPadding,
//         vertical: AppTheme.defaultPadding,
//       ),
//       child: Row(
//         children: [
//           _buildStep(context, 0, 'Personal', Icons.person),
//           _buildStepLine(context, 0),
//           _buildStep(context, 1, 'Address', Icons.home),
//           _buildStepLine(context, 1),
//           _buildStep(context, 2, 'ID', Icons.badge),
//           _buildStepLine(context, 2),
//           _buildStep(context, 3, 'Docs', Icons.upload_file),
//         ],
//       ),
//     );
//   }

//   Widget _buildStep(
//     BuildContext context,
//     int step,
//     String label,
//     IconData icon,
//   ) {
//     final theme = Theme.of(context);
//     final colorScheme = theme.colorScheme;

//     final isCompleted = currentStep > step;
//     final isCurrent = currentStep == step;

//     final backgroundColor = isCompleted
//         ? colorScheme.secondary
//         : isCurrent
//         ? colorScheme.primary
//         : theme.dividerColor;

//     final iconColor = isCompleted || isCurrent
//         ? theme.colorScheme.onPrimary
//         : theme.textTheme.bodyMedium?.color;

//     return Expanded(
//       child: Column(
//         children: [
//           Container(
//             width: 40,
//             height: 40,
//             decoration: BoxDecoration(
//               shape: BoxShape.circle,
//               color: backgroundColor,
//             ),
//             child: Center(
//               child: isCompleted
//                   ? Icon(Icons.check, color: iconColor, size: 20)
//                   : Icon(icon, color: iconColor, size: 20),
//             ),
//           ),
//           const SizedBox(height: AppTheme.smallPadding),
//           Text(
//             label,
//             style: theme.textTheme.labelSmall?.copyWith(
//               color: isCurrent
//                   ? colorScheme.primary
//                   : theme.textTheme.bodyMedium?.color,
//               fontWeight: isCurrent ? FontWeight.w600 : FontWeight.normal,
//             ),
//           ),
//         ],
//       ),
//     );
//   }

//   Widget _buildStepLine(BuildContext context, int step) {
//     final theme = Theme.of(context);
//     final colorScheme = theme.colorScheme;

//     final isActive = currentStep > step;

//     return Container(
//       width: 20,
//       height: 2,
//       margin: const EdgeInsets.only(bottom: 24),
//       decoration: BoxDecoration(
//         color: isActive ? colorScheme.secondary : theme.dividerColor,
//         borderRadius: BorderRadius.circular(1),
//       ),
//     );
//   }
// }
