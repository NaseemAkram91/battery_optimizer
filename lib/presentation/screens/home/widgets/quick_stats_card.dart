// 📁 lib/presentation/widgets/quick_stats_widget.dart
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/theme/app_colors.dart';
import '../../../blocs/battery/battery_bloc.dart';
import '../../../blocs/battery/battery_state.dart';
import '../../../widgets/stat_card.dart';
// Your existing StatCard widget

class QuickStatsCard extends StatelessWidget {
  const QuickStatsCard({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BatteryBloc, BatteryState>(
      builder: (context, state) {
        if (state is BatteryLoaded) {
          return Container(
            padding: const EdgeInsets.symmetric(vertical: 8),
            decoration: BoxDecoration(
              color: Color(0xff181C3B),
              borderRadius: BorderRadius.circular(10.0),
              border: Border.all(color: Color(0xff414669), width: 1),
            ),
            child: IntrinsicHeight(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  StatCard(
                    label: 'Remaining',
                    value: '${state.info.remainingTime}',
                    icon: "assets/icons/timer_icon.png",
                  ),
                  VerticalDivider(color: Color(0xff414669), width: 1),
                  StatCard(
                    label: 'Temperature',
                    value: '${state.info.temperature}°C',
                    icon: "assets/icons/temperature_icon.png",
                  ),
                  VerticalDivider(color: Color(0xff414669), width: 1),
                  StatCard(
                    label: 'Health',
                    value: '${state.info.healthLabel}',
                    icon: "assets/icons/health_icon.png",
                  ),
                ],
              ),
            ),
          );
        }
        // Loading/Empty state: return placeholder with same height
        return const _QuickStatsPlaceholder();
      },
    );
  }
}

// Optional: Placeholder to maintain layout during loading
class _QuickStatsPlaceholder extends StatelessWidget {
  const _QuickStatsPlaceholder();

  @override
  Widget build(BuildContext context) {
    return Row(
      children: List.generate(
        3,
        (index) => Expanded(
          child: Container(
            height: 70,
            margin: const EdgeInsets.symmetric(horizontal: 6),
            decoration: BoxDecoration(
              color: Colors.black26,
              borderRadius: BorderRadius.circular(16),
            ),
          ),
        ),
      ),
    );
  }
}
