import 'package:flutter/material.dart';
import '../../../models/death_report.dart';
import '../../../theme/slide_colors.dart';
import '../../../theme/typography.dart';
import '../../../widgets/activity_pill.dart';
import '../../../widgets/starburst_shape.dart';
import '../../../widgets/wave_painter.dart';
import '../../../constants/activity_comparisons.dart';
import '../format_utils.dart';

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
            top: 28,
            right: -8,
            child: WaveStripes(
              color: SlideColors.mint,
              width: 160,
              height: 55,
              waveCount: 5,
            ),
          ),
          Positioned(
            bottom: 80,
            left: 16,
            child: StarburstShape(
              fillColor: SlideColors.pink,
              size: 70,
              points: 6,
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 28, vertical: 40),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 20),
                Text(
                  'IN YOUR LIFETIME\nYOU COULD HAVE...',
                  style: AppTypography.displayBlack(size: 40),
                ),
                const Spacer(),
                if (report != null) ...[
                  ActivityPill(
                    icon: '💼',
                    text: 'Started a business earning ${FormatUtils.currency(report.wealthCouldHaveBuilt)}',
                  ),
                  ActivityPill(
                    icon: '📚',
                    text: 'Read ${FormatUtils.largeHours(report.booksCouldHaveRead)} books',
                  ),
                  ActivityPill(
                    icon: '🎓',
                    text: 'Mastered ${report.skillsCouldHaveMastered.toStringAsFixed(1)} professional skills',
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
              ],
            ),
          ),
        ],
      ),
    );
  }
}
