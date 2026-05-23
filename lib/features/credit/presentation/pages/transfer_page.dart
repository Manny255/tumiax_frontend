import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/localization/app_localizations.dart';
import '../../../../core/themes/app_theme.dart';
import '../../../profile/presentation/controllers/kyc_lookup_controller.dart';
import '../../data/models/credit_line_model.dart';
import '../../data/models/transfer_type.dart';
import '../../../payout/data/domain/entities/payout_method.dart';
import '../widgets/credit_line_selector.dart';
import '../widgets/fee_info_widget.dart';
import '../widgets/transfer_type_selector.dart';
import '../widgets/internal_transfer_section.dart';
import '../widgets/external_transfer_section.dart';
import '../widgets/transfer_button.dart';
import '../../../../core/widgets/tumiax_text_field.dart';

class TransferPage extends HookConsumerWidget {
  const TransferPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final t = AppLocalizations.of(context);

    // Form controllers
    final recipientController = useTextEditingController();
    final amountController = useTextEditingController();
    final descriptionController = useTextEditingController();

    // Selected contact
    final selectedContact = useState<Map<String, dynamic>?>(null);
    
    // Selected credit line
    final selectedCreditLine = useState<CreditLineModel?>(null);

    // Transfer type
    final transferType = useState<TransferType>(
      TransferType.internal,
    ); // 'internal' or 'external'

    final formKey = useState(UniqueKey());

    final selectedPayoutMethod = useState<PayoutMethod?>(null);

        // Reset selected credit line when recipient changes
    useEffect(() {
      selectedCreditLine.value = null;
      return null;
    }, [selectedContact.value]);

    void resetForm() {
      recipientController.clear();
      amountController.clear();
      descriptionController.clear();
      selectedContact.value = null;
      selectedCreditLine.value = null;
      selectedPayoutMethod.value = null;

      // Reset KYC lookup state
      ref.read(kycLookupControllerProvider.notifier).reset();

      // Force rebuild
      formKey.value = UniqueKey();
    }


    return Scaffold(
      backgroundColor: Colors.white,
      appBar: _buildAppBar(context, t),
      body: SingleChildScrollView(
        key: formKey.value, 
        padding: const EdgeInsets.all(AppTheme.defaultPadding),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // // Available Balance
            // TransferBalanceCard(creditState: creditState),

            // const SizedBox(height: 24),

            // Transfer Type Selector
            TransferTypeSelector(transferType: transferType),

            const SizedBox(height: 24),

            // Conditional Content based on transfer type
            if (transferType.value == TransferType.internal)
              InternalTransferSection(
                recipientController: recipientController,
                selectedContact: selectedContact,
              )
            else
              ExternalTransferSection(
                selectedPayoutMethod: selectedPayoutMethod,
              ),

                const SizedBox(height: 24),

            // Credit Line Selector - Show when:
            // Internal: recipient is selected
            // External: payout method is selected
            if ((transferType.value == TransferType.internal && 
                 selectedContact.value != null) ||
                (transferType.value == TransferType.external && 
                 selectedPayoutMethod.value != null))
              CreditLineSelector(
                title: t.translate('select_asset_to_spend'),
                onSelected: (line) => selectedCreditLine.value = line,
                initialSelected: selectedCreditLine.value,
                showOnlyActive: true,
                showOnlyWithBalance: true,
                emptyMessage: t.translate('no_asset_to_spend'),
              ),

            if (selectedCreditLine.value != null) ...[
              const SizedBox(height: 24),

              // Amount Field
              _buildAmountField(t, amountController),

              FeeInfoWidget(
                amountController: amountController,
                transferType: transferType.value,
              ),


              const SizedBox(height: 16),

              // Description Field (optional)
              _buildDescriptionField(t, descriptionController),

              const SizedBox(height: 24),

              // Transfer Button
              TransferButton(
                transferType: transferType.value,
                amountController: amountController,
                recipientController: recipientController,
                selectedContact: selectedContact,
                selectedPayoutMethod: selectedPayoutMethod,
                selectedCreditLine: selectedCreditLine,
                onSuccess: resetForm,
              ),
            ],
          ],
        ),
      ),
    );
  }

  PreferredSizeWidget _buildAppBar(BuildContext context, AppLocalizations t) {
    return AppBar(
      backgroundColor: Colors.transparent,
      elevation: 0,
      leading: IconButton(
        icon: const Icon(Icons.arrow_back_ios, color: AppTheme.primaryColor),
        onPressed: () => context.pop(),
      ),
      title: Text(
        t.translate('transfer'),
        style: AppTheme.heading3.copyWith(color: AppTheme.primaryColor),
      ),
    );
  }

  Widget _buildAmountField(
    AppLocalizations t,
    TextEditingController controller,
  ) {
    return TumiaxTextField(
      controller: controller,
      label: t.translate('amount'),
      hint: '0.00',
      prefixIcon: Icons.attach_money,
      keyboardType: TextInputType.number,
      validator: (value) {
        if (value == null || value.isEmpty) {
          return t.translate('enter_amount');
        }
        return null;
      },
    );
  }

  Widget _buildDescriptionField(
    AppLocalizations t,
    TextEditingController controller,
  ) {
    return TumiaxTextField(
      controller: controller,
      label: t.translate('description_optional'),
      hint: t.translate('enter_description'),
      prefixIcon: Icons.description_outlined,
    );
  }
}
