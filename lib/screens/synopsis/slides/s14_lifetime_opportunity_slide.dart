import 'package:flutter/material.dart';
import '../../../models/death_report.dart';
import '../../../constants/theme/slide_colors.dart';
import '../../../constants/theme/typography.dart';
import '../../../widgets/activity_pill.dart';
import '../../../constants/activity_comparisons.dart';
import '../format_utils.dart';
import 'package:flutter_m3shapes/flutter_m3shapes.dart';

class S14LifetimeOpportunitySlide extends StatelessWidget {
  final DeathReport? deathReport;
  const S14LifetimeOpportunitySlide({super.key, required this.deathReport});

  @override
  Widget build(BuildContext context) {
    final report = deathReport;

    return Container(
      color: SlideColors.periwinkle,
      child: Stack(
        children: [
          Positioned(
            bottom: 160,
            left: 50,
            child: M3Container.flower(
              color: SlideColors.pink,
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
                color: SlideColors.yellow,
                width: 160,
                height: 160,
                child: const SizedBox.shrink(),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 28, vertical: 40),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 60),
                Text(
                  'IN YOUR LIFETIME\nYOU COULD HAVE...',
                  style: AppTypography.displayBlack(size: 40),
                ),
                const SizedBox(height: 100),
                if (report != null) ...[
                  ActivityPill(
                    icon: '💼',
                    text:
                        'Started a business earning ${FormatUtils.currency(report.wealthCouldHaveBuilt)}',
                  ),
                  ActivityPill(
                    icon: '📚',
                    text:
                        'Read ${FormatUtils.largeHours(report.booksCouldHaveRead)} books',
                  ),
                  ActivityPill(
                    icon: '🎓',
                    text:
                        'Mastered ${report.skillsCouldHaveMastered.toStringAsFixed(1)} professional skills',
                  ),
                ] else ...[
                  ...ActivityComparisons.lifetime.map(
                    (a) => ActivityPill(icon: a.icon, text: a.description),
                  ),
                ],
                const Spacer(),
                Text(
                  '...INSTEAD OF\nSCROLLING.',
                  style: AppTypography.displayBlack(size: 36),
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
