import 'package:flutter/material.dart';
import '../theme/typography.dart';

/// A rounded white pill/bubble displaying an activity comparison.
class ActivityPill extends StatelessWidget {
  final String icon;
  final String text;

  const ActivityPill({super.key, required this.icon, required this.text});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.symmetric(vertical: 6),
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(50),
        border: Border.all(color: Colors.black, width: 2),
        boxShadow: const [
          BoxShadow(color: Colors.black, offset: Offset(3, 3), blurRadius: 0),
        ],
      ),
      child: Text(
        '$icon  $text',
        style: AppTypography.pill(),
        textAlign: TextAlign.center,
      ),
    );
  }
}
