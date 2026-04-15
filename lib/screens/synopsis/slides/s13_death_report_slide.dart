import 'package:flutter/material.dart';
import '../../../models/death_report.dart';
import '../../../constants/theme/slide_colors.dart';
import '../../../constants/theme/typography.dart';
import '../format_utils.dart';
import 'package:flutter_m3shapes/flutter_m3shapes.dart';

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
            bottom: 100,
            right: 80,
            child: Transform.rotate(
              angle: 0.1,
              child: M3Container.arch(
                color: SlideColors.purple,
                width: 170,
                height: 200,
                child: const SizedBox.shrink(),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 60),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 40),
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
