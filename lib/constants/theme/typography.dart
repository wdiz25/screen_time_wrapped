import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'slide_colors.dart';

class AppTypography {
  // Bold display font — used for the big impact numbers and headers
  static TextStyle displayBlack({double size = 64, Color? color}) {
    return GoogleFonts.archivoBlack(
      fontSize: size,
      fontWeight: FontWeight.w900,
      color: color ?? SlideColors.darkText,
      height: 1.0,
    );
  }

  // Medium display — section headers like "In that time, you could have..."
  static TextStyle displayBold({double size = 36, Color? color}) {
    return GoogleFonts.archivoBlack(
      fontSize: size,
      fontWeight: FontWeight.w900,
      color: color ?? SlideColors.darkText,
      height: 1.1,
    );
  }

  // Body text — supporting copy beneath the numbers
  static TextStyle body({double size = 20, Color? color, FontWeight? weight}) {
    return GoogleFonts.inter(
      fontSize: size,
      fontWeight: weight ?? FontWeight.w500,
      color: color ?? SlideColors.darkText,
      height: 1.4,
    );
  }

  // Pill text — inside activity comparison bubbles
  static TextStyle pill({double size = 17, Color? color}) {
    return GoogleFonts.inter(
      fontSize: size,
      fontWeight: FontWeight.w500,
      color: color ?? SlideColors.darkText,
      height: 1.3,
    );
  }

  // Small label text
  static TextStyle label({double size = 14, Color? color}) {
    return GoogleFonts.inter(
      fontSize: size,
      fontWeight: FontWeight.w400,
      color: color ?? SlideColors.lightText,
    );
  }
}
