import 'package:flutter/material.dart';

import '../../../../core/theme/app_text_styles.dart';
import 'gradient_card.dart';

class BatteryOverviewCard extends StatelessWidget {
  const BatteryOverviewCard({super.key});

  @override
  Widget build(BuildContext context) {
    return GradientCard(
      gColor: [
        Color(0xff3440A0),
        Color(0xff232C6D),
        Color(0xff1B2153),
        Color(0xff13173A),
      ],
      child: Row(
        children: const [
          BatteryCircleIndicator(),

          Expanded(flex: 4, child: OverviewStatsGrid()),
        ],
      ),
    );
  }
}

class BatteryCircleIndicator extends StatelessWidget {
  const BatteryCircleIndicator({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 100,
      height: 100,
      child: Stack(
        alignment: Alignment.center,
        children: [
          SizedBox(
            width: 100,
            height: 100,
            child: CircularProgressIndicator(
              value: 0.72,
              strokeWidth: 4,
              backgroundColor: Colors.white10,
              valueColor: const AlwaysStoppedAnimation(Color(0xFFFF2BC2)),
            ),
          ),
          Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(Icons.bolt, color: Color(0xFFFF2BC2), size: 20),
              SizedBox(height: 2),
              Text('72%', style: AppTextStyles.headline1),
              Text(
                'Battery Level',
                style: AppTextStyles.caption.copyWith(color: Colors.white),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class OverviewStatsGrid extends StatelessWidget {
  const OverviewStatsGrid({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        Row(
          children: [
            Expanded(
              child: StatItem(
                icon: Icons.schedule,
                title: 'Remaining Time',
                value: '18h 45m',
                subtitle: 'Usage Time',
              ),
            ),
            SizedBox(width: 2),
            Expanded(
              child: StatItem(
                icon: Icons.smartphone,
                title: 'Screen On Time',
                value: '6h 28m',
                subtitle: 'Today',
              ),
            ),
          ],
        ),
        SizedBox(height: 2),
        Row(
          children: [
            Expanded(
              child: StatItem(
                icon: Icons.favorite_outline,
                title: 'Battery Health',
                value: 'Good',
                subtitle: '85% Capacity',
              ),
            ),
            SizedBox(width: 2),
            Expanded(
              child: StatItem(
                icon: Icons.speed,
                title: 'Performance Score',
                value: '92/100',
                subtitle: 'Excellent',
              ),
            ),
          ],
        ),
      ],
    );
  }
}

class StatItem extends StatelessWidget {
  final IconData icon;
  final String title;
  final String value;
  final String subtitle;

  const StatItem({
    super.key,
    required this.icon,
    required this.title,
    required this.value,
    required this.subtitle,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(icon, color: const Color(0xFF8F4DFF), size: 22),
        const SizedBox(width: 2),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: AppTextStyles.bodySmall.copyWith(color: Colors.white),
              ),
              const SizedBox(height: 2),
              Text(
                value,
                style: AppTextStyles.subtitle.copyWith(color: Colors.white),
              ),
              Text(
                subtitle,
                style: AppTextStyles.caption.copyWith(color: Colors.white),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
