import 'package:flutter/material.dart';
import '../../../models/usage_report.dart';
import '../../../constants/theme/slide_colors.dart';
import '../../../constants/theme/typography.dart';
import '../format_utils.dart';
import 'package:flutter_m3shapes/flutter_m3shapes.dart';

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
            bottom: 70,
            left: 50,
            child: M3Container.softBurst(
              color: SlideColors.pink,
              width: 160,
              height: 160,
              child: const SizedBox.shrink(),
            ),
          ),
          Positioned(
            top: 140,
            right: 20,
            child: M3Container.softBoom(
              color: SlideColors.mint,
              width: 240,
              height: 240,
              child: const SizedBox.shrink(),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 60),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 40),
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
                      Text(appName, style: AppTypography.displayBold(size: 30)),
                      const SizedBox(height: 8),
                      Text(
                        'You spent $hours on this app last month.',
                        style: AppTypography.body(size: 16),
                      ),
                      if (topApp != null) ...[
                        const SizedBox(height: 12),
                        Text(
                          'That\'s ${FormatUtils.days(topApp.totalTime.inMinutes / 60.0)} of your life.',
                          style: AppTypography.body(
                            size: 14,
                            color: SlideColors.lightText,
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
