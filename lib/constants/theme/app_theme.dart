import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'slide_colors.dart';

ThemeData buildAppTheme() {
  return ThemeData(
    useMaterial3: true,
    colorScheme: ColorScheme.fromSeed(
      seedColor: SlideColors.yellow,
      brightness: Brightness.light,
    ),
    textTheme: GoogleFonts.interTextTheme(),
    scaffoldBackgroundColor: SlideColors.yellow,
    appBarTheme: const AppBarTheme(
      elevation: 0,
      scrolledUnderElevation: 0,
      backgroundColor: Colors.transparent,
    ),
  );
}
