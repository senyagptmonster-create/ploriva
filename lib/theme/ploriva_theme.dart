import 'package:flutter/material.dart';

class PlorivaTheme {
  static const bg = Color(0xFFF5FBF6);
  static const surface = Color(0xFFFFFFFF);
  static const edge = Color(0xFFD1FAE5);
  static const accent = Color(0xFF15803D);
  static const accent2 = Color(0xFF86EFAC);
  static const ink = Color(0xFF14532D);
  static const inkMuted = Color(0xFF166534);

  static ThemeData get theme {
    return ThemeData(
      useMaterial3: true,
      fontFamily: 'AppFont',
      scaffoldBackgroundColor: bg,
      colorScheme: const ColorScheme.light(
        surface: surface,
        primary: accent,
        secondary: accent2,
        onSurface: ink,
      ),
      appBarTheme: const AppBarTheme(
        backgroundColor: surface,
        foregroundColor: ink,
        elevation: 0,
      ),
      navigationBarTheme: NavigationBarThemeData(
        backgroundColor: surface,
        indicatorColor: edge,
      ),
    );
  }
}
