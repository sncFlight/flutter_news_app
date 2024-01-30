import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TextStyles {
  static TextStyle notation({
    Color? color = Colors.grey,
    double fontSize = 12,
  }) {
    return GoogleFonts.roboto(
      fontSize: fontSize,
      color: color,
    );
  }

  static TextStyle title({
    Color? color = Colors.white,
    double fontSize = 25,
  }) {
    return GoogleFonts.fugazOne(
      fontSize: fontSize,
      fontWeight: FontWeight.w700,
      color: color,
    );
  }

  static TextStyle mainHeader({
    Color? color = Colors.black,
    double fontSize = 18,
  }) {
    return GoogleFonts.fugazOne(
      fontSize: fontSize,
      fontWeight: FontWeight.w600,
      color: color,
    );
  }

  static TextStyle common({
    Color? color = Colors.black,
    double fontSize = 12,
  }) {
    return GoogleFonts.roboto(
      fontSize: fontSize,
      color: color,
    );
  }

  static TextStyle carouselTextStyle({
    Color? color = Colors.white,
    double fontSize = 14,
  }) {
    return GoogleFonts.roboto(
      fontSize: fontSize,
      color: color,
      fontWeight: FontWeight.w500,
    );
  }
}
