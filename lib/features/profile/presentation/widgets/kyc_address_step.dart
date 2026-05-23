import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:lottie/lottie.dart';
import '../../../../core/themes/app_theme.dart';
import '../../../../core/widgets/tumiax_text_field.dart';
import '../../../../core/localization/app_localizations.dart';

class KYCAddressStep extends HookWidget {
  final GlobalKey<FormState> formKey;
  final TextEditingController addressController;
  final TextEditingController cityController;
  final TextEditingController stateController;
  final TextEditingController postalCodeController;
  final TextEditingController countryController;
  final Animation<double> fadeAnimation;
  final Map<String, dynamic>? initialData;

  const KYCAddressStep({
    super.key,
    required this.formKey,
    required this.addressController,
    required this.cityController,
    required this.stateController,
    required this.postalCodeController,
    required this.countryController,
    required this.fadeAnimation,
    this.initialData,
  });

  @override
  Widget build(BuildContext context) {
    final t = AppLocalizations.of(context);

    useEffect(() {
      if (initialData != null) {
        addressController.text = initialData!['address'] ?? '';
        cityController.text = initialData!['city'] ?? '';
        stateController.text = initialData!['state'] ?? '';
        postalCodeController.text = initialData!['postalCode'] ?? '';
        countryController.text = initialData!['country'] ?? 'TZ';
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
                      'assets/animations/location.json',
                      fit: BoxFit.contain,
                      errorBuilder: (context, error, stackTrace) => Container(
                        height: 180,
                        decoration: BoxDecoration(
                          color: AppTheme.accentColor.withOpacity(0.1),
                          shape: BoxShape.circle,
                        ),
                        child: const Icon(
                          Icons.location_on,
                          size: 80,
                          color: AppTheme.accentColor,
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 16),
                Text(t.translate('your_address'), style: AppTheme.heading3),
                const SizedBox(height: 8),
                Text(
                  t.translate('address_subtitle'),
                  style: AppTheme.body2.copyWith(color: Colors.grey),
                ),
                const SizedBox(height: 24),
                TumiaxTextField(
                  controller: addressController,
                  label: t.translate('street_address'),
                  hint: t.translate('enter_address'),
                  prefixIcon: Icons.home_outlined,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return t.translate('address_required');
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 16),
                TumiaxTextField(
                  controller: cityController,
                  label: t.translate('city'),
                  hint: t.translate('enter_city'),
                  prefixIcon: Icons.location_city_outlined,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return t.translate('city_required');
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 16),
                TumiaxTextField(
                  controller: stateController,
                  label: t.translate('state_region'),
                  hint: t.translate('enter_region'),
                  prefixIcon: Icons.map_outlined,
                ),
                const SizedBox(height: 16),
                TumiaxTextField(
                  controller: postalCodeController,
                  label: t.translate('postal_code'),
                  hint: t.translate('enter_postal_code'),
                  prefixIcon: Icons.markunread_mailbox_outlined,
                ),
                const SizedBox(height: 16),
                TumiaxTextField(
                  controller: countryController,
                  label: t.translate('country'),
                  hint: 'TZ',
                  prefixIcon: Icons.public_outlined,
                  readOnly: true,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
