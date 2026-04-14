import 'package:flutter/material.dart';
import '../theme/slide_colors.dart';

/// Common full-screen scaffold for all Synopsis slides.
/// Provides background color, safe area, and optional close button.
class SlideScaffold extends StatelessWidget {
  final Color backgroundColor;
  final Widget child;
  final bool showCloseButton;
  final VoidCallback? onClose;

  const SlideScaffold({
    super.key,
    required this.backgroundColor,
    required this.child,
    this.showCloseButton = false,
    this.onClose,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      body: SafeArea(
        child: Stack(
          children: [
            child,
            if (showCloseButton)
              Positioned(
                top: 12,
                right: 16,
                child: IconButton(
                  icon: const Icon(Icons.close, size: 28),
                  color: SlideColors.darkText.withValues(alpha: 0.6),
                  onPressed: onClose ?? () => Navigator.of(context).pop(),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
