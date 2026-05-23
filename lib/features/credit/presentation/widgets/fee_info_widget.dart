
import 'package:flutter/material.dart';
import '../../data/models/transfer_type.dart';
import 'repayment_summary_widget.dart';

class FeeInfoWidget extends StatelessWidget {
  final TextEditingController amountController;
  final TransferType transferType;
  final bool showInterestInfo;

  const FeeInfoWidget({
    super.key,
    required this.amountController,
    required this.transferType,
    this.showInterestInfo = true,
  });

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<TextEditingValue>(
      valueListenable: amountController,
      builder: (context, value, child) {
        final amount = double.tryParse(value.text) ?? 0;

        if (amount <= 0) {
          return const SizedBox.shrink();
        }

        return RepaymentSummaryWidget(
          principal: amount,
          hasFee: transferType == TransferType.external,
          compact: false,
        );
      },
    );
  }
}
