// presentation/pages/add_asset_page/steps/documents_step.dart
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:lottie/lottie.dart';
import '../../../../../../core/themes/app_theme.dart';
import '../../../../../../core/localization/app_localizations.dart';
import '../../../../../../shared/document_uploader/document_uploader.dart';
import '../../../../../../shared/document_uploader/models/uploader_types.dart';


class DocumentsStep extends ConsumerWidget {
  final ValueNotifier<List<File>> images;
  final ValueNotifier<List<File>> documents;
  final GlobalKey<FormState> formKey;
  final double fadeAnimation;

  const DocumentsStep({
    super.key,
    required this.images,
    required this.documents,
    required this.formKey,
    required this.fadeAnimation,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final t = AppLocalizations.of(context);

    return FadeTransition(
      opacity: AlwaysStoppedAnimation(fadeAnimation),
      child: Padding(
        padding: const EdgeInsets.all(AppTheme.defaultPadding),
        child: Form(
          key: formKey,
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(
                  child: Container(
                    height: 150,
                    child: Lottie.asset(
                      'assets/animations/upload.json',
                      fit: BoxFit.contain,
                      errorBuilder: (context, error, stackTrace) {
                        return Container(
                          height: 150,
                          decoration: BoxDecoration(
                            color: AppTheme.primaryColor.withOpacity(0.1),
                            shape: BoxShape.circle,
                          ),
                          child: const Icon(
                            Icons.cloud_upload,
                            size: 80,
                            color: AppTheme.primaryColor,
                          ),
                        );
                      },
                    ),
                  ),
                ),
                const SizedBox(height: 16),
                Text(t.translate('documents_info'), style: AppTheme.heading3),
                const SizedBox(height: 8),
                Text(
                  t.translate('documents_info_desc'),
                  style: AppTheme.body2.copyWith(color: Colors.grey),
                ),
                const SizedBox(height: 24),

                // Asset Images (Required)
                DocumentUploader(
                  title: t.translate('asset_images'),
                  uploaderType: UploaderType.asset,
                  pickType: FilePickType.assetPhoto,
                  filesNotifier: images,
                  maxFiles: 5,
                ),
                const SizedBox(height: 16),

                // Other Documents (Optional)
                DocumentUploader(
                  title: t.translate('other_documents'),
                  uploaderType: UploaderType.asset,
                  pickType: FilePickType.imageOrPdf,
                  filesNotifier: documents,
                  maxFiles: 3,
                  optional: true,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
