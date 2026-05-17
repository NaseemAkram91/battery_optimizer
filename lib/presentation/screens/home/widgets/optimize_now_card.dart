import 'dart:ui';

import 'package:battery_optymizer/presentation/widgets/stat_card.dart';
import 'package:flutter/material.dart';

import '../../../widgets/liquid_glass_button.dart';

class OptimizeNowCard extends StatelessWidget {
  const OptimizeNowCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [Color(0xffFE39C6), Color(0xff5C0EE3)],
          stops: [0.1, 1.0],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(10.0),
        border: Border.all(color: Color(0xff414669), width: 1),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          StatCard(
            fontSize: 14,
            label: "Improve battery performance",
            value: "Optimize Now",
            icon: "assets/icons/optimize_icon.png",
          ),
          _buildOptimizeButton(),
          // Image.asset("assets/images/optimize_button.png"),
        ],
      ),
    );
  }

  Widget _buildOptimizeButton() {
    return ClipRRect(
      borderRadius: BorderRadiusGeometry.circular(24),

      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 30, sigmaY: 30),
        blendMode: BlendMode.screen,
        child: SizedBox(
          height: 30,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 6),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Text(
                  'Optimize',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 14,

                    letterSpacing: 0.3,
                  ),
                ),
                const SizedBox(width: 8),
                Icon(
                  Icons.arrow_forward_ios,
                  color: Colors.white.withOpacity(0.9),
                  size: 14,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
