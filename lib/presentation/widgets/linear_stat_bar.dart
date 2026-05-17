import 'package:flutter/material.dart';
import '../../core/theme/app_colors.dart';
import '../../core/theme/app_text_styles.dart';

class LinearStatBar extends StatelessWidget {
  final String label;
  final double percent;
  final String valueText;
  final Color? color;

  const LinearStatBar({
    super.key,
    required this.label,
    required this.percent,
    required this.valueText,
    this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(label, style: AppTextStyles.bodyMedium.copyWith(color: AppColors.textSecondary)),
            Text(valueText, style: AppTextStyles.title.copyWith(fontSize: 14)),
          ],
        ),
        const SizedBox(height: 8),
        ClipRRect(
          borderRadius: BorderRadius.circular(4),
          child: LinearProgressIndicator(
            value: percent,
            backgroundColor: AppColors.surfaceLight,
            valueColor: AlwaysStoppedAnimation<Color>(color ?? AppColors.primary),
            minHeight: 8,
          ),
        ),
      ],
    );
  }
}
