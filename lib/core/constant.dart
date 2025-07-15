import 'package:flutter/material.dart';
import 'package:zaera_app/core/themes/colors.dart';

class TextConstants {
  static const String slogan = "Peace over pennies";

  static TextStyle sloganStyle = TextStyle(
    fontSize: 18,
    fontWeight: FontWeight.w400,
    color: AppColors.musteredGreen,
    fontFamily: "Inter",
  );
}

class AppTextStyles {
  static TextStyle zaeraStyle = TextStyle(
    fontSize: 20,
    fontWeight: FontWeight.w600,
    color: AppColors.brown,
    fontFamily: "Inter",
    letterSpacing: 12,
  );
}
