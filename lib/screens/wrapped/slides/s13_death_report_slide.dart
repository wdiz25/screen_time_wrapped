import 'package:flutter/material.dart';
import '../../../models/death_report.dart';
import '../../../theme/slide_colors.dart';
import '../../../theme/typography.dart';
import '../../../widgets/starburst_shape.dart';
import '../../../widgets/wave_painter.dart';
import '../format_utils.dart';

class S13DeathReportSlide extends StatelessWidget {
  final DeathReport? deathReport;
  const S13DeathReportSlide({super.key, required this.deathReport});

  @override
  Widget build(BuildContext context) {
    final report = deathReport;

    return Container(
      color: SlideColors.yellow,
      child: Stack(
        children: [
          Positioned(
            top: 20,
            right: 20,
            child: StarburstShape(
              fillColor: const Color(0xFF8888DD),
              size: 75,
              points: 6,
            ),
          ),
          Positioned(
            bottom: 70,
            left: 0,
            child: WaveStripes(
              color: SlideColors.yellow.withGreen(150),
              width: 220,
              height: 55,
              waveCount: 5,
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 60),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Skull emoji as header
                const Text('💀', style: TextStyle(fontSize: 72)),
                const SizedBox(height: 16),
                if (report == null) ...[
                  Text(
                    'Complete your profile to see your Death Report.',
                    style: AppTypography.displayBold(size: 28),
                  ),
                ] else ...[
                  Text(
                    'Your lifetime usage would be over',
                    style: AppTypography.body(size: 20),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    '${FormatUtils.largeHours(report.lifetimeBadHours)} HOURS.',
                    style: AppTypography.displayBlack(size: 52),
                  ),
                  const SizedBox(height: 16),
                  Text("That's over", style: AppTypography.body(size: 20)),
                  const SizedBox(height: 4),
                  Text(
                    '${report.lifetimeYears.toStringAsFixed(1)} YEARS',
                    style: AppTypography.displayBlack(size: 52),
                  ),
                  Text(
                    'of daylight spent on bad apps.',
                    style: AppTypography.body(size: 20),
                  ),
                  const SizedBox(height: 24),
                  Text(
                    'Based on ${report.dailyBadHours.toStringAsFixed(1)}h/day of bad app usage over ${report.remainingYears} remaining years.',
                    style: AppTypography.label(size: 13),
                  ),
                ],
              ],
            ),
          ),
        ],
      ),
    );
  }
}
