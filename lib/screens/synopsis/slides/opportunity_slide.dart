import 'package:flutter/material.dart';
import '../../../constants/activity_comparisons.dart';
import '../../../constants/theme/typography.dart';
import '../../../widgets/activity_pill.dart';
import 'package:flutter_m3shapes/flutter_m3shapes.dart';

/// Reusable opportunity cost slide.
/// Shows: "IN [PERIOD], YOU COULD HAVE..." + 3 activity pills + optional footer.
class OpportunitySlide extends StatelessWidget {
  final Color backgroundColor;
  final String periodHeader; // "IN THAT TIME,\nYOU COULD HAVE..."
  final String? periodFooter; // "...EVERY DAY." or null
  final List<ActivityComparison> activities;
  final Color shapeColor1;
  final Color shapeColor2;

  const OpportunitySlide({
    super.key,
    required this.backgroundColor,
    required this.periodHeader,
    this.periodFooter,
    required this.activities,
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
            bottom: 160,
            left: 50,
            child: M3Container.flower(
              color: shapeColor1,
              width: 160,
              height: 160,
              child: const SizedBox.shrink(),
            ),
          ),
          Positioned(
            top: 140,
            right: 60,
            child: Transform.rotate(
              angle: -6,
              child: M3Container.c4SidedCookie(
                color: shapeColor2,
                width: 160,
                height: 160,
                child: const SizedBox.shrink(),
              ),
            ),
          ),
          // Main content
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 28, vertical: 40),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 70),
                  child: Text(
                    periodHeader,
                    style: AppTypography.displayBlack(size: 40),
                  ),
                ),
                const SizedBox(height: 100),
                ...activities.map(
                  (a) => ActivityPill(icon: a.icon, text: a.description),
                ),
                const Spacer(),
                if (periodFooter != null)
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      periodFooter!,
                      style: AppTypography.displayBlack(size: 40),
                    ),
                  ),
                const SizedBox(height: 40),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
