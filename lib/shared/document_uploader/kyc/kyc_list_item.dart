// lib/shared/widgets/document_uploader/kyc/kyc_list_item.dart
import 'dart:io';
import 'package:flutter/material.dart';
import '../../../../core/themes/app_theme.dart';
import '../../../core/localization/app_localizations.dart';

class KYCListItem extends StatelessWidget {
  final String title;
  final File? file;
  final IconData icon;
  final bool optional;
  final VoidCallback onTap;
  final VoidCallback onRemove;

  const KYCListItem({
    super.key,
    required this.title,
    required this.file,
    required this.icon,
    required this.optional,
    required this.onTap,
    required this.onRemove,
  });

  bool _isPdf(File? file) => file?.path.toLowerCase().endsWith('.pdf') ?? false;

  @override
  Widget build(BuildContext context) {
    final t = AppLocalizations.of(context);
    final isUploaded = file != null;

    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: isUploaded ? AppTheme.secondaryColor : Colors.grey.shade300,
          width: isUploaded ? 2 : 1,
        ),
      ),
      child: InkWell(
        onTap: onTap,
        onLongPress: isUploaded ? onRemove : null,
        borderRadius: BorderRadius.circular(12),
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Row(
            children: [
              Container(
                width: 60,
                height: 60,
                decoration: BoxDecoration(
                  color: isUploaded
                      ? AppTheme.secondaryColor.withOpacity(0.1)
                      : Colors.grey.shade100,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: isUploaded
                    ? _isPdf(file)
                          ? const Icon(
                              Icons.picture_as_pdf,
                              size: 32,
                              color: Colors.red,
                            )
                          : ClipRRect(
                              borderRadius: BorderRadius.circular(8),
                              child: Image.file(file!, fit: BoxFit.cover),
                            )
                    : Icon(icon, color: AppTheme.primaryColor),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: AppTheme.body1.copyWith(
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    const SizedBox(height: 4),
                   Text(
                      isUploaded
                          ? "✓ ${file!.path.split('/').last}"
                          : optional
                          ? t.translate('optional_tap_upload')
                          : t.translate('required_tap_upload'),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: AppTheme.caption,
                    ),
                  ],
                ),
              ),
              Icon(
                isUploaded ? Icons.check_circle : Icons.upload,
                color: isUploaded ? AppTheme.secondaryColor : Colors.grey,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
