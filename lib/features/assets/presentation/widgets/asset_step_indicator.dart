import 'package:flutter/material.dart';
import '../../../../core/themes/app_theme.dart';
import '../../../../core/localization/app_localizations.dart';

class AssetStepIndicator extends StatelessWidget {
  final int currentStep;
  final int totalSteps;

  const AssetStepIndicator({
    super.key,
    required this.currentStep,
    this.totalSteps = 4,
  });

  @override
  Widget build(BuildContext context) {
    final t = AppLocalizations.of(context);
    final steps = _getStepsForTotal(t, totalSteps);

    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: AppTheme.defaultPadding,
        vertical: 16,
      ),
      child: Row(
        children: List.generate(steps.length * 2 - 1, (index) {
          if (index.isEven) {
            final stepIndex = index ~/ 2;
            return _buildStep(
              stepIndex,
              steps[stepIndex].label,
              steps[stepIndex].icon,
            );
          } else {
            final stepIndex = index ~/ 2;
            return _buildStepLine(stepIndex);
          }
        }),
      ),
    );
  }

  List<StepInfo> _getStepsForTotal(AppLocalizations t, int total) {
    if (total == 5) {
      return [
        StepInfo(label: t.translate('basic_info'), icon: Icons.info),
        StepInfo(
          label: t.translate('valuation_info'),
          icon: Icons.attach_money,
        ),
        StepInfo(label: t.translate('documents_info'), icon: Icons.upload_file),
        StepInfo(label: t.translate('location_info'), icon: Icons.location_on),
        StepInfo(label: t.translate('insurance'), icon: Icons.security),
      ];
    }

    return [
      StepInfo(label: t.translate('basic_info'), icon: Icons.info),
      StepInfo(label: t.translate('valuation_info'), icon: Icons.attach_money),
      StepInfo(label: t.translate('documents_info'), icon: Icons.upload_file),
      StepInfo(label: t.translate('location_info'), icon: Icons.location_on),
    ];
  }

  Widget _buildStep(int step, String label, IconData icon) {
    final isCompleted = currentStep > step;
    final isCurrent = currentStep == step;

    return Expanded(
      child: Column(
        children: [
          Container(
            width: 40,
            height: 40,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: isCompleted
                  ? AppTheme.secondaryColor
                  : isCurrent
                  ? AppTheme.primaryColor
                  : Colors.grey.shade200,
            ),
            child: Center(
              child: isCompleted
                  ? const Icon(Icons.check, color: Colors.white, size: 20)
                  : Icon(
                      icon,
                      color: isCurrent ? Colors.white : Colors.grey,
                      size: 20,
                    ),
            ),
          ),
          const SizedBox(height: 4),
          Text(
            label,
            style: AppTheme.caption.copyWith(
              color: isCurrent ? AppTheme.primaryColor : Colors.grey,
              fontWeight: isCurrent ? FontWeight.w600 : FontWeight.normal,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildStepLine(int step) {
    final isActive = currentStep > step;

    return Container(
      width: 20,
      height: 2,
      margin: const EdgeInsets.only(bottom: 24),
      decoration: BoxDecoration(
        color: isActive ? AppTheme.secondaryColor : Colors.grey.shade200,
        borderRadius: BorderRadius.circular(1),
      ),
    );
  }
}

class StepInfo {
  final String label;
  final IconData icon;

  StepInfo({required this.label, required this.icon});
}

// import 'package:flutter/material.dart';
// import '../../../../core/themes/app_theme.dart';

// class AssetStepIndicator extends StatelessWidget {
//   final int currentStep;

//   const AssetStepIndicator({super.key, required this.currentStep});

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       padding: const EdgeInsets.symmetric(
//         horizontal: AppTheme.defaultPadding,
//         vertical: 16,
//       ),
//       child: Row(
//         children: [
//           _buildStep(0, 'Basic', Icons.info),
//           _buildStepLine(0),
//           _buildStep(1, 'Value', Icons.attach_money),
//           _buildStepLine(1),
//           _buildStep(2, 'Docs', Icons.upload_file),
//           _buildStepLine(2),
//           _buildStep(3, 'Location', Icons.location_on),
//         ],
//       ),
//     );
//   }

//   Widget _buildStep(int step, String label, IconData icon) {
//     final isCompleted = currentStep > step;
//     final isCurrent = currentStep == step;

//     return Expanded(
//       child: Column(
//         children: [
//           Container(
//             width: 40,
//             height: 40,
//             decoration: BoxDecoration(
//               shape: BoxShape.circle,
//               color: isCompleted
//                   ? AppTheme.secondaryColor
//                   : isCurrent
//                   ? AppTheme.primaryColor
//                   : Colors.grey.shade200,
//             ),
//             child: Center(
//               child: isCompleted
//                   ? const Icon(Icons.check, color: Colors.white, size: 20)
//                   : Icon(
//                       icon,
//                       color: isCurrent ? Colors.white : Colors.grey,
//                       size: 20,
//                     ),
//             ),
//           ),
//           const SizedBox(height: 4),
//           Text(
//             label,
//             style: AppTheme.caption.copyWith(
//               color: isCurrent ? AppTheme.primaryColor : Colors.grey,
//               fontWeight: isCurrent ? FontWeight.w600 : FontWeight.normal,
//             ),
//           ),
//         ],
//       ),
//     );
//   }

//   Widget _buildStepLine(int step) {
//     final isActive = currentStep > step;

//     return Container(
//       width: 20,
//       height: 2,
//       margin: const EdgeInsets.only(bottom: 24),
//       decoration: BoxDecoration(
//         color: isActive ? AppTheme.secondaryColor : Colors.grey.shade200,
//         borderRadius: BorderRadius.circular(1),
//       ),
//     );
//   }
// }
