// lib/features/auth/presentation/pages/onboarding_page.dart

import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../../core/session/auth_session_provider.dart';
import '../../../../core/themes/app_theme.dart';
import '../../../../core/widgets/tumiax_button.dart';
import '../../../../core/localization/app_localizations.dart';
import '../../../../core/localization/language_selector.dart';
import '../widgets/asset_to_cash_animation.dart';
import '../widgets/cash_anytime_animation.dart';
import '../widgets/keep_ownership_animation.dart';

class OnboardingPage extends HookConsumerWidget {
  const OnboardingPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = Theme.of(context);
    final pageController = usePageController();
    final currentPage = useState<int>(0);
    final t = AppLocalizations.of(context);

    final onboardingData = <OnboardingItem>[
      OnboardingItem(
        titleKey: 'onboarding_title_1',
        descriptionKey: 'onboarding_desc_1',
        animation: const AssetToCashAnimation(),
      ),
      OnboardingItem(
        titleKey: 'onboarding_title_2',
        descriptionKey: 'onboarding_desc_2',
        animation: const CashAnytimeAnimation(),
      ),
      OnboardingItem(
        titleKey: 'onboarding_title_3',
        descriptionKey: 'onboarding_desc_3',
        animation: const KeepOwnershipAnimation(),
      ),
    ];

    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            /// Top Bar
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: AppTheme.defaultPadding,
                vertical: 16,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const SizedBox(),
                  const LanguageSelector(),
                ],
              ),
            ),

            /// Pages
            Expanded(
              child: PageView.builder(
                controller: pageController,
                itemCount: onboardingData.length,
                onPageChanged: (index) {
                  currentPage.value = index;
                },
                itemBuilder: (context, index) {
                  return OnboardingContent(item: onboardingData[index], t: t);
                },
              ),
            ),

            /// Indicators
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(
                onboardingData.length,
                (index) => AnimatedContainer(
                  duration: AppTheme.defaultAnimationDuration,
                  margin: const EdgeInsets.symmetric(horizontal: 4),
                  width: currentPage.value == index ? 24 : 8,
                  height: 8,
                  decoration: BoxDecoration(
                    color: currentPage.value == index
                        ? theme.colorScheme.primary
                        : theme.colorScheme.onSurface.withValues(alpha: 0.2),
                    borderRadius: BorderRadius.circular(4),
                  ),
                ),
              ),
            ),

            const SizedBox(height: 32),

            /// Buttons
            Padding(
              padding: const EdgeInsets.all(AppTheme.defaultPadding),
              child: Column(
                children: [
                  TumiaxButton(
                  text: t.translate('done'),
                   onPressed: () async {
                      await ref
                          .read(authsessionProvider.notifier)
                          .completeOnboarding();
                    }
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class OnboardingItem {
  final String titleKey;
  final String descriptionKey;
  final Widget animation;

  const OnboardingItem({
    required this.titleKey,
    required this.descriptionKey,
    required this.animation,
  });
}

class OnboardingContent extends StatelessWidget {
  final OnboardingItem item;
  final AppLocalizations t;

  const OnboardingContent({super.key, required this.item, required this.t});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Padding(
      padding: const EdgeInsets.all(AppTheme.largePadding),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          item.animation,

          const SizedBox(height: 32),

          Text(
            t.translate(item.titleKey),
            style: theme.textTheme.displayMedium?.copyWith(
              color: theme.colorScheme.primary,
            ),
            textAlign: TextAlign.center,
          ),

          const SizedBox(height: 16),

          Text(
            t.translate(item.descriptionKey),
            style: theme.textTheme.bodyLarge?.copyWith(
              color: theme.colorScheme.onSurfaceVariant,
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
