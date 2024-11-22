import 'package:flutter/material.dart';

const customTextTheme = TextTheme(
  // Display styles (for large headers)
  displayLarge: TextStyle(fontSize: 57, fontWeight: FontWeight.bold),   // Headline1
  displayMedium: TextStyle(fontSize: 45, fontWeight: FontWeight.bold),  // Headline2
  displaySmall: TextStyle(fontSize: 36, fontWeight: FontWeight.bold),   // Headline3

  // Headline styles
  headlineLarge: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),  // Headline4
  headlineMedium: TextStyle(fontSize: 28, fontWeight: FontWeight.bold), // Headline5
  headlineSmall: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),  // Headline6

  // Title styles (subtitles)
  titleLarge: TextStyle(fontSize: 22, fontWeight: FontWeight.w600),     // Subtitle1
  titleMedium: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),    // Subtitle2
  titleSmall: TextStyle(fontSize: 14, fontWeight: FontWeight.w600),     // New in M3

  // Body styles
  bodyLarge: TextStyle(fontSize: 16, fontWeight: FontWeight.normal),    // BodyText1
  bodyMedium: TextStyle(fontSize: 14, fontWeight: FontWeight.normal),   // BodyText2
  bodySmall: TextStyle(fontSize: 12, fontWeight: FontWeight.normal),    // Caption

  // Labels and buttons
  labelLarge: TextStyle(fontSize: 14, fontWeight: FontWeight.w600),     // Button
  labelMedium: TextStyle(fontSize: 12, fontWeight: FontWeight.w600),
  labelSmall: TextStyle(fontSize: 11, fontWeight: FontWeight.w600),
);
