
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../../core/localization/app_localizations.dart';
import '../../../../core/themes/app_theme.dart';
import '../../../../core/widgets/tumiax_text_field.dart';

import '../../../auth/providers/auth_providers.dart';
import '../../../profile/presentation/controllers/kyc_lookup_controller.dart';
import 'selected_contact_card.dart';
import 'recipient_lookup_card.dart';

class InternalTransferSection extends HookConsumerWidget {
  final TextEditingController recipientController;
  final ValueNotifier<Map<String, dynamic>?> selectedContact;

  const InternalTransferSection({
    super.key,
    required this.recipientController,
    required this.selectedContact,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final t = AppLocalizations.of(context);

    final lookupState = ref.watch(kycLookupControllerProvider);
    final lookupController = ref.read(kycLookupControllerProvider.notifier);

    final user = ref.watch(userProvider);

    final isLoading = lookupState.maybeWhen(
      loading: () => true,
      orElse: () => false,
    );

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          t.translate('recipient'),
          style: AppTheme.body1.copyWith(fontWeight: FontWeight.w600),
        ),

        const SizedBox(height: 12),

        TumiaxTextField(
          controller: recipientController,
          label: t.translate('email'),
          hint: t.translate('enter_recipient'),
          prefixIcon: Icons.email_outlined,

          suffixIcon: isLoading
              ? const Padding(
                  padding: EdgeInsets.all(12),
                  child: SizedBox(
                    width: 20,
                    height: 20,
                    child: CircularProgressIndicator(strokeWidth: 2),
                  ),
                )
              : IconButton(
                  icon: const Icon(Icons.refresh),
                  color: AppTheme.primaryColor,
                  onPressed: () {
                    final value = recipientController.text.trim();

                    if (value.isEmpty || !value.contains('@')) {
                      return;
                    }

                    if (user != null) {
                      if (value.toLowerCase() == user.email.toLowerCase()) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text(t.translate('cannot_send_to_self')),
                            backgroundColor: AppTheme.errorColor,
                          ),
                        );
                        return;
                      }

                      lookupController.lookup(value);
                      FocusScope.of(context).unfocus();
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text(t.translate('error_loading_profile')),
                          backgroundColor: AppTheme.errorColor,
                        ),
                      );
                    }
                  },
                ),

          keyboardType: TextInputType.emailAddress,

          onChanged: (value) {
            selectedContact.value = null;
            lookupController.reset();

            if (user != null) {
              if (value.trim().toLowerCase() == user.email.toLowerCase()) {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text(t.translate('cannot_send_to_self')),
                    backgroundColor: AppTheme.errorColor,
                  ),
                );
              }
            }
          },
        ),

        const SizedBox(height: 16),

        /// LOOKUP RESULT CARD
        RecipientLookupCard(
          state: lookupState,
          onSelect: (lookup) {
            selectedContact.value = {
              'name': lookup.fullName,
              'email': lookup.email,
              'selfieUrl': lookup.selfieUrl,
              'canReceive': lookup.canReceive,
              'level': lookup.level,
              'riskScore': lookup.riskScore,
            };
          },

          onClear: () {
            lookupController.reset();
            selectedContact.value = null;
            recipientController.clear();
          },
        ),

        const SizedBox(height: 16),

        /// SELECTED CONTACT
        if (selectedContact.value != null)
          Padding(
            padding: const EdgeInsets.only(top: 16),
            child: SelectedContactCard(
              contact: selectedContact.value!,
              onClear: () {
                selectedContact.value = null;
                recipientController.clear();
                lookupController.reset();
              },
            ),
          ),

        const SizedBox(height: 20),
      ],
    );
  }
}