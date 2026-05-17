import 'package:flutter/material.dart';
import '../../../core/theme/app_text_styles.dart';
import 'widgets/battery_overview_card.dart';
import 'widgets/battery_usage_by_apps_card.dart';
import 'widgets/battery_usage_graph_card.dart';
import 'widgets/optimization_suggestions_card.dart';
import 'widgets/system_usage_card.dart';

class UsageScreen extends StatelessWidget {
  const UsageScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF060A2A),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: const [
              UsageHeader(),
              SizedBox(height: 16),
              BatteryOverviewCard(),
              SizedBox(height: 16),
              BatteryUsageGraphCard(),
              SizedBox(height: 16),
              BatteryUsageByAppsCard(),
              SizedBox(height: 16),
              SystemUsageCard(),
              SizedBox(height: 16),
              OptimizationSuggestionsCard(),
              SizedBox(height: 24),
            ],
          ),
        ),
      ),
    );
  }
}

class UsageHeader extends StatelessWidget {
  const UsageHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Center(
            child: Text('Battery Usage', style: AppTextStyles.headline1),
          ),
        ),
        Icon(Icons.calendar_month_outlined),
      ],
    );
  }
}
