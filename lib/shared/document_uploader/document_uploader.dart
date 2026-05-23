// lib/shared/widgets/document_uploader/document_uploader.dart
import 'dart:io';
import 'package:flutter/material.dart';
import 'models/uploader_types.dart';
import 'asset/asset_uploader.dart';
import 'kyc/kyc_uploader.dart';

class DocumentUploader extends StatelessWidget {
  // Common properties
  final String title;
  final UploaderType uploaderType;
  final FilePickType pickType; // Make sure this is passed through
  final IconData icon;
  final bool optional;
  final String? userId;
  final String? assetId;

  // Asset-specific
  final ValueNotifier<List<File>>? filesNotifier;
  final int? maxFiles;
  final String? documentType;

  // KYC-specific
  final ValueNotifier<File?>? fileNotifier;

  final Future<void> Function(List<File> files)? onFilesSelected;

  const DocumentUploader({
    super.key,
    required this.title,
    required this.uploaderType,
    required this.pickType, // REQUIRED
    this.icon = Icons.upload_file,
    this.optional = false,
    this.userId,
    this.assetId,
    // Asset
    this.filesNotifier,
    this.maxFiles,
    this.documentType,
    // KYC
    this.fileNotifier,

    this.onFilesSelected,
  }) : assert(
         (uploaderType == UploaderType.asset && filesNotifier != null) ||
             (uploaderType == UploaderType.kyc && fileNotifier != null),
         'filesNotifier required for asset, fileNotifier required for kyc',
       );

  @override
  Widget build(BuildContext context) {
    if (uploaderType == UploaderType.asset) {
      return AssetUploader(
        title: title,
        filesNotifier: filesNotifier!,
        pickType: pickType,
        maxFiles: maxFiles ?? 5,
        optional: optional,
        documentType: documentType,
        userId: userId ?? 'ASSET',
        assetId: assetId,
        onFilesSelected: onFilesSelected,
      );
    } else {
      return KYCUploader(
        title: title,
        fileNotifier: fileNotifier!,
        pickType: pickType,
        userId: userId,
        icon: icon,
        optional: optional,
      );
    }
  }
}
