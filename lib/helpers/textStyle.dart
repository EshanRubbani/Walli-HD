import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'colors.dart'; // Assuming AppColors is in colors.dart

class AppTextStyles {
  // Headlines
  static TextStyle headline(BuildContext context) => GoogleFonts.poppins(
        fontSize: 22,
        fontWeight: FontWeight.w500,
        letterSpacing: -1.5,
        color: Theme.of(context).brightness == Brightness.light
            ? AppColors.lightTextColor
            : AppColors.darkTextColor,
      );
  static TextStyle headline1(BuildContext context) => GoogleFonts.poppins(
        fontSize: 96,
        fontWeight: FontWeight.w300,
        letterSpacing: -1.5,
        color: Theme.of(context).brightness == Brightness.light
            ? AppColors.lightTextColor
            : AppColors.darkTextColor,
      );

  static TextStyle headline2(BuildContext context) => GoogleFonts.poppins(
        fontSize: 60,
        fontWeight: FontWeight.w300,
        letterSpacing: -0.5,
        color: Theme.of(context).brightness == Brightness.light
            ? AppColors.lightTextColor
            : AppColors.darkTextColor,
      );

  static TextStyle headline3(BuildContext context) => GoogleFonts.poppins(
        fontSize: 48,
        fontWeight: FontWeight.w400,
        color: Theme.of(context).brightness == Brightness.light
            ? AppColors.lightTextColor
            : AppColors.darkTextColor,
      );

  static TextStyle headline4(BuildContext context) => GoogleFonts.poppins(
        fontSize: 34,
        fontWeight: FontWeight.w400,
        letterSpacing: 0.25,
        color: Theme.of(context).brightness == Brightness.light
            ? AppColors.lightTextColor
            : AppColors.darkTextColor,
      );

  // Subtitles
  static TextStyle searchbar(BuildContext context) => GoogleFonts.poppins(
        fontSize: 16,
        fontWeight: FontWeight.w600,
        letterSpacing: 0.15,
        color: Theme.of(context).brightness == Brightness.light
            ? AppColors.lightTextColor
            : AppColors.darkTextColor,
      );

  static TextStyle searchbar1(BuildContext context) => GoogleFonts.poppins(
        fontSize: 20,
        fontWeight: FontWeight.w600,
        letterSpacing: 0.15,
        color: Theme.of(context).brightness == Brightness.light
            ? AppColors.darkTextColor
            : AppColors.lightTextColor,
      );

  static TextStyle subtitle2(BuildContext context) => GoogleFonts.poppins(
        fontSize: 12,
        fontWeight: FontWeight.w500,
        letterSpacing: 0.1,
        color: Theme.of(context).brightness == Brightness.light
            ? AppColors.lightTextColor
            : AppColors.darkTextColor,
      );

  // Body Text
  static TextStyle bodyText1(BuildContext context) => GoogleFonts.poppins(
        fontSize: 16,
        fontWeight: FontWeight.w400,
        letterSpacing: 0.5,
        color: Theme.of(context).brightness == Brightness.light
            ? AppColors.lightTextColor
            : AppColors.darkTextColor,
      );

  static TextStyle bodyText2(BuildContext context) => GoogleFonts.poppins(
        fontSize: 14,
        fontWeight: FontWeight.w400,
        letterSpacing: 0.25,
        color: Theme.of(context).brightness == Brightness.light
            ? AppColors.lightTextColor
            : AppColors.darkTextColor,
      );

  // Other
  static TextStyle button(BuildContext context) => GoogleFonts.poppins(
        fontSize: 14,
        fontWeight: FontWeight.w500,
        letterSpacing: 1.25,
        color: Theme.of(context).brightness == Brightness.light
            ? AppColors.lightTextColor
            : AppColors.darkTextColor,
      );

  static TextStyle caption(BuildContext context) => GoogleFonts.poppins(
        fontSize: 12,
        fontWeight: FontWeight.w400,
        letterSpacing: 0.4,
        color: Theme.of(context).brightness == Brightness.light
            ? AppColors.lightTextColor
            : AppColors.darkTextColor,
      );

  static TextStyle overline(BuildContext context) => GoogleFonts.poppins(
        fontSize: 10,
        fontWeight: FontWeight.w400,
        letterSpacing: 1.5,
        color: Theme.of(context).brightness == Brightness.light
            ? AppColors.lightTextColor
            : AppColors.darkTextColor,
      );
}
