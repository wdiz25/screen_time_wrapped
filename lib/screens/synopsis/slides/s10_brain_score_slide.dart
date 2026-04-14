import 'package:flutter/material.dart';
import '../../../models/usage_report.dart';
import '../../../theme/slide_colors.dart';
import '../../../theme/typography.dart';
import '../../../widgets/brain_score_gauge.dart';
import '../../../widgets/starburst_shape.dart';

class S10BrainScoreSlide extends StatelessWidget {
  final UsageReport report;
  const S10BrainScoreSlide({super.key, required this.report});

  String _scoreDescription(double score) {
    if (score >= 80) return 'You spent most of your screen time on productive apps. Keep it up!';
    if (score >= 60) return 'A good balance — mostly growth apps with some mindless scrolling.';
    if (score >= 40) return 'Time is split pretty evenly. Small changes to your habits could make a big difference.';
    if (score >= 20) return 'Bad apps are winning. Your scroll habit is eating into your potential.';
    return 'Almost all screen time went to dopamine traps. Your future self wants a word.';
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: SlideColors.yellow,
      child: Stack(
        children: [
          Positioned(
            top: 24,
            right: 24,
            child: StarburstShape(
              fillColor: SlideColors.pink,
              size: 70,
              points: 8,
            ),
          ),
          Center(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 32),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    'YOUR\nBRAIN SCORE',
                    style: AppTypography.displayBlack(size: 46),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 32),
                  BrainScoreGauge(score: report.brainScore),
                  const SizedBox(height: 24),
                  Text(
                    _scoreDescription(report.brainScore),
                    style: AppTypography.body(size: 16),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 24),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      _MiniStat(
                        label: 'Good apps',
                        value: '${report.goodHours.toStringAsFixed(1)}h',
                        color: SlideColors.mint,
                      ),
                      const SizedBox(width: 16),
                      _MiniStat(
                        label: 'Bad apps',
                        value: '${report.badHours.toStringAsFixed(1)}h',
                        color: const Color(0xFFFF6B6B),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _MiniStat extends StatelessWidget {
  final String label;
  final String value;
  final Color color;

  const _MiniStat({required this.label, required this.value, required this.color});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: Colors.black, width: 2),
        boxShadow: const [
          BoxShadow(color: Colors.black, offset: Offset(3, 3), blurRadius: 0),
        ],
      ),
      child: Column(
        children: [
          Text(value, style: AppTypography.displayBold(size: 22)),
          Text(label, style: AppTypography.label(size: 12)),
        ],
      ),
    );
  }
}
