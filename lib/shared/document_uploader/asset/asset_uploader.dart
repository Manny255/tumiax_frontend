import 'dart:io';
import 'package:flutter/material.dart';
import 'package:file_picker/file_picker.dart';

import '../../../../core/themes/app_theme.dart';
import '../../../../core/localization/app_localizations.dart';
import '../asset/asset_grid_view.dart';
import '../cameras/asset_camera_screen.dart';
import '../models/uploader_types.dart';

class AssetUploader extends StatefulWidget {
  final String title;
  final ValueNotifier<List<File>> filesNotifier;
  final FilePickType pickType;
  final int maxFiles;
  final bool optional;
  final String? documentType;
  final String userId;
  final String? assetId;
  final Future<void> Function(List<File> files)? onFilesSelected;

  const AssetUploader({
    super.key,
    required this.title,
    required this.filesNotifier,
    required this.pickType,
    required this.maxFiles,
    this.optional = false,
    this.documentType,
    required this.userId,
    this.assetId,
    this.onFilesSelected,
  });

  @override
  State<AssetUploader> createState() => _AssetUploaderState();
}

class _AssetUploaderState extends State<AssetUploader> {
  bool _isCapturing = false;

  Future<void> _handleAdd() async {
    if (_isCapturing) return;

    final t = AppLocalizations.of(context);

    final remaining = widget.maxFiles - widget.filesNotifier.value.length;

    if (remaining <= 0) {
      _showSnackBar(
        t.translate(
          'max_files_allowed',
          params: {'count': widget.maxFiles.toString()},
        ),
      );
      return;
    }

    switch (widget.pickType) {
      case FilePickType.assetPhoto:
        await _takePhoto();
        break;

      case FilePickType.imageOrPdf:
        await _pickDocument();
        break;

      default:
        await _takePhoto();
    }
  }

  Future<void> _takePhoto() async {
    if (_isCapturing) return;

    final t = AppLocalizations.of(context);
    _isCapturing = true;

    try {
      final file = await Navigator.push(
        context,
        MaterialPageRoute(
          builder: (_) =>
              AssetCameraScreen(userId: widget.userId, assetId: widget.assetId),
          fullscreenDialog: true,
        ),
      );

      if (file != null && mounted) {
        final newList = List<File>.from(widget.filesNotifier.value)..add(file);
        widget.filesNotifier.value = newList;

        if (widget.onFilesSelected != null) {
          await widget.onFilesSelected!([file]);
        }
        // widget.filesNotifier.value = newList;
      }
    } catch (e) {
      if (mounted) {
        _showSnackBar(t.translate('camera_open_failed'));
      }
    } finally {
      _isCapturing = false;
    }
  }

  Future<void> _pickDocument() async {
    if (_isCapturing) return;

    final t = AppLocalizations.of(context);
    _isCapturing = true;

    try {
      final result = await FilePicker.platform.pickFiles(
        type: FileType.custom,
        allowedExtensions: ['pdf', 'jpg', 'jpeg', 'png'],
        allowMultiple: false,
      );

      if (result != null && result.files.single.path != null && mounted) {
        final file = File(result.files.single.path!);

        final newList = List<File>.from(widget.filesNotifier.value)..add(file);
        widget.filesNotifier.value = newList;

        if (widget.onFilesSelected != null) {
          await widget.onFilesSelected!([file]);
        }

        // widget.filesNotifier.value = newList;
      }
    } catch (e) {
      if (mounted) {
        _showSnackBar(t.translate('file_pick_failed'));
      }
    } finally {
      _isCapturing = false;
    }
  }

  void _showSnackBar(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(message), backgroundColor: AppTheme.errorColor),
    );
  }

  void _removeFile(int index) {
    final newList = List<File>.from(widget.filesNotifier.value)
      ..removeAt(index);

    widget.filesNotifier.value = newList;
  }

  @override
  Widget build(BuildContext context) {
    final t = AppLocalizations.of(context);

    return ValueListenableBuilder<List<File>>(
      valueListenable: widget.filesNotifier,
      builder: (context, files, child) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            /// HEADER
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Text(
                      widget.title,
                      style: AppTheme.body1.copyWith(
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
                Text(
                  '${files.length}/${widget.maxFiles}',
                  style: AppTheme.caption.copyWith(
                    color: files.length >= widget.maxFiles
                        ? AppTheme.errorColor
                        : Colors.grey,
                  ),
                ),
              ],
            ),

            const SizedBox(height: 8),

            /// GRID OR EMPTY STATE
            if (files.isNotEmpty)
              AssetGridView(
                files: files,
                maxFiles: widget.maxFiles,
                onAddPressed: _handleAdd,
                onRemove: _removeFile,
              )
            else
              _buildEmptyState(t),
          ],
        );
      },
    );
  }

  Widget _buildEmptyState(AppLocalizations t) {
    final isCameraOnly = widget.pickType == FilePickType.assetPhoto;

    return InkWell(
      onTap: _handleAdd,
      borderRadius: BorderRadius.circular(12),
      child: Container(
        height: 100,
        decoration: BoxDecoration(
          color: Colors.grey.shade50,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: Colors.grey.shade300),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              isCameraOnly ? Icons.camera_alt : Icons.cloud_upload,
              size: 32,
              color: AppTheme.primaryColor,
            ),
            const SizedBox(height: 8),
            Text(
              widget.optional
                  ? (widget.documentType == 'INSURANCE'
                        ? t.translate('upload_insurance_optional')
                        : t.translate('tap_upload_optional'))
                  : isCameraOnly
                  ? t.translate('take_asset_photo')
                  : t.translate('tap_upload_file'),
              style: AppTheme.caption.copyWith(color: Colors.grey.shade600),
            ),
          ],
        ),
      ),
    );
  }
}
