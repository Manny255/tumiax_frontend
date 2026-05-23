import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'app_localizations.dart';

class LanguageSelector extends HookConsumerWidget {
  final bool isCompact;
  final Color? iconColor;

  const LanguageSelector({super.key, this.isCompact = false, this.iconColor});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = Theme.of(context);
    final locale = ref.watch(localeProvider);
    final localeNotifier = ref.read(localeProvider.notifier);

    final isEnglish = locale.languageCode == 'en';

    if (isCompact) {
      return Container(
        decoration: BoxDecoration(
          color: theme.colorScheme.surfaceContainerHighest,
          borderRadius: BorderRadius.circular(30),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            _buildCompactOption(
              context: context,
              flag: '🇺🇸',
              label: 'EN',
              isSelected: isEnglish,
              onTap: () => localeNotifier.setLocale(const Locale('en')),
            ),
            Container(
              height: 16,
              width: 1,
              color: theme.colorScheme.outlineVariant,
            ),
            _buildCompactOption(
              context: context,
              flag: '🇹🇿',
              label: 'SW',
              isSelected: !isEnglish,
              onTap: () => localeNotifier.setLocale(const Locale('sw')),
            ),
          ],
        ),
      );
    }

    /// Full dropdown version
    return Container(
      decoration: BoxDecoration(
        color: theme.colorScheme.surfaceContainerHighest,
        borderRadius: BorderRadius.circular(12),
      ),
      child: DropdownButtonHideUnderline(
        child: DropdownButton<Locale>(
          value: locale,
          // icon: Icon(
          //   Icons.language,
          //   size: 20,
          //   color: iconColor ?? theme.colorScheme.onSurface,
          // ),
          elevation: 8,
          style: theme.textTheme.bodyMedium,
          dropdownColor: theme.colorScheme.surface,
          onChanged: (Locale? newLocale) {
            if (newLocale != null) {
              localeNotifier.setLocale(newLocale);
            }
          },
          items: [
            DropdownMenuItem(
              value: const Locale('en'),
              child: _buildDropdownItem(
                context,
                flag: '🇺🇸',
                label: 'EN',
              ),
            ),
            DropdownMenuItem(
              value: const Locale('sw'),
              child: _buildDropdownItem(
                context,
                flag: '🇹🇿',
                label: 'SW',
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildDropdownItem(
    BuildContext context, {
    required String flag,
    required String label,
  }) {
    final theme = Theme.of(context);

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Row(
        children: [
          Text(flag, style: const TextStyle(fontSize: 20)),
          const SizedBox(width: 8),
          Text(label, style: theme.textTheme.bodyMedium),
        ],
      ),
    );
  }

  Widget _buildCompactOption({
    required BuildContext context,
    required String flag,
    required String label,
    required bool isSelected,
    required VoidCallback onTap,
  }) {
    final theme = Theme.of(context);

    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(30),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
        decoration: BoxDecoration(
          color: isSelected ? theme.colorScheme.primary : Colors.transparent,
          borderRadius: BorderRadius.circular(30),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(flag, style: const TextStyle(fontSize: 16)),
            Text(
              label,
              style: theme.textTheme.labelSmall?.copyWith(
                color: isSelected
                    ? theme.colorScheme.onPrimary
                    : theme.colorScheme.onSurfaceVariant,
                fontWeight: isSelected ? FontWeight.w600 : FontWeight.normal,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
