import 'package:flutter/material.dart';

class AppColors {
  // Primary Colors
  static const Color primary = Color(0xFF1A73E8);
  static const Color primaryLight = Color(0xFF4285F4);
  static const Color primaryDark = Color(0xFF0D47A1);

  // Background Colors
  static const Color background = Color(0xFFFFFFFF);
  static const Color backgroundDark = Color(0xFF121212);
  static const Color surfaceLight = Color(0xFFF8F9FA);
  static const Color surfaceDark = Color(0xFF1E1E1E);

  // Text Colors
  static const Color textPrimary = Color(0xFF202124);
  static const Color textSecondary = Color(0xFF5F6368);
  static const Color textPrimaryDark = Color(0xFFE8EAED);
  static const Color textSecondaryDark = Color(0xFF9AA0A6);

  // Accent Colors
  static const Color accent = Color(0xFF34A853);
  static const Color error = Color(0xFFDC3545);
  static const Color warning = Color(0xFFFFC107);
  static const Color success = Color(0xFF28A745);

  // Border Colors
  static const Color border = Color(0xFFDADCE0);
  static const Color borderDark = Color(0xFF3C4043);

  // Chat Colors
  static const Color aiMessage = Color(0xFFF1F3F4);
  static const Color aiMessageDark = Color(0xFF2D2D2D);
  static const Color userMessage = Color(0xFFE8F0FE);
  static const Color userMessageDark = Color(0xFF1A73E8);

  // Source Citation Colors
  static const Color sourceBackground = Color(0xFFEFF3F6);
  static const Color sourceBackgroundDark = Color(0xFF282828);
  static const Color sourceText = Color(0xFF4A4A4A);
  static const Color sourceTextDark = Color(0xFFBBBBBB);

  static ThemeData lightTheme = ThemeData(
    useMaterial3: true,
    brightness: Brightness.light,
    colorScheme: ColorScheme.light(
      primary: primary,
      secondary: accent,
      surface: background,
      background: background,
      error: error,
      onPrimary: Colors.white,
      onSecondary: Colors.white,
      onSurface: textPrimary,
      onBackground: textPrimary,
      onError: Colors.white,
    ),
    scaffoldBackgroundColor: background,
  );

  static ThemeData darkTheme = ThemeData(
    useMaterial3: true,
    brightness: Brightness.dark,
    colorScheme: ColorScheme.dark(
      primary: primaryLight,
      secondary: accent,
      surface: surfaceDark,
      background: backgroundDark,
      error: error,
      onPrimary: Colors.white,
      onSecondary: Colors.white,
      onSurface: textPrimaryDark,
      onBackground: textPrimaryDark,
      onError: Colors.white,
    ),
    scaffoldBackgroundColor: backgroundDark,
  );
}
