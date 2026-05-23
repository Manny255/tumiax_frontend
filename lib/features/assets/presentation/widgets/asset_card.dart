import 'package:flutter/material.dart';

import '../../../../core/themes/app_theme.dart';
import '../../data/models/asset_model.dart';
import 'asset_status_badge.dart';

class AssetCard extends StatelessWidget {
  final AssetModel asset;
  final VoidCallback onTap;

  const AssetCard({super.key, required this.asset, required this.onTap});

  @override
  Widget build(BuildContext context) {

    final status = AssetStatus.fromString(asset.verificationStatus);

   final imageUrl = asset.primaryPhotoUrl;

    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(12),
        child: Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(12),
            border: Border.all(color: Colors.grey.shade200),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              /// Image Section
              Expanded(
                flex: 3,
                child: ClipRRect(
                  borderRadius: const BorderRadius.vertical(
                    top: Radius.circular(12),
                  ),
                  child: Stack(
                    fit: StackFit.expand,
                    children: [
                      /// Image
                      if (imageUrl != null)
                        Image.network(
                          imageUrl,
                          fit: BoxFit.cover,
                          errorBuilder: (context, error, stackTrace) {
                            return Container(
                              color: Colors.grey.shade100,
                              child: Center(
                                child: Icon(
                                  Icons.image_not_supported_outlined,
                                  size: 30,
                                  color: Colors.grey.shade400,
                                ),
                              ),
                            );
                          },
                        )
                      else
                        Container(
                          color: Colors.grey.shade100,
                          child: Center(
                            child: Icon(
                              Icons.image_outlined,
                              size: 30,
                              color: Colors.grey.shade400,
                            ),
                          ),
                        ),

                      /// Status Badge
                      Positioned(
                        top: 8,
                        right: 8,
                        child: AssetStatusBadge(status: status, compact: true),
                      ),

                      /// Insurance Badge
                      if (asset.hasActiveInsurance == true)
                        Positioned(
                          top: 8,
                          left: 8,
                          child: Container(
                            padding: const EdgeInsets.all(4),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              shape: BoxShape.circle,
                            ),
                            child: const Icon(
                              Icons.security,
                              size: 14,
                              color: AppTheme.secondaryColor,
                            ),
                          ),
                        ),
                    ],
                  ),
                ),
              ),

              /// Title Section
              Expanded(
                flex: 1,
                child: Padding(
                  padding: const EdgeInsets.all(10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        asset.title,
                        style: const TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w600,
                          height: 1.2,
                        ),
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
