import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/localization/app_localizations.dart';
import '../../../../core/themes/app_theme.dart';
import '../../../../core/widgets/tumiax_button.dart';
import '../controllers/change_password_controller.dart';

class ChangePasswordPage extends HookConsumerWidget {
  const ChangePasswordPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final t = AppLocalizations.of(context);
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    // Controllers
    final currentPasswordController = useTextEditingController();
    final newPasswordController = useTextEditingController();
    final confirmPasswordController = useTextEditingController();

    // State
    final isLoading = useState(false);
    final isCurrentPasswordVisible = useState(false);
    final isNewPasswordVisible = useState(false);
    final isConfirmPasswordVisible = useState(false);
    final formKey = useMemoized(() => GlobalKey<FormState>());

    // Validation states
    final isCurrentPasswordTouched = useState(false);
    final isNewPasswordTouched = useState(false);
    final isConfirmPasswordTouched = useState(false);

    // Focus nodes for better UX
    final currentFocus = useFocusNode();
    final newFocus = useFocusNode();
    final confirmFocus = useFocusNode();

    // Password strength indicators
    final hasMinLength = useState(false);
    final hasUppercase = useState(false);
    final hasLowercase = useState(false);
    final hasNumber = useState(false);
    final hasSpecial = useState(false);

    // Update password strength when new password changes
    useEffect(() {
      void updateStrength() {
        final text = newPasswordController.text;
        hasMinLength.value = text.length >= 8;
        hasUppercase.value = RegExp(r'[A-Z]').hasMatch(text);
        hasLowercase.value = RegExp(r'[a-z]').hasMatch(text);
        hasNumber.value = RegExp(r'[0-9]').hasMatch(text);
        hasSpecial.value = RegExp(r'[!@#$%^&*(),.?":{}|<>]').hasMatch(text);
      }

      newPasswordController.addListener(updateStrength);
      return () => newPasswordController.removeListener(updateStrength);
    }, []);

    // Calculate password strength percentage
    final strengthPercent = useMemoized(
      () {
        int count = 0;
        if (hasMinLength.value) count++;
        if (hasUppercase.value) count++;
        if (hasLowercase.value) count++;
        if (hasNumber.value) count++;
        if (hasSpecial.value) count++;
        return count / 5;
      },
      [
        hasMinLength.value,
        hasUppercase.value,
        hasLowercase.value,
        hasNumber.value,
        hasSpecial.value,
      ],
    );

    // Validation functions
    String? _validateCurrentPassword(String? value) {
      if (value == null || value.isEmpty) {
        return t.translate('current_password_required');
      }
      return null;
    }

    String? _validateNewPassword(String? value) {
      if (value == null || value.isEmpty) {
        return t.translate('new_password_required');
      }
      if (value.length < 8) {
        return t.translate('password_too_short');
      }
      if (!RegExp(r'[A-Z]').hasMatch(value)) {
        return t.translate('password_needs_uppercase');
      }
      if (!RegExp(r'[a-z]').hasMatch(value)) {
        return t.translate('password_needs_lowercase');
      }
      if (!RegExp(r'[0-9]').hasMatch(value)) {
        return t.translate('password_needs_number');
      }
      if (!RegExp(r'[!@#$%^&*(),.?":{}|<>]').hasMatch(value)) {
        return t.translate('password_needs_special');
      }
      return null;
    }

    String? _validateConfirmPassword(String? value) {
      if (value == null || value.isEmpty) {
        return t.translate('confirm_password_required');
      }
      if (value != newPasswordController.text) {
        return t.translate('passwords_do_not_match');
      }
      return null;
    }

    // Get controller
    final changePasswordController = ref.read(
      changePasswordControllerProvider.notifier,
    );

    // Listen to controller state for errors
    ref.listen(changePasswordControllerProvider, (previous, next) {
      next.whenOrNull(
        error: (error, stack) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Row(
                children: [
                  Icon(Icons.error_outline, color: colorScheme.onError),
                  const SizedBox(width: 8),
                  Expanded(child: Text(error.toString())),
                ],
              ),
              backgroundColor: colorScheme.error,
              behavior: SnackBarBehavior.floating,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
            ),
          );
          isLoading.value = false;
        },
      );
    });

    Future<void> _submit() async {
      // Mark all fields as touched to show validation errors
      isCurrentPasswordTouched.value = true;
      isNewPasswordTouched.value = true;
      isConfirmPasswordTouched.value = true;

      if (!formKey.currentState!.validate()) return;

      isLoading.value = true;

      final success = await changePasswordController.changePassword(
        oldPassword: currentPasswordController.text,
        newPassword: newPasswordController.text,
      );

      if (success && context.mounted) {
        // Show success dialog
        await showDialog(
          context: context,
          barrierDismissible: false,
          builder: (context) => AlertDialog(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
            ),
            content: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  t.translate('password_changed_successfully'),
                  style: AppTheme.heading3,
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 8),
                Text(
                  t.translate('password_updated_message'),
                  style: AppTheme.body2.copyWith(
                    color: colorScheme.onSurface.withOpacity(0.6),
                  ),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
            actions: [
              TumiaxButton(
                text: t.translate('done'),
                onPressed: () {
                  Navigator.pop(context);
                  context.pop();
                },
              ),
            ],
          ),
        );
      }

      isLoading.value = false;
    }

    return Scaffold(
      backgroundColor: colorScheme.surface,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: Container(
          margin: const EdgeInsets.all(8),
          decoration: BoxDecoration(
            color: colorScheme.surface,
            shape: BoxShape.circle,
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.05),
                blurRadius: 8,
                offset: const Offset(0, 2),
              ),
            ],
          ),
          child: IconButton(
            icon: Icon(Icons.arrow_back_ios, color: colorScheme.primary),
            onPressed: () => context.pop(),
          ),
        ),
        title: Text(
          t.translate('change_password'),
          style: AppTheme.heading3.copyWith(
            color: colorScheme.primary,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(24),
          child: Form(
            key: formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                // Header Illustration
                Center(
                  child: Container(
                    height: 160,
                    width: 160,
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        colors: [
                          colorScheme.primary.withOpacity(0.2),
                          colorScheme.primary.withOpacity(0.05),
                        ],
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                      ),
                      shape: BoxShape.circle,
                    ),
                    child: Center(
                      child: Icon(
                        Icons.security,
                        size: 70,
                        color: colorScheme.primary,
                      ),
                    ),
                  ),
                ),

                const SizedBox(height: 24),

                // Title
                Text(
                  t.translate('secure_your_account'),
                  style: AppTheme.heading2.copyWith(
                    fontWeight: FontWeight.bold,
                    color: colorScheme.onSurface,
                  ),
                  textAlign: TextAlign.center,
                ),

                const SizedBox(height: 8),

                Text(
                  t.translate('password_recommendation'),
                  style: AppTheme.body2.copyWith(
                    color: colorScheme.onSurface.withOpacity(0.6),
                  ),
                  textAlign: TextAlign.center,
                ),

                const SizedBox(height: 32),

                // Current Password Card
                _buildPasswordField(
                  controller: currentPasswordController,
                  focusNode: currentFocus,
                  label: t.translate('current_password'),
                  hint: t.translate('enter_current_password'),
                  isVisible: isCurrentPasswordVisible,
                  onVisibilityToggle: () => isCurrentPasswordVisible.value =
                      !isCurrentPasswordVisible.value,
                  validator: _validateCurrentPassword,
                  isTouched: isCurrentPasswordTouched,
                  onNext: () => newFocus.requestFocus(),
                  colorScheme: colorScheme,
                ),

                const SizedBox(height: 20),

                // New Password Card
                _buildPasswordField(
                  controller: newPasswordController,
                  focusNode: newFocus,
                  label: t.translate('new_password'),
                  hint: t.translate('enter_new_password'),
                  isVisible: isNewPasswordVisible,
                  onVisibilityToggle: () =>
                      isNewPasswordVisible.value = !isNewPasswordVisible.value,
                  validator: _validateNewPassword,
                  isTouched: isNewPasswordTouched,
                  onNext: () => confirmFocus.requestFocus(),
                  colorScheme: colorScheme,
                ),

                if (newPasswordController.text.isNotEmpty) ...[
                  const SizedBox(height: 16),

                  // Password Strength Meter
                  _buildPasswordStrengthMeter(strengthPercent, colorScheme, t),

                  const SizedBox(height: 16),

                  // Password Requirements Grid
                  _buildPasswordRequirements(
                    hasMinLength: hasMinLength.value,
                    hasUppercase: hasUppercase.value,
                    hasLowercase: hasLowercase.value,
                    hasNumber: hasNumber.value,
                    hasSpecial: hasSpecial.value,
                    colorScheme: colorScheme,
                    t: t,
                  ),
                ],

                const SizedBox(height: 20),

                // Confirm Password Card
                _buildPasswordField(
                  controller: confirmPasswordController,
                  focusNode: confirmFocus,
                  label: t.translate('confirm_new_password'),
                  hint: t.translate('confirm_new_password'),
                  isVisible: isConfirmPasswordVisible,
                  onVisibilityToggle: () => isConfirmPasswordVisible.value =
                      !isConfirmPasswordVisible.value,
                  validator: _validateConfirmPassword,
                  isTouched: isConfirmPasswordTouched,
                  onSubmit: _submit,
                  colorScheme: colorScheme,
                ),

                const SizedBox(height: 32),

                // Submit Button
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16),
                    gradient: LinearGradient(
                      colors: [
                        colorScheme.primary,
                        colorScheme.primary.withOpacity(0.8),
                      ],
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: colorScheme.primary.withOpacity(0.3),
                        blurRadius: 12,
                        offset: const Offset(0, 4),
                      ),
                    ],
                  ),
                  child: ElevatedButton(
                    onPressed: isLoading.value ? null : _submit,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.transparent,
                      shadowColor: Colors.transparent,
                      padding: const EdgeInsets.symmetric(vertical: 16),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16),
                      ),
                    ),
                    child: isLoading.value
                        ? SizedBox(
                            height: 20,
                            width: 20,
                            child: CircularProgressIndicator(
                              strokeWidth: 2,
                              valueColor: AlwaysStoppedAnimation<Color>(
                                colorScheme.onPrimary,
                              ),
                            ),
                          )
                        : Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                t.translate('update_password').toUpperCase(),
                                style: TextStyle(
                                  color: colorScheme.onPrimary,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16,
                                  letterSpacing: 1,
                                ),
                              ),
                            ],
                          ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildPasswordField({
    required TextEditingController controller,
    required FocusNode focusNode,
    required String label,
    required String hint,
    required ValueNotifier<bool> isVisible,
    required VoidCallback onVisibilityToggle,
    required String? Function(String?) validator,
    required ValueNotifier<bool> isTouched,
    required ColorScheme colorScheme,
    VoidCallback? onNext,
    VoidCallback? onSubmit,
  }) {
    return Container(
      decoration: BoxDecoration(
        color: colorScheme.surface,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
          color: isTouched.value && controller.text.isEmpty
              ? colorScheme.error
              : colorScheme.outline.withOpacity(0.1),
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.02),
            blurRadius: 8,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              label,
              style: AppTheme.caption.copyWith(
                color: colorScheme.onSurface.withOpacity(0.7),
                fontWeight: FontWeight.w600,
              ),
            ),
            const SizedBox(height: 8),
            TextFormField(
              controller: controller,
              focusNode: focusNode,
              obscureText: !isVisible.value,
              validator: validator,
              onTap: () => isTouched.value = true,
              onFieldSubmitted: (_) => onNext ?? onSubmit,
              decoration: InputDecoration(
                hintText: hint,
                hintStyle: TextStyle(
                  color: colorScheme.onSurface.withOpacity(0.4),
                ),
                prefixIcon: Icon(
                  Icons.lock_outline,
                  color: colorScheme.primary,
                ),
                suffixIcon: IconButton(
                  icon: Icon(
                    isVisible.value ? Icons.visibility_off : Icons.visibility,
                    color: colorScheme.onSurface.withOpacity(0.5),
                  ),
                  onPressed: onVisibilityToggle,
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: BorderSide.none,
                ),
                filled: true,
                fillColor: colorScheme.surface,
                contentPadding: const EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 14,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildPasswordStrengthMeter(
    double strengthPercent,
    ColorScheme colorScheme,
    AppLocalizations t,
  ) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      decoration: BoxDecoration(
        color: colorScheme.surface,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: colorScheme.outline.withOpacity(0.1)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                t.translate('password_strength'),
                style: AppTheme.caption.copyWith(
                  color: colorScheme.onSurface.withOpacity(0.6),
                ),
              ),
              Text(
                '${(strengthPercent * 100).toInt()}%',
                style: AppTheme.body2.copyWith(
                  fontWeight: FontWeight.bold,
                  color: _getStrengthColor(strengthPercent, colorScheme),
                ),
              ),
            ],
          ),
          const SizedBox(height: 8),
          ClipRRect(
            borderRadius: BorderRadius.circular(4),
            child: LinearProgressIndicator(
              value: strengthPercent,
              backgroundColor: colorScheme.outline.withOpacity(0.2),
              valueColor: AlwaysStoppedAnimation<Color>(
                _getStrengthColor(strengthPercent, colorScheme),
              ),
              minHeight: 8,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildPasswordRequirements({
    required bool hasMinLength,
    required bool hasUppercase,
    required bool hasLowercase,
    required bool hasNumber,
    required bool hasSpecial,
    required ColorScheme colorScheme,
    required AppLocalizations t,
  }) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: colorScheme.surface,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: colorScheme.outline.withOpacity(0.1)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            t.translate('password_requirements'),
            style: AppTheme.caption.copyWith(
              color: colorScheme.onSurface.withOpacity(0.7),
              fontWeight: FontWeight.w600,
            ),
          ),
          const SizedBox(height: 12),
          Wrap(
            spacing: 8,
            runSpacing: 8,
            children: [
              _buildRequirementChip(
                t.translate('min_8_chars'),
                hasMinLength,
                colorScheme,
              ),
              _buildRequirementChip(
                t.translate('uppercase'),
                hasUppercase,
                colorScheme,
              ),
              _buildRequirementChip(
                t.translate('lowercase'),
                hasLowercase,
                colorScheme,
              ),
              _buildRequirementChip(
                t.translate('number'),
                hasNumber,
                colorScheme,
              ),
              _buildRequirementChip(
                t.translate('special_char'),
                hasSpecial,
                colorScheme,
              ),
            ],
          ),
        ],
      ),
    );
  }

  Color _getStrengthColor(double percent, ColorScheme colorScheme) {
    if (percent < 0.4) return colorScheme.error;
    if (percent < 0.7) return colorScheme.tertiary;
    if (percent < 0.9) return colorScheme.primary;
    return colorScheme.secondary;
  }

  Widget _buildRequirementChip(
    String label,
    bool isMet,
    ColorScheme colorScheme,
  ) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
      decoration: BoxDecoration(
        color: isMet
            ? colorScheme.secondary.withOpacity(0.1)
            : colorScheme.outline.withOpacity(0.05),
        borderRadius: BorderRadius.circular(20),
        border: Border.all(
          color: isMet
              ? colorScheme.secondary.withOpacity(0.3)
              : colorScheme.outline.withOpacity(0.2),
        ),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            isMet ? Icons.check_circle : Icons.circle_outlined,
            size: 14,
            color: isMet ? colorScheme.secondary : colorScheme.outline,
          ),
          const SizedBox(width: 4),
          Text(
            label,
            style: AppTheme.caption.copyWith(
              color: isMet ? colorScheme.secondary : colorScheme.outline,
              fontWeight: isMet ? FontWeight.w600 : FontWeight.normal,
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

// import '../../../../core/localization/app_localizations.dart';
// import '../../../../core/themes/app_theme.dart';
// import '../../../../core/widgets/tumiax_button.dart';
// import '../../../../core/widgets/tumiax_text_field.dart';
// import '../controllers/change_password_controller.dart';

// class ChangePasswordPage extends HookConsumerWidget {
//   const ChangePasswordPage({super.key});

//   @override
//   Widget build(BuildContext context, WidgetRef ref) {
//     final t = AppLocalizations.of(context);

//     // Controllers
//     final currentPasswordController = useTextEditingController();
//     final newPasswordController = useTextEditingController();
//     final confirmPasswordController = useTextEditingController();

//     // State
//     final isLoading = useState(false);
//     final isCurrentPasswordVisible = useState(false);
//     final isNewPasswordVisible = useState(false);
//     final isConfirmPasswordVisible = useState(false);
//     final formKey = useMemoized(() => GlobalKey<FormState>());

//     // Get controller
//     final changePasswordController = ref.read(
//       changePasswordControllerProvider.notifier,
//     );

//     // Listen to controller state for errors
//     ref.listen(changePasswordControllerProvider, (previous, next) {
//       next.whenOrNull(
//         error: (error, stack) {
//           ScaffoldMessenger.of(context).showSnackBar(
//             SnackBar(
//               content: Text(error.toString()),
//               backgroundColor: AppTheme.errorColor,
//               behavior: SnackBarBehavior.floating,
//             ),
//           );
//           isLoading.value = false;
//         },
//       );
//     });

//     Future<void> _submit() async {
//       if (!formKey.currentState!.validate()) return;

//       isLoading.value = true;

//       final success = await changePasswordController.changePassword(
//         oldPassword: currentPasswordController.text,
//         newPassword: newPasswordController.text,
//       );

//       if (success && context.mounted) {
//         ScaffoldMessenger.of(context).showSnackBar(
//           SnackBar(
//             content: Text(t.translate('password_changed_successfully')),
//             backgroundColor: AppTheme.secondaryColor,
//             behavior: SnackBarBehavior.floating,
//           ),
//         );
//         context.pop();
//       }

//       isLoading.value = false;
//     }

//     return Scaffold(
//       backgroundColor: Colors.white,
//       appBar: AppBar(
//         backgroundColor: Colors.transparent,
//         elevation: 0,
//         leading: IconButton(
//           icon: const Icon(Icons.arrow_back_ios, color: AppTheme.primaryColor),
//           onPressed: () => context.pop(),
//         ),
//         title: Text(
//           t.translate('change_password'),
//           style: AppTheme.heading3.copyWith(color: AppTheme.primaryColor),
//         ),
//       ),
//       body: SafeArea(
//         child: SingleChildScrollView(
//           padding: const EdgeInsets.all(AppTheme.defaultPadding),
//           child: Form(
//             key: formKey,
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.stretch,
//               children: [
//                 // Header Icon
//                 Center(
//                   child: Container(
//                     padding: const EdgeInsets.all(24),
//                     decoration: BoxDecoration(
//                       color: AppTheme.primaryColor.withOpacity(0.1),
//                       shape: BoxShape.circle,
//                     ),
//                     child: Icon(
//                       Icons.lock_outline,
//                       size: 48,
//                       color: AppTheme.primaryColor,
//                     ),
//                   ),
//                 ),

//                 const SizedBox(height: 32),

//                 // Current Password
//                 TumiaxTextField(
//                   controller: currentPasswordController,
//                   label: t.translate('current_password'),
//                   hint: t.translate('enter_current_password'),
//                   prefixIcon: Icons.lock_outline,
//                   obscureText: !isCurrentPasswordVisible.value,
//                   suffixIcon: IconButton(
//                     icon: Icon(
//                       isCurrentPasswordVisible.value
//                           ? Icons.visibility_off
//                           : Icons.visibility,
//                     ),
//                     onPressed: () => isCurrentPasswordVisible.value =
//                         !isCurrentPasswordVisible.value,
//                   ),
//                   validator: (value) {
//                     if (value == null || value.isEmpty) {
//                       return t.translate('current_password_required');
//                     }
//                     return null;
//                   },
//                 ),

//                 const SizedBox(height: 16),

//                 // New Password
//                 TumiaxTextField(
//                   controller: newPasswordController,
//                   label: t.translate('new_password'),
//                   hint: t.translate('enter_new_password'),
//                   prefixIcon: Icons.lock_outline,
//                   obscureText: !isNewPasswordVisible.value,
//                   suffixIcon: IconButton(
//                     icon: Icon(
//                       isNewPasswordVisible.value
//                           ? Icons.visibility_off
//                           : Icons.visibility,
//                     ),
//                     onPressed: () => isNewPasswordVisible.value =
//                         !isNewPasswordVisible.value,
//                   ),
//                   validator: (value) {
//                     if (value == null || value.isEmpty) {
//                       return t.translate('new_password_required');
//                     }
//                     if (value.length < 8) {
//                       return t.translate('password_too_short');
//                     }
//                     return null;
//                   },
//                 ),

//                 const SizedBox(height: 16),

//                 // Confirm New Password
//                 TumiaxTextField(
//                   controller: confirmPasswordController,
//                   label: t.translate('confirm_new_password'),
//                   hint: t.translate('confirm_new_password'),
//                   prefixIcon: Icons.lock_outline,
//                   obscureText: !isConfirmPasswordVisible.value,
//                   suffixIcon: IconButton(
//                     icon: Icon(
//                       isConfirmPasswordVisible.value
//                           ? Icons.visibility_off
//                           : Icons.visibility,
//                     ),
//                     onPressed: () => isConfirmPasswordVisible.value =
//                         !isConfirmPasswordVisible.value,
//                   ),
//                   validator: (value) {
//                     if (value == null || value.isEmpty) {
//                       return t.translate('confirm_password_required');
//                     }
//                     if (value != newPasswordController.text) {
//                       return t.translate('passwords_do_not_match');
//                     }
//                     return null;
//                   },
//                 ),

//                 const SizedBox(height: 24),

//                 // Password Requirements
//                 Container(
//                   padding: const EdgeInsets.all(16),
//                   decoration: BoxDecoration(
//                     color: Colors.grey.shade50,
//                     borderRadius: BorderRadius.circular(12),
//                     border: Border.all(color: Colors.grey.shade200),
//                   ),
//                   child: Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       Text(
//                         t.translate('password_requirements'),
//                         style: AppTheme.body2.copyWith(
//                           fontWeight: FontWeight.bold,
//                         ),
//                       ),
//                       const SizedBox(height: 8),
//                       _buildRequirement(
//                         t.translate('min_8_characters'),
//                         newPasswordController.text.length >= 8,
//                       ),
//                       _buildRequirement(
//                         t.translate('at_least_one_uppercase'),
//                         RegExp(r'[A-Z]').hasMatch(newPasswordController.text),
//                       ),
//                       _buildRequirement(
//                         t.translate('at_least_one_lowercase'),
//                         RegExp(r'[a-z]').hasMatch(newPasswordController.text),
//                       ),
//                       _buildRequirement(
//                         t.translate('at_least_one_number'),
//                         RegExp(r'[0-9]').hasMatch(newPasswordController.text),
//                       ),
//                       _buildRequirement(
//                         t.translate('at_least_one_special'),
//                         RegExp(
//                           r'[!@#$%^&*(),.?":{}|<>]',
//                         ).hasMatch(newPasswordController.text),
//                       ),
//                     ],
//                   ),
//                 ),

//                 const SizedBox(height: 32),

//                 // Submit Button
//                 TumiaxButton(
//                   text: t.translate('update_password'),
//                   onPressed: _submit,
//                   isLoading: isLoading.value,
//                 ),
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }

//   Widget _buildRequirement(String text, bool isMet) {
//     return Padding(
//       padding: const EdgeInsets.symmetric(vertical: 4),
//       child: Row(
//         children: [
//           Icon(
//             isMet ? Icons.check_circle : Icons.cancel,
//             size: 16,
//             color: isMet ? Colors.green : Colors.grey,
//           ),
//           const SizedBox(width: 8),
//           Expanded(
//             child: Text(
//               text,
//               style: AppTheme.caption.copyWith(
//                 color: isMet ? Colors.green : Colors.grey.shade600,
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
