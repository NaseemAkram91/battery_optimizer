// 📁 lib/presentation/widgets/feature_grid.dart
import 'package:flutter/material.dart';

import '../../../../core/routes/app_router.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../widgets/feature_card.dart';

class FeatureGrid extends StatelessWidget {
  const FeatureGrid({super.key});

  @override
  Widget build(BuildContext context) {
    return GridView.count(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      crossAxisCount: 2,
      crossAxisSpacing: 8,
      mainAxisSpacing: 8,
      childAspectRatio: 2.2,
      children: [
        FeatureCard(
          icon: "assets/icons/battery_saver_icon.png",
          title: 'Battery Saver',
          subtitle: 'Save power and\nextend battery life',
          onTap: () => Navigator.pushNamed(context, AppRouter.batterySaver),
        ),
        FeatureCard(
          icon: "assets/icons/power_boost_icon.png",
          title: 'Power Boost',
          subtitle: 'Boost performance\nwhen needed',
          onTap: () => Navigator.pushNamed(context, AppRouter.powerBoost),
          gradientColors: [AppColors.primary, AppColors.primaryDark],
        ),
        FeatureCard(
          icon: "assets/icons/temperature_control_icon.png",
          title: 'Cool Down',
          subtitle: 'Keep your device\ncool',
          onTap: () => Navigator.pushNamed(context, AppRouter.temperature),
          gradientColors: [AppColors.primaryLight, AppColors.primary],
        ),
        FeatureCard(
          icon: "assets/icons/battery_health_icon.png",
          title: 'Battery Health',
          subtitle: 'Monitor and protect\nyour battery',
          onTap: () => Navigator.pushNamed(context, AppRouter.batteryHealth),
          gradientColors: [AppColors.success, AppColors.successDark],
        ),
      ],
    );
  }
}
