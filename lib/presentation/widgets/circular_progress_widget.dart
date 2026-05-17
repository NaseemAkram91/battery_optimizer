import 'package:flutter/material.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import '../../core/theme/app_colors.dart';
import '../../core/theme/app_text_styles.dart';

class CircularProgressWidget extends StatelessWidget {
  final double percent;
  final String centerText;
  final String subText;
  final Color? progressColor;

  const CircularProgressWidget({
    super.key,
    required this.percent,
    required this.centerText,
    required this.subText,
    this.progressColor,
  });

  @override
  Widget build(BuildContext context) {
    return CircularPercentIndicator(
      radius: 110.0,
      lineWidth: 18.0,
      animation: true,
      percent: percent,
      animateFromLastPercent: true,
      circularStrokeCap: CircularStrokeCap.round,
      progressColor: progressColor ?? AppColors.primary,
      backgroundColor: AppColors.surfaceLight,
      center: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            centerText,
            style: AppTextStyles.percentage,
          ),
          const SizedBox(height: 4),
          Text(
            subText,
            style: AppTextStyles.bodySmall,
          ),
        ],
      ),
      footer: null,
    );
  }
}
