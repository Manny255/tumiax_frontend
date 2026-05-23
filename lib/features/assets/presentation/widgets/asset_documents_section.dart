import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../../core/localization/app_localizations.dart';
import '../../../../core/themes/app_theme.dart';

import '../../../../shared/document_uploader/document_uploader.dart';
import '../../../../shared/document_uploader/models/uploader_types.dart';
import '../../data/models/asset_document.dart';
import '../controllers/asset_detail_controller.dart';
import '../controllers/asset_edit_controller.dart';
import 'asset_document_manager.dart';

class AssetDocumentsSection extends HookConsumerWidget {
  final String assetId;
  final List<AssetDocumentModel> documents;

  const AssetDocumentsSection({
    super.key,
    required this.assetId,
    required this.documents,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final t = AppLocalizations.of(context);

    /// LOCAL FILES (NOT YET UPLOADED)
    final photoFiles = useState<List<File>>([]);
    final otherFiles = useState<List<File>>([]);

    /// EXISTING SERVER DOCS
    final existingPhotos = documents
        .where((d) => d.documentType == "PHOTO")
        .length;

    final existingOthers = documents
        .where((d) => d.documentType != "PHOTO")
        .length;

    /// BACKEND LIMITS
    const maxPhotos = 5;
    const maxOthers = 3;

    final remainingPhotos = (maxPhotos - existingPhotos).clamp(0, maxPhotos);
    final remainingOthers = (maxOthers - existingOthers).clamp(0, maxOthers);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        /// =============================
        /// EXISTING DOCUMENTS
        /// =============================
        AssetDocumentManager(
          assetId: assetId,
          documents: documents,
          onDelete: (doc) async {
            final controller =
                ref.read(assetEditControllerProvider.notifier);

            final success = await controller.deleteDocument(
              assetId,
              doc.id,
            );

            if (success) {
              await ref
                  .read(assetDetailControllerProvider.notifier)
                  .loadAsset(assetId);

              if (context.mounted) {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text(
                      AppLocalizations.of(context)
                          .translate('document_deleted'),
                    ),
                  ),
                );
              }
            }
          },
        ),

        const SizedBox(height: 24),

        /// =============================
        /// PHOTO UPLOADER
        /// =============================
        if (remainingPhotos > 0) ...[
          // DocumentUploader(
          //   title: t.translate('asset_images'),
          //   uploaderType: UploaderType.asset,
          //   pickType: FilePickType.assetPhoto,
          //   filesNotifier: photoFiles,
          //   maxFiles: remainingPhotos,
          //   assetId: assetId,
          //   documentType: "PHOTO",
          // ),
          DocumentUploader(
            title: t.translate('asset_images'),
            uploaderType: UploaderType.asset,
            pickType: FilePickType.assetPhoto,
            filesNotifier: photoFiles,
            maxFiles: remainingPhotos,
            assetId: assetId,
            documentType: "PHOTO",
            onFilesSelected: (files) async {
              final controller = ref.read(assetEditControllerProvider.notifier);

              for (final file in files) {
                await controller.uploadDocumentFromFile(
                  assetId,
                  file,
                  documentType: "PHOTO",
                );
              }

              await ref
                  .read(assetDetailControllerProvider.notifier)
                  .loadAsset(assetId);
            },
          ),
          const SizedBox(height: 24),
        ],

        /// =============================
        /// OTHER DOCS UPLOADER
        /// =============================
        if (remainingOthers > 0)
          DocumentUploader(
            title: t.translate('other_documents'),
            uploaderType: UploaderType.asset,
            pickType: FilePickType.imageOrPdf,
            filesNotifier: otherFiles,
            maxFiles: remainingOthers,
            assetId: assetId,
            documentType: "OTHER",
            onFilesSelected: (files) async {
              final controller = ref.read(assetEditControllerProvider.notifier);

              for (final file in files) {
                await controller.uploadDocumentFromFile(
                  assetId,
                  file,
                  documentType: "OTHER",
                );
              }

              await ref
                  .read(assetDetailControllerProvider.notifier)
                  .loadAsset(assetId);
            },
          ),
          // DocumentUploader(
          //   title: t.translate('other_documents'),
          //   uploaderType: UploaderType.asset,
          //   pickType: FilePickType.imageOrPdf,
          //   filesNotifier: otherFiles,
          //   maxFiles: remainingOthers,
          //   assetId: assetId,
          //   documentType: "OTHER",
          // ),

        /// =============================
        /// LIMIT MESSAGE
        /// =============================
        if (remainingPhotos == 0 && remainingOthers == 0)
          Container(
            padding: const EdgeInsets.all(16),
            margin: const EdgeInsets.only(top: 16),
            decoration: BoxDecoration(
              color: Colors.orange.shade50,
              borderRadius: BorderRadius.circular(8),
              border: Border.all(color: Colors.orange.shade200),
            ),
            child: Row(
              children: [
                const Icon(Icons.info_outline, color: Colors.orange),
                const SizedBox(width: 10),
                Expanded(
                  child: Text(
                    t.translate('max_documents_uploaded'),
                    style: AppTheme.body2,
                  ),
                ),
              ],
            ),
          ),
      ],
    );
  }
}
