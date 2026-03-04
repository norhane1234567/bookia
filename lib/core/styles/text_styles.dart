import 'package:flutter/material.dart';
import '../constants/app_fonts.dart';
import 'colors.dart';

class AppTextStyles {

  // Headlines
  static TextStyle h1 = TextStyle(
    fontSize: 32,
    fontFamily: AppFonts.dmSerifDisplay,
    color: AppColors.darkText,
  );

  static TextStyle h2 = TextStyle(
    fontSize: 24,
    fontFamily: AppFonts.dmSerifDisplay,
    color: AppColors.darkText,
  );

  // Body Text
  static TextStyle bodyLarge = TextStyle(
    fontSize: 18,
    fontFamily: AppFonts.dmSerifDisplay,
    color: AppColors.darkText,
  );

  static TextStyle bodyMedium = TextStyle(
    fontSize: 16,
    fontFamily: AppFonts.dmSerifDisplay,
    color: AppColors.greyText,
  );

  // Buttons
  static TextStyle button = TextStyle(
    fontSize: 18,
    fontFamily: AppFonts.dmSerifDisplay,
    color: AppColors.white,
  );
  
}