import 'dart:math' as math;
import 'package:flutter/material.dart';
import '../constants/theme/typography.dart';
import '../constants/theme/slide_colors.dart';
import '../constants/animals.dart';

/// Animated arc gauge showing BrainScore from 0 to 100.
class BrainScoreGauge extends StatefulWidget {
  final double score;
  final double size;

  const BrainScoreGauge({super.key, required this.score, this.size = 220});

  @override
  State<BrainScoreGauge> createState() => _BrainScoreGaugeState();
}

class _BrainScoreGaugeState extends State<BrainScoreGauge>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1500),
    );
    _animation = Tween<double>(
      begin: 0,
      end: widget.score,
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeOut));
    _controller.forward();
  }

  @override
  void didUpdateWidget(BrainScoreGauge oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.score != widget.score) {
      _animation = Tween<double>(
        begin: _animation.value,
        end: widget.score,
      ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeOut));
      _controller
        ..reset()
        ..forward();
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  Color _scoreColor(double score) {
    if (score <= 40) {
      return Color.lerp(SlideColors.red, SlideColors.yellow, score / 40)!;
    } else if (score <= 70) {
      return Color.lerp(
        SlideColors.yellow,
        SlideColors.mint,
        (score - 40) / 30,
      )!;
    }
    return SlideColors.mint;
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _animation,
      builder: (context, _) {
        final current = _animation.value;
        return SizedBox(
          width: widget.size,
          height: widget.size * 0.7,
          child: Stack(
            alignment: const Alignment(0, 0.9),
            children: [
              CustomPaint(
                size: Size(widget.size, widget.size * 0.7),
                painter: _GaugePainter(
                  score: current,
                  trackColor: Colors.black.withValues(alpha: 0.15),
                  fillColor: _scoreColor(current),
                ),
              ),
              Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    current.toInt().toString(),
                    style: AppTypography.displayBlack(size: 56),
                  ),
                  Text(
                    "${animalForScore(current).name} Brain",
                    style: AppTypography.body(
                      size: 14,
                      weight: FontWeight.w700,
                    ),
                  ),
                ],
              ),
            ],
          ),
        );
      },
    );
  }
}

class _GaugePainter extends CustomPainter {
  final double score;
  final Color trackColor;
  final Color fillColor;

  _GaugePainter({
    required this.score,
    required this.trackColor,
    required this.fillColor,
  });

  @override
  void paint(Canvas canvas, Size size) {
    const startAngle = math.pi;
    const sweepAngle = math.pi;

    final center = Offset(size.width / 2, size.height * 0.85);
    final radius = size.width / 2 - 12;
    final rect = Rect.fromCircle(center: center, radius: radius);

    final trackPaint = Paint()
      ..color = trackColor
      ..style = PaintingStyle.stroke
      ..strokeWidth = 22
      ..strokeCap = StrokeCap.round;

    final fillPaint = Paint()
      ..color = fillColor
      ..style = PaintingStyle.stroke
      ..strokeWidth = 22
      ..strokeCap = StrokeCap.round;

    canvas.drawArc(rect, startAngle, sweepAngle, false, trackPaint);
    canvas.drawArc(
      rect,
      startAngle,
      sweepAngle * (score / 100),
      false,
      fillPaint,
    );
  }

  @override
  bool shouldRepaint(_GaugePainter old) =>
      old.score != score || old.fillColor != fillColor;
}
