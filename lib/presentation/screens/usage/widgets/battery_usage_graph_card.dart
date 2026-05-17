import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

import '../../../../core/theme/app_text_styles.dart';
import 'gradient_card.dart';

class BatteryUsageGraphCard extends StatelessWidget {
  const BatteryUsageGraphCard({super.key});

  @override
  Widget build(BuildContext context) {
    return GradientCard(
      gColor: [
        Color(0xff3440A0),
        Color(0xff232C6D),
        Color(0xff1B2153),
        Color(0xff13173A),
      ],
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Expanded(
                child: Text(
                  'Battery Usage Graph',
                  style: AppTextStyles.subtitle,
                ),
              ),
              PeriodTabs(),
            ],
          ),
          const SizedBox(height: 10),
          Padding(
            padding: const EdgeInsets.all(4.0),
            child: const SizedBox(height: 220, child: UsageLineChart()),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                CircleAvatar(radius: 5, backgroundColor: Color(0xff9A3CFF)),
                SizedBox(width: 10),
                Text("Battery Level"),
                SizedBox(width: 10),
                CircleAvatar(radius: 5, backgroundColor: Color(0xff3069F7)),
                SizedBox(width: 10),
                Text("Charging"),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class PeriodTabs extends StatelessWidget {
  const PeriodTabs({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.black26,
        borderRadius: BorderRadius.circular(12),
      ),
      padding: const EdgeInsets.all(4),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: const [
          PeriodTab(label: '24H', selected: true),
          PeriodTab(label: '7D'),
          PeriodTab(label: '30D'),
        ],
      ),
    );
  }
}

class PeriodTab extends StatelessWidget {
  final String label;
  final bool selected;

  const PeriodTab({super.key, required this.label, this.selected = false});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 5),
      decoration: BoxDecoration(
        gradient: selected
            ? const LinearGradient(
                colors: [Color(0xFFFF2BC2), Color(0xFF8F4DFF)],
              )
            : null,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Text(
        label,
        style: TextStyle(
          color: selected ? Colors.white : const Color(0xFFB77DFF),
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}

class UsageLineChart extends StatelessWidget {
  const UsageLineChart({super.key});

  @override
  Widget build(BuildContext context) {
    final spots = [
      const FlSpot(0, 100),
      const FlSpot(1, 88),
      const FlSpot(2, 76),
      const FlSpot(3, 55),
      const FlSpot(4, 50),
      const FlSpot(5, 49),
      const FlSpot(6, 44),
      const FlSpot(7, 49),
      const FlSpot(8, 32),
      const FlSpot(9, 25),
      const FlSpot(10, 72),
    ];

    return LineChart(
      LineChartData(
        // Extend chart slightly left and right so grid lines
        // protrude beyond first and last points.
        minX: -0.5,
        maxX: 10.5,

        // Keep Y range exact to avoid unwanted label artifacts.
        minY: 0,
        maxY: 100,

        // Allow labels outside chart area.
        clipData: const FlClipData.none(),

        // Grid lines
        gridData: FlGridData(
          show: true,
          drawVerticalLine: true,

          // Smaller box height (more horizontal divisions)
          horizontalInterval: 20,

          // Keep box width similar to design
          verticalInterval: 2,

          getDrawingHorizontalLine: (_) =>
              FlLine(color: Colors.white10, strokeWidth: 1),

          getDrawingVerticalLine: (_) =>
              FlLine(color: Colors.white10, strokeWidth: 1),
        ),

        // Axis labels
        titlesData: FlTitlesData(
          show: true,

          // Left-side percentage labels
          leftTitles: AxisTitles(
            sideTitles: SideTitles(
              showTitles: true,
              reservedSize: 42,
              interval: 25,
              getTitlesWidget: (value, meta) {
                // Show only 0, 25, 50, 75, 100
                if (![0, 25, 50, 75, 100].contains(value.toInt())) {
                  return const SizedBox.shrink();
                }

                return Padding(
                  padding: const EdgeInsets.only(right: 8),
                  child: Text(
                    '${value.toInt()}%',
                    style: const TextStyle(
                      color: Colors.white70,
                      fontSize: 10,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                );
              },
            ),
          ),

          // Bottom time labels
          bottomTitles: AxisTitles(
            sideTitles: SideTitles(
              showTitles: true,
              reservedSize: 32,
              interval: 2,
              getTitlesWidget: (value, meta) {
                const allowedValues = [0.0, 2.0, 4.0, 6.0, 8.0, 10.0];

                final shouldShow = allowedValues.any(
                  (v) => (value - v).abs() < 0.001,
                );

                if (!shouldShow) {
                  return const SizedBox.shrink();
                }

                const labels = {
                  0: '12 AM',
                  2: '4 AM',
                  4: '8 AM',
                  6: '12 PM',
                  8: '8 PM',
                  10: '12 AM',
                };

                return Padding(
                  padding: const EdgeInsets.only(top: 8),
                  child: Text(
                    labels[value.toInt()] ?? '',
                    style: const TextStyle(
                      color: Colors.white70,
                      fontSize: 10,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                );
              },
            ),
          ),
          // Hide unused axes
          topTitles: const AxisTitles(
            sideTitles: SideTitles(showTitles: false),
          ),
          rightTitles: const AxisTitles(
            sideTitles: SideTitles(showTitles: false),
          ),
        ),

        // No border
        borderData: FlBorderData(show: false),

        // Line data
        lineBarsData: [
          LineChartBarData(
            spots: spots,
            isCurved: true,
            barWidth: 2,
            color: const Color(0xFFFF2BC2),
            isStrokeCapRound: true,

            // Show dot only at the last point
            dotData: FlDotData(
              show: true,
              checkToShowDot: (spot, barData) => spot.x == 10,
              getDotPainter: (spot, percent, barData, index) {
                return FlDotCirclePainter(
                  radius: 4,
                  color: Colors.white,
                  strokeWidth: 2,
                  strokeColor: const Color(0xFFFF2BC2),
                );
              },
            ),

            // Gradient fill under line
            belowBarData: BarAreaData(
              show: true,
              gradient: const LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [Color(0x66FF2BC2), Color(0x00000000)],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
