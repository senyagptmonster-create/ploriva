import 'package:flutter/material.dart';

class PlorivaTheme {
  static const background = Color(0xFF06140F);
  static const surface = Color(0xFF0E231B);
  static const card = Color(0xFF163328);
  static const emerald = Color(0xFF10B981);
  static const mint = Color(0xFF34D399);
  static const amber = Color(0xFFF59E0B);
  static const textPrimary = Color(0xFFF0FDF4);
  static const textSecondary = Color(0xFF86EFAC);

  static ThemeData get themeData {
    return ThemeData(
      brightness: Brightness.dark,
      scaffoldBackgroundColor: background,
      primaryColor: emerald,
      cardColor: card,
      fontFamily: 'AppFont',
      colorScheme: const ColorScheme.dark(
        primary: emerald,
        secondary: mint,
        surface: surface,
      ),
      appBarTheme: const AppBarTheme(
        backgroundColor: background,
        elevation: 0,
        centerTitle: true,
        titleTextStyle: TextStyle(
          color: textPrimary,
          fontSize: 18,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
