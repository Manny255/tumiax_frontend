import 'package:flutter/material.dart';
import 'app_theme.dart';

class DarkTheme {
  static ThemeData get theme {
    return ThemeData(
      brightness: Brightness.dark,
      useMaterial3: true,

      primaryColor: AppTheme.primaryColor,

      colorScheme: const ColorScheme.dark(
        primary: AppTheme.primaryColor,
        secondary: AppTheme.secondaryColor,
        error: AppTheme.errorColor,
        surface: AppTheme.darkSurface,
      ),

      scaffoldBackgroundColor: AppTheme.darkBackground,

      appBarTheme: const AppBarTheme(
        elevation: 0,
        centerTitle: true,
        backgroundColor: Colors.transparent,
        foregroundColor: AppTheme.textLight,
        titleTextStyle: AppTheme.heading3,
      ),

      textTheme: const TextTheme(
        displayLarge: AppTheme.heading1,
        displayMedium: AppTheme.heading2,
        displaySmall: AppTheme.heading3,
        bodyLarge: AppTheme.body1,
        bodyMedium: AppTheme.body2,
        labelSmall: AppTheme.caption,
      ).apply(
        bodyColor: AppTheme.textLight,
        displayColor: AppTheme.textLight,
      ),

      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: AppTheme.primaryColor,
          foregroundColor: Colors.white,
          minimumSize: const Size(double.infinity, 52),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(14),
          ),
          textStyle: const TextStyle(
            fontWeight: FontWeight.w600,
            fontFamily: 'Inter',
          ),
        ),
      ),

      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        fillColor: AppTheme.darkSurface,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(14),
          borderSide: BorderSide.none,
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(14),
          borderSide: const BorderSide(
            color: AppTheme.primaryColor,
            width: 2,
          ),
        ),
        contentPadding:
            const EdgeInsets.all(AppTheme.defaultPadding),
        hintStyle: const TextStyle(
          color: AppTheme.textSecondary,
        ),
      ),

      cardTheme: CardThemeData(
        elevation: 3,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(18),
        ),
        color: AppTheme.darkSurface,
      ),
    );
  }
}



// import 'package:flutter/material.dart';
// import 'app_theme.dart';

// class DarkTheme {
//   static ThemeData get theme {
//     return ThemeData(
//       brightness: Brightness.dark,
//       primaryColor: AppTheme.primaryColor,

//       colorScheme: const ColorScheme.dark(
//         primary: AppTheme.primaryColor,
//         secondary: AppTheme.secondaryColor,
//         error: AppTheme.errorColor,
//         surface: AppTheme.darkSurface,
//       ),

//       scaffoldBackgroundColor: AppTheme.darkBackground,

//       appBarTheme: const AppBarTheme(
//         elevation: 0,
//         centerTitle: true,
//         backgroundColor: Colors.transparent,
//         foregroundColor: AppTheme.darkText,
//         titleTextStyle: AppTheme.heading3,
//       ),

//       textTheme: const TextTheme(
//         displayLarge: AppTheme.heading1,
//         displayMedium: AppTheme.heading2,
//         displaySmall: AppTheme.heading3,
//         bodyLarge: AppTheme.body1,
//         bodyMedium: AppTheme.body2,
//         labelSmall: AppTheme.caption,
//       ).apply(bodyColor: AppTheme.darkText, displayColor: AppTheme.darkText),

//       elevatedButtonTheme: ElevatedButtonThemeData(
//         style: ElevatedButton.styleFrom(
//           backgroundColor: AppTheme.primaryColor,
//           foregroundColor: Colors.white,
//           minimumSize: const Size(double.infinity, 50),
//           shape: RoundedRectangleBorder(
//             borderRadius: BorderRadius.circular(12),
//           ),
//         ),
//       ),

//       inputDecorationTheme: InputDecorationTheme(
//         filled: true,
//         fillColor: AppTheme.darkSurface,
//         border: OutlineInputBorder(
//           borderRadius: BorderRadius.circular(12),
//           borderSide: BorderSide.none,
//         ),
//         enabledBorder: OutlineInputBorder(
//           borderRadius: BorderRadius.circular(12),
//           borderSide: BorderSide.none,
//         ),
//         focusedBorder: OutlineInputBorder(
//           borderRadius: BorderRadius.circular(12),
//           borderSide: const BorderSide(color: AppTheme.primaryColor, width: 2),
//         ),
//         errorBorder: OutlineInputBorder(
//           borderRadius: BorderRadius.circular(12),
//           borderSide: const BorderSide(color: AppTheme.errorColor),
//         ),
//         contentPadding: const EdgeInsets.all(AppTheme.defaultPadding),
//         hintStyle: const TextStyle(color: Colors.grey),
//       ),

//       cardTheme: CardThemeData(
//         elevation: 2,
//         shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
//         color: AppTheme.darkSurface,
//       ),
//     );
//   }
// }
