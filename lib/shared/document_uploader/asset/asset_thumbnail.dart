// lib/shared/widgets/document_uploader/asset/asset_thumbnail.dart
import 'dart:io';
import 'package:flutter/material.dart';
import '../../../../core/themes/app_theme.dart';

class AssetThumbnail extends StatelessWidget {
  final File file;
  final int index;
  final VoidCallback onRemove;

  const AssetThumbnail({
    super.key,
    required this.file,
    required this.index,
    required this.onRemove,
  });

  bool _isImageFile(String path) {
    final extension = path.split('.').last.toLowerCase();
    return ['jpg', 'jpeg', 'png', 'gif', 'webp'].contains(extension);
  }

  String _getFileName(String path) {
    final parts = path.split('/');
    return parts.isNotEmpty ? parts.last : 'file.pdf';
  }

  @override
  Widget build(BuildContext context) {
    final isImage = _isImageFile(file.path);
    final fileName = _getFileName(file.path);

    return Stack(
      children: [
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            border: Border.all(color: Colors.grey.shade200),
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: isImage
                ? Image.file(
                    file,
                    width: double.infinity,
                    height: double.infinity,
                    fit: BoxFit.cover,
                  )
                : _buildPdfThumbnail(fileName),
          ),
        ),
        Positioned(
          top: 4,
          right: 4,
          child: GestureDetector(
            onTap: onRemove,
            child: Container(
              padding: const EdgeInsets.all(2),
              decoration: const BoxDecoration(
                color: AppTheme.errorColor,
                shape: BoxShape.circle,
              ),
              child: const Icon(Icons.close, color: Colors.white, size: 12),
            ),
          ),
        ),
      ],
    );
  }

Widget _buildPdfThumbnail(String fileName) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      decoration: BoxDecoration(
        color: AppTheme.primaryColor.withOpacity(0.08),
        border: Border.all(color: AppTheme.primaryColor.withOpacity(0.25)),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // PDF Icon
          Container(
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: AppTheme.lightSurface,
              borderRadius: BorderRadius.circular(6),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.04),
                  blurRadius: 4,
                  offset: const Offset(0, 2),
                ),
              ],
            ),
            child: const Icon(
              Icons.picture_as_pdf,
              size: 22,
              color: AppTheme.primaryColor,
            ),
          ),
          const SizedBox(height: 6),

          // Filename (truncated)
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 6),
            child: Text(
              _truncateFileName(fileName),
              style: AppTheme.caption.copyWith(
                fontSize: 9,
                fontWeight: FontWeight.w600,
                color: AppTheme.primaryDeepBlue,
              ),
              maxLines: 2,
              textAlign: TextAlign.center,
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ],
      ),
    );
  }

  String _truncateFileName(String fileName, {int maxLength = 10}) {
    if (fileName.length <= maxLength) return fileName;
    return '${fileName.substring(0, 5)}...${fileName.substring(fileName.length - 3)}';
  }
}
