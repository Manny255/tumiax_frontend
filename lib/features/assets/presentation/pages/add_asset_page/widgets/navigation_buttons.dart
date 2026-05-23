// presentation/pages/add_asset_page/widgets/navigation_buttons.dart
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import '../../../../../../core/themes/app_theme.dart';
import '../../../../../../core/localization/app_localizations.dart';
import '../../../../../../core/widgets/tumiax_button.dart';

class NavigationButtons extends ConsumerWidget {
  final int currentStep;
  final VoidCallback onNext;
  final VoidCallback onBack;
  final bool isSubmitting;

  const NavigationButtons({
    super.key,
    required this.currentStep,
    required this.onNext,
    required this.onBack,
    this.isSubmitting = false,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final t = AppLocalizations.of(context);
    final isLastStep = currentStep == 3; // Location step is last before submit

    return Container(
      padding: const EdgeInsets.all(AppTheme.defaultPadding),
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.1),
            blurRadius: 10,
            offset: const Offset(0, -5),
          ),
        ],
      ),
      child: Row(
        children: [
          if (currentStep > 0)
            Expanded(
              child: TumiaxButton(
                text: t.translate('back'),
                onPressed: isSubmitting
                    ? () {} 
                    : onBack,
                isOutlined: true,
              ),
            ),
          if (currentStep > 0) const SizedBox(width: 12),
          Expanded(
            flex: 2,
            child: TumiaxButton(
              text: isLastStep ? t.translate('submit') : t.translate('next'),
              onPressed: isSubmitting
                  ? () {}
                  : onNext,
              isLoading: isSubmitting,
            ),
          ),
        ],
      ),
    );
  }
}
