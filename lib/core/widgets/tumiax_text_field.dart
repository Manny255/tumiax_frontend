// lib/core/widgets/tumiax_text_field.dart
import 'package:flutter/material.dart';
import '../themes/app_theme.dart';

class TumiaxTextField extends StatelessWidget {
  final TextEditingController controller;
  final String label;
  final String? hint;
  final IconData? prefixIcon;
  final Widget? suffixIcon;

  final bool obscureText;
  final TextInputType? keyboardType;
  final String? Function(String?)? validator;
  final void Function(String)? onChanged;

  final bool readOnly;
  final VoidCallback? onTap;

  final int? maxLines;
  final int? minLines;
  final int? maxLength;

  final TextInputAction? textInputAction;
  final FocusNode? focusNode;
  final bool enabled;
  final Iterable<String>? autofillHints;

  const TumiaxTextField({
    super.key,
    required this.controller,
    required this.label,
    this.hint,
    this.prefixIcon,
    this.suffixIcon,
    this.obscureText = false,
    this.keyboardType,
    this.validator,
    this.onChanged,
    this.readOnly = false,
    this.onTap,
    this.maxLines = 1,
    this.minLines,
    this.maxLength,
    this.textInputAction,
    this.focusNode,
    this.enabled = true,
    this.autofillHints,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return TextFormField(
      controller: controller,
      focusNode: focusNode,
      readOnly: readOnly,
      onTap: onTap,
      obscureText: obscureText,
      keyboardType: keyboardType,
      validator: validator,
      onChanged: onChanged,
      enabled: enabled,
      autofillHints: autofillHints,
      textInputAction: textInputAction,
      maxLines: obscureText ? 1 : maxLines,
      minLines: minLines,
      maxLength: maxLength,
      style: theme.textTheme.bodyLarge ?? AppTheme.body1,

      decoration: InputDecoration(
        labelText: label,
        hintText: hint,

        prefixIcon: prefixIcon != null
            ? Icon(prefixIcon, color: theme.iconTheme.color)
            : null,

        suffixIcon: suffixIcon,

        counterText: "", // hides ugly default counter if maxLength is set
      ),
    );
  }
}
