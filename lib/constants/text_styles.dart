import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TextStyles {
  static TextStyle notation({
    Color? color = Colors.grey,
    double fontSize = 12,
  }) {
    return GoogleFonts.notoSans(
      fontSize: fontSize,
      color: color,
    );
  }

  static TextStyle header({
    Color? color = Colors.grey,
    double fontSize = 16,
  }) {
    return GoogleFonts.notoSans(
      fontSize: fontSize,
      fontWeight: FontWeight.w700,
      color: color,
    );
  }

  static TextStyle common({
    Color? color = Colors.white,
    double fontSize = 12,
  }) {
    return GoogleFonts.notoSans(
      fontSize: fontSize,
      color: color,
    );
  }
}
