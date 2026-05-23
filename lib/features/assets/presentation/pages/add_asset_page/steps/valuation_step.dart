// presentation/pages/add_asset_page/steps/valuation_step.dart

import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:lottie/lottie.dart';

import '../../../../../../core/localization/app_localizations.dart';
import '../../../../../../core/themes/app_theme.dart';
import '../../../../../../core/widgets/tumiax_text_field.dart';
import '../../../widgets/condition_selector.dart';

class ValuationStep extends HookConsumerWidget {
  final TextEditingController purchasePriceController;
  final TextEditingController purchaseDateController;
  final TextEditingController currentMarketValueController;
  final TextEditingController serialNumberController;
  final TextEditingController registrationNumberController;
  final TextEditingController vinController;
  final ValueNotifier<String> selectedCondition;
  final ValueNotifier<double> conditionScore;
  final TextEditingController externalLenderNameController;
  final TextEditingController externalLienAmountController;
  final ValueNotifier<bool> isExternallyEncumbered;

  final GlobalKey<FormState> formKey;
  final double fadeAnimation;

  const ValuationStep({
    super.key,
    required this.purchasePriceController,
    required this.purchaseDateController,
    required this.currentMarketValueController,
    required this.serialNumberController,
    required this.registrationNumberController,
    required this.vinController,
    required this.selectedCondition,
    required this.conditionScore,
    required this.externalLenderNameController,
    required this.externalLienAmountController,
    required this.isExternallyEncumbered,
    required this.formKey,
    required this.fadeAnimation,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final t = AppLocalizations.of(context);

    return FadeTransition(
      opacity: AlwaysStoppedAnimation(fadeAnimation),
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
                    height: 150,
                    child: Lottie.asset(
                      'assets/animations/valuation.json',
                      fit: BoxFit.contain,
                      errorBuilder: (context, error, stackTrace) {
                        return Container(
                          height: 150,
                          decoration: BoxDecoration(
                            color: AppTheme.secondaryColor.withValues(
                              alpha: 0.1,
                            ),
                            shape: BoxShape.circle,
                          ),
                          child: const Icon(
                            Icons.attach_money,
                            size: 80,
                            color: AppTheme.secondaryColor,
                          ),
                        );
                      },
                    ),
                  ),
                ),

                const SizedBox(height: 16),

                Text(t.translate('valuation_info'), style: AppTheme.heading3),

                const SizedBox(height: 8),

                Text(
                  t.translate('valuation_info_desc'),
                  style: AppTheme.body2.copyWith(color: Colors.grey),
                ),

                const SizedBox(height: 24),

                // Purchase Price
                TumiaxTextField(
                  controller: purchasePriceController,
                  label: t.translate('purchase_price'),
                  hint: t.translate('purchase_price_hint'),
                  prefixIcon: Icons.attach_money,
                  keyboardType: TextInputType.number,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return t.translate('purchase_price_required');
                    }

                    final parsedValue = double.tryParse(
                      value.replaceAll(',', ''),
                    );

                    if (parsedValue == null) {
                      return t.translate('valid_number_required');
                    }

                    if (parsedValue <= 0) {
                      return t.translate('value_greater_than_zero');
                    }

                    return null;
                  },
                ),

                const SizedBox(height: 16),

                // Purchase Date
                TumiaxTextField(
                  controller: purchaseDateController,
                  label: t.translate('purchase_date'),
                  hint: t.translate('purchase_date_hint'),
                  prefixIcon: Icons.calendar_today_outlined,
                  readOnly: true,
                  onTap: () async {
                    final date = await showDatePicker(
                      context: context,
                      initialDate: DateTime.now(),
                      firstDate: DateTime(2000),
                      lastDate: DateTime.now(),
                    );

                    if (date != null) {
                      purchaseDateController.text =
                          '${date.year}-${date.month.toString().padLeft(2, '0')}-${date.day.toString().padLeft(2, '0')}';
                    }
                  },
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return t.translate('purchase_date_required');
                    }

                    return null;
                  },
                ),

                const SizedBox(height: 16),

                // Current Market Value
                TumiaxTextField(
                  controller: currentMarketValueController,
                  label: t.translate('current_value'),
                  hint: t.translate('current_value_hint'),
                  prefixIcon: Icons.attach_money,
                  keyboardType: TextInputType.number,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return t.translate('current_value_required');
                    }

                    final parsedValue = double.tryParse(
                      value.replaceAll(',', ''),
                    );

                    if (parsedValue == null) {
                      return t.translate('valid_number_required');
                    }

                    if (parsedValue <= 0) {
                      return t.translate('value_greater_than_zero');
                    }

                    return null;
                  },
                ),

                const SizedBox(height: 16),

                // Optional Fields
                TumiaxTextField(
                  controller: serialNumberController,
                  label: t.translate('serial_number'),
                  hint: t.translate('serial_number_hint'),
                  prefixIcon: Icons.qr_code_outlined,
                ),

                const SizedBox(height: 16),

                TumiaxTextField(
                  controller: registrationNumberController,
                  label: t.translate('registration_number'),
                  hint: t.translate('registration_number_hint'),
                  prefixIcon: Icons.app_registration_outlined,
                ),

                const SizedBox(height: 16),

                TumiaxTextField(
                  controller: vinController,
                  label: t.translate('vin'),
                  hint: t.translate('vin_hint'),
                  prefixIcon: Icons.directions_car_outlined,
                ),

                const SizedBox(height: 24),

                // External Encumbrance Section
                Container(
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: AppTheme.warningColor.withValues(alpha: 0.1),
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(
                      color: AppTheme.warningColor.withValues(alpha: 0.3),
                    ),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Icon(
                            Icons.warning_amber_rounded,
                            color: AppTheme.warningColor,
                            size: 20,
                          ),

                          const SizedBox(width: 8),

                          Expanded(
                            child: Text(
                              t.translate('external_encumbrance_title'),
                              style: AppTheme.heading3.copyWith(
                                color: AppTheme.warningColor,
                              ),
                            ),
                          ),
                        ],
                      ),

                      const SizedBox(height: 16),

                      // Toggle Switch
                      ValueListenableBuilder<bool>(
                        valueListenable: isExternallyEncumbered,
                        builder: (context, value, child) {
                          return SwitchListTile(
                            title: Text(
                              t.translate('is_externally_encumbered'),
                              style: AppTheme.body1,
                            ),
                            subtitle: Text(
                              t.translate('is_externally_encumbered_desc'),
                              style: AppTheme.body2.copyWith(
                                color: Colors.grey,
                              ),
                            ),
                            value: value,
                            onChanged: (newValue) {
                              isExternallyEncumbered.value = newValue;
                            },
                            activeThumbColor: AppTheme.warningColor,
                          );
                        },
                      ),

                      // Conditional Fields
                      ValueListenableBuilder<bool>(
                        valueListenable: isExternallyEncumbered,
                        builder: (context, isEncumbered, child) {
                          if (!isEncumbered) {
                            return const SizedBox.shrink();
                          }

                          return Column(
                            children: [
                              const SizedBox(height: 16),

                              TumiaxTextField(
                                controller: externalLenderNameController,
                                label: t.translate('external_lender_name'),
                                hint: t.translate('external_lender_name_hint'),
                                prefixIcon: Icons.business,
                                validator: (value) {
                                  if (isExternallyEncumbered.value &&
                                      (value == null || value.isEmpty)) {
                                    return t.translate(
                                      'external_lender_name_required',
                                    );
                                  }

                                  return null;
                                },
                              ),

                              const SizedBox(height: 16),

                              TumiaxTextField(
                                controller: externalLienAmountController,
                                label: t.translate('external_lien_amount'),
                                hint: t.translate('external_lien_amount_hint'),
                                prefixIcon: Icons.account_balance,
                                keyboardType: TextInputType.number,
                                validator: (value) {
                                  if (isExternallyEncumbered.value) {
                                    if (value == null || value.isEmpty) {
                                      return t.translate(
                                        'external_lien_amount_required',
                                      );
                                    }

                                    final parsedValue = double.tryParse(
                                      value.replaceAll(',', ''),
                                    );

                                    if (parsedValue == null) {
                                      return t.translate(
                                        'valid_number_required',
                                      );
                                    }

                                    if (parsedValue <= 0) {
                                      return t.translate(
                                        'value_greater_than_zero',
                                      );
                                    }
                                  }

                                  return null;
                                },
                              ),
                            ],
                          );
                        },
                      ),
                    ],
                  ),
                ),

                const SizedBox(height: 24),

                // Condition Selector
                ConditionSelector(
                  selectedCondition: selectedCondition,
                  conditionScore: conditionScore,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
