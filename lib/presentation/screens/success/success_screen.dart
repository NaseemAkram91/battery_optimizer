import 'package:flutter/material.dart';
import '../../../core/theme/app_colors.dart';
import '../../../core/theme/app_text_styles.dart';
import '../../widgets/primary_button.dart';

class SuccessScreenArgs {
  final String title;
  final String subtitle;
  final IconData icon;

  SuccessScreenArgs({
    required this.title,
    required this.subtitle,
    required this.icon,
  });
}

class SuccessScreen extends StatelessWidget {
  final SuccessScreenArgs args;

  const SuccessScreen({
    super.key,
    required this.args,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(30),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Spacer(),
            Container(
              padding: const EdgeInsets.all(30),
              decoration: BoxDecoration(
                color: AppColors.success.withOpacity(0.1),
                shape: BoxShape.circle,
              ),
              child: Icon(args.icon, size: 80, color: AppColors.success),
            ),
            const SizedBox(height: 40),
            Text(args.title, style: AppTextStyles.headline2, textAlign: TextAlign.center),
            const SizedBox(height: 12),
            Text(
              args.subtitle,
              style: AppTextStyles.bodyMedium.copyWith(color: AppColors.textSecondary),
              textAlign: TextAlign.center,
            ),
            const Spacer(),
            PrimaryButton(
              text: 'Back to Home',
              onPressed: () => Navigator.popUntil(context, (route) => route.isFirst),
            ),
          ],
        ),
      ),
    );
  }
}
