import 'package:flutter/material.dart';
import '../../../constants/animals.dart';
import '../../../models/usage_report.dart';
import '../../../constants/theme/slide_colors.dart';
import '../../../constants/theme/typography.dart';

class S15AnimalSlide extends StatelessWidget {
  final UsageReport report;
  const S15AnimalSlide({super.key, required this.report});

  @override
  Widget build(BuildContext context) {
    final animal = animalForScore(report.brainScore);

    return Container(
      color: SlideColors.mint,
      child: Stack(
        children: [
          SafeArea(
            child: Column(
              children: [
                Expanded(
                  flex: 3,
                  child: Container(
                    margin: const EdgeInsets.fromLTRB(24, 48, 24, 0),
                    decoration: BoxDecoration(
                      color: Colors.white,
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
                          'YOUR SCREEN TIME ANIMAL',
                          style: AppTypography.displayBold(size: 28),
                        ),
                        const SizedBox(height: 8),
                        Text(
                          animal.name,
                          style: AppTypography.displayBlack(size: 52),
                        ),
                        const SizedBox(height: 8),
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
