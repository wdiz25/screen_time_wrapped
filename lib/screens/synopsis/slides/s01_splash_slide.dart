import 'package:flutter/material.dart';
import '../../../constants/theme/slide_colors.dart';
import '../../../constants/theme/typography.dart';
import 'package:flutter_m3shapes/flutter_m3shapes.dart';
import 'package:intl/intl.dart';

class S01SplashSlide extends StatelessWidget {
  const S01SplashSlide({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: SlideColors.pink,
      child: Stack(
        children: [
          Positioned(
            top: 100,
            right: 70,
            child: M3Container.softBurst(
                    color: SlideColors.mint,
                    width: 120,
                    height: 120,
                    child: const SizedBox.shrink(),
                ),
          ),
          Positioned(
            bottom: 100,
            left: 60,
            child: Center(
              child: M3Container.softBoom(
                    color: SlideColors.yellow,
                    width: 200,
                    height: 200,
                    child: const SizedBox.shrink(),
                ),
            ),
          ),
          // Main content
          Center(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 28),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('YOUR', style: AppTypography.displayBold(size: 26)),
                  Text(
                    'SCREEN\nTIME\nSYNOPSIS',
                    style: AppTypography.displayBlack(size: 60),
                    textAlign: TextAlign.left,
                  ),
                  const SizedBox(height: 12),
                  Text(
                    DateFormat.yMMMM().format(DateTime(DateTime.now().year, DateTime.now().month - 1, 1)).toUpperCase(),
                    style: AppTypography.displayBold(size: 26),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}