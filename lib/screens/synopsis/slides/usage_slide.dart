import 'package:flutter/material.dart';
import '../../../constants/theme/typography.dart';
import '../format_utils.dart';
import 'package:flutter_m3shapes/flutter_m3shapes.dart';

/// Reusable usage summary slide.
/// Shows: "Your average [period] usage was X HOURS. That's [context]."
class UsageSlide extends StatelessWidget {
  final Color backgroundColor;
  final String periodLabel; // "daily", "weekly", "monthly", "yearly"
  final double hours;
  final String contextLine; // e.g. "OVER HALF your waking day"
  final String contextSuffix; // e.g. "spent on your phone."
  final Color shapeColor1;
  final Color shapeColor2;

  const UsageSlide({
    super.key,
    required this.backgroundColor,
    required this.periodLabel,
    required this.hours,
    required this.contextLine,
    required this.contextSuffix,
    required this.shapeColor1,
    required this.shapeColor2,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      color: backgroundColor,
      child: Stack(
        children: [
          Positioned(
            top: 70,
            left: 30,
            child: M3Container.softBurst(
              color: shapeColor1,
              width: 200,
              height: 200,
              child: const SizedBox.shrink(),
            ),
          ),
          Positioned(
            bottom: 100,
            right: 60,
            child: M3Container.c6SidedCookie(
              color: shapeColor2,
              width: 150,
              height: 150,
              child: const SizedBox.shrink(),
            ),
          ),
          Center(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 32),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    'Your average $periodLabel usage was',
                    style: AppTypography.body(size: 20),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 8),
                  Text(
                    '${FormatUtils.largeHours(hours)} HOURS.',
                    style: AppTypography.displayBlack(size: 50),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 20),
                  Text(
                    "That's",
                    style: AppTypography.body(size: 20),
                    textAlign: TextAlign.center,
                  ),
                  Text(
                    contextLine,
                    style: AppTypography.displayBlack(size: 38),
                    textAlign: TextAlign.center,
                  ),
                  Text(
                    contextSuffix,
                    style: AppTypography.body(size: 20),
                    textAlign: TextAlign.center,
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
