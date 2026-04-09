import 'package:flutter/material.dart';
import '../../../models/usage_report.dart';
import '../../../theme/slide_colors.dart';
import '../../../theme/typography.dart';
import '../../../widgets/wave_painter.dart';

class _Animal {
  final String emoji;
  final String name;
  final String trait;
  const _Animal(this.emoji, this.name, this.trait);
}

const _animals = [
  _Animal('🧟', 'Zombie', 'Mindless. But fixable.'),
  _Animal('🦝', 'Raccoon', 'Impulsive and easily distracted.'),
  _Animal('🦥', 'Sloth', 'Passive and slow to change.'),
  _Animal('🐬', 'Dolphin', 'Intelligent, mostly curious.'),
  _Animal('🦅', 'Eagle', 'Sharp, focused, and intentional.'),
];

_Animal _animalForScore(double score) {
  if (score >= 80) return _animals[4]; // Eagle
  if (score >= 60) return _animals[3]; // Dolphin
  if (score >= 40) return _animals[2]; // Sloth
  if (score >= 20) return _animals[1]; // Raccoon
  return _animals[0];                  // Zombie
}

class S15AnimalSlide extends StatelessWidget {
  final UsageReport report;
  const S15AnimalSlide({super.key, required this.report});

  @override
  Widget build(BuildContext context) {
    final animal = _animalForScore(report.brainScore);

    return Container(
      color: SlideColors.mint,
      child: Stack(
        children: [
          Positioned(
            bottom: 30,
            left: -10,
            child: WaveStripes(
              color: SlideColors.periwinkle,
              width: 180,
              height: 55,
              waveCount: 5,
            ),
          ),
          Positioned(
            bottom: 30,
            right: -10,
            child: WaveStripes(
              color: SlideColors.yellow,
              width: 160,
              height: 55,
              waveCount: 5,
            ),
          ),
          SafeArea(
            child: Column(
              children: [
                Expanded(
                  flex: 3,
                  child: Container(
                    margin: const EdgeInsets.fromLTRB(24, 24, 24, 0),
                    decoration: BoxDecoration(
                      color: const Color(0xFFEEEEEE),
                      borderRadius: BorderRadius.circular(32),
                    ),
                    child: Center(
                      child: Text(
                        animal.emoji,
                        style: const TextStyle(fontSize: 120),
                      ),
                    ),
                  ),
                ),
                Expanded(
                  flex: 2,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 28, vertical: 20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'YOUR SCREEN\nTIME ANIMAL',
                          style: AppTypography.displayBold(size: 28),
                        ),
                        const SizedBox(height: 8),
                        Text(
                          animal.name,
                          style: AppTypography.displayBlack(size: 52),
                        ),
                        Text(
                          animal.trait,
                          style: AppTypography.body(size: 17),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
