import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';

import '../../../../core/localization/app_localizations.dart';
import '../../../../core/routing/route_helpers.dart';
import '../../../../core/themes/app_theme.dart';
import '../../../../core/widgets/async_value_widget.dart';
import '../../../../core/widgets/tumiax_button.dart';
import '../../../../core/routing/route_names.dart';
import '../../../insurance/presentation/widgets/asset_insurance_card.dart';
import '../../data/models/asset_model.dart';
import '../controllers/asset_detail_controller.dart';
import '../widgets/asset_status_badge.dart';
import '../widgets/asset_info_section.dart';
import '../widgets/asset_document_grid.dart';
import '../widgets/asset_rejection_details.dart';

class AssetDetailPage extends HookConsumerWidget {
  final String assetId;

  const AssetDetailPage({super.key, required this.assetId});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final t = AppLocalizations.of(context);
    final formatCurrency = NumberFormat.currency(
      locale: 'en_TZ',
      symbol: 'TZS ',
      decimalDigits: 0,
    );

    final assetDetailController = ref.watch(assetDetailControllerProvider);
    final controller = ref.read(assetDetailControllerProvider.notifier);
   

    useEffect(() {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        controller.loadAsset(assetId);
      });
      return null;
    }, [assetId]);

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios, color: AppTheme.primaryColor),
          onPressed: () {
            if (context.mounted) {
              context.pop();
            } else {
              GoRouter.of(context).go(RouteNames.home);
            }
          },
        ),
        title: Text(
          t.translate('asset_details'),
          style: AppTheme.heading3.copyWith(color: AppTheme.primaryColor),
        ),
        // actions: [
        //   if (status != null && (status.isEditable || status.isRejected))
        //     IconButton(
        //       icon: const Icon(Icons.edit, color: AppTheme.primaryColor),
        //       onPressed: () {
        //         context.pushNamed(
        //           RouteNames.editAsset,
        //           pathParameters: {'id': assetId},
        //         );
        //       },
        //     ),
        // ],
      ),
      body: AsyncValueWidget<AssetModel?>(
        value: assetDetailController,
        loadingHeight: 400,
        onData: (asset) {
          if (asset == null) {
            return const SizedBox.shrink();
          }

          final status = AssetStatus.fromString(asset.verificationStatus);

          return SingleChildScrollView(
            padding: const EdgeInsets.all(AppTheme.defaultPadding),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Header with image or category icon
                _buildHeader(asset, status, formatCurrency, t),

                const SizedBox(height: 24),

                // Status Banner
                if (status.isPending) _buildPendingBanner(t),
                if (status.isRejected)
                  AssetRejectionDetails(
                    rejectionReasons: asset.rejectionReasons ?? {},
                  ),
                if (status.isVerified) _buildVerifiedBanner(t),

                // Only show asset details if status is NOT verified, pending, or rejected
                // This means only show for draft assets
                if (!status.isVerified &&
                    !status.isPending &&
                    !status.isRejected) ...[
                  const SizedBox(height: 16),

                  // Basic Information
                  AssetInfoSection(
                    title: t.translate('basic_information'),
                    icon: Icons.info_outline,
                    children: [
                      _buildInfoRow(t.translate('title'), asset.title),
                      _buildInfoRow(
                        t.translate('category'),
                        asset.resolvedCategory?.name ?? 'N/A',
                      ),
                      _buildInfoRow(
                        t.translate('description'),
                        asset.description ?? 'N/A',
                      ),
                    ],
                  ),

                  const SizedBox(height: 16),

                  // Financial Information
                  AssetInfoSection(
                    title: t.translate('financial_information'),
                    icon: Icons.attach_money,
                    children: [
                      _buildInfoRow(
                        t.translate('purchase_price'),
                        formatCurrency.format(asset.purchasePrice ?? 0),
                      ),
                      _buildInfoRow(
                        t.translate('current_value'),
                        formatCurrency.format(asset.currentMarketValue),
                        valueColor: AppTheme.primaryColor,
                      ),
                      if (asset.purchaseDate != null)
                        _buildInfoRow(
                          t.translate('purchase_date'),
                          DateFormat('dd MMM yyyy').format(asset.purchaseDate!),
                        ),
                    ],
                  ),

                  const SizedBox(height: 16),

                  // Condition Information
                  AssetInfoSection(
                    title: t.translate('condition_information'),
                    icon: Icons.build,
                    children: [
                      _buildInfoRow(t.translate('condition'), asset.condition),
                      if (asset.conditionScore != null)
                        _buildInfoRow(
                          t.translate('condition_score'),
                          '${asset.conditionScore}/100',
                        ),
                    ],
                  ),

                  const SizedBox(height: 16),

                  // Location Information
                  if (asset.locationAddress != null)
                    AssetInfoSection(
                      title: t.translate('location'),
                      icon: Icons.location_on,
                      children: [
                        _buildInfoRow(
                          t.translate('address'),
                          asset.locationAddress!,
                        ),
                      ],
                    ),

                  const SizedBox(height: 24),

                  // Documents
                  Text(t.translate('documents'), style: AppTheme.heading3),
                  const SizedBox(height: 12),

                  AssetDocumentGrid(
                    assetId: asset.id,
                    documents: asset.documents ?? [],
                  ),

                  const SizedBox(height: 24),
                ],

                // Action Buttons based on status
                _buildActionButtons(context, asset, status, controller, t),
              ],
            ),
          );
        },
      ),
    );
  }
Widget _buildHeader(
    AssetModel asset,
    AssetStatus status,
    NumberFormat formatCurrency,
    AppLocalizations t,
  ) {
    final imageUrl = asset.primaryPhotoUrl;

    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            _getCategoryColor(asset.resolvedCategory?.name),
            _getCategoryColor(asset.resolvedCategory?.name).withOpacity(0.7),
          ],
        ),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          /// TOP ROW (Image + Title)
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              /// Asset Image / Icon
              Container(
                width: 64,
                height: 64,
                padding: imageUrl == null
                    ? const EdgeInsets.all(16)
                    : EdgeInsets.zero,
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.2),
                  borderRadius: BorderRadius.circular(16),
                ),
                child: imageUrl != null
                    ? ClipRRect(
                        borderRadius: BorderRadius.circular(16),
                        child: Image.network(
                          imageUrl,
                          fit: BoxFit.cover,
                          errorBuilder: (_, __, ___) {
                            return Icon(
                              _getCategoryIcon(asset.resolvedCategory?.name),
                              size: 32,
                              color: Colors.white,
                            );
                          },
                        ),
                      )
                    : Icon(
                        _getCategoryIcon(asset.resolvedCategory?.name),
                        size: 32,
                        color: Colors.white,
                      ),
              ),

              const SizedBox(width: 16),

              /// Title + Status
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      asset.title,
                      style: AppTheme.heading3.copyWith(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                    const SizedBox(height: 8),
                    AssetStatusBadge(status: status),
                  ],
                ),
              ),
            ],
          ),

          const SizedBox(height: 24),

          /// VALUE SECTION (Vertical Layout)
          Text(
            t.translate('current_value'),
            style: AppTheme.body2.copyWith(color: Colors.white70),
          ),

          const SizedBox(height: 6),

          Text(
            formatCurrency.format(asset.currentMarketValue),
            style: AppTheme.heading2.copyWith(
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildInfoRow(String label, String value, {Color? valueColor}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: 120,
            child: Text(
              label,
              style: AppTheme.caption.copyWith(color: Colors.grey.shade600),
            ),
          ),
          Expanded(
            child: Text(
              value,
              style: AppTheme.body2.copyWith(
                fontWeight: FontWeight.w500,
                color: valueColor,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildPendingBanner(AppLocalizations t) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.orange.shade50,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.orange.shade200),
      ),
      child: Row(
        children: [
          const Icon(Icons.info_outline, color: Colors.orange),
          const SizedBox(width: 12),
          Expanded(
            child: Text(
              t.translate('asset_pending_review'),
              style: AppTheme.body2.copyWith(color: Colors.orange.shade700),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildVerifiedBanner(AppLocalizations t) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.green.shade50,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.green.shade200),
      ),
      child: Row(
        children: [
          const Icon(Icons.verified, color: Colors.green),
          const SizedBox(width: 12),
          Expanded(
            child: Text(
              t.translate('asset_verified'),
              style: AppTheme.body2.copyWith(color: Colors.green.shade700),
            ),
          ),
        ],
      ),
    );
  }

Widget _buildActionButtons(
    BuildContext context,
    AssetModel asset,
    AssetStatus status,
    AssetDetailController controller,
    AppLocalizations t,
  ) {
    final requiresInsurance = asset.resolvedCategory?.requiresInsurance == true;
    // Check for rejected FIRST before isEditable
    if (status.isRejected) {
      return TumiaxButton(
        text: t.translate('edit_and_resubmit'),
        onPressed: () {
          context.pushNamed(
            RouteNames.editAsset,
            pathParameters: {'id': asset.id},
          );
        },
      );
    }

    if (status.isEditable) {
      // This will now only be for DRAFT
      return Column(
        children: [
          if (requiresInsurance) ...[
            AssetInsuranceCard(
              asset: asset,
              onAddInsurance: () {
                context.push(
                  RouteHelpers.addInsurance(
                    assetId: asset.id,
                    assetTitle: asset.title,
                  ),
                );
              },
            ),
            const SizedBox(height: 12),
          ],

        TumiaxButton(
          text: t.translate('edit'),
          onPressed: () {
            context.pushNamed(
              RouteNames.editAsset,
              pathParameters: {'id': asset.id},
            );
          },
        ),
        
          const SizedBox(height: 12),
          TumiaxButton(
            text: t.translate('submit_for_review'),
            onPressed: () => _submitAsset(context, asset, controller, t),
          ),
        ],
      );
    }

    if (status.isPending) {
      return Center(
        child: Text(
          t.translate('under_review_message'),
          style: AppTheme.body1.copyWith(color: Colors.grey),
        ),
      );
    }

    return const SizedBox.shrink();
  }

Future<void> _submitAsset(
    BuildContext context,
    AssetModel asset,
    AssetDetailController controller,
    AppLocalizations t,
  ) async {
    final requiresInsurance = asset.category?.requiresInsurance == true;
     final hasInsurance =
        asset.hasActiveInsurance ?? asset.insurancePolicy?.active ?? false;
    /// BLOCK submission if insurance is required but missing
    if (requiresInsurance && !hasInsurance) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            t.translate(
              'insurance_required_for',
              params: {'asset': asset.title},
            ),
          ),
          backgroundColor: AppTheme.errorColor,
        ),
      );
      return;
    }

    try {
      await controller.submitAsset(asset.id);

      if (context.mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(t.translate('asset_submitted')),
            backgroundColor: AppTheme.secondaryColor,
          ),
        );
      }
    } catch (e) {
      if (context.mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Error: $e'),
            backgroundColor: AppTheme.errorColor,
          ),
        );
      }
    }
  }

  Future<void> _valuateAsset(
    BuildContext context,
    String assetId,
    AssetDetailController controller,
    AppLocalizations t,
  ) async {
    try {
      await controller.valuateAsset(assetId);
      if (context.mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(t.translate('valuation_complete')),
            backgroundColor: AppTheme.secondaryColor,
          ),
        );
      }
    } catch (e) {
      if (context.mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Error: $e'),
            backgroundColor: AppTheme.errorColor,
          ),
        );
      }
    }
  }

  IconData _getCategoryIcon(String? category) {
    switch (category?.toLowerCase() ?? '') {
      case 'motorcycle':
        return Icons.motorcycle;
      case 'car':
        return Icons.directions_car;
      case 'house':
        return Icons.home;
      case 'land':
        return Icons.landscape;
      default:
        return Icons.attach_money;
    }
  }

  Color _getCategoryColor(String? category) {
    switch (category?.toLowerCase() ?? '') {
      case 'motorcycle':
        return Colors.orange;
      case 'car':
        return Colors.blue;
      case 'house':
        return Colors.green;
      case 'land':
        return Colors.brown;
      default:
        return AppTheme.primaryColor;
    }
  }
}
