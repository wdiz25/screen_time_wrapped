import 'package:flutter/material.dart';
import '../../theme/slide_colors.dart';
import '../../theme/typography.dart';
import '../../widgets/starburst_shape.dart';
import '../../widgets/wave_painter.dart';

class WelcomePage extends StatelessWidget {
  final VoidCallback onNext;
  const WelcomePage({super.key, required this.onNext});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: SlideColors.pink,
      body: SafeArea(
        child: Stack(
          children: [
            // Decorative starburst top-right
            Positioned(
              top: 24,
              right: 24,
              child: StarburstShape(
                fillColor: SlideColors.mint,
                size: 90,
                points: 8,
              ),
            ),
            // Wavy decoration bottom-left
            Positioned(
              bottom: 80,
              left: -10,
              child: WaveStripes(
                color: SlideColors.yellow,
                width: 160,
                height: 50,
                waveCount: 5,
              ),
            ),
            // Main content
            Center(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 32),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text('YOUR', style: AppTypography.displayBold(size: 28)),
                    Text(
                      'SCREEN\nTIME',
                      style: AppTypography.displayBlack(size: 72),
                      textAlign: TextAlign.center,
                    ),
                    Text(
                      'WRAPPED',
                      style: AppTypography.displayBlack(size: 64),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      '${DateTime.now().year}',
                      style: AppTypography.displayBold(size: 22),
                    ),
                    const SizedBox(height: 48),
                    _OnboardingButton(
                      label: "Let's Go",
                      onTap: onNext,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _OnboardingButton extends StatelessWidget {
  final String label;
  final VoidCallback onTap;

  const _OnboardingButton({required this.label, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 16),
        decoration: BoxDecoration(
          color: Colors.black,
          borderRadius: BorderRadius.circular(50),
          boxShadow: const [
            BoxShadow(color: Colors.white54, offset: Offset(3, 3), blurRadius: 0),
          ],
        ),
        child: Text(
          label,
          style: AppTypography.body(
            size: 18,
            color: Colors.white,
            weight: FontWeight.w700,
          ),
        ),
      ),
    );
  }
}
