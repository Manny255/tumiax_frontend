

import 'package:flutter/material.dart';
import '../../../../core/localization/app_localizations.dart';
import '../../../../core/themes/app_theme.dart';
import '../../../../core/widgets/tumiax_button.dart';
import '../../../profile/data/models/kyc_lookup_model.dart';
import '../../../profile/presentation/controllers/kyc_lookup_controller.dart';

class RecipientLookupCard extends StatelessWidget {
  final KYCLookupState state;
  final Function(KYCLookupModel) onSelect;
  final VoidCallback? onClear; 
  final bool isAutoSelect;

  const RecipientLookupCard({
    super.key,
    required this.state,
    required this.onSelect,
    this.onClear, 
    this.isAutoSelect = false,
  });

  @override
  Widget build(BuildContext context) {
    final t = AppLocalizations.of(context);

     return state.when(
      initial: () => const SizedBox.shrink(),
      loading: () => const Center(
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 16),
          child: CircularProgressIndicator(),
        ),
      ),
      error: (message) => _buildErrorCard(context, message, t),
      loaded: (lookup) => _buildLookupResult(context, lookup, t),
    );
  }

  Widget _buildErrorCard(BuildContext context, String message, AppLocalizations t) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppTheme.errorColor.withOpacity(0.1),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: AppTheme.errorColor.withOpacity(0.3)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(Icons.error_outline, color: AppTheme.errorColor),
              const SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      t.translate('recipient_not_found'),
                      style: AppTheme.body2.copyWith(
                        color: AppTheme.errorColor,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      message,
                      style: AppTheme.caption.copyWith(
                        color: AppTheme.errorColor.withOpacity(0.8),
                      ),
                    ),
                  ],
                ),
              ),
              if (onClear != null)
                IconButton(
                  icon: const Icon(Icons.close, size: 20),
                  color: AppTheme.errorColor,
                  onPressed: onClear,
                ),
            ],
          ),
        ],
      ),
    );
  }


  Widget _buildLookupResult(
    BuildContext context,
    KYCLookupModel lookup,
    AppLocalizations t,
  ) {

      // Auto-select if enabled
    if (isAutoSelect && lookup.canReceive) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        onSelect(lookup);
      });
    }


    // Check if recipient can receive money
    if (!lookup.canReceive) {
      return Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: Colors.orange.shade50,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: Colors.orange.shade300),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Icon(Icons.warning_amber, color: Colors.orange.shade700),
                const SizedBox(width: 8),
                Text(
                  t.translate('recipient_cannot_receive'),
                  style: AppTheme.body2.copyWith(
                    color: Colors.orange.shade700,
                    fontWeight: FontWeight.bold,
                  ),
                ),

                if (onClear != null)
                  IconButton(
                    icon: const Icon(Icons.close, size: 20),
                    color: Colors.orange.shade700,
                    onPressed: onClear,
                  ),
              ],
            ),
            const SizedBox(height: 8),
            Text(
              t.translate('recipient_kyc_issue'),
              style: AppTheme.caption.copyWith(color: Colors.orange.shade700),
            ),
          ],
        ),
      );
    }

    // Check risk indicators
    final hasRisks =
        lookup.riskScore > 50 ||
        lookup.pepCheck ||
        lookup.sanctionCheck ||
        lookup.adverseMedia;

    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: hasRisks
            ? Colors.orange.shade50
            : AppTheme.secondaryColor.withOpacity(0.1),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: hasRisks
              ? Colors.orange.shade300
              : AppTheme.secondaryColor.withOpacity(0.3),
        ),
      ),
      child: Column(
        children: [
          // Recipient Info
          Row(
            children: [
              CircleAvatar(
                radius: 24,
                backgroundColor: AppTheme.primaryColor.withValues(alpha: 0.1),
                child: ClipOval(
                  child: lookup.selfieUrl != null && lookup.selfieUrl!.isNotEmpty
                      ? Image.network(
                          lookup.selfieUrl!,
                          width: 48,
                          height: 48,
                          fit: BoxFit.cover,
                          errorBuilder: (_, __, ___) => _buildInitialsAvatar(lookup),
                        )
                      : _buildInitialsAvatar(lookup),
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      lookup.fullName ?? '',
                      style: AppTheme.body1.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(lookup.email, style: AppTheme.caption),
                    const SizedBox(height: 4),
                    _buildVerificationBadge(lookup),
                  ],
                ),
              ),
            ],
          ),
           if (onClear != null)
            IconButton(
              icon: const Icon(Icons.close, size: 20),
              color: Colors.grey.shade600,
              onPressed: onClear,
            ),

          const SizedBox(height: 16),

          // Risk Indicators
          if (hasRisks) ...[
            _buildRiskIndicators(lookup, t),
            const SizedBox(height: 16),
          ],

          // Select Button (only show if not auto-select)
          if (!isAutoSelect)
          TumiaxButton(
            text: t.translate('select_recipient'),
            onPressed: () => onSelect(lookup),
          ),
        ],
      ),
    );
  }

  Widget _buildInitialsAvatar(KYCLookupModel lookup) {
    final name = lookup.fullName ?? '';
  final initials = name
        .split(' ')
        .where((e) => e.isNotEmpty)
        .map((e) => e[0])
        .take(2)
        .join()
        .toUpperCase();

    return Container(
      width: 48,
      height: 48,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: AppTheme.primaryColor,
        shape: BoxShape.circle,
      ),
      child: Text(
        initials,
        style: const TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }

  Widget _buildVerificationBadge(KYCLookupModel lookup) {
    Color color;
    String label;

    switch (lookup.level) {
      case 'FULL':
      case 'ADVANCED':
        color = AppTheme.secondaryColor;
        label = 'Verified';
        break;
      case 'STANDARD':
        color = Colors.orange;
        label = 'Limited';
        break;
      default:
        color = Colors.grey;
        label = 'Basic';
    }

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
      decoration: BoxDecoration(
        color: color.withOpacity(0.2),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Text(
        label,
        style: AppTheme.caption.copyWith(
          color: color,
          fontWeight: FontWeight.bold,
          fontSize: 10,
        ),
      ),
    );
  }

  Widget _buildRiskIndicators(KYCLookupModel lookup, AppLocalizations t) {
    return Column(
      children: [
        if (lookup.riskScore > 50)
          _buildRiskItem(
            Icons.speed,
            'Risk Score: ${lookup.riskScore}',
            Colors.orange.shade700,
          ),
        if (lookup.pepCheck)
          _buildRiskItem(
            Icons.account_balance,
            t.translate('politically_exposed'),
            Colors.orange.shade700,
          ),
        if (lookup.sanctionCheck)
          _buildRiskItem(
            Icons.gavel,
            t.translate('sanctions_check'),
            Colors.red.shade700,
          ),
        if (lookup.adverseMedia)
          _buildRiskItem(
            Icons.newspaper,
            t.translate('adverse_media'),
            Colors.orange.shade700,
          ),
      ],
    );
  }

  Widget _buildRiskItem(IconData icon, String text, Color color) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 4),
      child: Row(
        children: [
          Icon(icon, size: 16, color: color),
          const SizedBox(width: 8),
          Expanded(
            child: Text(
              text,
              style: AppTheme.caption.copyWith(
                color: color,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
