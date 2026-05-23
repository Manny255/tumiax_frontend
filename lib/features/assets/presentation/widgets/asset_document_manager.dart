import 'package:flutter/material.dart';

import '../../../../core/themes/app_theme.dart';
import '../../../../core/localization/app_localizations.dart';
import '../../data/models/asset_document.dart';

class AssetDocumentManager extends StatefulWidget {
  final String assetId;
  final List<AssetDocumentModel> documents;

  /// Parent handles delete logic
  final Future<void> Function(AssetDocumentModel doc)? onDelete;

  const AssetDocumentManager({
    super.key,
    required this.assetId,
    required this.documents,
    this.onDelete,
  });

  @override
  State<AssetDocumentManager> createState() => _AssetDocumentManagerState();
}

class _AssetDocumentManagerState extends State<AssetDocumentManager> {
  String? _deletingId;

  @override
  Widget build(BuildContext context) {
    final t = AppLocalizations.of(context);

    if (widget.documents.isEmpty) {
      return _buildEmptyState(t);
    }

    return Column(children: widget.documents.map(_buildDocumentTile).toList());
  }

  Widget _buildEmptyState(AppLocalizations t) {
    return Container(
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: Colors.grey.shade50,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.grey.shade200),
      ),
      child: Column(
        children: [
          Icon(Icons.insert_drive_file, size: 48, color: Colors.grey.shade400),
          const SizedBox(height: 12),
          Text(
            t.translate('no_documents'),
            style: AppTheme.body1.copyWith(color: Colors.grey.shade600),
          ),
        ],
      ),
    );
  }

  Widget _buildDocumentTile(AssetDocumentModel doc) {
    final isImage = doc.mimeType?.startsWith('image/') ?? false;
    final canDelete = doc.status == 'REJECTED';

    return Container(
      margin: const EdgeInsets.only(bottom: 8),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: Colors.grey.shade200),
      ),
      child: Row(
        children: [
          /// FILE ICON
          Container(
            width: 40,
            height: 40,
            decoration: BoxDecoration(
              color: Colors.grey.shade100,
              borderRadius: BorderRadius.circular(8),
            ),
            child: Icon(
              isImage ? Icons.image : Icons.insert_drive_file,
              color: AppTheme.primaryColor,
              size: 20,
            ),
          ),

          const SizedBox(width: 12),

          /// FILE INFO
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  doc.fileName ?? doc.documentType,
                  style: AppTheme.body2.copyWith(fontWeight: FontWeight.w600),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                const SizedBox(height: 4),
                _buildStatusBadge(doc.status),
              ],
            ),
          ),

          /// DELETE BUTTON
          if (canDelete)
            _deletingId == doc.id
                ? const SizedBox(
                    width: 24,
                    height: 24,
                    child: CircularProgressIndicator(strokeWidth: 2),
                  )
                : IconButton(
                    icon: const Icon(Icons.delete_outline),
                    color: AppTheme.errorColor,
                    onPressed: () => _confirmDelete(doc),
                  ),
        ],
      ),
    );
  }

  Future<void> _confirmDelete(AssetDocumentModel doc) async {
    final t = AppLocalizations.of(context);

    final confirm = await showDialog<bool>(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(t.translate('delete_document')),
        content: Text(t.translate('delete_document_confirmation')),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context, false),
            child: Text(t.translate('cancel')),
          ),
          ElevatedButton(
            onPressed: () => Navigator.pop(context, true),
            style: ElevatedButton.styleFrom(
              backgroundColor: AppTheme.errorColor,
            ),
            child: Text(t.translate('delete')),
          ),
        ],
      ),
    );

    if (confirm != true) return;

    setState(() => _deletingId = doc.id);

    try {
      await widget.onDelete?.call(doc);
    } finally {
      if (mounted) {
        setState(() => _deletingId = null);
      }
    }
  }

  Widget _buildStatusBadge(String status) {
    Color color;
    String label;

    switch (status) {
      case 'APPROVED':
        color = Colors.green;
        label = 'Approved';
        break;

      case 'REJECTED':
        color = Colors.red;
        label = 'Rejected';
        break;

      default:
        color = Colors.orange;
        label = 'Pending';
    }

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
      decoration: BoxDecoration(
        color: color.withOpacity(0.1),
        borderRadius: BorderRadius.circular(4),
      ),
      child: Text(
        label,
        style: AppTheme.caption.copyWith(
          color: color,
          fontSize: 10,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
