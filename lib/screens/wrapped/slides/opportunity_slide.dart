import 'package:flutter/material.dart';
import '../../../constants/activity_comparisons.dart';
import '../../../theme/typography.dart';
import '../../../widgets/activity_pill.dart';
import '../../../widgets/starburst_shape.dart';
import '../../../widgets/wave_painter.dart';

/// Reusable opportunity cost slide.
/// Shows: "IN [PERIOD], YOU COULD HAVE..." + 3 activity pills + optional footer.
class OpportunitySlide extends StatelessWidget {
  final Color backgroundColor;
  final String periodHeader;      // "IN THAT TIME,\nYOU COULD HAVE..."
  final String? periodFooter;     // "...EVERY DAY." or null
  final List<ActivityComparison> activities;
  final Color decorStarColor;
  final Color waveColor;

  const OpportunitySlide({
    super.key,
    required this.backgroundColor,
    required this.periodHeader,
    this.periodFooter,
    required this.activities,
    required this.decorStarColor,
    required this.waveColor,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      color: backgroundColor,
      child: Stack(
        children: [
          // Decorative wave top-right
          Positioned(
            top: 30,
            right: -10,
            child: WaveStripes(
              color: waveColor,
              width: 160,
              height: 60,
              waveCount: 5,
            ),
          ),
          // Starburst bottom-left
          Positioned(
            bottom: 80,
            left: 16,
            child: StarburstShape(
              fillColor: decorStarColor,
              size: 75,
              points: 6,
            ),
          ),
          // Main content
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 28, vertical: 40),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 20),
                  child: Text(
                    periodHeader,
                    style: AppTypography.displayBlack(size: 44),
                  ),
                ),
                const Spacer(),
                ...activities.map((a) => ActivityPill(icon: a.icon, text: a.description)),
                const Spacer(),
                if (periodFooter != null)
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      periodFooter!,
                      style: AppTypography.displayBlack(size: 36),
                    ),
                  ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
