import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../../core/widgets/tumiax_button.dart';
import '../../../../core/widgets/tumiax_text_field.dart';
import '../../../../core/themes/app_theme.dart';
import '../../../../core/localization/app_localizations.dart';

import '../controllers/auth_controller.dart';
import '../../providers/auth_providers.dart';

class VerifyEmailPage extends HookConsumerWidget {
  final String email;

  const VerifyEmailPage({super.key, required this.email});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final t = AppLocalizations.of(context);

    final authState = ref.watch(authControllerProvider);

    final codeController = useTextEditingController();
    final formKey = useMemoized(() => GlobalKey<FormState>());

    final isResending = useState(false);

    /// Listen for auth errors only
    ref.listen<AuthState>(authControllerProvider, (previous, next) {
      next.maybeWhen(
        error: (message) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(message),
              backgroundColor: AppTheme.errorColor,
            ),
          );
        },
        orElse: () {},
      );
    });

    return Scaffold(
      appBar: AppBar(title: Text(t.translate('verify_email'))),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.all(AppTheme.defaultPadding),
            constraints: BoxConstraints(
              minHeight:
                  MediaQuery.of(context).size.height -
                  MediaQuery.of(context).padding.top -
                  MediaQuery.of(context).padding.bottom -
                  kToolbarHeight,
            ),
            child: Form(
              key: formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Icon(
                    Icons.mark_email_read_outlined,
                    size: 80,
                    color: AppTheme.primaryColor,
                  ),

                  const SizedBox(height: 24),

                  Text(
                    t.translate('check_your_email'),
                    style: AppTheme.heading2,
                    textAlign: TextAlign.center,
                  ),

                  const SizedBox(height: 16),

                  Text(
                    '${t.translate('we_sent_code_to')}\n$email',
                    style: AppTheme.body1.copyWith(
                      color: AppTheme.textSecondary,
                    ),
                    textAlign: TextAlign.center,
                  ),

                  const SizedBox(height: 40),

                  TumiaxTextField(
                    controller: codeController,
                    label: t.translate('verification_code'),
                    prefixIcon: Icons.lock_clock_outlined,
                    keyboardType: TextInputType.number,
                    maxLength: 6,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return t.translate('code_required');
                      }

                      if (value.length != 6) {
                        return t.translate('code_must_be_6_digits');
                      }

                      if (!RegExp(r'^[0-9]+$').hasMatch(value)) {
                        return t.translate('code_must_be_numbers');
                      }

                      return null;
                    },
                  ),

                  const SizedBox(height: 24),

                  TumiaxButton(
                    text: t.translate('verify_email'),
                    isLoading:
                        authState is AuthStateLoading && !isResending.value,
                    onPressed: () {
                      if (formKey.currentState?.validate() ?? false) {
                        ref
                            .read(authControllerProvider.notifier)
                            .verifyEmail(email, codeController.text.trim());
                      }
                    },
                  ),

                  const SizedBox(height: 16),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        t.translate('didnt_receive_code'),
                        style: AppTheme.body2,
                      ),
                      TextButton(
                        onPressed: isResending.value
                            ? null
                            : () async {
                                isResending.value = true;

                                await ref
                                    .read(authControllerProvider.notifier)
                                    .resendVerificationCode(email);

                                isResending.value = false;

                                if (context.mounted) {
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(
                                      content: Text(t.translate('code_resent')),
                                      backgroundColor: AppTheme.secondaryColor,
                                    ),
                                  );
                                }
                              },
                        child: Text(
                          isResending.value
                              ? t.translate('sending')
                              : t.translate('resend_code'),
                          style: AppTheme.body2.copyWith(
                            color: isResending.value
                                ? AppTheme.textSecondary
                                : AppTheme.primaryColor,
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
}
