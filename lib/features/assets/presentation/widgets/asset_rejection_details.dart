import 'package:flutter/material.dart';
import '../../../../core/themes/app_theme.dart';
import '../../../../core/localization/app_localizations.dart';

class AssetRejectionDetails extends StatelessWidget {
  final Map<String, dynamic> rejectionReasons;

  const AssetRejectionDetails({super.key, required this.rejectionReasons});

  @override
  Widget build(BuildContext context) {
    final t = AppLocalizations.of(context);

    return Container(
      margin: const EdgeInsets.only(bottom: 24),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.red.shade50,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.red.shade200),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              const Icon(Icons.error_outline, color: Colors.red),
              const SizedBox(width: 8),
              Text(
                t.translate('rejection_reason'),
                style: AppTheme.body1.copyWith(
                  fontWeight: FontWeight.bold,
                  color: Colors.red.shade700,
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),
          ..._buildRejectionList(),
        ],
      ),
    );
  }

  List<Widget> _buildRejectionList() {
    List<Widget> items = [];

    rejectionReasons.forEach((key, value) {
      if (key == 'documents' && value is List) {
        for (var doc in value) {
          if (doc is Map && doc.containsKey('reason')) {
            items.add(
              _buildRejectionItem(
                'Document: ${doc['id'] ?? 'Unknown'}',
                doc['reason'] as String? ?? 'No reason provided',
              ),
            );
          }
        }
      } else if (value is List) {
        for (var msg in value) {
          items.add(_buildRejectionItem(key, msg.toString()));
        }
      } else if (value is String) {
        items.add(_buildRejectionItem(key, value));
      }
    });

    return items;
  }

  Widget _buildRejectionItem(String field, String reason) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(width: 16, child: Text('•')),
          const SizedBox(width: 8),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  field,
                  style: AppTheme.body2.copyWith(fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 2),
                Text(
                  reason,
                  style: AppTheme.caption.copyWith(color: Colors.grey.shade700),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
