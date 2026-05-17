import 'package:battery_optymizer/presentation/screens/home/widgets/battery_level_card.dart';
import 'package:battery_optymizer/presentation/screens/home/widgets/clean_now_card.dart';
import 'package:battery_optymizer/presentation/screens/home/widgets/feature_grid.dart';
import 'package:battery_optymizer/presentation/screens/home/widgets/optimize_now_card.dart';
import 'package:battery_optymizer/presentation/screens/home/widgets/quick_stats_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../core/theme/app_colors.dart';
import '../../../core/theme/app_text_styles.dart';
import '../../../core/routes/app_router.dart';
import '../../blocs/battery/battery_bloc.dart';
import '../../blocs/battery/battery_event.dart';
import '../../blocs/battery/battery_state.dart';
import '../../widgets/circular_progress_widget.dart';
import '../../widgets/feature_card.dart';
import '../../widgets/stat_card.dart';
import '../../widgets/section_header.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.sizeOf(context);
    return Scaffold(
      body: SafeArea(
        child: RefreshIndicator(
          onRefresh: () async {
            context.read<BatteryBloc>().add(const RefreshBatteryInfo());
          },
          child: SingleChildScrollView(
            physics: const AlwaysScrollableScrollPhysics(),
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _buildHeader(),
                const SizedBox(height: 30),
                BatteryLevelCard(size: size),
                const SizedBox(height: 16),
                QuickStatsCard(),
                const SizedBox(height: 16),
                OptimizeNowCard(),
                const SizedBox(height: 16),
                FeatureGrid(),
                const SizedBox(height: 16),
                CleanNowCard(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildHeader() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Image.asset("assets/icons/drawer_icon.png"),
        Row(
          mainAxisSize:
              MainAxisSize.min, // Prevents Row from expanding infinitely
          crossAxisAlignment: CrossAxisAlignment.baseline,
          textBaseline: TextBaseline.alphabetic,
          children: [
            // 🔹 "Battery" - Plain white text
            Text(
              'Battery ',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.white, // Solid color (no gradient)
              ),
            ),

            // 🔹 "Optimizer" - Gradient text via ShaderMask
            ShaderMask(
              shaderCallback: (bounds) => LinearGradient(
                colors: [Color(0xFFFF0EBA), Color(0xFF5C0EE3)], // Pink → Purple
                begin: Alignment.centerLeft,
                end: Alignment.centerRight,
              ).createShader(bounds),
              blendMode:
                  BlendMode.srcIn, // 🔑 Critical: applies gradient to text only
              child: Text(
                'Optimizer',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.w900, // Extra bold for emphasis
                  color: Colors.white, // Must be solid (gradient overrides it)
                ),
              ),
            ),
          ],
        ),
        Image.asset("assets/icons/setting_icon.png"),
      ],
    );
  }

  Widget _buildBatteryCircle() {
    return BlocBuilder<BatteryBloc, BatteryState>(
      builder: (context, state) {
        if (state is BatteryLoaded) {
          return Center(
            child: CircularProgressWidget(
              percent: state.info.percentage / 100,
              centerText: '${state.info.percentage}%',
              subText: state.info.remainingTime,
              progressColor: state.info.percentage > 20
                  ? AppColors.success
                  : AppColors.danger,
            ),
          );
        }
        return const Center(child: CircularProgressIndicator());
      },
    );
  }
}
