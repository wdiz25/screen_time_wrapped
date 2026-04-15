import 'package:flutter/material.dart';

class SlideColors {
  static const red = Color(0xFFFF6B6B);
  static const pink = Color(0xFFF5A8C1);
  static const yellow = Color(0xFFF5C842);
  static const mint = Color(0xFF7DD9B4);
  static const periwinkle = Color(0xFFB8CAFE);
  static const purple = Color(0xFF8888DD);
  static const grey = Color(0xFFDDDDDD);  
  static const darkGrey = Color(0xFF888888);

  // Dark text color used on all slide backgrounds
  static const darkText = Color(0xFF1A1A1A);
  static const lightText = Color(0xFF555555);

  // The 15 slide background colors in order
  static const List<Color> slideBackgrounds = [
    pink,        // 1 - Splash
    yellow,      // 2 - Daily Usage
    periwinkle,  // 3 - Daily Opportunity
    mint,        // 4 - Weekly Usage
    pink,        // 5 - Weekly Opportunity
    periwinkle,  // 6 - Monthly Usage
    yellow,      // 7 - Monthly Opportunity
    mint,        // 8 - Yearly Usage
    pink,        // 9 - Yearly Opportunity
    yellow,      // 10 - BrainScore
    periwinkle,  // 11 - Top Bad App
    mint,        // 12 - Top Good App
    yellow,      // 13 - Death Report
    periwinkle,  // 14 - Lifetime Opportunity
    mint,        // 15 - Animal Reveal
  ];
}
