import 'package:flutter/material.dart';
import '../../core/theme/app_colors.dart';
import '../../core/theme/app_text_styles.dart';

class StatCard extends StatelessWidget {
  final String label;
  final String value;
  final String icon;
  final double fontSize;

  const StatCard({
    super.key,
    required this.label,
    required this.value,
    required this.icon,
    this.fontSize = 14,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Image.asset(icon),
        const SizedBox(width: 6),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              value,
              style: AppTextStyles.statValue.copyWith(
                fontSize: fontSize,
                color: Colors.white,
              ),
            ),
            Text(
              label,
              style: AppTextStyles.statLabel.copyWith(
                fontSize: fontSize * 0.71429,
                color: Colors.white,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
