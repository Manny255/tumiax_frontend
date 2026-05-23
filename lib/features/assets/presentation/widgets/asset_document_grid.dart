import 'package:flutter/material.dart';
import '../../../../core/themes/app_theme.dart';
import '../../../../core/localization/app_localizations.dart';
import '../../data/models/asset_document.dart';

class AssetDocumentGrid extends StatelessWidget {
  final String assetId;
  final List<AssetDocumentModel> documents;

  const AssetDocumentGrid({
    super.key,
    required this.assetId,
    required this.documents,
  });

  @override
  Widget build(BuildContext context) {
    final t = AppLocalizations.of(context);

    /// EMPTY STATE
    if (documents.isEmpty) {
      return Container(
        padding: const EdgeInsets.all(24),
        decoration: BoxDecoration(
          color: Colors.grey.shade50,
          borderRadius: BorderRadius.circular(16),
          border: Border.all(color: Colors.grey.shade200),
        ),
        child: Column(
          children: [
            Icon(
              Icons.insert_drive_file,
              size: 48,
              color: Colors.grey.shade400,
            ),
            const SizedBox(height: 12),
            Text(
              t.translate('no_documents'),
              style: AppTheme.body1.copyWith(color: Colors.grey.shade600),
            ),
            const SizedBox(height: 4),
            Text(
              t.translate('upload_documents_to_verify'),
              style: AppTheme.caption.copyWith(color: Colors.grey.shade500),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      );
    }

    /// DOCUMENT GRID
    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 8,
        mainAxisSpacing: 8,
        childAspectRatio: 0.9,
      ),
      itemCount: documents.length,
      itemBuilder: (context, index) {
        return _buildDocumentTile(documents[index], context);
      },
    );
  }

  Widget _buildDocumentTile(AssetDocumentModel doc, BuildContext context) {
    final isImage = doc.mimeType?.startsWith('image/') ?? false;

    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.grey.shade200),
      ),
      child: Stack(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              /// PREVIEW
              Expanded(
                child: ClipRRect(
                  borderRadius: const BorderRadius.vertical(
                    top: Radius.circular(12),
                  ),
                  child: isImage && doc.fileUrl != null
                      ? Image.network(
                          doc.fileUrl!,
                          fit: BoxFit.cover,
                          errorBuilder: (_, __, ___) => Container(
                            color: Colors.grey.shade100,
                            child: const Icon(Icons.broken_image),
                          ),
                        )
                      : Container(
                          color: Colors.grey.shade100,
                          child: Icon(
                            Icons.insert_drive_file,
                            size: 32,
                            color: Colors.grey.shade400,
                          ),
                        ),
                ),
              ),

              /// DOCUMENT INFO
              Padding(
                padding: const EdgeInsets.all(8),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      doc.documentType,
                      style: AppTheme.caption.copyWith(
                        fontWeight: FontWeight.w600,
                      ),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                    const SizedBox(height: 4),
                    _buildStatusBadge(doc.status),
                  ],
                ),
              ),
            ],
          ),

          /// REJECTED INDICATOR
          if (doc.status == 'REJECTED')
            Positioned(
              top: 4,
              right: 4,
              child: Container(
                padding: const EdgeInsets.all(2),
                decoration: const BoxDecoration(
                  color: Colors.red,
                  shape: BoxShape.circle,
                ),
                child: const Icon(Icons.close, size: 12, color: Colors.white),
              ),
            ),
        ],
      ),
    );
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
      padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 2),
      decoration: BoxDecoration(
        color: color.withOpacity(0.1),
        borderRadius: BorderRadius.circular(4),
      ),
      child: Text(
        label,
        style: AppTheme.caption.copyWith(
          color: color,
          fontSize: 8,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
