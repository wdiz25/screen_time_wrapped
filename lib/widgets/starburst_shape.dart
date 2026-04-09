import 'dart:math' as math;
import 'package:flutter/material.dart';

/// Draws a starburst/blob shape filled with a crosshatch pattern.
/// Inspired by the decorative shapes in the mockups.
class StarburstShape extends StatelessWidget {
  final Color fillColor;
  final Color borderColor;
  final double size;
  final int points;

  const StarburstShape({
    super.key,
    required this.fillColor,
    this.borderColor = Colors.black,
    this.size = 80,
    this.points = 8,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: size,
      height: size,
      child: CustomPaint(
        painter: _StarburstPainter(
          fillColor: fillColor,
          borderColor: borderColor,
          points: points,
        ),
      ),
    );
  }
}

class _StarburstPainter extends CustomPainter {
  final Color fillColor;
  final Color borderColor;
  final int points;

  _StarburstPainter({
    required this.fillColor,
    required this.borderColor,
    required this.points,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final center = Offset(size.width / 2, size.height / 2);
    final outerRadius = size.width / 2 * 0.92;
    final innerRadius = size.width / 2 * 0.62;

    final path = _buildStarPath(center, outerRadius, innerRadius, points);

    // Fill
    canvas.drawPath(path, Paint()..color = fillColor);

    // Crosshatch overlay
    _drawCrosshatch(canvas, path, size);

    // Border
    canvas.drawPath(
      path,
      Paint()
        ..color = borderColor
        ..style = PaintingStyle.stroke
        ..strokeWidth = 2.0,
    );
  }

  Path _buildStarPath(
      Offset center, double outer, double inner, int numPoints) {
    final path = Path();
    final step = math.pi / numPoints;
    for (int i = 0; i < numPoints * 2; i++) {
      final angle = i * step - math.pi / 2;
      final r = i.isEven ? outer : inner;
      final x = center.dx + r * math.cos(angle);
      final y = center.dy + r * math.sin(angle);
      if (i == 0) {
        path.moveTo(x, y);
      } else {
        path.lineTo(x, y);
      }
    }
    path.close();
    return path;
  }

  void _drawCrosshatch(Canvas canvas, Path clipPath, Size size) {
    canvas.save();
    canvas.clipPath(clipPath);

    final paint = Paint()
      ..color = Colors.black.withValues(alpha: 0.12)
      ..strokeWidth = 1.0;

    const spacing = 8.0;
    for (double x = 0; x <= size.width; x += spacing) {
      canvas.drawLine(Offset(x, 0), Offset(x, size.height), paint);
    }
    for (double y = 0; y <= size.height; y += spacing) {
      canvas.drawLine(Offset(0, y), Offset(size.width, y), paint);
    }

    canvas.restore();
  }

  @override
  bool shouldRepaint(_StarburstPainter old) =>
      old.fillColor != fillColor ||
      old.borderColor != borderColor ||
      old.points != points;
}
