import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:zaera_app/core/themes/colors.dart';

class TextConstants {
  static const String slogan = "Peace over pennies";
  static const String alreadyAcc = "Already have a Account?";
  static const String login = "Log Me in";
  static const String terms = "I accept terms and conditions....";

  static TextStyle sloganStyle = GoogleFonts.inter(
    fontSize: 18,
    fontWeight: FontWeight.normal,
    color: AppColors.musteredGreen,
  );
  static TextStyle termsStyle = GoogleFonts.inter(
    fontSize: 16,
    fontWeight: FontWeight.normal,
    color: AppColors.tealGreen,
  );
  static TextStyle alreadyAccstyle = GoogleFonts.inter(
    fontSize: 16,
    fontWeight: FontWeight.normal,
    color: AppColors.tealGreen,
  );

  static TextStyle logmeinStyle = GoogleFonts.inter(
    fontSize: 16,
    fontWeight: FontWeight.w700,
    color: AppColors.tealGreen,
  );
}

class AppTextStyles {
  static TextStyle zaeraStyle = GoogleFonts.inter(
    fontSize: 20,
    fontWeight: FontWeight.w600,
    color: AppColors.brown,
    letterSpacing: 12,
  );
}
