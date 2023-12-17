import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

ThemeData theme = ThemeData(
  colorScheme: ColorScheme.fromSeed(
    seedColor: Colors.deepPurple,
    primary: const Color(0xff10217D),
  ),
  highlightColor: const Color(0xff16C2D5),
  textTheme: GoogleFonts.interTextTheme(
    const TextTheme(
      displayLarge: TextStyle(
        fontSize: 24,
        fontWeight: FontWeight.bold,
        color: Colors.black,
      ),
      displayMedium: TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.normal,
        color: Colors.black,
      ),
      displaySmall: TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.bold,
        color: Colors.black,
      ),
      headlineMedium: TextStyle(
        fontSize: 14,
        fontWeight: FontWeight.bold,
        color: Colors.black,
      ),
      headlineSmall: TextStyle(
        fontSize: 12,
        fontWeight: FontWeight.bold,
        color: Colors.black,
      ),
      titleLarge: TextStyle(
        fontSize: 10,
        fontWeight: FontWeight.normal,
        color: Colors.black,
      ),
      bodyLarge: TextStyle(
        fontSize: 14,
        fontWeight: FontWeight.normal,
        color: Colors.black,
      ),
      bodyMedium: TextStyle(
        fontSize: 12,
        fontWeight: FontWeight.normal,
        color: Colors.black,
      ),
      titleMedium: TextStyle(
        fontSize: 10,
        fontWeight: FontWeight.normal,
        color: Colors.black,
      ),
      titleSmall: TextStyle(
        fontSize: 8,
        fontWeight: FontWeight.normal,
        color: Colors.black,
      ),
    ),
  ),
  useMaterial3: true,
);
