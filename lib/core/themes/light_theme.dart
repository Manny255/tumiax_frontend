import 'package:flutter/material.dart';
import 'app_theme.dart';

class LightTheme {
  static ThemeData get theme {
    return ThemeData(
      brightness: Brightness.light,
      useMaterial3: true,

      primaryColor: AppTheme.primaryColor,

      colorScheme: const ColorScheme.light(
        primary: AppTheme.primaryColor,
        secondary: AppTheme.secondaryColor,
        error: AppTheme.errorColor,
        surface: AppTheme.lightSurface,
      ),

      scaffoldBackgroundColor: AppTheme.lightBackground,

      appBarTheme: const AppBarTheme(
        elevation: 0,
        centerTitle: true,
        backgroundColor: Colors.transparent,
        foregroundColor: AppTheme.textPrimaryDark,
        titleTextStyle: AppTheme.heading3,
      ),

      textTheme:
          const TextTheme(
            displayLarge: AppTheme.heading1,
            displayMedium: AppTheme.heading2,
            displaySmall: AppTheme.heading3,
            bodyLarge: AppTheme.body1,
            bodyMedium: AppTheme.body2,
            labelSmall: AppTheme.caption,
          ).apply(
            bodyColor: AppTheme.textPrimaryDark,
            displayColor: AppTheme.textPrimaryDark,
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

      outlinedButtonTheme: OutlinedButtonThemeData(
        style: OutlinedButton.styleFrom(
          foregroundColor: AppTheme.primaryColor,
          side: const BorderSide(color: AppTheme.primaryColor),
          minimumSize: const Size(double.infinity, 52),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(14),
          ),
        ),
      ),

      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        fillColor: Colors.white,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(14),
          borderSide: BorderSide.none,
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(14),
          borderSide: const BorderSide(color: AppTheme.primaryColor, width: 2),
        ),
        contentPadding: const EdgeInsets.all(AppTheme.defaultPadding),
        hintStyle: const TextStyle(color: AppTheme.textSecondary),
      ),

      cardTheme: CardThemeData(
        elevation: 3,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(18)),
        color: AppTheme.lightSurface,
      ),

      bottomNavigationBarTheme: const BottomNavigationBarThemeData(
        backgroundColor: Colors.white,
        selectedItemColor: AppTheme.primaryColor,
        unselectedItemColor: AppTheme.textSecondary,
        type: BottomNavigationBarType.fixed,
        elevation: 8,
      ),
    );
  }
}


// import 'package:flutter/material.dart';
// import 'app_theme.dart';

// class LightTheme {
//   static ThemeData get theme {
//     return ThemeData(
//       brightness: Brightness.light,
//       primaryColor: AppTheme.primaryColor,

//       colorScheme: const ColorScheme.light(
//         primary: AppTheme.primaryColor,
//         secondary: AppTheme.secondaryColor,
//         error: AppTheme.errorColor,
//         surface: AppTheme.lightSurface,
//       ),

//       scaffoldBackgroundColor: AppTheme.lightBackground,

//       appBarTheme: const AppBarTheme(
//         elevation: 0,
//         centerTitle: true,
//         backgroundColor: Colors.transparent,
//         foregroundColor: AppTheme.lightText,
//         titleTextStyle: AppTheme.heading3,
//       ),

//       textTheme: const TextTheme(
//         displayLarge: AppTheme.heading1,
//         displayMedium: AppTheme.heading2,
//         displaySmall: AppTheme.heading3,
//         bodyLarge: AppTheme.body1,
//         bodyMedium: AppTheme.body2,
//         labelSmall: AppTheme.caption,
//       ),

//       elevatedButtonTheme: ElevatedButtonThemeData(
//         style: ElevatedButton.styleFrom(
//           backgroundColor: AppTheme.primaryColor,
//           foregroundColor: Colors.white,
//           minimumSize: const Size(double.infinity, 50),
//           shape: RoundedRectangleBorder(
//             borderRadius: BorderRadius.circular(12),
//           ),
//           textStyle: const TextStyle(
//             fontSize: 16,
//             fontWeight: FontWeight.w600,
//             fontFamily: 'Inter',
//           ),
//         ),
//       ),

//       outlinedButtonTheme: OutlinedButtonThemeData(
//         style: OutlinedButton.styleFrom(
//           foregroundColor: AppTheme.primaryColor,
//           side: const BorderSide(color: AppTheme.primaryColor),
//           minimumSize: const Size(double.infinity, 50),
//           shape: RoundedRectangleBorder(
//             borderRadius: BorderRadius.circular(12),
//           ),
//         ),
//       ),

//       inputDecorationTheme: InputDecorationTheme(
//         filled: true,
//         fillColor: Colors.grey.shade100,
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
//         color: Colors.white,
//       ),

//       bottomNavigationBarTheme: const BottomNavigationBarThemeData(
//         backgroundColor: Colors.white,
//         selectedItemColor: AppTheme.primaryColor,
//         unselectedItemColor: Colors.grey,
//         type: BottomNavigationBarType.fixed,
//         elevation: 8,
//       ),
//     );
//   }
// }
