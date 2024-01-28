import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TextStyles {
  static TextStyle description({
    Color? color,
    double fontSize = 12,
  }) {
    return GoogleFonts.inter(
      fontSize: fontSize,
      color: color,
    );
  }
}
