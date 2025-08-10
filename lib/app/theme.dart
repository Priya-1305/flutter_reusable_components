import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTheme {
  static const primary = Color.fromARGB(255, 163, 245, 204);
  static const bg = Color(0xFFF7F8FA);
  static const text = Color(0xFF0F172A);

  static final light = ThemeData(
    useMaterial3: true,
    scaffoldBackgroundColor: bg,
    colorScheme: ColorScheme.fromSeed(seedColor: primary),
    textTheme: GoogleFonts.interTextTheme().copyWith(
      bodyMedium: GoogleFonts.inter(fontSize: 14, color: text),
      titleMedium: GoogleFonts.inter(fontWeight: FontWeight.w600, color: text),
    ),
  );
}
