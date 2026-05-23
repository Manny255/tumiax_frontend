// lib/features/auth/presentation/pages/login_page.dart

import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:go_router/go_router.dart';
import '../../../../core/widgets/tumiax_text_field.dart';
import '../../../../core/widgets/tumiax_button.dart';
import '../../../../core/themes/app_theme.dart';
import '../../../../core/routing/route_names.dart';
import '../../../../core/localization/app_localizations.dart';
import '../../providers/auth_providers.dart';
import '../controllers/auth_controller.dart';

class LoginPage extends HookConsumerWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final t = AppLocalizations.of(context);
    final authState = ref.watch(authControllerProvider);

    final emailController = useTextEditingController();
    final passwordController = useTextEditingController();
    final formKey = useMemoized(() => GlobalKey<FormState>());
    final isPasswordVisible = useState(false);

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
                  // Logo and Welcome Text
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
                          t.translate('welcome_back'),
                          style: Theme.of(context).textTheme.titleLarge
                              ?.copyWith(fontWeight: FontWeight.w600),
                        ),
                      ],
                    ),
                  ),

                  const SizedBox(height: 40),

                  // Email Field
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

                  // Password Field
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
                      ),
                      onPressed: () =>
                          isPasswordVisible.value = !isPasswordVisible.value,
                    ),
                    validator: (value) => value == null || value.isEmpty
                        ? t.translate('password_required')
                        : null,
                  ),

                  const SizedBox(height: 24),

                  // Error Message
                  if (authState is AuthStateError)
                    Container(
                      padding: const EdgeInsets.all(12),
                      decoration: BoxDecoration(
                        color: Colors.red.shade50,
                        borderRadius: BorderRadius.circular(8),
                        border: Border.all(color: Colors.red.shade200),
                      ),
                      child: Row(
                        children: [
                          Icon(Icons.error_outline, color: Colors.red.shade700),
                          const SizedBox(width: 8),
                          Expanded(
                            child: Text(
                              authState.message,
                              style: TextStyle(color: Colors.red.shade700),
                            ),
                          ),
                        ],
                      ),
                    ),

                  const SizedBox(height: 24),

                  // Login Button
                  TumiaxButton(
                    text: t.translate('login'),
                    isLoading: authState is AuthStateLoading,
                    onPressed: () {
                      if (formKey.currentState?.validate() ?? false) {
                        ref
                            .read(authControllerProvider.notifier)
                            .login(
                              emailController.text,
                              passwordController.text,
                            );
                      }
                    },
                  ),

                  const SizedBox(height: 16),

                  // Register Link
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        t.translate('dont_have_account'),
                        style: AppTheme.body2,
                      ),
                      TextButton(
                        onPressed: () => context.push(RouteNames.register),
                        child: Text(
                          t.translate('create_account'),
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
}
