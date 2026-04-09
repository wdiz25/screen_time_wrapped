import 'package:flutter/material.dart';
import '../../../theme/typography.dart';
import '../../../widgets/starburst_shape.dart';
import '../../../widgets/wave_painter.dart';
import '../format_utils.dart';

/// Reusable usage summary slide.
/// Shows: "Your average [period] usage was X HOURS. That's [context]."
class UsageSlide extends StatelessWidget {
  final Color backgroundColor;
  final String periodLabel;       // "daily", "weekly", "monthly", "yearly"
  final double hours;
  final String contextLine;       // e.g. "OVER HALF your waking day"
  final String contextSuffix;     // e.g. "spent on your phone."
  final Color decorStarColor;
  final Color waveColor;

  const UsageSlide({
    super.key,
    required this.backgroundColor,
    required this.periodLabel,
    required this.hours,
    required this.contextLine,
    required this.contextSuffix,
    required this.decorStarColor,
    required this.waveColor,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      color: backgroundColor,
      child: Stack(
        children: [
          Positioned(
            top: 30,
            left: 20,
            child: StarburstShape(
              fillColor: decorStarColor,
              size: 80,
              points: 6,
            ),
          ),
          Positioned(
            bottom: 60,
            right: -10,
            child: WaveStripes(
              color: waveColor,
              width: 200,
              height: 55,
              waveCount: 6,
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
                    style: AppTypography.displayBlack(size: 58),
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
                    style: AppTypography.displayBlack(size: 44),
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
