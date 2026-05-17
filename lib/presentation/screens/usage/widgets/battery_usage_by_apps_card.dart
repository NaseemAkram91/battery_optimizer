import 'package:flutter/material.dart';

import '../../../../core/theme/app_text_styles.dart';
import 'gradient_card.dart';
import 'section_tile.dart';

class BatteryUsageByAppsCard extends StatelessWidget {
  const BatteryUsageByAppsCard({super.key});

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
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            SectionTitle(title: 'Battery Usage by Apps'),
            SizedBox(height: 12),
            AppUsageTile(
              name: "Instagram",
              duration: "1h 28m",
              percent: 18,
              icon: "assets/icons/instagram_icon.png",
            ),
            AppUsageTile(
              name: "YouTube",
              duration: "1h 15m",
              percent: 14,
              icon: "assets/icons/youtube_icon.png",
            ),
            AppUsageTile(
              name: "WhatsApp",
              duration: "55m",
              percent: 11,
              icon: "assets/icons/whatsapp_icon.png",
            ),
            AppUsageTile(
              name: "Facebook",
              duration: "45m",
              percent: 7,
              icon: "assets/icons/facebook_icon.png",
            ),
          ],
        ),
      ),
    );
  }
}

class AppUsageTile extends StatelessWidget {
  final String name;
  final String duration;
  final int percent;
  final String icon;

  const AppUsageTile({
    super.key,
    required this.name,
    required this.duration,
    required this.percent,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      // mainAxisAlignment: MainAxisAlignment.spaceBetween
      children: [
        Image.asset(icon),
        const SizedBox(width: 12),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    name,
                    style: AppTextStyles.caption.copyWith(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    duration,
                    style: const TextStyle(color: Colors.white54, fontSize: 12),
                  ),
                ],
              ),
              const SizedBox(height: 6),
              ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: LinearProgressIndicator(
                  value: percent / 20,
                  minHeight: 6,
                  backgroundColor: Colors.white10,
                  valueColor: const AlwaysStoppedAnimation(Color(0xFF9B3FFF)),
                ),
              ),
            ],
          ),
        ),
        const SizedBox(width: 12),

        Text(
          '$percent%',
          style: AppTextStyles.bodyLarge.copyWith(
            color: Color(0xFFFF2BC2),
            fontWeight: FontWeight.w500,
          ),
        ),
      ],
    );
  }
}
