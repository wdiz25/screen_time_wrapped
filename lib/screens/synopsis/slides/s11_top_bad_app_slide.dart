import 'package:flutter/material.dart';
import '../../../models/usage_report.dart';
import '../../../theme/slide_colors.dart';
import '../../../theme/typography.dart';
import '../../../widgets/starburst_shape.dart';
import '../../../widgets/wave_painter.dart';
import '../format_utils.dart';

/// Shows the top bad app (biggest time sink).
class S11TopBadAppSlide extends StatelessWidget {
  final UsageReport report;
  const S11TopBadAppSlide({super.key, required this.report});

  @override
  Widget build(BuildContext context) {
    final topApp = report.topBadApp;
    final appName = topApp?.appName ?? 'None detected 🎉';
    final hours = topApp?.totalTime.inMinutes != null
        ? FormatUtils.hours(topApp!.totalTime.inMinutes / 60.0)
        : '0h';

    return Container(
      color: SlideColors.periwinkle,
      child: Stack(
        children: [
          Positioned(
            top: 30,
            right: 20,
            child: WaveStripes(
              color: SlideColors.yellow,
              width: 160,
              height: 50,
              waveCount: 5,
            ),
          ),
          Positioned(
            bottom: 60,
            right: 24,
            child: StarburstShape(
              fillColor: SlideColors.pink,
              size: 80,
              points: 6,
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 60),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'YOUR BIGGEST\nTIME SINK',
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
                      Text('📱', style: const TextStyle(fontSize: 48)),
                      const SizedBox(height: 8),
                      Text(
                        appName,
                        style: AppTypography.displayBold(size: 30),
                      ),
                      const SizedBox(height: 8),
                      Text(
                        'You spent $hours on this app this year.',
                        style: AppTypography.body(size: 16),
                      ),
                      if (topApp != null) ...[
                        const SizedBox(height: 12),
                        Text(
                          'That\'s ${FormatUtils.days(topApp.totalTime.inMinutes / 60.0)} of your life.',
                          style: AppTypography.body(
                            size: 14,
                            color: const Color(0xFF777777),
                          ),
                        ),
                      ],
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
