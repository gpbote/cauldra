import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

ThemeData buildCauldraTheme() {
  const background = Color(0xFF1B1A17);
  const card = Color(0xFF31291E);
  const primary = Color(0xFF7B9E45);
  const accent = Color(0xFFD4A44A);
  const text = Color(0xFFF7F1E3);

  return ThemeData(
    useMaterial3: true,
    brightness: Brightness.dark,

    scaffoldBackgroundColor: background,

    colorScheme: const ColorScheme.dark(
      primary: primary,
      secondary: accent,
      surface: card,
    ),

    appBarTheme: AppBarTheme(
      backgroundColor: background,
      centerTitle: true,
      elevation: 0,
      titleTextStyle: GoogleFonts.cinzel(
        color: text,
        fontSize: 24,
        fontWeight: FontWeight.bold,
      ),
    ),

    textTheme: GoogleFonts.nunitoTextTheme(
      ThemeData.dark().textTheme,
    ).apply(
      bodyColor: text,
      displayColor: text,
    ),

    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: primary,
        foregroundColor: text,
        padding: const EdgeInsets.symmetric(
          horizontal: 24,
          vertical: 14,
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        ),
      ),
    ),

    cardTheme: CardThemeData(
      color: card,
      elevation: 4,
      margin: const EdgeInsets.all(12),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
    ),
  );
}