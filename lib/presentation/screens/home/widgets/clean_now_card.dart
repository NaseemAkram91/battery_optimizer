import 'package:battery_optymizer/core/theme/app_colors.dart';
import 'package:battery_optymizer/core/theme/app_text_styles.dart';
import 'package:battery_optymizer/presentation/widgets/custom_outline_container.dart';
import 'package:flutter/material.dart';

class CleanNowCard extends StatelessWidget {
  const CleanNowCard({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomOutlineContainer(
      borderColor: AppColors.successDark,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Clean Background App",
                style: AppTextStyles.subtitle.copyWith(
                  color: AppColors.success,
                ),
              ),
              SizedBox(height: 5),
              Text(
                "Stop unused apps running\nin the background",
                style: AppTextStyles.bodyMedium,
              ),
            ],
          ),
          Image.asset("assets/icons/checked_box_icon.png"),
          CustomButton(
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text("Clean Now", style: AppTextStyles.button),

                const SizedBox(width: 2),

                Image.asset("assets/icons/clean_now_icon.png"),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class CustomButton extends StatelessWidget {
  final Color? backgroundColor;
  final Color? borderColor;
  final Widget child;

  const CustomButton({
    super.key,
    this.backgroundColor,
    this.borderColor,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),

      decoration: BoxDecoration(
        // If backgroundColor is null → use gradient
        color: backgroundColor,

        gradient: backgroundColor == null
            ? const LinearGradient(
                colors: [Color(0xff9DF474), Color(0xff5B8E44)],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
              )
            : null,

        borderRadius: BorderRadius.circular(20),

        border: borderColor != null ? Border.all(color: borderColor!) : null,
      ),

      child: child,
    );
  }
}
