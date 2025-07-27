import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:zaera_app/core/themes/colors.dart';

class AppTheme {
  static ThemeData get theme {
    return ThemeData(
      scaffoldBackgroundColor: AppColors.background,
      primaryColor: AppColors.brown,
      secondaryHeaderColor: AppColors.musteredGreen,

      hintColor: AppColors.musteredGreen,
      brightness: Brightness.light,

      iconTheme: IconThemeData(color: AppColors.musteredGreen, size: 13),

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
          color: AppColors.tealGreen,
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
          fontSize: 18,
          fontWeight: FontWeight.w600,
          color: AppColors.background,
        ).copyWith(inherit: true),
      ),

      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColors.musteredGreen,
          foregroundColor: AppColors.background,
          // padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 14),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12.0),
          ),
          textStyle: TextStyle(
            fontSize: 17.0,
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

      //form field theme
      inputDecorationTheme: InputDecorationTheme(
        contentPadding: const EdgeInsets.symmetric(
          vertical: 18,
          horizontal: 20,
        ),
        filled: true,
        fillColor: Colors.transparent,
        labelStyle: GoogleFonts.inter(
          fontSize: 14,
          fontWeight: FontWeight.normal,
          color: AppColors.brown,
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12.0),
          borderSide: BorderSide(color: AppColors.brown),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12.0),
          borderSide: BorderSide(color: AppColors.brown),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12.0),
          borderSide: BorderSide(color: AppColors.brown, width: 1.5),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12.0),
          borderSide: const BorderSide(color: Colors.redAccent, width: 1.5),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12.0),
          borderSide: const BorderSide(color: Colors.red, width: 2),
        ),
        hintStyle: GoogleFonts.inter(
          fontSize: 14,
          color: AppColors.brown.withOpacity(0.6),
          fontWeight: FontWeight.normal,
        ),
      ),

      //cgeckbox
      checkboxTheme: CheckboxThemeData(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
        fillColor: WidgetStatePropertyAll(AppColors.tealGreen),
        checkColor: WidgetStatePropertyAll(AppColors.background),
        materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
      ),

      //bottom navigation theme
      bottomNavigationBarTheme: BottomNavigationBarThemeData(
        backgroundColor: AppColors.musteredGreen,
        selectedItemColor: AppColors.whiteskin,
        unselectedItemColor: AppColors.background,
        selectedLabelStyle: GoogleFonts.inter(
          fontWeight: FontWeight.w700,
          fontSize: 14,
        ),
        unselectedLabelStyle: GoogleFonts.inter(
          fontWeight: FontWeight.w500,
          fontSize: 15,
        ),
        type: BottomNavigationBarType.fixed,
        elevation: 10,
        showUnselectedLabels: true,
      ),

      //drawar theme
      drawerTheme: DrawerThemeData(
        backgroundColor: AppColors.musteredGreen,
        elevation: 8,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.horizontal(right: Radius.circular(24)),
        ),
      ),
    );
  }
}
