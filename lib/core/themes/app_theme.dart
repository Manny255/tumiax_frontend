// lib/core/themes/app_theme.dart
import 'package:flutter/material.dart';

class AppTheme {
  // ==============================
  // BRAND COLORS (Official)
  // ==============================

  /// Primary Deep Blue (Base brand depth)
  static const Color primaryDeepBlue = Color(0xFF0A3D91);

  /// Royal Blue (Primary CTA color)
  static const Color primaryColor = Color(0xFF1565C0);

  /// Teal Transition (Accent / secondary highlight)
  static const Color accentColor = Color(0xFF00A8A8);

  /// Fintech Growth Green (Success)
  static const Color secondaryColor = Color(0xFF2ED573);

  /// Neon Accent Green (Micro highlights only)
  static const Color neonAccent = Color(0xFF7CFC00);

  /// Error Red
  static const Color errorColor = Color(0xFFEF4444);

  /// Warning
  static const Color warningColor = Color(0xFFFFC107);

  /// Info
  static const Color infoColor = Color(0xFF17A2B8);

  // ==============================
  // NEUTRALS
  // ==============================

  /// Dark Mode Background
  static const Color darkBackground = Color(0xFF0F172A);

  static const Color darkSurface = Color(0xFF111827);

  /// Light Mode Background
  static const Color lightBackground = Color(0xFFF4F7FB);

  static const Color lightSurface = Colors.white;

  /// Text Colors
  static const Color textPrimaryDark = Color(0xFF111827);
  static const Color textSecondary = Color(0xFF6B7280);
  static const Color textLight = Color(0xFFF9FAFB);

  // ==============================
  // SPACING
  // ==============================

  static const double defaultPadding = 16.0;
  static const double smallPadding = 8.0;
  static const double largePadding = 24.0;

  static const Duration defaultAnimationDuration = Duration(milliseconds: 300);

  // ==============================
  // TYPOGRAPHY
  // ==============================

  static const TextStyle heading1 = TextStyle(
    fontSize: 32,
    fontWeight: FontWeight.bold,
    fontFamily: 'Poppins',
    letterSpacing: -0.5,
  );

  static const TextStyle heading2 = TextStyle(
    fontSize: 28,
    fontWeight: FontWeight.bold,
    fontFamily: 'Poppins',
    letterSpacing: -0.5,
  );

  static const TextStyle heading3 = TextStyle(
    fontSize: 20,
    fontWeight: FontWeight.w600,
    fontFamily: 'Poppins',
  );

  static const TextStyle body1 = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.normal,
    fontFamily: 'Inter',
  );

  static const TextStyle body2 = TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.normal,
    fontFamily: 'Inter',
  );

  static const TextStyle caption = TextStyle(
    fontSize: 12,
    fontWeight: FontWeight.normal,
    fontFamily: 'Inter',
    color: textSecondary,
  );

  // ==============================
  // BRAND GRADIENT
  // ==============================

  static const LinearGradient primaryGradient = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [primaryDeepBlue, primaryColor, accentColor, secondaryColor],
    stops: [0.0, 0.35, 0.65, 1.0],
  );
}



// lib/core/themes/app_theme.dart
// import 'package:flutter/material.dart';

// class AppTheme {
//   static const Color primaryColor = Color(0xFF0B2E4E);
//   static const Color secondaryColor = Color(0xFF00A86B);
//   static const Color accentColor = Color(0xFFFFB800);
//   static const Color errorColor = Color(0xFFDC3545);
//   static const Color successColor = Color(0xFF28A745);
//   static const Color warningColor = Color(0xFFFFC107);
//   static const Color infoColor = Color(0xFF17A2B8);
  
//   static const Color darkBackground = Color(0xFF121212);
//   static const Color darkSurface = Color(0xFF1E1E1E);
//   static const Color darkText = Color(0xFFE0E0E0);
  
//   static const Color lightBackground = Color(0xFFF5F5F5);
//   static const Color lightSurface = Colors.white;
//   static const Color lightText = Color(0xFF212121);
  
//   static const double defaultPadding = 16.0;
//   static const double smallPadding = 8.0;
//   static const double largePadding = 24.0;
  
//   static const Duration defaultAnimationDuration = Duration(milliseconds: 300);
  
//   static const TextStyle heading1 = TextStyle(
//     fontSize: 32,
//     fontWeight: FontWeight.bold,
//     fontFamily: 'Poppins',
//     letterSpacing: -0.5,
//   );
  
//   static const TextStyle heading2 = TextStyle(
//     fontSize: 28,
//     fontWeight: FontWeight.bold,
//     fontFamily: 'Poppins',
//     letterSpacing: -0.5,
//   );
  
//   static const TextStyle heading3 = TextStyle(
//     fontSize: 24,
//     fontWeight: FontWeight.w600,
//     fontFamily: 'Poppins',
//   );
  
//   static const TextStyle body1 = TextStyle(
//     fontSize: 16,
//     fontWeight: FontWeight.normal,
//     fontFamily: 'Inter',
//   );
  
//   static const TextStyle body2 = TextStyle(
//     fontSize: 14,
//     fontWeight: FontWeight.normal,
//     fontFamily: 'Inter',
//   );
  
//   static const TextStyle caption = TextStyle(
//     fontSize: 12,
//     fontWeight: FontWeight.normal,
//     fontFamily: 'Inter',
//     color: Colors.grey,
//   );
// }

