import 'package:flutter/material.dart';

class AppTheme {
  static ThemeData get theme {
    return ThemeData(
      primaryColor: const Color(0xFF3E3C37),
      hintColor: const Color(0xFF7D8F69),
      scaffoldBackgroundColor: const Color(0xFFF7F4EF),
      textTheme: TextTheme(
        displayLarge: TextStyle(
          fontSize: 24,
          fontWeight: FontWeight.bold,
          color: const Color(0xFF3E3C37),
        ),
        bodyLarge: TextStyle(fontSize: 16, color: const Color(0xFF3E3C37)),
      ),
    );
  }
}
