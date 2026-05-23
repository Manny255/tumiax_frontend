// lib/shared/widgets/document_uploader/asset/asset_grid_view.dart
import 'dart:io';
import 'package:flutter/material.dart';
import '../../../../core/themes/app_theme.dart';
import 'asset_thumbnail.dart';

class AssetGridView extends StatelessWidget {
  final List<File> files;
  final int maxFiles;
  final VoidCallback onAddPressed;
  final Function(int) onRemove;

  const AssetGridView({
    super.key,
    required this.files,
    required this.maxFiles,
    required this.onAddPressed,
    required this.onRemove,
  });

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        crossAxisSpacing: 8,
        mainAxisSpacing: 8,
        childAspectRatio: 1,
      ),
      itemCount: files.length + (files.length < maxFiles ? 1 : 0),
      itemBuilder: (context, index) {
        if (index == files.length) {
          return _buildAddButton();
        }
        return AssetThumbnail(
          file: files[index],
          index: index,
          onRemove: () => onRemove(index),
        );
      },
    );
  }

  Widget _buildAddButton() {
    return InkWell(
      onTap: onAddPressed,
      borderRadius: BorderRadius.circular(8),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.grey.shade50,
          borderRadius: BorderRadius.circular(8),
          border: Border.all(
            color: Colors.grey.shade300,
            style: BorderStyle.solid,
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: AppTheme.primaryColor.withOpacity(0.1),
                shape: BoxShape.circle,
              ),
              child: Icon(Icons.add, color: AppTheme.primaryColor, size: 20),
            ),
            const SizedBox(height: 4),
            Text(
              'Add',
              style: AppTheme.caption.copyWith(
                color: AppTheme.primaryColor,
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
