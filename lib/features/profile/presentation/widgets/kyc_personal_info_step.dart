import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:lottie/lottie.dart';
import '../../../../core/themes/app_theme.dart';
import '../../../../core/widgets/tumiax_text_field.dart';
import '../../../../core/localization/app_localizations.dart';

class KYCPersonalInfoStep extends HookWidget {
  final GlobalKey<FormState> formKey;
  final TextEditingController fullNameController;
  // final TextEditingController emailController;
  final TextEditingController phoneController;
  final TextEditingController dateOfBirthController;
  final Animation<double> fadeAnimation;
  final Map<String, dynamic>? initialData;

  const KYCPersonalInfoStep({
    super.key,
    required this.formKey,
    required this.fullNameController,
    // required this.emailController,
    required this.phoneController,
    required this.dateOfBirthController,
    required this.fadeAnimation,
    this.initialData,
  });

  @override
  Widget build(BuildContext context) {
    final t = AppLocalizations.of(context);

    // Initialize with draft data if available
    useEffect(() {
      if (initialData != null) {
        fullNameController.text = initialData!['fullName'] ?? '';
        // emailController.text = initialData!['email'] ?? '';
        phoneController.text = initialData!['phone'] ?? '';
        dateOfBirthController.text = initialData!['dateOfBirth'] ?? '';
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
                Center(
                  child: Container(
                    height: 180,
                    child: Lottie.asset(
                      'assets/animations/profile.json',
                      fit: BoxFit.contain,
                      errorBuilder: (context, error, stackTrace) => Container(
                        height: 180,
                        decoration: BoxDecoration(
                          color: AppTheme.primaryColor.withOpacity(0.1),
                          shape: BoxShape.circle,
                        ),
                        child: const Icon(
                          Icons.person,
                          size: 80,
                          color: AppTheme.primaryColor,
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 16),
                Text(
                  t.translate('personal_information'),
                  style: AppTheme.heading3,
                ),
                const SizedBox(height: 8),
                Text(
                  t.translate('personal_info_subtitle'),
                  style: AppTheme.body2.copyWith(color: Colors.grey),
                ),
                const SizedBox(height: 24),
                TumiaxTextField(
                  controller: fullNameController,
                  label: t.translate('full_name'),
                  hint: t.translate('enter_full_name'),
                  prefixIcon: Icons.person_outline,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return t.translate('full_name_required');
                    }
                    return null;
                  },
                ),
                // const SizedBox(height: 16),
                // TumiaxTextField(
                //   controller: emailController,
                //   label: t.translate('email'),
                //   hint: t.translate('enter_email'),
                //   prefixIcon: Icons.email_outlined,
                //   keyboardType: TextInputType.emailAddress,
                //   validator: (value) {
                //     if (value == null || value.isEmpty) {
                //       return t.translate('email_required');
                //     }
                //     if (!value.contains('@') || !value.contains('.')) {
                //       return t.translate('invalid_email');
                //     }
                //     return null;
                //   },
                // ),
                const SizedBox(height: 16),
                TumiaxTextField(
                  controller: phoneController,
                  label: t.translate('phone_number'),
                  hint: t.translate('enter_phone_number'),
                  prefixIcon: Icons.phone_outlined,
                  keyboardType: TextInputType.phone,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return t.translate('phone_required');
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 16),
                TumiaxTextField(
                  controller: dateOfBirthController,
                  label: t.translate('date_of_birth'),
                  hint: t.translate('date_format_hint'),
                  prefixIcon: Icons.cake_outlined,
                  readOnly: true,
                  onTap: () async {
                    final date = await showDatePicker(
                      context: context,
                      initialDate: DateTime.now().subtract(
                        const Duration(days: 6570),
                      ),
                      firstDate: DateTime(1900),
                      lastDate: DateTime.now(),
                    );
                    if (date != null) {
                      dateOfBirthController.text =
                          '${date.year}-${date.month.toString().padLeft(2, '0')}-${date.day.toString().padLeft(2, '0')}';
                    }
                  },
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return t.translate('date_of_birth_required');
                    }
                    return null;
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
