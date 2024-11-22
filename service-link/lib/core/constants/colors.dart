import 'package:flutter/material.dart';

class AppColors {
  // Light Theme Colors
  static const primary = Color(0xFF1D3557);       // Deep Blue (Trust, Reliability)
  static const onPrimary = Colors.white;          // Text/Icon color on Primary

  static const secondary = Color(0xFF2A9D8F);     // Emerald Green (Growth, Community)
  static const onSecondary = Colors.white;        // Text/Icon color on Secondary

  static const tertiary = Color(0xFFF4A261);      // Warm Yellow (Energy, Optimism)
  static const onTertiary = Colors.black;         // Text/Icon color on Tertiary

  static const background = Color(0xFFE9ECEF);    // Light Gray (Neutral, Modern)
  static const onBackground = Colors.black;       // Text/Icon color on Background

  static const surface = Color(0xFFF3F5FD);       // Surface color (e.g., Cards, AppBar)
  static const onSurface = Colors.black;          // Text/Icon color on Surface

  static const error = Colors.red;                // Error color
  static const onError = Colors.white;            // Text/Icon color on Error

  static const outline = Colors.grey;             // Outline color (Borders, Dividers)
  static const shadow = Colors.black26;           // Shadow color for elevation


  // Dark Theme Colors
  static const primaryDark = Color(0xFF8AB6D6);   // Lighter Blue for Dark Mode
  static const onPrimaryDark = Color(0xFF1D3557); // Dark Blue for Text/Icon on Primary

  static const secondaryDark = Color(0xFF2A9D8F); // Emerald Green stays the same
  static const onSecondaryDark = Colors.white;

  static const tertiaryDark = Color(0xFFEE9B45);  // Slightly Muted Yellow for Dark Mode
  static const onTertiaryDark = Colors.black;

  static const backgroundDark = Color(0xFF1C1C1E); // Dark Gray for Background
  static const onBackgroundDark = Color(0xFFE5E5E5); // Light Text/Icon on Background

  static const surfaceDark = Color(0xFF2C2C2E);   // Dark Surface (Cards, AppBar, etc.)
  static const onSurfaceDark = Colors.white;

  static const errorDark = Color(0xFFCF6679);     // Softer Red for Error in Dark Mode
  static const onErrorDark = Colors.black;

  static const outlineDark = Colors.white24;      // Lighter outline for dark mode
  static const shadowDark = Colors.black54;       // Darker shadow for dark mode

  // Gradients
  static const List<Color> primaryGradient = [
    Color(0xFF1D3557), // Deep Blue
    Color(0xFF2A9D8F), // Emerald Green
  ];

  static const List<Color> secondaryGradient = [
    Color(0xFF2A9D8F), // Emerald Green
    Color(0xFFF4A261), // Warm Yellow
  ];
}
