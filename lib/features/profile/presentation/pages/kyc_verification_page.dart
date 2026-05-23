import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';

import '../../../../core/localization/app_localizations.dart';
import '../../../../core/themes/app_theme.dart';
import '../../../../core/widgets/tumiax_button.dart';
import '../../../../core/widgets/empty_state.dart';
import '../../../../core/routing/route_names.dart';
import '../../../profile/providers/kyc_providers.dart';
import '../../../profile/presentation/controllers/kyc_controller.dart';
import '../../../profile/data/models/kyc_model.dart';
import '../widgets/kyc_status_badge.dart';

class KYCVerificationPage extends HookConsumerWidget {
  const KYCVerificationPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final t = AppLocalizations.of(context);
    final kycState = ref.watch(kycControllerProvider);
    final kycController = ref.read(kycControllerProvider.notifier);

    // Load KYC profile on initial load
    useEffect(() {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        kycController.loadKYCData();
      });
      return null;
    }, []);

    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back_ios,
            color: Theme.of(context).colorScheme.primary,
          ),
          onPressed: () => context.pop(),
        ),
        title: Text(
          t.translate('kyc_verification'),
          style: AppTheme.heading3.copyWith(
            color: Theme.of(context).colorScheme.primary,
          ),
        ),
      ),
      body: RefreshIndicator(
        onRefresh: () async {
          await kycController.loadKYCData();
        },
        color: Theme.of(context).colorScheme.primary,
        child: kycState.when(
          initial: () => const Center(child: CircularProgressIndicator()),

          loading: () => const Center(child: CircularProgressIndicator()),

          error: (message) =>
              _buildErrorState(context, t, message, kycController),

          loaded: (profile, draft, status) {
            if (profile == null) {
              return _buildNotStartedState(context, t, kycController);
            }

            // Show different UI based on status
            if (profile.isVerified) {
              return _buildVerifiedState(context, t, profile, status);
            } else if (profile.isPending) {
              return _buildPendingState(context, t, profile, status);
            } else if (profile.isRejected) {
              return _buildRejectedState(context, t, profile, kycController);
            } else if (profile.isExpired) {
              return _buildExpiredState(context, t, profile, kycController);
            } else {
              return _buildNotStartedState(context, t, kycController);
            }
          },

          submitting: () => Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const CircularProgressIndicator(),
                const SizedBox(height: 16),
                Text(
                  t.translate('submitting_kyc'),
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
              ],
            ),
          ),

          submitted: (profile) =>
              _buildVerifiedState(context, t, profile, null),

          draftSaved: () => const SizedBox.shrink(),
        ),
      ),
    );
  }

  Widget _buildErrorState(
    BuildContext context,
    AppLocalizations t,
    String message,
    KYCController controller,
  ) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    return Center(
      child: Padding(
        padding: const EdgeInsets.all(32),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: colorScheme.error.withValues(alpha: 0.1),
                shape: BoxShape.circle,
              ),
              child: Icon(
                Icons.error_outline,
                size: 48,
                color: colorScheme.error,
              ),
            ),
            const SizedBox(height: 24),
            Text(
              t.translate('failed_to_load_kyc'),
              style: theme.textTheme.titleMedium?.copyWith(
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              message,
              style: theme.textTheme.bodySmall?.copyWith(
                color: colorScheme.onSurface.withValues(alpha: 0.6),
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 24),
            TumiaxButton(
              text: t.translate('retry'),
              onPressed: () {
                controller.loadKYCData();
              },
              width: 200,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildVerifiedState(
    BuildContext context,
    AppLocalizations t,
    KYCProfile profile,
    KYCStatus? status,
  ) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    return SingleChildScrollView(
      padding: const EdgeInsets.all(AppTheme.defaultPadding),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Success Header
          Container(
            padding: const EdgeInsets.all(24),
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  colorScheme.secondary.withValues(alpha: 0.8),
                  colorScheme.secondary,
                ],
              ),
              borderRadius: BorderRadius.circular(20),
            ),
            child: Column(
              children: [
                Container(
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: Colors.white.withValues(alpha: 0.2),
                    shape: BoxShape.circle,
                  ),
                  child: Icon(
                    Icons.verified,
                    size: 48,
                    color: colorScheme.onSecondary,
                  ),
                ),
                const SizedBox(height: 16),
                Text(
                  t.translate('kyc_verified'),
                  style: AppTheme.heading3.copyWith(
                    color: colorScheme.onSecondary,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  t.translate('kyc_verified_message'),
                  style: AppTheme.body2.copyWith(
                    color: colorScheme.onSecondary.withValues(alpha: 0.9),
                  ),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ),

          const SizedBox(height: 24),

          // KYC Status Badge
          Center(child: KYCStatusBadge(profile: profile)),

          const SizedBox(height: 24),

          // Verification Details
          if (status != null)
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: theme.cardColor,
                borderRadius: BorderRadius.circular(16),
                border: Border.all(color: theme.dividerColor),
              ),
              child: Column(
                children: [
                  _buildInfoRow(
                    context,
                    icon: Icons.verified_user,
                    label: t.translate('verification_level'),
                    value: profile.level,
                  ),
                  const Divider(height: 24),
                  if (profile.verifiedAt != null)
                    _buildInfoRow(
                      context,
                      icon: Icons.calendar_today,
                      label: t.translate('verified_on'),
                      value: DateFormat(
                        'dd MMM yyyy',
                      ).format(profile.verifiedAt!),
                    ),
                  const Divider(height: 24),
                  if (profile.expiresAt != null)
                    _buildInfoRow(
                      context,
                      icon: Icons.timer,
                      label: t.translate('expires_on'),
                      value: DateFormat(
                        'dd MMM yyyy',
                      ).format(profile.expiresAt!),
                    ),
                ],
              ),
            ),
        ],
      ),
    );
  }

  Widget _buildPendingState(
    BuildContext context,
    AppLocalizations t,
    KYCProfile profile,
    KYCStatus? status,
  ) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    return SingleChildScrollView(
      padding: const EdgeInsets.all(AppTheme.defaultPadding),
      child: Column(
        children: [
          // Pending Animation/Icon
          Container(
            padding: const EdgeInsets.all(32),
            decoration: BoxDecoration(
              color: colorScheme.primaryContainer.withValues(alpha: 0.3),
              shape: BoxShape.circle,
            ),
            child: Icon(
              Icons.hourglass_empty,
              size: 64,
              color: colorScheme.primary,
            ),
          ),

          const SizedBox(height: 24),

          Text(
            t.translate('kyc_pending_title'),
            style: AppTheme.heading2.copyWith(color: colorScheme.primary),
          ),

          const SizedBox(height: 12),

          Text(
            t.translate('kyc_pending_message'),
            style: theme.textTheme.bodyLarge?.copyWith(
              color: colorScheme.onSurface.withValues(alpha: 0.7),
            ),
            textAlign: TextAlign.center,
          ),

          const SizedBox(height: 24),

          // KYC Status Badge
          Center(child: KYCStatusBadge(profile: profile)),

          const SizedBox(height: 24),

          // Timeline
          Container(
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              color: theme.cardColor,
              borderRadius: BorderRadius.circular(16),
            ),
            child: Column(
              children: [
                _buildTimelineStep(
                  context,
                  isCompleted: true,
                  title: t.translate('submitted'),
                  subtitle: profile.createdAt != null
                      ? DateFormat(
                          'dd MMM yyyy, HH:mm',
                        ).format(profile.createdAt!)
                      : '',
                ),
                _buildTimelineStep(
                  context,
                  isCompleted: false,
                  isActive: true,
                  title: t.translate('under_review'),
                  subtitle: t.translate('under_review_message'),
                ),
                _buildTimelineStep(
                  context,
                  isCompleted: false,
                  title: t.translate('verification_complete'),
                  subtitle: t.translate('verification_pending'),
                ),
              ],
            ),
          ),

          const SizedBox(height: 24),

          // Estimated time
          Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: colorScheme.primary.withValues(alpha: 0.1),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Row(
              children: [
                Icon(Icons.access_time, color: colorScheme.primary),
                const SizedBox(width: 12),
                Expanded(
                  child: Text(
                    t.translate('kyc_estimated_time'),
                    style: theme.textTheme.bodyMedium?.copyWith(
                      color: colorScheme.primary,
                    ),
                  ),
                ),
              ],
            ),
          ),

          const SizedBox(height: 24),

          // // Notification settings
          // TumiaxButton(
          //   text: t.translate('notify_me_when_done'),
          //   onPressed: () {
          //     // TODO: Enable notifications
          //   },
          //   isOutlined: true,
          // ),
        ],
      ),
    );
  }

  Widget _buildRejectedState(
    BuildContext context,
    AppLocalizations t,
    KYCProfile profile,
    KYCController controller,
  ) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    return SingleChildScrollView(
      padding: const EdgeInsets.all(AppTheme.defaultPadding),
      child: Column(
        children: [
          // Rejected Icon
          Container(
            padding: const EdgeInsets.all(32),
            decoration: BoxDecoration(
              color: colorScheme.error.withValues(alpha: 0.1),
              shape: BoxShape.circle,
            ),
            child: Icon(Icons.cancel, size: 64, color: colorScheme.error),
          ),

          const SizedBox(height: 24),

          Text(
            t.translate('kyc_rejected'),
            style: AppTheme.heading2.copyWith(color: colorScheme.error),
          ),

          const SizedBox(height: 12),

          // KYC Status Badge
          Center(child: KYCStatusBadge(profile: profile)),

          const SizedBox(height: 24),

          // Rejection Reason
          Container(
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              color: colorScheme.error.withValues(alpha: 0.05),
              borderRadius: BorderRadius.circular(16),
              border: Border.all(
                color: colorScheme.error.withValues(alpha: 0.3),
              ),
            ),
            child: Column(
              children: [
                Text(
                  t.translate('rejection_reason'),
                  style: theme.textTheme.titleMedium?.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  profile.rejectionReason ?? t.translate('no_reason_provided'),
                  style: theme.textTheme.bodyMedium,
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ),

          const SizedBox(height: 24),

          // Resubmit Button
          TumiaxButton(
            text: t.translate('resubmit_kyc'),
            onPressed: () => context.push(RouteNames.kyc),
          ),

          const SizedBox(height: 12),

          // Contact Support
          TextButton(
            onPressed: () {
              // TODO: Contact support
            },
            child: Text(
              t.translate('contact_support'),
              style: TextStyle(color: colorScheme.primary),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildExpiredState(
    BuildContext context,
    AppLocalizations t,
    KYCProfile profile,
    KYCController controller,
  ) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    return SingleChildScrollView(
      padding: const EdgeInsets.all(AppTheme.defaultPadding),
      child: Column(
        children: [
          // Expired Icon
          Container(
            padding: const EdgeInsets.all(32),
            decoration: BoxDecoration(
              color: colorScheme.onSurface.withValues(alpha: 0.1),
              shape: BoxShape.circle,
            ),
            child: Icon(
              Icons.timer_off,
              size: 64,
              color: colorScheme.onSurface.withValues(alpha: 0.5),
            ),
          ),

          const SizedBox(height: 24),

          Text(t.translate('kyc_expired'), style: AppTheme.heading2),

          const SizedBox(height: 12),

          // KYC Status Badge
          Center(child: KYCStatusBadge(profile: profile)),

          const SizedBox(height: 24),

          Text(
            t.translate('kyc_expired_message'),
            style: theme.textTheme.bodyLarge?.copyWith(
              color: colorScheme.onSurface.withValues(alpha: 0.7),
            ),
            textAlign: TextAlign.center,
          ),

          const SizedBox(height: 24),

          if (profile.expiresAt != null)
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: theme.cardColor,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.calendar_today,
                    size: 16,
                    color: colorScheme.onSurface,
                  ),
                  const SizedBox(width: 8),
                  Text(
                    '${t.translate('expired_on')}: ${DateFormat('dd MMM yyyy').format(profile.expiresAt!)}',
                    style: theme.textTheme.bodyMedium,
                  ),
                ],
              ),
            ),

          const SizedBox(height: 24),

          // Renew Button
          TumiaxButton(
            text: t.translate('renew_kyc'),
            onPressed: () => context.push(RouteNames.kyc),
          ),
        ],
      ),
    );
  }

  Widget _buildNotStartedState(
    BuildContext context,
    AppLocalizations t,
    KYCController controller,
  ) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(AppTheme.defaultPadding),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Header Icon with subtle animation
            TweenAnimationBuilder<double>(
              tween: Tween(begin: 0.0, end: 1.0),
              duration: const Duration(milliseconds: 800),
              curve: Curves.easeOut,
              builder: (context, value, child) {
                return Opacity(
                  opacity: value,
                  child: Transform.scale(scale: value, child: child),
                );
              },
              child: Container(
                padding: const EdgeInsets.all(32),
                decoration: BoxDecoration(
                  color: colorScheme.primary.withValues(alpha: 0.1),
                  shape: BoxShape.circle,
                ),
                child: Icon(
                  Icons.verified_user_outlined,
                  size: 64,
                  color: colorScheme.primary,
                ),
              ),
            ),

            const SizedBox(height: 24),

            // Title
            Text(t.translate('kyc_not_started'), style: AppTheme.heading2),

            const SizedBox(height: 12),

            // Description
            Text(
              t.translate('kyc_benefits_message'),
              style: theme.textTheme.bodyLarge?.copyWith(
                color: colorScheme.onSurface.withValues(alpha: 0.7),
              ),
              textAlign: TextAlign.center,
            ),

            const SizedBox(height: 32),

            // What You'll Get After Verification Card
            Container(
              width: double.infinity, // Ensure container takes full width
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    colorScheme.primary.withValues(alpha: 0.05),
                    colorScheme.primary.withValues(alpha: 0.02),
                  ],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
                borderRadius: BorderRadius.circular(16),
                border: Border.all(
                  color: colorScheme.primary.withValues(alpha: 0.1),
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Section Title
               Row(
                    children: [
                      Icon(Icons.stars, size: 20, color: colorScheme.primary),
                      const SizedBox(width: 8),
                      Expanded(
                        child: Text(
                          t.translate('unlock_features'),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: AppTheme.body1.copyWith(
                            fontWeight: FontWeight.bold,
                            color: colorScheme.primary,
                          ),
                        ),
                      ),
                    ],
                  ),

                  const SizedBox(height: 20),

                  // Feature 1: Add Assets
                  _buildFeatureItem(
                    context,
                    icon: Icons.add_business,
                    title: t.translate('add_assets'),
                    description: t.translate('add_assets_desc'),
                    isEnabled: true,
                  ),

                  const SizedBox(height: 16),

                  // Feature 2: Spend with Credit
                  _buildFeatureItem(
                    context,
                    icon: Icons.credit_card,
                    title: t.translate('spend_with_credit'),
                    description: t.translate('spend_with_credit_desc'),
                    isEnabled: true,
                  ),

                  const SizedBox(height: 16),
                  // Feature 3: Send Money
                  _buildFeatureItem(
                    context,
                    icon: Icons.send,
                    title: t.translate('send_money'),
                    description: t.translate('send_money_desc'),
                    isEnabled: true,
                  ),

                  // Feature 4: Higher Limits
                  // _buildFeatureItem(
                  //   context,
                  //   icon: Icons.trending_up,
                  //   title: t.translate('higher_limits'),
                  //   description: t.translate('higher_limits_desc'),
                  //   isEnabled: true,
                  // ),

                  const SizedBox(height: 20),

                  // Verification Badge
                  Container(
                    width: double.infinity, // Take full width
                    padding: const EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      color: colorScheme.primary.withValues(alpha: 0.1),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Row(
                      children: [
                        Icon(
                          Icons.verified,
                          size: 16,
                          color: colorScheme.primary,
                        ),
                        const SizedBox(width: 8),
                        Expanded(
                          child: Text(
                            t.translate('verified_only_badge'),
                            style: AppTheme.caption.copyWith(
                              color: colorScheme.primary,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 32),

            // Start Verification Button
            TumiaxButton(
              text: t.translate('start_verification'),
              onPressed: () => context.push(RouteNames.kyc),
            ),

            const SizedBox(height: 12),

            // Time Estimate
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.timer_outlined,
                  size: 14,
                  color: colorScheme.onSurface.withValues(alpha: 0.5),
                ),
                const SizedBox(width: 4),
                Text(
                  t.translate('takes_2_minutes'),
                  style: theme.textTheme.bodySmall?.copyWith(
                    color: colorScheme.onSurface.withValues(alpha: 0.6),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildFeatureItem(
    BuildContext context, {
    required IconData icon,
    required String title,
    required String description,
    required bool isEnabled,
  }) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          padding: const EdgeInsets.all(8),
          decoration: BoxDecoration(
            color: colorScheme.primary.withValues(alpha: 0.1),
            borderRadius: BorderRadius.circular(10),
          ),
          child: Icon(icon, size: 18, color: colorScheme.primary),
        ),
        const SizedBox(width: 12),
        Expanded(
          flex: 3,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: AppTheme.body2.copyWith(fontWeight: FontWeight.w600),
              ),
              const SizedBox(height: 2),
              Text(
                description,
                style: AppTheme.caption.copyWith(
                  color: colorScheme.onSurface.withValues(alpha: 0.6),
                ),
              ),
            ],
          ),
        ),
        const SizedBox(width: 8),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
          decoration: BoxDecoration(
            color: isEnabled
                ? colorScheme.primary.withValues(alpha: 0.1)
                : Colors.grey.shade100,
            borderRadius: BorderRadius.circular(12),
          ),
          child: Text(
            isEnabled ? '✓' : '🔒',
            style: AppTheme.caption.copyWith(
              color: isEnabled ? colorScheme.primary : Colors.grey,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildInfoRow(
    BuildContext context, {
    required IconData icon,
    required String label,
    required String value,
  }) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Row(
        children: [
          Icon(
            icon,
            size: 18,
            color: colorScheme.onSurface.withValues(alpha: 0.6),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  label,
                  style: theme.textTheme.bodySmall?.copyWith(
                    color: colorScheme.onSurface.withValues(alpha: 0.6),
                  ),
                ),
                Text(
                  value,
                  style: theme.textTheme.bodyMedium?.copyWith(
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTimelineStep(
    BuildContext context, {
    required bool isCompleted,
    bool isActive = false,
    required String title,
    required String subtitle,
  }) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            margin: const EdgeInsets.only(top: 2),
            width: 24,
            height: 24,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: isCompleted
                  ? colorScheme.secondary
                  : isActive
                  ? colorScheme.primary
                  : colorScheme.onSurface.withValues(alpha: 0.2),
            ),
            child: Center(
              child: isCompleted
                  ? Icon(Icons.check, size: 16, color: colorScheme.onSecondary)
                  : isActive
                  ? SizedBox(
                      width: 12,
                      height: 12,
                      child: CircularProgressIndicator(
                        strokeWidth: 2,
                        valueColor: AlwaysStoppedAnimation<Color>(
                          colorScheme.onPrimary,
                        ),
                      ),
                    )
                  : null,
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: theme.textTheme.bodyMedium?.copyWith(
                    fontWeight: isActive ? FontWeight.bold : FontWeight.normal,
                    color: isActive ? colorScheme.primary : null,
                  ),
                ),
                const SizedBox(height: 2),
                Text(
                  subtitle,
                  style: theme.textTheme.bodySmall?.copyWith(
                    color: colorScheme.onSurface.withValues(alpha: 0.6),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}



// import 'package:flutter/material.dart';
// import 'package:flutter_hooks/flutter_hooks.dart';
// import 'package:hooks_riverpod/hooks_riverpod.dart';
// import 'package:go_router/go_router.dart';
// import 'package:intl/intl.dart';

// import '../../../../core/localization/app_localizations.dart';
// import '../../../../core/themes/app_theme.dart';
// import '../../../../core/widgets/tumiax_button.dart';
// import '../../../../core/widgets/empty_state.dart';
// import '../../../../core/routing/route_names.dart';
// import '../../../profile/providers/kyc_providers.dart';
// import '../../../profile/presentation/controllers/kyc_controller.dart';
// import '../../../profile/data/models/kyc_model.dart';
// import '../widgets/kyc_status_badge.dart';

// class KYCVerificationPage extends HookConsumerWidget {
//   const KYCVerificationPage({super.key});

//   @override
//   Widget build(BuildContext context, WidgetRef ref) {
//     final t = AppLocalizations.of(context);
//     final kycState = ref.watch(kycControllerProvider);
//     final kycController = ref.read(kycControllerProvider.notifier);

//     // Load KYC profile on initial load
//     useEffect(() {
//       WidgetsBinding.instance.addPostFrameCallback((_) {
//         kycController.loadKYCData();
//       });
//       return null;
//     }, []);

//     return Scaffold(
//       backgroundColor: Theme.of(context).scaffoldBackgroundColor,
//       appBar: AppBar(
//         backgroundColor: Colors.transparent,
//         elevation: 0,
//         leading: IconButton(
//           icon: Icon(
//             Icons.arrow_back_ios,
//             color: Theme.of(context).colorScheme.primary,
//           ),
//           onPressed: () => context.pop(),
//         ),
//         title: Text(
//           t.translate('kyc_verification'),
//           style: AppTheme.heading3.copyWith(
//             color: Theme.of(context).colorScheme.primary,
//           ),
//         ),
//       ),
//       body: RefreshIndicator(
//         onRefresh: () async {
//           await kycController.loadKYCData();
//         },
//         color: Theme.of(context).colorScheme.primary,
//         child: kycState.when(
//           initial: () => const Center(child: CircularProgressIndicator()),

//           loading: () => const Center(child: CircularProgressIndicator()),

//           error: (message) =>
//               _buildErrorState(context, t, message, kycController),

//           loaded: (profile, draft, status) {
//             if (profile == null) {
//               return _buildNotStartedState(context, t, kycController);
//             }

//             // Show different UI based on status
//             if (profile.isVerified) {
//               return _buildVerifiedState(context, t, profile, status);
//             } else if (profile.isPending) {
//               return _buildPendingState(context, t, profile, status);
//             } else if (profile.isRejected) {
//               return _buildRejectedState(context, t, profile, kycController);
//             } else if (profile.isExpired) {
//               return _buildExpiredState(context, t, profile, kycController);
//             } else {
//               return _buildNotStartedState(context, t, kycController);
//             }
//           },

//           submitting: () => Center(
//             child: Column(
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: [
//                 const CircularProgressIndicator(),
//                 const SizedBox(height: 16),
//                 Text(
//                   t.translate('submitting_kyc'),
//                   style: Theme.of(context).textTheme.bodyMedium,
//                 ),
//               ],
//             ),
//           ),

//           submitted: (profile) =>
//               _buildVerifiedState(context, t, profile, null),

//           draftSaved: () => const SizedBox.shrink(),
//         ),
//       ),
//     );
//   }

//   Widget _buildErrorState(
//     BuildContext context,
//     AppLocalizations t,
//     String message,
//     KYCController controller,
//   ) {
//     final theme = Theme.of(context);
//     final colorScheme = theme.colorScheme;

//     return Center(
//       child: Padding(
//         padding: const EdgeInsets.all(32),
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             Container(
//               padding: const EdgeInsets.all(20),
//               decoration: BoxDecoration(
//                 color: colorScheme.error.withOpacity(0.1),
//                 shape: BoxShape.circle,
//               ),
//               child: Icon(
//                 Icons.error_outline,
//                 size: 48,
//                 color: colorScheme.error,
//               ),
//             ),
//             const SizedBox(height: 24),
//             Text(
//               t.translate('failed_to_load_kyc'),
//               style: theme.textTheme.titleMedium?.copyWith(
//                 fontWeight: FontWeight.bold,
//               ),
//             ),
//             const SizedBox(height: 8),
//             Text(
//               message,
//               style: theme.textTheme.bodySmall?.copyWith(
//                 color: colorScheme.onSurface.withOpacity(0.6),
//               ),
//               textAlign: TextAlign.center,
//             ),
//             const SizedBox(height: 24),
//             TumiaxButton(
//               text: t.translate('retry'),
//               onPressed: () {
//                 controller.loadKYCData();
//               },
//               width: 200,
//             ),
//           ],
//         ),
//       ),
//     );
//   }

//   Widget _buildVerifiedState(
//     BuildContext context,
//     AppLocalizations t,
//     KYCProfile profile,
//     KYCStatus? status,
//   ) {
//     final theme = Theme.of(context);
//     final colorScheme = theme.colorScheme;

//     return SingleChildScrollView(
//       padding: const EdgeInsets.all(AppTheme.defaultPadding),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           // Success Header
//           Container(
//             padding: const EdgeInsets.all(24),
//             decoration: BoxDecoration(
//               gradient: LinearGradient(
//                 colors: [
//                   colorScheme.secondary.withOpacity(0.8),
//                   colorScheme.secondary,
//                 ],
//               ),
//               borderRadius: BorderRadius.circular(20),
//             ),
//             child: Column(
//               children: [
//                 Container(
//                   padding: const EdgeInsets.all(16),
//                   decoration: BoxDecoration(
//                     color: Colors.white.withOpacity(0.2),
//                     shape: BoxShape.circle,
//                   ),
//                   child: Icon(
//                     Icons.verified,
//                     size: 48,
//                     color: colorScheme.onSecondary,
//                   ),
//                 ),
//                 const SizedBox(height: 16),
//                 Text(
//                   t.translate('kyc_verified'),
//                   style: AppTheme.heading3.copyWith(
//                     color: colorScheme.onSecondary,
//                     fontWeight: FontWeight.bold,
//                   ),
//                 ),
//                 const SizedBox(height: 8),
//                 Text(
//                   t.translate('kyc_verified_message'),
//                   style: AppTheme.body2.copyWith(
//                     color: colorScheme.onSecondary.withOpacity(0.9),
//                   ),
//                   textAlign: TextAlign.center,
//                 ),
//               ],
//             ),
//           ),

//           const SizedBox(height: 24),

//           // KYC Status Badge
//           Center(child: KYCStatusBadge(profile: profile)),

//           const SizedBox(height: 24),

//           // Verification Details
//           if (status != null)
//             Container(
//               padding: const EdgeInsets.all(16),
//               decoration: BoxDecoration(
//                 color: theme.cardColor,
//                 borderRadius: BorderRadius.circular(16),
//                 border: Border.all(color: theme.dividerColor),
//               ),
//               child: Column(
//                 children: [
//                   _buildInfoRow(
//                     context,
//                     icon: Icons.verified_user,
//                     label: t.translate('verification_level'),
//                     value: profile.level,
//                   ),
//                   const Divider(height: 24),
//                   if (profile.verifiedAt != null)
//                     _buildInfoRow(
//                       context,
//                       icon: Icons.calendar_today,
//                       label: t.translate('verified_on'),
//                       value: DateFormat(
//                         'dd MMM yyyy',
//                       ).format(profile.verifiedAt!),
//                     ),
//                   const Divider(height: 24),
//                   if (profile.expiresAt != null)
//                     _buildInfoRow(
//                       context,
//                       icon: Icons.timer,
//                       label: t.translate('expires_on'),
//                       value: DateFormat(
//                         'dd MMM yyyy',
//                       ).format(profile.expiresAt!),
//                     ),
//                 ],
//               ),
//             ),

//           const SizedBox(height: 24),

//           // Continue Button
//           TumiaxButton(
//             text: t.translate('continue_to_home'),
//             onPressed: () => context.go(RouteNames.home),
//           ),
//         ],
//       ),
//     );
//   }

//   Widget _buildPendingState(
//     BuildContext context,
//     AppLocalizations t,
//     KYCProfile profile,
//     KYCStatus? status,
//   ) {
//     final theme = Theme.of(context);
//     final colorScheme = theme.colorScheme;

//     return SingleChildScrollView(
//       padding: const EdgeInsets.all(AppTheme.defaultPadding),
//       child: Column(
//         children: [
//           // Pending Animation/Icon
//           Container(
//             padding: const EdgeInsets.all(32),
//             decoration: BoxDecoration(
//               color: colorScheme.primaryContainer.withOpacity(0.3),
//               shape: BoxShape.circle,
//             ),
//             child: Icon(
//               Icons.hourglass_empty,
//               size: 64,
//               color: colorScheme.primary,
//             ),
//           ),

//           const SizedBox(height: 24),

//           Text(
//             t.translate('kyc_pending_title'),
//             style: AppTheme.heading2.copyWith(color: colorScheme.primary),
//           ),

//           const SizedBox(height: 12),

//           Text(
//             t.translate('kyc_pending_message'),
//             style: theme.textTheme.bodyLarge?.copyWith(
//               color: colorScheme.onSurface.withOpacity(0.7),
//             ),
//             textAlign: TextAlign.center,
//           ),

//           const SizedBox(height: 24),

//           // KYC Status Badge
//           Center(child: KYCStatusBadge(profile: profile)),

//           const SizedBox(height: 24),

//           // Timeline
//           Container(
//             padding: const EdgeInsets.all(20),
//             decoration: BoxDecoration(
//               color: theme.cardColor,
//               borderRadius: BorderRadius.circular(16),
//             ),
//             child: Column(
//               children: [
//                 _buildTimelineStep(
//                   context,
//                   isCompleted: true,
//                   title: t.translate('submitted'),
//                   subtitle: profile.createdAt != null
//                       ? DateFormat(
//                           'dd MMM yyyy, HH:mm',
//                         ).format(profile.createdAt!)
//                       : '',
//                 ),
//                 _buildTimelineStep(
//                   context,
//                   isCompleted: false,
//                   isActive: true,
//                   title: t.translate('under_review'),
//                   subtitle: t.translate('under_review_message'),
//                 ),
//                 _buildTimelineStep(
//                   context,
//                   isCompleted: false,
//                   title: t.translate('verification_complete'),
//                   subtitle: t.translate('verification_pending'),
//                 ),
//               ],
//             ),
//           ),

//           const SizedBox(height: 24),

//           // Estimated time
//           Container(
//             padding: const EdgeInsets.all(16),
//             decoration: BoxDecoration(
//               color: colorScheme.primary.withOpacity(0.1),
//               borderRadius: BorderRadius.circular(12),
//             ),
//             child: Row(
//               children: [
//                 Icon(Icons.access_time, color: colorScheme.primary),
//                 const SizedBox(width: 12),
//                 Expanded(
//                   child: Text(
//                     t.translate('kyc_estimated_time'),
//                     style: theme.textTheme.bodyMedium?.copyWith(
//                       color: colorScheme.primary,
//                     ),
//                   ),
//                 ),
//               ],
//             ),
//           ),

//           const SizedBox(height: 24),

//           // Notification settings
//           TumiaxButton(
//             text: t.translate('notify_me_when_done'),
//             onPressed: () {
//               // TODO: Enable notifications
//             },
//             isOutlined: true,
//           ),
//         ],
//       ),
//     );
//   }

//   Widget _buildRejectedState(
//     BuildContext context,
//     AppLocalizations t,
//     KYCProfile profile,
//     KYCController controller,
//   ) {
//     final theme = Theme.of(context);
//     final colorScheme = theme.colorScheme;

//     return SingleChildScrollView(
//       padding: const EdgeInsets.all(AppTheme.defaultPadding),
//       child: Column(
//         children: [
//           // Rejected Icon
//           Container(
//             padding: const EdgeInsets.all(32),
//             decoration: BoxDecoration(
//               color: colorScheme.error.withOpacity(0.1),
//               shape: BoxShape.circle,
//             ),
//             child: Icon(Icons.cancel, size: 64, color: colorScheme.error),
//           ),

//           const SizedBox(height: 24),

//           Text(
//             t.translate('kyc_rejected'),
//             style: AppTheme.heading2.copyWith(color: colorScheme.error),
//           ),

//           const SizedBox(height: 12),

//           // KYC Status Badge
//           Center(child: KYCStatusBadge(profile: profile)),

//           const SizedBox(height: 24),

//           // Rejection Reason
//           Container(
//             padding: const EdgeInsets.all(20),
//             decoration: BoxDecoration(
//               color: colorScheme.error.withOpacity(0.05),
//               borderRadius: BorderRadius.circular(16),
//               border: Border.all(color: colorScheme.error.withOpacity(0.3)),
//             ),
//             child: Column(
//               children: [
//                 Text(
//                   t.translate('rejection_reason'),
//                   style: theme.textTheme.titleMedium?.copyWith(
//                     fontWeight: FontWeight.bold,
//                   ),
//                 ),
//                 const SizedBox(height: 8),
//                 Text(
//                   profile.rejectionReason ?? t.translate('no_reason_provided'),
//                   style: theme.textTheme.bodyMedium,
//                   textAlign: TextAlign.center,
//                 ),
//               ],
//             ),
//           ),

//           const SizedBox(height: 24),

//           // Resubmit Button
//           TumiaxButton(
//             text: t.translate('resubmit_kyc'),
//             onPressed: () => context.push(RouteNames.kyc),
//           ),

//           const SizedBox(height: 12),

//           // Contact Support
//           TextButton(
//             onPressed: () {
//               // TODO: Contact support
//             },
//             child: Text(
//               t.translate('contact_support'),
//               style: TextStyle(color: colorScheme.primary),
//             ),
//           ),
//         ],
//       ),
//     );
//   }

//   Widget _buildExpiredState(
//     BuildContext context,
//     AppLocalizations t,
//     KYCProfile profile,
//     KYCController controller,
//   ) {
//     final theme = Theme.of(context);
//     final colorScheme = theme.colorScheme;

//     return SingleChildScrollView(
//       padding: const EdgeInsets.all(AppTheme.defaultPadding),
//       child: Column(
//         children: [
//           // Expired Icon
//           Container(
//             padding: const EdgeInsets.all(32),
//             decoration: BoxDecoration(
//               color: colorScheme.onSurface.withOpacity(0.1),
//               shape: BoxShape.circle,
//             ),
//             child: Icon(
//               Icons.timer_off,
//               size: 64,
//               color: colorScheme.onSurface.withOpacity(0.5),
//             ),
//           ),

//           const SizedBox(height: 24),

//           Text(t.translate('kyc_expired'), style: AppTheme.heading2),

//           const SizedBox(height: 12),

//           // KYC Status Badge
//           Center(child: KYCStatusBadge(profile: profile)),

//           const SizedBox(height: 24),

//           Text(
//             t.translate('kyc_expired_message'),
//             style: theme.textTheme.bodyLarge?.copyWith(
//               color: colorScheme.onSurface.withOpacity(0.7),
//             ),
//             textAlign: TextAlign.center,
//           ),

//           const SizedBox(height: 24),

//           if (profile.expiresAt != null)
//             Container(
//               padding: const EdgeInsets.all(16),
//               decoration: BoxDecoration(
//                 color: theme.cardColor,
//                 borderRadius: BorderRadius.circular(12),
//               ),
//               child: Row(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: [
//                   Icon(
//                     Icons.calendar_today,
//                     size: 16,
//                     color: colorScheme.onSurface,
//                   ),
//                   const SizedBox(width: 8),
//                   Text(
//                     '${t.translate('expired_on')}: ${DateFormat('dd MMM yyyy').format(profile.expiresAt!)}',
//                     style: theme.textTheme.bodyMedium,
//                   ),
//                 ],
//               ),
//             ),

//           const SizedBox(height: 24),

//           // Renew Button
//           TumiaxButton(
//             text: t.translate('renew_kyc'),
//             onPressed: () => context.push(RouteNames.kyc),
//           ),
//         ],
//       ),
//     );
//   }


// Widget _buildNotStartedState(
//     BuildContext context,
//     AppLocalizations t,
//     KYCController controller,
//   ) {
//     final theme = Theme.of(context);
//     final colorScheme = theme.colorScheme;

//     return Center(
//       child: Padding(
//         padding: const EdgeInsets.all(AppTheme.defaultPadding),
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             // Header Icon with subtle animation
//             TweenAnimationBuilder<double>(
//               tween: Tween(begin: 0.0, end: 1.0),
//               duration: const Duration(milliseconds: 800),
//               curve: Curves.easeOut,
//               builder: (context, value, child) {
//                 return Opacity(
//                   opacity: value,
//                   child: Transform.scale(scale: value, child: child),
//                 );
//               },
//               child: Container(
//                 padding: const EdgeInsets.all(32),
//                 decoration: BoxDecoration(
//                   color: colorScheme.primary.withOpacity(0.1),
//                   shape: BoxShape.circle,
//                 ),
//                 child: Icon(
//                   Icons.verified_user_outlined,
//                   size: 64,
//                   color: colorScheme.primary,
//                 ),
//               ),
//             ),

//             const SizedBox(height: 24),

//             // Title
//             Text(t.translate('kyc_not_started'), style: AppTheme.heading2),

//             const SizedBox(height: 12),

//             // Description
//             Text(
//               t.translate('kyc_benefits_message'),
//               style: theme.textTheme.bodyLarge?.copyWith(
//                 color: colorScheme.onSurface.withOpacity(0.7),
//               ),
//               textAlign: TextAlign.center,
//             ),

//             const SizedBox(height: 32),

//             // What You'll Get After Verification Card
//             Container(
//               padding: const EdgeInsets.all(20),
//               decoration: BoxDecoration(
//                 gradient: LinearGradient(
//                   colors: [
//                     colorScheme.primary.withOpacity(0.05),
//                     colorScheme.primary.withOpacity(0.02),
//                   ],
//                   begin: Alignment.topLeft,
//                   end: Alignment.bottomRight,
//                 ),
//                 borderRadius: BorderRadius.circular(16),
//                 border: Border.all(color: colorScheme.primary.withOpacity(0.1)),
//               ),
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   // Section Title
//                   Row(
//                     children: [
//                       Icon(Icons.stars, size: 20, color: colorScheme.primary),
//                       const SizedBox(width: 8),
//                       Text(
//                         t.translate('unlock_features'),
//                         style: AppTheme.body1.copyWith(
//                           fontWeight: FontWeight.bold,
//                           color: colorScheme.primary,
//                         ),
//                       ),
//                     ],
//                   ),

//                   const SizedBox(height: 20),

//                   // Feature 1: Add Assets
//                   _buildFeatureItem(
//                     context,
//                     icon: Icons.add_business,
//                     title: t.translate('add_assets'),
//                     description: t.translate('add_assets_desc'),
//                     isEnabled: true,
//                   ),

//                   const SizedBox(height: 16),

//                   // Feature 2: Send Money
//                   _buildFeatureItem(
//                     context,
//                     icon: Icons.send,
//                     title: t.translate('send_money'),
//                     description: t.translate('send_money_desc'),
//                     isEnabled: true,
//                   ),

//                   const SizedBox(height: 16),

//                   // Feature 3: Spend with Credit
//                   _buildFeatureItem(
//                     context,
//                     icon: Icons.credit_card,
//                     title: t.translate('spend_with_credit'),
//                     description: t.translate('spend_with_credit_desc'),
//                     isEnabled: true,
//                   ),

//                   const SizedBox(height: 16),

//                   // Feature 4: Higher Limits
//                   _buildFeatureItem(
//                     context,
//                     icon: Icons.trending_up,
//                     title: t.translate('higher_limits'),
//                     description: t.translate('higher_limits_desc'),
//                     isEnabled: true,
//                   ),

//                   const SizedBox(height: 20),

//                   // Verification Badge
//                   Container(
//                     padding: const EdgeInsets.all(12),
//                     decoration: BoxDecoration(
//                       color: colorScheme.primary.withOpacity(0.1),
//                       borderRadius: BorderRadius.circular(12),
//                     ),
//                     child: Row(
//                       children: [
//                         Icon(
//                           Icons.verified,
//                           size: 16,
//                           color: colorScheme.primary,
//                         ),
//                         const SizedBox(width: 8),
//                         Expanded(
//                           child: Text(
//                             t.translate('verified_only_badge'),
//                             style: AppTheme.caption.copyWith(
//                               color: colorScheme.primary,
//                               fontWeight: FontWeight.w500,
//                             ),
//                           ),
//                         ),
//                       ],
//                     ),
//                   ),
//                 ],
//               ),
//             ),

//             const SizedBox(height: 32),

//             // Start Verification Button
//             TumiaxButton(
//               text: t.translate('start_verification'),
//               onPressed: () => context.push(RouteNames.kyc),
//             ),

//             const SizedBox(height: 12),

//             // Time Estimate
//             Row(
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: [
//                 Icon(
//                   Icons.timer_outlined,
//                   size: 14,
//                   color: colorScheme.onSurface.withOpacity(0.5),
//                 ),
//                 const SizedBox(width: 4),
//                 Text(
//                   t.translate('takes_2_minutes'),
//                   style: theme.textTheme.bodySmall?.copyWith(
//                     color: colorScheme.onSurface.withOpacity(0.6),
//                   ),
//                 ),
//               ],
//             ),
//           ],
//         ),
//       ),
//     );
//   }

//   Widget _buildFeatureItem(
//     BuildContext context, {
//     required IconData icon,
//     required String title,
//     required String description,
//     required bool isEnabled,
//   }) {
//     final theme = Theme.of(context);
//     final colorScheme = theme.colorScheme;

//     return Row(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         Container(
//           padding: const EdgeInsets.all(8),
//           decoration: BoxDecoration(
//             color: colorScheme.primary.withOpacity(0.1),
//             borderRadius: BorderRadius.circular(10),
//           ),
//           child: Icon(icon, size: 18, color: colorScheme.primary),
//         ),
//         const SizedBox(width: 12),
//         Expanded(
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               Text(
//                 title,
//                 style: AppTheme.body2.copyWith(fontWeight: FontWeight.w600),
//               ),
//               const SizedBox(height: 2),
//               Text(
//                 description,
//                 style: AppTheme.caption.copyWith(
//                   color: colorScheme.onSurface.withOpacity(0.6),
//                 ),
//               ),
//             ],
//           ),
//         ),
//         Container(
//           padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
//           decoration: BoxDecoration(
//             color: isEnabled
//                 ? colorScheme.primary.withOpacity(0.1)
//                 : Colors.grey.shade100,
//             borderRadius: BorderRadius.circular(12),
//           ),
//           child: Text(
//             isEnabled ? '✓' : '🔒',
//             style: AppTheme.caption.copyWith(
//               color: isEnabled ? colorScheme.primary : Colors.grey,
//               fontWeight: FontWeight.bold,
//             ),
//           ),
//         ),
//       ],
//     );
//   }

//   Widget _buildInfoRow(
//     BuildContext context, {
//     required IconData icon,
//     required String label,
//     required String value,
//   }) {
//     final theme = Theme.of(context);
//     final colorScheme = theme.colorScheme;

//     return Padding(
//       padding: const EdgeInsets.symmetric(vertical: 4),
//       child: Row(
//         children: [
//           Icon(icon, size: 18, color: colorScheme.onSurface.withOpacity(0.6)),
//           const SizedBox(width: 12),
//           Expanded(
//             child: Row(
//               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//               children: [
//                 Text(
//                   label,
//                   style: theme.textTheme.bodySmall?.copyWith(
//                     color: colorScheme.onSurface.withOpacity(0.6),
//                   ),
//                 ),
//                 Text(
//                   value,
//                   style: theme.textTheme.bodyMedium?.copyWith(
//                     fontWeight: FontWeight.w600,
//                   ),
//                 ),
//               ],
//             ),
//           ),
//         ],
//       ),
//     );
//   }

//   Widget _buildTimelineStep(
//     BuildContext context, {
//     required bool isCompleted,
//     bool isActive = false,
//     required String title,
//     required String subtitle,
//   }) {
//     final theme = Theme.of(context);
//     final colorScheme = theme.colorScheme;

//     return Padding(
//       padding: const EdgeInsets.symmetric(vertical: 8),
//       child: Row(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           Container(
//             margin: const EdgeInsets.only(top: 2),
//             width: 24,
//             height: 24,
//             decoration: BoxDecoration(
//               shape: BoxShape.circle,
//               color: isCompleted
//                   ? colorScheme.secondary
//                   : isActive
//                   ? colorScheme.primary
//                   : colorScheme.onSurface.withOpacity(0.2),
//             ),
//             child: Center(
//               child: isCompleted
//                   ? Icon(Icons.check, size: 16, color: colorScheme.onSecondary)
//                   : isActive
//                   ? SizedBox(
//                       width: 12,
//                       height: 12,
//                       child: CircularProgressIndicator(
//                         strokeWidth: 2,
//                         valueColor: AlwaysStoppedAnimation<Color>(
//                           colorScheme.onPrimary,
//                         ),
//                       ),
//                     )
//                   : null,
//             ),
//           ),
//           const SizedBox(width: 12),
//           Expanded(
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 Text(
//                   title,
//                   style: theme.textTheme.bodyMedium?.copyWith(
//                     fontWeight: isActive ? FontWeight.bold : FontWeight.normal,
//                     color: isActive ? colorScheme.primary : null,
//                   ),
//                 ),
//                 const SizedBox(height: 2),
//                 Text(
//                   subtitle,
//                   style: theme.textTheme.bodySmall?.copyWith(
//                     color: colorScheme.onSurface.withOpacity(0.6),
//                   ),
//                 ),
//               ],
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }

