// lib/shared/widgets/document_uploader/kyc/kyc_uploader.dart
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:file_picker/file_picker.dart';
import '../../../../core/themes/app_theme.dart';
import '../../../../core/localization/app_localizations.dart';
import '../cameras/secure_camera_screen.dart';
import '../models/uploader_types.dart';
import 'kyc_list_item.dart';

class KYCUploader extends StatefulWidget {
  final String title;
  final ValueNotifier<File?> fileNotifier;
  final FilePickType pickType;
  final String? userId;
  final IconData icon;
  final bool optional;

  const KYCUploader({
    super.key,
    required this.title,
    required this.fileNotifier,
    required this.pickType,
    this.userId,
    this.icon = Icons.upload_file,
    this.optional = false,
  });

  @override
  State<KYCUploader> createState() => _KYCUploaderState();
}

class _KYCUploaderState extends State<KYCUploader> {
  final ImagePicker _picker = ImagePicker();
  bool _isCameraInitializing = false;

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<File?>(
      valueListenable: widget.fileNotifier,
      builder: (_, file, __) {
        return KYCListItem(
          title: widget.title,
          file: file,
          icon: widget.icon,
          optional: widget.optional,
          onTap: _handleUpload,
          onRemove: _removeFile,
        );
      },
    );
  }

  Future<void> _handleUpload() async {
    if (_isCameraInitializing) return;

    switch (widget.pickType) {
      case FilePickType.selfieSecure:
        await _takeSecureSelfie();
        break;
      case FilePickType.imageOnly:
        _showImagePicker();
        break;
      case FilePickType.imageOrPdf:
        await _pickDocument();
        break;
      default:
        _showImagePicker();
    }
  }

  Future<void> _takeSecureSelfie() async {
    final t = AppLocalizations.of(context);
    _isCameraInitializing = true;

    try {
      final file = await Navigator.push(
        context,
        MaterialPageRoute(
          builder: (_) =>
              SecureCameraScreen(userId: widget.userId ?? "UNKNOWN"),
          fullscreenDialog: true,
        ),
      );

      if (file != null && mounted) {
        widget.fileNotifier.value = file;
      }
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(t.translate('camera_open_failed')),
            backgroundColor: AppTheme.errorColor,
          ),
        );
      }
    } finally {
      _isCameraInitializing = false;
    }
  }

  void _showImagePicker() {
    final t = AppLocalizations.of(context);

    showModalBottomSheet(
      context: context,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (_) => SafeArea(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ListTile(
              leading: const Icon(Icons.camera_alt),
              title: Text(t.translate('take_photo')),
              onTap: () async {
                Navigator.pop(context);
                final XFile? image = await _picker.pickImage(
                  source: ImageSource.camera,
                  maxWidth: 1024,
                  maxHeight: 1024,
                  imageQuality: 85,
                );
                if (image != null && mounted) {
                  widget.fileNotifier.value = File(image.path);
                }
              },
            ),
            ListTile(
              leading: const Icon(Icons.photo_library),
              title: Text(t.translate('choose_from_gallery')),
              onTap: () async {
                Navigator.pop(context);
                final XFile? image = await _picker.pickImage(
                  source: ImageSource.gallery,
                  maxWidth: 1024,
                  maxHeight: 1024,
                  imageQuality: 85,
                );
                if (image != null && mounted) {
                  widget.fileNotifier.value = File(image.path);
                }
              },
            ),
          ],
        ),
      ),
    );
  }

  Future<void> _pickDocument() async {
    final result = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: ['jpg', 'jpeg', 'png', 'pdf'],
    );

    if (result != null && result.files.single.path != null && mounted) {
      widget.fileNotifier.value = File(result.files.single.path!);
    }
  }

  void _removeFile() {
    final t = AppLocalizations.of(context);

    showDialog(
      context: context,
      builder: (_) => AlertDialog(
        title: Text(t.translate('remove_file')),
        content: Text(t.translate('remove_file_confirmation')),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: Text(t.translate('cancel')),
          ),
          TextButton(
            onPressed: () {
              widget.fileNotifier.value = null;
              Navigator.pop(context);
            },
            child: Text(
              t.translate('remove'),
              style: const TextStyle(color: Colors.red),
            ),
          ),
        ],
      ),
    );
  }
}
