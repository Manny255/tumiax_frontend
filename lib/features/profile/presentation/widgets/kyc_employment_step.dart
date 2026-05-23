import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:lottie/lottie.dart';
import '../../../../core/themes/app_theme.dart';
import '../../../../core/widgets/tumiax_text_field.dart';
import '../../../../core/localization/app_localizations.dart';

class KYCEmploymentStep extends HookWidget {
  final GlobalKey<FormState> formKey;
  final TextEditingController employmentStatusController;
  final TextEditingController occupationController;
  final TextEditingController employerController;
  final TextEditingController annualIncomeController;
  final Animation<double> fadeAnimation;
  final Map<String, dynamic>? initialData;

  const KYCEmploymentStep({
    super.key,
    required this.formKey,
    required this.employmentStatusController,
    required this.occupationController,
    required this.employerController,
    required this.annualIncomeController,
    required this.fadeAnimation,
    this.initialData,
  });

  @override
  Widget build(BuildContext context) {
    final t = AppLocalizations.of(context);
    final employmentStatusOptions = [
      'EMPLOYED',
      'SELF_EMPLOYED',
      'UNEMPLOYED',
      'RETIRED',
      'STUDENT',
    ];

    // Initialize with draft data if available
    useEffect(() {
      if (initialData != null) {
        employmentStatusController.text =
            initialData!['employmentStatus'] ?? 'EMPLOYED';
        occupationController.text = initialData!['occupation'] ?? '';
        employerController.text = initialData!['employer'] ?? '';
        annualIncomeController.text = initialData!['annualIncome'] ?? '';
      }
      return null;
    }, [initialData]);

    return FadeTransition(
      opacity: fadeAnimation,
      child: Padding(
        padding: const EdgeInsets.all(AppTheme.defaultPadding),
        child: Form(
          key: formKey,
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Animation
                Center(
                  child: Container(
                    height: 180,
                    child: Lottie.asset(
                      'assets/animations/employment.json',
                      fit: BoxFit.contain,
                      errorBuilder: (context, error, stackTrace) => Container(
                        height: 180,
                        decoration: BoxDecoration(
                          color: AppTheme.primaryColor.withOpacity(0.1),
                          shape: BoxShape.circle,
                        ),
                        child: const Icon(
                          Icons.work_outline,
                          size: 80,
                          color: AppTheme.primaryColor,
                        ),
                      ),
                    ),
                  ),
                ),

                const SizedBox(height: 16),

                Text(
                  t.translate('employment_information'),
                  style: AppTheme.heading3,
                ),

                const SizedBox(height: 8),

                Text(
                  t.translate('employment_info_subtitle'),
                  style: AppTheme.body2.copyWith(color: Colors.grey),
                ),

                const SizedBox(height: 24),

                // Employment Status Dropdown
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 16,
                    vertical: 4,
                  ),
                  decoration: BoxDecoration(
                    color: Colors.grey.shade50,
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(color: Colors.grey.shade200),
                  ),
                  child: DropdownButtonFormField<String>(
                    value: employmentStatusController.text.isNotEmpty
                        ? employmentStatusController.text
                        : 'EMPLOYED',
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      labelText: t.translate('employment_status'),
                      labelStyle: AppTheme.body2.copyWith(color: Colors.grey),
                      prefixIcon: const Icon(
                        Icons.work_outline,
                        color: Colors.grey,
                      ),
                    ),
                    items: employmentStatusOptions.map((status) {
                      String displayText;
                      switch (status) {
                        case 'EMPLOYED':
                          displayText = t.translate('employed');
                          break;
                        case 'SELF_EMPLOYED':
                          displayText = t.translate('self_employed');
                          break;
                        case 'UNEMPLOYED':
                          displayText = t.translate('unemployed');
                          break;
                        case 'RETIRED':
                          displayText = t.translate('retired');
                          break;
                        case 'STUDENT':
                          displayText = t.translate('student');
                          break;
                        default:
                          displayText = status;
                      }
                      return DropdownMenuItem(
                        value: status,
                        child: Text(displayText),
                      );
                    }).toList(),
                    onChanged: (value) {
                      if (value != null) {
                        employmentStatusController.text = value;
                      }
                    },
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return t.translate('select_employment_status');
                      }
                      return null;
                    },
                  ),
                ),

                const SizedBox(height: 16),

                // Occupation
                TumiaxTextField(
                  controller: occupationController,
                  label: t.translate('occupation'),
                  hint: t.translate('enter_occupation'),
                  prefixIcon: Icons.business_center_outlined,
                ),

                const SizedBox(height: 16),

                // Employer
                TumiaxTextField(
                  controller: employerController,
                  label: t.translate('employer'),
                  hint: t.translate('enter_employer'),
                  prefixIcon: Icons.apartment_outlined,
                ),

                const SizedBox(height: 16),

                // Annual Income
                TumiaxTextField(
                  controller: annualIncomeController,
                  label: t.translate('annual_income'),
                  hint: t.translate('income_hint'),
                  prefixIcon: Icons.attach_money,
                  keyboardType: TextInputType.number,
                ),

                const SizedBox(height: 16),

                // Info note
                Container(
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    color: Colors.blue.shade50,
                    borderRadius: BorderRadius.circular(8),
                    border: Border.all(color: Colors.blue.shade200),
                  ),
                  child: Row(
                    children: [
                      Icon(
                        Icons.info_outline,
                        color: Colors.blue.shade700,
                        size: 20,
                      ),
                      const SizedBox(width: 12),
                      Expanded(
                        child: Text(
                          t.translate('employment_info_note'),
                          style: AppTheme.caption.copyWith(
                            color: Colors.blue.shade700,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
