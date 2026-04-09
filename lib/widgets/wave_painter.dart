import 'dart:math' as math;
import 'package:flutter/material.dart';

/// Draws layered wavy horizontal stripes, inspired by the mockup decorations.
class WavePainter extends CustomPainter {
  final Color color;
  final int waveCount;
  final double amplitude;

  WavePainter({
    required this.color,
    this.waveCount = 5,
    this.amplitude = 8,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = color
      ..style = PaintingStyle.stroke
      ..strokeWidth = 3.5
      ..strokeCap = StrokeCap.round;

    final spacing = 10.0;
    for (int i = 0; i < waveCount; i++) {
      final yBase = i * spacing;
      final path = Path();
      for (double x = 0; x <= size.width; x += 2) {
        final normalized = x / size.width * 2 * math.pi;
        final y = yBase + amplitude * math.sin(normalized);
        if (x == 0) {
          path.moveTo(x, y);
        } else {
          path.lineTo(x, y);
        }
      }
      canvas.drawPath(path, paint);
    }
  }

  @override
  bool shouldRepaint(WavePainter oldDelegate) =>
      oldDelegate.color != color ||
      oldDelegate.waveCount != waveCount ||
      oldDelegate.amplitude != amplitude;
}

/// A widget that renders wavy stripes over a given width/height.
class WaveStripes extends StatelessWidget {
  final Color color;
  final double width;
  final double height;
  final int waveCount;

  const WaveStripes({
    super.key,
    required this.color,
    this.width = 200,
    this.height = 60,
    this.waveCount = 5,
  });

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      size: Size(width, height),
      painter: WavePainter(color: color, waveCount: waveCount),
    );
  }
}
