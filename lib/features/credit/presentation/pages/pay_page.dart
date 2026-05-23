import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:mobile_scanner/mobile_scanner.dart';

import '../../../../core/localization/app_localizations.dart';
import '../../../../core/themes/app_theme.dart';
import '../../../../core/widgets/tumiax_button.dart';
import '../../../../core/widgets/tumiax_text_field.dart';
import '../../../auth/data/models/user_model.dart';
import '../../../auth/providers/auth_providers.dart';
import '../../../profile/data/models/kyc_lookup_model.dart';
import '../../data/models/credit_line_model.dart';
import '../../data/models/transfer_type.dart';
import '../../dialogs/pay_confirmation_dialog.dart';
import '../widgets/credit_line_selector.dart';
import '../widgets/fee_info_widget.dart';
import '../widgets/pay_qr_code_display.dart';
import '../widgets/pay_recipient_lookup.dart';

class PayPage extends HookConsumerWidget {
  const PayPage({super.key});


    @override
  Widget build(BuildContext context, WidgetRef ref) {
    final t = AppLocalizations.of(context);

    /// user
    final user = ref.watch(userProvider);

    /// safety fallback
    if (user == null) {
      return const SizedBox.shrink();
    }

    // State
    final isScanning = useState(false);
    final scannedCode = useState<String?>(null);
    final selectedCreditLine = useState<CreditLineModel?>(null);

    final scannedEmail = useState<String?>(null);
    final selectedRecipient = useState<KYCLookupModel?>(null);
    final amountController = useTextEditingController();
    final descriptionController = useTextEditingController();

    final scannerController = useMemoized(
      () => MobileScannerController(
        formats: [BarcodeFormat.qrCode],
        autoStart: false,
      ),
    );

    /// control scanner lifecycle
    useEffect(() {
      if (isScanning.value) {
        Future.microtask(() {
          if (!scannerController.value.isRunning) {
            scannerController.start();
          }
        });
      } else {
        if (scannerController.value.isRunning) {
          scannerController.stop();
        }
      }
      return null;
    }, [isScanning.value]);

    /// dispose scanner
    useEffect(() {
      return scannerController.dispose;
    }, []);

    /// reset QR state when scanning restarts
    useEffect(() {
      if (isScanning.value) {
        scannedCode.value = null;
        scannedEmail.value = null;
      }
      return null;
    }, [isScanning.value]);

    /// parse QR once scanned
    useEffect(() {
      if (scannedCode.value != null) {
        _parseQRCode(scannedCode.value!, scannedEmail, user);
      }
      return null;
    }, [scannedCode.value]);

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios, color: AppTheme.primaryColor),
          onPressed: () => context.pop(),
        ),
        title: Text(
          t.translate("pay"),
          style: AppTheme.heading3.copyWith(color: AppTheme.primaryColor),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(AppTheme.defaultPadding),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildQRPaymentSection(
              context,
              t,
              isScanning,
              scannedCode,
              scannedEmail,
              selectedRecipient,
              scannerController,
              user,
            ),

            const SizedBox(height: 24),

            /// show payment fields only when recipient selected
            if (selectedRecipient.value != null) ...[
              CreditLineSelector(
                title: t.translate('select_asset_to_spend'),
                onSelected: (line) => selectedCreditLine.value = line,
                initialSelected: selectedCreditLine.value,
                showOnlyActive: true,
                showOnlyWithBalance: true,
                emptyMessage: t.translate('no_asset_to_spend'),
              ),

              const SizedBox(height: 16),

              _buildAmountField(t, amountController),

              if (amountController.text.isNotEmpty &&
                  double.tryParse(amountController.text) != null &&
                  double.parse(amountController.text) > 0) ...[
                const SizedBox(height: 16),
                FeeInfoWidget(
                  amountController: amountController,
                  transferType:
                      TransferType.internal,
                  showInterestInfo: true,
                ),
              ],
              const SizedBox(height: 16),

              _buildDescriptionField(t, descriptionController),

              const SizedBox(height: 24),

              _buildPaymentButton(
                context,
                t,
                amountController,
                descriptionController,
                selectedRecipient.value!,
                selectedCreditLine,
                ref,
              ),
            ],
          ],
        ),
      ),
    );
  }

  Widget _buildQRPaymentSection(
    BuildContext context,
    AppLocalizations t,
    ValueNotifier<bool> isScanning,
    ValueNotifier<String?> scannedCode,
    ValueNotifier<String?> scannedEmail,
    ValueNotifier<KYCLookupModel?> selectedRecipient,
    MobileScannerController scannerController,
    UserModel? user,
  ) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        // ================================
        // Show User QR (only when completely idle)
        // ================================
        if (!isScanning.value &&
            scannedEmail.value == null &&
            selectedRecipient.value == null &&
            user != null)
          PayQRCodeDisplay(user: user),

        const SizedBox(height: 16),

        // ================================
        // Scan Button
        // ================================
        if (selectedRecipient.value == null)
          Center(
            child: TumiaxButton(
              text: isScanning.value
                  ? t.translate("stop_scanning")
                  : t.translate("scan_qr_code"),
              onPressed: () {
                isScanning.value = !isScanning.value;
              },
              isOutlined: !isScanning.value,
              width: 200,
            ),
          ),

        const SizedBox(height: 16),

        // ================================
        // QR Scanner
        // ================================
        if (isScanning.value)
          _buildQRScanner(
            context,
            t,
            scannedCode,
            isScanning,
            scannerController,
          ),

        // ================================
        // Recipient Lookup
        // ================================
        if (scannedEmail.value != null)
          PayRecipientLookup(
            email: scannedEmail.value!,
            onCancel: () {
              scannedEmail.value = null;
              scannedCode.value = null;
              selectedRecipient.value = null;
            },
            onRecipientSelected: (recipient) {
              selectedRecipient.value = recipient;
            },
          ),
      ],
    );
  }

Widget _buildQRScanner(
    BuildContext context,
    AppLocalizations t,
    ValueNotifier<String?> scannedCode,
    ValueNotifier<bool> isScanning,
    MobileScannerController controller,
  ) {
    return Container(
      height: 300,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: AppTheme.primaryColor, width: 2),
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(14),
        child: Stack(
          children: [
            MobileScanner(
              controller: controller,
              fit: BoxFit.cover,
              onDetect: (capture) {
                if (!isScanning.value) return;

                final barcode = capture.barcodes.firstOrNull;
                final raw = barcode?.rawValue;

                if (raw == null || raw.isEmpty) return;

                // Prevent duplicate scans
                isScanning.value = false;

                // Save scanned code
                scannedCode.value = raw;
              },
            ),

            // Overlay
            CustomPaint(
              painter: _QRScannerOverlayPainter(),
              child: const SizedBox.expand(),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildAmountField(
    AppLocalizations t,
    TextEditingController controller,
  ) {
    return TumiaxTextField(
      controller: controller,
      label: t.translate("amount"),
      hint: '0.00',
      prefixIcon: Icons.attach_money,
      keyboardType: TextInputType.number,
      validator: (value) {
        if (value == null || value.isEmpty) {
          return t.translate("enter_amount");
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
      label: t.translate("description_optional"),
      hint: t.translate("enter_description"),
      prefixIcon: Icons.description_outlined,
    );
  }

  // Update payment button
  Widget _buildPaymentButton(
    BuildContext context,
    AppLocalizations t,
    TextEditingController amountController,
    TextEditingController descriptionController,
    KYCLookupModel recipient,
    ValueNotifier<CreditLineModel?> selectedCreditLine,
    WidgetRef ref,
  ) {
    return TumiaxButton(

      text: t.translate("confirm_payment"),
      onPressed: () {
        if (amountController.text.isEmpty) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(t.translate("enter_amount")),
              backgroundColor: AppTheme.errorColor,
            ),
          );
          return;
        }

         if (selectedCreditLine.value == null) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(t.translate("select_asset_to_spend")),
              backgroundColor: AppTheme.errorColor,
            ),
          );
          return;
        }

        PayConfirmationDialog.show(
          context: context,
          amount: amountController.text,
          recipient: recipient,
          description: descriptionController.text,
          creditLine: selectedCreditLine.value!,
          ref: ref,
        );
      },
    );
  }

  void _parseQRCode(
    String code,
    ValueNotifier<String?> scannedEmail,
    UserModel? user,
  ) {
    if (code.startsWith('TUMIAX:PAY:')) {
      final email = code.replaceFirst('TUMIAX:PAY:', '');

      if (user != null && email.toLowerCase() == user.email.toLowerCase()) {
        return; // prevent self payment
      }

      if (email.contains('@')) {
        scannedEmail.value = email;
      }
    }
  }
}

// QR Scanner Overlay Painter
class _QRScannerOverlayPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Colors.white.withOpacity(0.3)
      ..style = PaintingStyle.fill;

    // Darken outside area
    canvas.drawPath(
      Path.combine(
        PathOperation.difference,
        Path()..addRect(Rect.fromLTWH(0, 0, size.width, size.height)),
        Path()..addRRect(
          RRect.fromRectAndRadius(
            Rect.fromCenter(
              center: Offset(size.width / 2, size.height / 2),
              width: size.width * 0.7,
              height: size.height * 0.7,
            ),
            const Radius.circular(16),
          ),
        ),
      ),
      paint,
    );

    // Draw corner markers
    final cornerPaint = Paint()
      ..color = Colors.white
      ..style = PaintingStyle.stroke
      ..strokeWidth = 4;

    final rect = Rect.fromCenter(
      center: Offset(size.width / 2, size.height / 2),
      width: size.width * 0.7,
      height: size.height * 0.7,
    );

    // Top-left corner
    canvas.drawLine(
      rect.topLeft,
      Offset(rect.left + 30, rect.top),
      cornerPaint,
    );
    canvas.drawLine(
      rect.topLeft,
      Offset(rect.left, rect.top + 30),
      cornerPaint,
    );

    // Top-right corner
    canvas.drawLine(
      rect.topRight,
      Offset(rect.right - 30, rect.top),
      cornerPaint,
    );
    canvas.drawLine(
      rect.topRight,
      Offset(rect.right, rect.top + 30),
      cornerPaint,
    );

    // Bottom-left corner
    canvas.drawLine(
      rect.bottomLeft,
      Offset(rect.left + 30, rect.bottom),
      cornerPaint,
    );
    canvas.drawLine(
      rect.bottomLeft,
      Offset(rect.left, rect.bottom - 30),
      cornerPaint,
    );

    // Bottom-right corner
    canvas.drawLine(
      rect.bottomRight,
      Offset(rect.right - 30, rect.bottom),
      cornerPaint,
    );
    canvas.drawLine(
      rect.bottomRight,
      Offset(rect.right, rect.bottom - 30),
      cornerPaint,
    );
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}

