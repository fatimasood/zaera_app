import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:zaera_app/core/themes/colors.dart';

class AppTheme {
  static ThemeData get theme {
    return ThemeData(
      scaffoldBackgroundColor: AppColors.background,
      primaryColor: AppColors.brown,
      hintColor: AppColors.musteredGreen,

      textTheme: TextTheme(
        displayLarge: GoogleFonts.urbanist(
          fontSize: 28,
          fontWeight: FontWeight.w800,
          color: AppColors.brown,
        ).copyWith(inherit: true),
        displayMedium: GoogleFonts.urbanist(
          fontSize: 24,
          fontWeight: FontWeight.w600,
          color: AppColors.brown,
        ).copyWith(inherit: true),
        displaySmall: GoogleFonts.urbanist(
          fontSize: 20,
          fontWeight: FontWeight.w500,
          color: AppColors.brown,
        ).copyWith(inherit: true),

        bodyLarge: GoogleFonts.inter(
          fontSize: 16,
          fontWeight: FontWeight.normal,
          color: AppColors.brown,
        ).copyWith(inherit: true),
        bodyMedium: GoogleFonts.inter(
          fontSize: 14,
          fontWeight: FontWeight.w400,
          color: AppColors.brown,
        ).copyWith(inherit: true),
        bodySmall: GoogleFonts.inter(
          fontSize: 12,
          fontWeight: FontWeight.w300,
          color: AppColors.brown,
        ).copyWith(inherit: true),

        labelLarge: GoogleFonts.inter(
          fontSize: 20,
          fontWeight: FontWeight.w600,
          color: AppColors.background,
        ).copyWith(inherit: true),
      ),

      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColors.musteredGreen,
          foregroundColor: AppColors.background,
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 14),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12.0),
          ),
          textStyle: TextStyle(
            fontSize: 18.0,
            fontWeight: FontWeight.w600,
            fontFamily: "Inter",
          ),
        ),
      ),
      textButtonTheme: TextButtonThemeData(
        style: TextButton.styleFrom(
          foregroundColor: AppColors.brown,
          textStyle: GoogleFonts.inter(
            fontSize: 14,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
      outlinedButtonTheme: OutlinedButtonThemeData(
        style: OutlinedButton.styleFrom(
          side: BorderSide(color: AppColors.brown, width: 1.5),
          textStyle: GoogleFonts.inter(
            fontSize: 14,
            fontWeight: FontWeight.w500,
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
        ),
      ),
    );
  }
}
