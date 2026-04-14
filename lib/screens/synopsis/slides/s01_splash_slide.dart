import 'package:flutter/material.dart';
import '../../../theme/slide_colors.dart';
import '../../../theme/typography.dart';
import '../../../widgets/starburst_shape.dart';

class S01SplashSlide extends StatelessWidget {
  const S01SplashSlide({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: SlideColors.pink,
      child: Stack(
        children: [
          // Starburst top
          Positioned(
            top: 40,
            right: 30,
            child: StarburstShape(
              fillColor: SlideColors.mint,
              size: 90,
              points: 8,
            ),
          ),
          // Wavy disc / platform at bottom
          Positioned(
            bottom: 60,
            left: 0,
            right: 0,
            child: Center(
              child: _GridDisc(),
            ),
          ),
          // Main content
          Center(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 28),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('YOUR', style: AppTypography.displayBold(size: 26)),
                  Text(
                    'SCREEN\nTIME',
                    style: AppTypography.displayBlack(size: 76),
                    textAlign: TextAlign.left,
                  ),
                  Text(
                    'SYNOPSIS',
                    style: AppTypography.displayBlack(size: 68),
                  ),
                  const SizedBox(height: 12),
                  Text(
                    '${DateTime.now().year}',
                    style: AppTypography.displayBold(size: 28),
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

// A flat ellipse with a grid pattern — like the "disc" in the mockup
class _GridDisc extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 280,
      height: 90,
      child: CustomPaint(painter: _DiscPainter()),
    );
  }
}

class _DiscPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final rect = Rect.fromLTWH(0, size.height * 0.3, size.width, size.height * 0.7);
    final oval = Path()..addOval(rect);

    canvas.drawPath(oval, Paint()..color = const Color(0xFFF5C842));

    // Grid lines
    canvas.save();
    canvas.clipPath(oval);
    final gridPaint = Paint()
      ..color = Colors.black.withValues(alpha: 0.2)
      ..strokeWidth = 1.0;
    const spacing = 14.0;
    for (double x = 0; x <= size.width; x += spacing) {
      canvas.drawLine(Offset(x, 0), Offset(x, size.height), gridPaint);
    }
    for (double y = 0; y <= size.height; y += spacing) {
      canvas.drawLine(Offset(0, y), Offset(size.width, y), gridPaint);
    }
    canvas.restore();

    // Rim
    canvas.drawPath(oval, Paint()
      ..color = Colors.white
      ..style = PaintingStyle.stroke
      ..strokeWidth = 5);
    canvas.drawPath(oval, Paint()
      ..color = Colors.black
      ..style = PaintingStyle.stroke
      ..strokeWidth = 2);
  }

  @override
  bool shouldRepaint(_DiscPainter old) => false;
}
