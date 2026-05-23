import 'package:flutter/material.dart';
import '../../../../core/themes/app_theme.dart';
import '../../../../core/localization/app_localizations.dart';
import '../../data/domain/entities/payout_method.dart';

class PayoutMethodCard extends StatelessWidget {
  final PayoutMethod method;
  final VoidCallback onDelete;
  final bool isDeleting;

  const PayoutMethodCard({
    super.key,
    required this.method,
    required this.onDelete,
    this.isDeleting = false,
  });

  @override
  Widget build(BuildContext context) {
    final t = AppLocalizations.of(context);
    final isMobile = method.method == 'Mo';

    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: method.isActive
              ? AppTheme.secondaryColor.withOpacity(0.3)
              : Colors.grey.shade200,
          width: method.isActive ? 2 : 1,
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.05),
            blurRadius: 5,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Stack(
        children: [
          // Status Badge (if pending)
          if (!method.isActive)
            Positioned(
              top: 12,
              right: 12,
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                decoration: BoxDecoration(
                  color: Colors.orange.shade100,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Text(
                  t.translate('pending'),
                  style: AppTheme.caption.copyWith(
                    color: Colors.orange.shade800,
                    fontWeight: FontWeight.bold,
                    fontSize: 10,
                  ),
                ),
              ),
            ),

          Padding(
            padding: const EdgeInsets.all(16),
            child: Row(
              children: [
                // Icon
                Container(
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    color: (isMobile ? Colors.green : Colors.blue).withOpacity(
                      0.1,
                    ),
                    shape: BoxShape.circle,
                  ),
                  child: Icon(
                    isMobile ? Icons.phone_android : Icons.account_balance,
                    color: isMobile ? Colors.green : Colors.blue,
                    size: 24,
                  ),
                ),
                const SizedBox(width: 16),

                // Details
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        isMobile
                            ? t.translate('mobile_wallet')
                            : t.translate('bank_transfer'),
                        style: AppTheme.caption.copyWith(color: Colors.grey),
                      ),
                      const SizedBox(height: 4),
                      if (isMobile) ...[
                        Text(
                          method.mobileWalletProvider ?? '',
                          style: AppTheme.body2.copyWith(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 2),
                        Text(
                          method.mobileWalletNumber ?? '',
                          style: AppTheme.body2,
                        ),
                        if (method.mobileWalletName != null) ...[
                          const SizedBox(height: 2),
                          Text(
                            method.mobileWalletName!,
                            style: AppTheme.caption,
                          ),
                        ],
                      ] else ...[
                        Text(
                          method.bankName ?? '',
                          style: AppTheme.body2.copyWith(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 2),
                        Text(
                          '${t.translate('account')}: ${method.accountNumber ?? ''}',
                          style: AppTheme.body2,
                        ),
                        if (method.accountHolder != null) ...[
                          const SizedBox(height: 2),
                          Text(method.accountHolder!, style: AppTheme.caption),
                        ],
                      ],
                    ],
                  ),
                ),

                // Delete Button
                if (!isDeleting)
                  IconButton(
                    icon: const Icon(Icons.delete_outline, color: Colors.grey),
                    onPressed: onDelete,
                  )
                else
                  const SizedBox(
                    width: 40,
                    height: 40,
                    child: Center(
                      child: SizedBox(
                        width: 20,
                        height: 20,
                        child: CircularProgressIndicator(strokeWidth: 2),
                      ),
                    ),
                  ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
