import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:lottie/lottie.dart';
import '../../../../core/themes/app_theme.dart';
import '../../../../core/widgets/tumiax_text_field.dart';
import '../../../../core/localization/app_localizations.dart';

class KYCIdStep extends HookWidget {
  final GlobalKey<FormState> formKey;
  final TextEditingController idTypeController;
  final TextEditingController idNumberController;
  final TextEditingController idExpiryDateController;
  final Animation<double> fadeAnimation;
  final Map<String, dynamic>? initialData;

  const KYCIdStep({
    super.key,
    required this.formKey,
    required this.idTypeController,
    required this.idNumberController,
    required this.idExpiryDateController,
    required this.fadeAnimation,
    this.initialData,
  });

  @override
  Widget build(BuildContext context) {
    final t = AppLocalizations.of(context);

    useEffect(() {
      if (initialData != null) {
        idTypeController.text = initialData!['idType'] ?? 'NATIONAL_ID';
        idNumberController.text = initialData!['idNumber'] ?? '';
        idExpiryDateController.text = initialData!['idExpiryDate'] ?? '';
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
                  child: SizedBox(
                    height: 180,
                    child: Lottie.asset(
                      'assets/animations/id_card.json',
                      fit: BoxFit.contain,
                      errorBuilder: (_, __, ___) =>
                          const Icon(Icons.badge, size: 80),
                    ),
                  ),
                ),

                const SizedBox(height: 16),
                Text(t.translate('identification'), style: AppTheme.heading3),

                const SizedBox(height: 24),

                /// ID TYPE
                DropdownButtonFormField<String>(
                  value: idTypeController.text.isEmpty
                      ? null
                      : idTypeController.text,
                  decoration: InputDecoration(
                    labelText: t.translate('id_type'),
                    prefixIcon: const Icon(Icons.badge_outlined),
                  ),
                  items: [
                    DropdownMenuItem(
                      value: 'NATIONAL_ID',
                      child: Text(t.translate('national_id')),
                    ),
                    DropdownMenuItem(
                      value: 'PASSPORT',
                      child: Text(t.translate('passport')),
                    ),
                    DropdownMenuItem(
                      value: 'DRIVERS_LICENSE',
                      child: Text(t.translate('drivers_license')),
                    ),
                    DropdownMenuItem(
                      value: 'RESIDENT_PERMIT',
                      child: Text(t.translate('resident_permit')),
                    ),
                  ],
                  onChanged: (value) {
                    if (value != null) {
                      idTypeController.text = value;
                    }
                  },
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return t.translate('id_type_required');
                    }
                    return null;
                  },
                ),

                const SizedBox(height: 16),

                /// ID NUMBER
                TumiaxTextField(
                  controller: idNumberController,
                  label: t.translate('id_number'),
                  hint: t.translate('enter_id_number'),
                  prefixIcon: Icons.numbers_outlined,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return t.translate('id_number_required');
                    }
                    return null;
                  },
                ),

                const SizedBox(height: 16),

                /// EXPIRY DATE (OPTIONAL)
                TumiaxTextField(
                  controller: idExpiryDateController,
                  label:
                      "${t.translate('id_expiry_date')} (${t.translate('optional')})",
                  hint: t.translate('id_expiry_date_hint'),
                  prefixIcon: Icons.event_outlined,
                  readOnly: true,
                  onTap: () async {
                    final date = await showDatePicker(
                      context: context,
                      initialDate: DateTime.now().add(
                        const Duration(days: 365),
                      ),
                      firstDate: DateTime(1900),
                      lastDate: DateTime(2100),
                    );

                    if (date != null) {
                      idExpiryDateController.text =
                          "${date.year}-${date.month.toString().padLeft(2, '0')}-${date.day.toString().padLeft(2, '0')}";
                    }
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
