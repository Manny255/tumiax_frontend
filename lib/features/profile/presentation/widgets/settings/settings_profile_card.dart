import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:intl/intl.dart';

import '../../../../../core/localization/app_localizations.dart';
import '../../../../../core/themes/app_theme.dart';
import '../../../../../core/widgets/user_avatar.dart';
import '../../../../auth/data/models/user_model.dart';
import '../../../../wallet/presentation/controllers/balance_controller.dart';

class SettingsProfileCard extends ConsumerStatefulWidget {
  final UserModel user;

  const SettingsProfileCard({super.key, required this.user});

  @override
  ConsumerState<SettingsProfileCard> createState() =>
      _SettingsProfileCardState();
}

class _SettingsProfileCardState extends ConsumerState<SettingsProfileCard> {
  bool _isVisible = false;

  void _toggleVisibility() {
    final newValue = !_isVisible;

    setState(() {
      _isVisible = newValue;
    });

    /// Refresh balance ONLY when showing it
    if (newValue) {
      ref.invalidate(balanceControllerProvider);
    }

    // Auto-hide after 10 seconds
    if (newValue) {
      Future.delayed(const Duration(seconds: 10), () {
        if (mounted) {
          setState(() => _isVisible = false);
        }
      });
    }
  }

  String _maskAmount() => 'TZS ••••••';

  @override
  Widget build(BuildContext context) {
    final t = AppLocalizations.of(context);

    final formatCurrency = NumberFormat.currency(
      locale: 'en_TZ',
      symbol: 'TZS ',
      decimalDigits: 0,
    );

    final displayName = (widget.user.fullName?.trim().isNotEmpty ?? false)
        ? widget.user.fullName!.trim()
        : widget.user.email.split('@').first;

    final balanceState = ref.watch(balanceControllerProvider);

    String formatOrMask(double amount) {
      return _isVisible ? formatCurrency.format(amount) : _maskAmount();
    }

    return Container(
      padding: const EdgeInsets.all(AppTheme.defaultPadding),
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [AppTheme.primaryColor, Color(0xFF1a4a7a)],
        ),
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: AppTheme.primaryColor.withValues(alpha: 0.3),
            blurRadius: 10,
            offset: const Offset(0, 5),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          /// =============================
          /// PROFILE HEADER
          /// =============================
          Row(
            children: [
              Container(
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(
                    color: Colors.white.withValues(alpha: 0.3),
                    width: 2,
                  ),
                ),
                child: UserAvatar(user: widget.user, radius: 28),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      displayName,
                      style: AppTheme.body1.copyWith(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                    const SizedBox(height: 6),
                    Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 8,
                        vertical: 2,
                      ),
                      decoration: BoxDecoration(
                        color: Colors.white.withValues(alpha: 0.15),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Text(
                        widget.user.accountTier,
                        style: AppTheme.caption.copyWith(
                          color: Colors.white,
                          fontSize: 10,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),

          const SizedBox(height: 20),

          /// =============================
          /// BALANCE SECTION
          /// =============================
          Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16),
              border: Border.all(color: Colors.white.withValues(alpha: 0.1)),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                /// Left side
                Row(
                  children: [
                    Text(
                      t.translate("balance"),
                      style: AppTheme.body2.copyWith(
                        color: Colors.white.withValues(alpha: 0.9),
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    const SizedBox(width: 8),

                    IconButton(
                      onPressed: _toggleVisibility,
                      icon: Icon(
                        _isVisible ? Icons.visibility : Icons.visibility_off,
                        color: Colors.white,
                        size: 20,
                      ),
                    ),
                  ],
                ),

                /// Right side (ALWAYS SHOW TEXT)
                balanceState.when(
                  loading: () => Text(
                    _maskAmount(),
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Poppins',
                    ),
                  ),
                  error: (_, __) => Text(
                    _maskAmount(),
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Poppins',
                    ),
                  ),
                  data: (data) => Text(
                    formatOrMask(data.balance.balance),
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Poppins',
                    ),
                  ),
                ),
              ],
            ),
          ),

          const SizedBox(height: 16),

          /// =============================
          /// ADD FUNDS BUTTON
          /// =============================
          SizedBox(
            width: double.infinity,
            child: ElevatedButton.icon(
              onPressed: () {
                // context.push(RouteNames.addFunds);
              },
              icon: const Icon(Icons.add, size: 18),
              label: Text(
                t.translate("add_funds"),
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 14,
                  letterSpacing: 0.5,
                ),
              ),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.white,
                foregroundColor: AppTheme.primaryColor,
                elevation: 0,
                padding: const EdgeInsets.symmetric(vertical: 14),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
