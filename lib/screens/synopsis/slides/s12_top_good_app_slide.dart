import 'package:flutter/material.dart';
import '../../../models/usage_report.dart';
import '../../../constants/theme/slide_colors.dart';
import '../../../constants/theme/typography.dart';
import '../format_utils.dart';
import 'package:flutter_m3shapes/flutter_m3shapes.dart';

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
            top: 210,
            left: 50,
            child: M3Container.c12SidedCookie(
              color: SlideColors.yellow,
              width: 160,
              height: 160,
              child: const SizedBox.shrink(),
            ),
          ),
          Positioned(
            bottom: 40,
            right: 20,
            child: M3Container.softBoom(
              color: SlideColors.pink,
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
                      Text(appName, style: AppTypography.displayBold(size: 30)),
                      const SizedBox(height: 8),
                      Text(
                        topApp != null
                            ? 'You invested $hours in growth last month. Well done!'
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
