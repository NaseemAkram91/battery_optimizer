import 'package:battery_optymizer/core/theme/app_colors.dart';
import 'package:battery_optymizer/core/theme/app_text_styles.dart';
import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';

import 'gradient_card.dart';
import 'section_tile.dart';

class SystemUsageCard extends StatelessWidget {
  const SystemUsageCard({super.key});

  @override
  Widget build(BuildContext context) {
    return GradientCard(
      gColor: const [
        Color(0xff3440A0),
        Color(0xff232C6D),
        Color(0xff1B2153),
        Color(0xff13173A),
      ],
      child: Padding(
        padding: const EdgeInsets.all(4.0),
        child: Column(
          children: [
            SectionTitle(title: 'System Usage'),
            SizedBox(height: 8),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: MiniMetricCard(
                    title: 'CPU Usge',
                    value: '32%',
                    icon: Icons.memory,
                    iconColor: Color(0xff9A3CFF),
                    graphColor: Color(0xff9A3CFF),
                    graphData: [
                      2,
                      3,
                      1.5,
                      3.5,
                      2,
                      4,
                      2.5,
                      3,
                      1.8,
                      3.2,
                      2.2,
                      3.8,
                    ],
                  ),
                ),
                SizedBox(width: 6),
                Expanded(
                  child: MiniMetricCard(
                    title: 'Temperature',
                    value: '36°C',
                    icon: Icons.thermostat_outlined,
                    iconColor: Color(0xFFFF3B5C),
                    graphColor: Color(0xFFFF3B5C),
                    graphData: [
                      2.5,
                      3,
                      2,
                      3.5,
                      2.8,
                      4,
                      3,
                      3.5,
                      2.5,
                      3.8,
                      2.6,
                      3.4,
                    ],
                  ),
                ),
                SizedBox(width: 6),
                Expanded(
                  child: MiniMetricCard(
                    title: 'RAM Usage',
                    value: '68%',
                    icon: Icons.sd_card,
                    iconColor: Color(0xFF3B82F6),
                    graphColor: Color(0xFF3B82F6),
                    graphData: [
                      3,
                      2,
                      3.5,
                      2.5,
                      4,
                      2.8,
                      3.5,
                      2.2,
                      3.8,
                      2.6,
                      3.2,
                      2.4,
                    ],
                  ),
                ),
                SizedBox(width: 6),
                Expanded(
                  child: MiniMetricCard(
                    title: 'Charge Cycles',
                    value: '142',
                    icon: Icons.access_time,
                    iconColor: Color(0xFFB14DFF),
                    graphColor: Color(0xFFB14DFF),
                    graphData: [
                      2,
                      3.5,
                      2.2,
                      3,
                      2.5,
                      4,
                      2.8,
                      3.2,
                      2.4,
                      3.6,
                      2.6,
                      3.8,
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class MiniMetricCard extends StatelessWidget {
  final String title;
  final String value;
  final IconData icon;
  final Color iconColor;
  final Color graphColor;
  final List<double> graphData;

  const MiniMetricCard({
    super.key,
    required this.title,
    required this.value,
    required this.icon,
    required this.iconColor,
    required this.graphColor,
    required this.graphData,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(6),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.04),
        borderRadius: BorderRadius.circular(6),
        border: Border.all(color: Colors.white10),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Icon with tinted background
          Icon(icon, color: iconColor, size: 20),
          const SizedBox(height: 4),
          Text(
            title,
            style: AppTextStyles.caption.copyWith(
              color: Colors.white,
              fontWeight: FontWeight.w400,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            value,
            style: AppTextStyles.bodyMedium.copyWith(
              fontWeight: FontWeight.w500,
              color: Colors.white,
            ),
          ),

          // Mini sparkline graph
          SizedBox(
            height: 30,
            child: LineChart(
              LineChartData(
                gridData: const FlGridData(show: false),
                titlesData: const FlTitlesData(show: false),
                borderData: FlBorderData(show: false),
                lineTouchData: const LineTouchData(enabled: false),
                minY: 0,
                maxY: 5,
                lineBarsData: [
                  LineChartBarData(
                    spots: List.generate(
                      graphData.length,
                      (i) => FlSpot(i.toDouble(), graphData[i]),
                    ),
                    isCurved: true,
                    curveSmoothness: 0.3,
                    color: graphColor,
                    barWidth: 1,
                    isStrokeCapRound: true,
                    dotData: const FlDotData(show: false),
                    belowBarData: BarAreaData(
                      show: true,
                      gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [
                          graphColor.withOpacity(0.4),
                          graphColor.withOpacity(0.0),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
