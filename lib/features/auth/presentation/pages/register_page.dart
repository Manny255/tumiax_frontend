// lib/features/auth/presentation/pages/register_page.dart

import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:go_router/go_router.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../../../core/widgets/tumiax_button.dart';
import '../../../../core/widgets/tumiax_text_field.dart';
import '../../../../core/themes/app_theme.dart';
import '../../../../core/routing/route_names.dart';
import '../../../../core/localization/app_localizations.dart';
import '../../providers/auth_providers.dart';
import '../controllers/auth_controller.dart';

class RegisterPage extends HookConsumerWidget {
  const RegisterPage({super.key});

  static const String _termsUrl = 'https://tumiax.com/terms';
  static const String _privacyUrl = 'https://tumiax.com/privacy';

  Future<void> _launchUrl(String url) async {
    final uri = Uri.parse(url);
    if (!await launchUrl(uri, mode: LaunchMode.externalApplication)) {
      // Fallback to internal web view if external browser fails
      await launchUrl(uri, mode: LaunchMode.inAppWebView);
    }
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final t = AppLocalizations.of(context);
    final authState = ref.watch(authControllerProvider);
    final isDark = Theme.of(context).brightness == Brightness.dark;

    final emailController = useTextEditingController();
    final passwordController = useTextEditingController();
    final confirmPasswordController = useTextEditingController();

    final formKey = useMemoized(() => GlobalKey<FormState>());
    final isPasswordVisible = useState(false);
    final isConfirmPasswordVisible = useState(false);
    final acceptedTerms = useState(false);

    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.all(AppTheme.defaultPadding),
            constraints: BoxConstraints(
              minHeight:
                  MediaQuery.of(context).size.height -
                  MediaQuery.of(context).padding.top -
                  MediaQuery.of(context).padding.bottom,
            ),
            child: Form(
              key: formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  /// Title
                  Center(
                    child: Column(
                      children: [
                        SizedBox(
                          height: 150,
                          child: Image.asset(
                            'assets/images/tumiax-logo.png',
                            fit: BoxFit.contain,
                          ),
                        ),
                        Text(
                          t.translate('create_account'),
                          style: Theme.of(context).textTheme.titleLarge
                              ?.copyWith(fontWeight: FontWeight.w600),
                        ),
                        const SizedBox(height: 8),
                        Text(
                          t.translate('sign_up_to_get_started'),
                          style: AppTheme.body2.copyWith(
                            color: AppTheme.textSecondary,
                          ),
                        ),
                      ],
                    ),
                  ),

                  const SizedBox(height: 32),

                  /// Email
                  TumiaxTextField(
                    controller: emailController,
                    label: t.translate('email'),
                    prefixIcon: Icons.email_outlined,
                    keyboardType: TextInputType.emailAddress,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return t.translate('email_required');
                      }
                      if (!value.contains('@') || !value.contains('.')) {
                        return t.translate('invalid_email');
                      }
                      return null;
                    },
                  ),

                  const SizedBox(height: 16),

                  /// Password
                  TumiaxTextField(
                    controller: passwordController,
                    label: t.translate('password'),
                    prefixIcon: Icons.lock_outline,
                    obscureText: !isPasswordVisible.value,
                    suffixIcon: IconButton(
                      icon: Icon(
                        isPasswordVisible.value
                            ? Icons.visibility_off
                            : Icons.visibility,
                        color: AppTheme.textSecondary,
                      ),
                      onPressed: () =>
                          isPasswordVisible.value = !isPasswordVisible.value,
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return t.translate('password_required');
                      }
                      if (value.length < 8) {
                        return t.translate('password_too_short');
                      }
                      return null;
                    },
                  ),

                  const SizedBox(height: 16),

                  /// Confirm Password
                  TumiaxTextField(
                    controller: confirmPasswordController,
                    label: t.translate('confirm_password'),
                    prefixIcon: Icons.lock_outline,
                    obscureText: !isConfirmPasswordVisible.value,
                    suffixIcon: IconButton(
                      icon: Icon(
                        isConfirmPasswordVisible.value
                            ? Icons.visibility_off
                            : Icons.visibility,
                        color: AppTheme.textSecondary,
                      ),
                      onPressed: () => isConfirmPasswordVisible.value =
                          !isConfirmPasswordVisible.value,
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return t.translate('confirm_password_required');
                      }
                      if (value != passwordController.text) {
                        return t.translate('passwords_do_not_match');
                      }
                      return null;
                    },
                  ),

                  const SizedBox(height: 24),

                  /// Terms & Conditions with Clickable Links
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Checkbox(
                        value: acceptedTerms.value,
                        onChanged: (value) =>
                            acceptedTerms.value = value ?? false,
                        activeColor: AppTheme.primaryColor,
                      ),
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.only(top: 12),
                          child: _buildTermsText(context, t, isDark),
                        ),
                      ),
                    ],
                  ),

                  const SizedBox(height: 16),

                  /// Error Message
                  if (authState is AuthStateError)
                    Container(
                      padding: const EdgeInsets.all(12),
                      decoration: BoxDecoration(
                        color: AppTheme.errorColor.withValues(alpha: 0.1),
                        borderRadius: BorderRadius.circular(8),
                        border: Border.all(
                          color: AppTheme.errorColor.withValues(alpha: 0.3),
                        ),
                      ),
                      child: Row(
                        children: [
                          Icon(Icons.error_outline, color: AppTheme.errorColor),
                          const SizedBox(width: 8),
                          Expanded(
                            child: Text(
                              authState.message,
                              style: TextStyle(color: AppTheme.errorColor),
                            ),
                          ),
                        ],
                      ),
                    ),

                  const SizedBox(height: 24),

                  /// Register Button
                  TumiaxButton(
                    text: t.translate('create_account'),
                    isLoading: authState is AuthStateLoading,
                    onPressed: () async {
                      if (!(formKey.currentState?.validate() ?? false)) return;

                      if (!acceptedTerms.value) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text(t.translate('accept_terms_first')),
                            backgroundColor: AppTheme.warningColor,
                          ),
                        );
                        return;
                      }
                      ref
                          .read(authControllerProvider.notifier)
                          .register(
                            emailController.text,
                            passwordController.text,
                            confirmPasswordController.text,
                          );
                    },
                  ),

                  const SizedBox(height: 16),

                  /// Login Link
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        t.translate('already_have_account'),
                        style: AppTheme.body2,
                      ),
                      TextButton(
                        onPressed: authState is AuthStateLoading
                            ? null
                            : () => context.go(RouteNames.login),
                        child: Text(
                          t.translate('login'),
                          style: AppTheme.body2.copyWith(
                            color: AppTheme.primaryColor,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  /// Build clickable terms text with Terms of Service and Privacy Policy links
  Widget _buildTermsText(
    BuildContext context,
    AppLocalizations t,
    bool isDark,
  ) {
    return RichText(
      text: TextSpan(
        style: AppTheme.body2.copyWith(
          color: isDark ? Colors.grey.shade300 : AppTheme.textSecondary,
        ),
        children: [
          TextSpan(text: '${t.translate('i_agree_to_terms')} '),
          WidgetSpan(
            alignment: PlaceholderAlignment.middle,
            child: InkWell(
              onTap: () => _launchUrl(_termsUrl),
              borderRadius: BorderRadius.circular(4),
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 2),
                child: Text(
                  t.translate('terms_of_service'),
                  style: AppTheme.body2.copyWith(
                    color: AppTheme.primaryColor,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ),
          ),
          TextSpan(text: ' ${t.translate('and')} '),
          WidgetSpan(
            alignment: PlaceholderAlignment.middle,
            child: InkWell(
              onTap: () => _launchUrl(_privacyUrl),
              borderRadius: BorderRadius.circular(4),
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 2),
                child: Text(
                  t.translate('privacy_policy'),
                  style: AppTheme.body2.copyWith(
                    color: AppTheme.primaryColor,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
