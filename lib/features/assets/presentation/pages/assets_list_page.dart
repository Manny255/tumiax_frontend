import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/localization/app_localizations.dart';
import '../../../../core/themes/app_theme.dart';
import '../../../../core/widgets/empty_state.dart';
import '../../../../core/routing/route_names.dart';
import '../../../auth/domain/models/failure.dart';
import '../../data/models/asset_model.dart';
import '../controllers/asset_controller.dart';
import '../widgets/asset_card.dart';
import '../widgets/asset_status_tabs.dart';

class AssetListPage extends HookConsumerWidget {
  const AssetListPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final t = AppLocalizations.of(context);
    final scrollController = useScrollController();
    final selectedStatus = useState<String?>('all');

    final assetsAsync = ref.watch(assetListControllerProvider);
    final controller = ref.read(assetListControllerProvider.notifier);

    /// ------------------------------------------------
    /// FETCH ASSETS AFTER FIRST FRAME
    /// ------------------------------------------------
    useEffect(() {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        controller.fetchAssets();
      });
      return null;
    }, []);

    List<AssetModel> filterAssets(List<AssetModel> assets) {
      var filtered = assets;

      if (selectedStatus.value != null && selectedStatus.value != 'all') {
        filtered = filtered.where((a) {
          if (selectedStatus.value == 'verified') {
            return a.verificationStatus == 'VERIFIED';
          }

          if (selectedStatus.value == 'pending') {
            return a.verificationStatus == 'SUBMITTED' ||
                a.verificationStatus == 'UNDER_REVIEW';
          }

          if (selectedStatus.value == 'draft') {
            return a.verificationStatus == 'DRAFT';
          }

          if (selectedStatus.value == 'rejected') {
            return a.verificationStatus == 'REJECTED';
          }

          return true;
        }).toList();
      }

      return filtered;
    }

    Widget buildBody() {
      if (assetsAsync.isLoading) {
        return const Center(
          child: CircularProgressIndicator(color: AppTheme.primaryColor),
        );
      }

      if (assetsAsync.hasError) {
        final error = assetsAsync.error;

        if (error is KycRequiredFailure) {
          return _buildKycRequired(context, t);
        }

        return Center(
          child: EmptyState(
            icon: Icons.error_outline,
            title: t.translate('error_loading_assets'),
            subtitle: error.toString(),
          ),
        );
      }

      final assets = assetsAsync.value ?? [];
      final filteredAssets = filterAssets(assets);

      if (filteredAssets.isEmpty) {
        return _buildEmptyState(context, t, selectedStatus.value);
      }

      return GridView.builder(
        controller: scrollController,
        padding: const EdgeInsets.all(AppTheme.defaultPadding),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 0.85,
          crossAxisSpacing: 12,
          mainAxisSpacing: 12,
        ),
        itemCount: filteredAssets.length,
        itemBuilder: (context, index) {
          final asset = filteredAssets[index];

          return AssetCard(
            asset: asset,
            onTap: () {
              context.push('${RouteNames.assets}/${asset.id}');
            },
          );
        },
      );
    }

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios, color: AppTheme.primaryColor),
          onPressed: () => context.pop(),
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Text(
          t.translate('my_assets'),
          style: AppTheme.heading3.copyWith(color: AppTheme.primaryColor),
        ),
      ),
      body: Column(
        children: [
          AssetStatusTabs(
            selectedStatus: selectedStatus.value!,
            onStatusChanged: (status) {
              selectedStatus.value = status;
            },
          ),
          const SizedBox(height: 8),
          Expanded(
            child: RefreshIndicator(
              onRefresh: controller.refreshAssets,
              color: AppTheme.primaryColor,
              child: buildBody(),
            ),
          ),
        ],
      ),
    );
  }

 Widget _buildKycRequired(BuildContext context, AppLocalizations t) {
    return Center(
      child: SingleChildScrollView(
        child: EmptyState(
          icon: Icons.lock_outline,
          title: t.translate('kyc_required_title'),
          subtitle: t.translate('kyc_required_message'),
          onAction: () {
            context.push(RouteNames.kycVerification);
          },
          actionLabel: t.translate('verify'),
        ),
      ),
    );
  }

  Widget _buildEmptyState(
    BuildContext context,
    AppLocalizations t,
    String? status,
  ) {
    String title;
    String message;
    IconData icon;

    if (status == 'verified') {
      title = t.translate('no_verified_assets');
      message = t.translate('no_verified_assets_message');
      icon = Icons.verified_outlined;
    } else if (status == 'pending') {
      title = t.translate('no_pending_assets');
      message = t.translate('no_pending_assets_message');
      icon = Icons.hourglass_empty;
    } else if (status == 'rejected') {
      title = t.translate('no_rejected_assets');
      message = t.translate('no_rejected_assets_message');
      icon = Icons.cancel_outlined;
    } else {
      title = t.translate('no_assets_yet');
      message = t.translate('add_your_first_asset');
      icon = Icons.inventory_2_outlined;
    }

    return Center(
      child: SingleChildScrollView(
        child: EmptyState(icon: icon, title: title, subtitle: message),
      ),
    );
  }
}
