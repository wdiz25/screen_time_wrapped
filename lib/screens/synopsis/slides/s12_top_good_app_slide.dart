import 'package:flutter/material.dart';
import '../../../models/usage_report.dart';
import '../../../theme/slide_colors.dart';
import '../../../theme/typography.dart';
import '../../../widgets/starburst_shape.dart';
import '../../../widgets/wave_painter.dart';
import '../format_utils.dart';

/// Shows the top good app (most productive app used).
class S12TopGoodAppSlide extends StatelessWidget {
  final UsageReport report;
  const S12TopGoodAppSlide({super.key, required this.report});

  @override
  Widget build(BuildContext context) {
    final topApp = report.topGoodApp;
    final appName = topApp?.appName ?? 'None this year — yet!';
    final hours = topApp?.totalTime.inMinutes != null
        ? FormatUtils.hours(topApp!.totalTime.inMinutes / 60.0)
        : '0h';

    return Container(
      color: SlideColors.mint,
      child: Stack(
        children: [
          Positioned(
            top: 24,
            left: 20,
            child: StarburstShape(
              fillColor: SlideColors.yellow,
              size: 75,
              points: 8,
            ),
          ),
          Positioned(
            bottom: 50,
            right: -10,
            child: WaveStripes(
              color: SlideColors.pink,
              width: 200,
              height: 55,
              waveCount: 6,
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 60),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'YOUR TOP\nGOOD APP',
                  style: AppTypography.displayBlack(size: 44),
                ),
                const Spacer(),
                Container(
                  width: double.infinity,
                  padding: const EdgeInsets.all(24),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(24),
                    border: Border.all(color: Colors.black, width: 2),
                    boxShadow: const [
                      BoxShadow(
                        color: Colors.black,
                        offset: Offset(4, 4),
                        blurRadius: 0,
                      ),
                    ],
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('🌱', style: const TextStyle(fontSize: 48)),
                      const SizedBox(height: 8),
                      Text(
                        appName,
                        style: AppTypography.displayBold(size: 30),
                      ),
                      const SizedBox(height: 8),
                      Text(
                        topApp != null
                            ? 'You invested $hours in growth this year. Well done!'
                            : 'Try adding some growth apps to your routine!',
                        style: AppTypography.body(size: 16),
                      ),
                    ],
                  ),
                ),
                const Spacer(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
