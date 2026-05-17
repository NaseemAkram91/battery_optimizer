import 'package:battery_optymizer/core/theme/app_colors.dart';
import 'package:battery_optymizer/core/theme/app_text_styles.dart';
import 'package:battery_optymizer/presentation/screens/home/widgets/clean_now_card.dart';
import 'package:flutter/material.dart';

import 'gradient_card.dart';
import 'section_tile.dart';

class OptimizationSuggestionsCard extends StatelessWidget {
  const OptimizationSuggestionsCard({super.key});

  @override
  Widget build(BuildContext context) {
    return GradientCard(
      gColor: [
        Color(0xff3440A0),
        Color(0xff232C6D),
        Color(0xff1B2153),
        Color(0xff13173A),
      ],
      child: Padding(
        padding: const EdgeInsets.all(4.0),
        child: Column(
          children: [
            const SectionTitle(title: 'Optimization Suggestions'),
            const SizedBox(height: 8),
            Container(
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: Colors.white.withOpacity(0.04),
                borderRadius: BorderRadius.circular(20),
                border: Border.all(color: Colors.white10),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Image.asset("assets/icons/rocket_optimize_icon.png"),
                  const SizedBox(width: 8),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Close background apps',
                          style: AppTextStyles.bodyMedium.copyWith(
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        SizedBox(height: 4),
                        Text(
                          '6 apps are running in background',
                          style: AppTextStyles.subtitle.copyWith(fontSize: 9),
                        ),
                      ],
                    ),
                  ),
                  CustomButton(
                    child: Text("Optimize", style: AppTextStyles.button),
                    borderColor: Color(0xff9A3CFF),
                    backgroundColor: Colors.transparent,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
