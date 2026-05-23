import 'package:flutter/material.dart';
import '../../../../core/localization/app_localizations.dart';
import '../../../../core/themes/app_theme.dart';

class SelectedContactCard extends StatelessWidget {
  final Map<String, dynamic> contact;
  final VoidCallback onClear;

  const SelectedContactCard({
    super.key,
    required this.contact,
    required this.onClear,
  });

  @override
  Widget build(BuildContext context) {
    final t = AppLocalizations.of(context);
    final canReceive = contact['canReceive'] ?? true;
    final riskScore = contact['riskScore'] ?? 0;
    final hasWarning = !canReceive || riskScore > 50;

    final String name = contact['name'] ?? '';
    final String email = contact['email'] ?? '';
    final String? selfieUrl = contact['selfieUrl'];

    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: hasWarning
            ? Colors.orange.shade50
            : AppTheme.primaryColor.withValues(alpha: 0.05),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: hasWarning
              ? Colors.orange.shade300
              : AppTheme.primaryColor.withValues(alpha: 0.3),
        ),
      ),
      child: Row(
        children: [
          _buildAvatar(name, selfieUrl, hasWarning),

          const SizedBox(width: 12),

          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  name,
                  style: AppTheme.body2.copyWith(fontWeight: FontWeight.bold),
                ),
                Text(email, style: AppTheme.caption),

                if (!canReceive) ...[
                  const SizedBox(height: 4),
                  Text(
                    t.translate('recipient_cannot_receive_transfers'),
                    style: AppTheme.caption.copyWith(
                      color: Colors.orange.shade700,
                      fontSize: 10,
                    ),
                  ),
                ],

                if (riskScore > 50 && canReceive) ...[
                  const SizedBox(height: 4),
                  Text(
                    t.translate('recipient_medium_risk'),
                    style: AppTheme.caption.copyWith(
                      color: Colors.orange.shade700,
                      fontSize: 10,
                    ),
                  ),
                ],
              ],
            ),
          ),

          IconButton(
            icon: const Icon(Icons.close, size: 16),
            onPressed: onClear,
          ),
        ],
      ),
    );
  }

  /// =============================
  /// AVATAR (Image + Fallback)
  /// =============================

  Widget _buildAvatar(String name, String? selfieUrl, bool hasWarning) {
    return CircleAvatar(
      radius: 20,
      backgroundColor: hasWarning ? Colors.orange : AppTheme.primaryColor,
      child: ClipOval(
        child: selfieUrl != null && selfieUrl.isNotEmpty
            ? Image.network(
                selfieUrl,
                width: 40,
                height: 40,
                fit: BoxFit.cover,
                errorBuilder: (_, __, ___) => _buildInitials(name, hasWarning),
              )
            : _buildInitials(name, hasWarning),
      ),
    );
  }

  Widget _buildInitials(String name, bool hasWarning) {
    final initials = name
        .split(' ')
        .where((e) => e.isNotEmpty)
        .map((e) => e[0])
        .take(2)
        .join()
        .toUpperCase();

    return Container(
      width: 40,
      height: 40,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: hasWarning ? Colors.orange : AppTheme.primaryColor,
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
}
