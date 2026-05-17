import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../core/theme/app_colors.dart';
import '../../../core/theme/app_text_styles.dart';
import '../../blocs/optimization/optimization_bloc.dart';
import '../../blocs/optimization/optimization_event.dart';
import '../../blocs/optimization/optimization_state.dart';
import '../../widgets/custom_app_bar.dart';
import '../../widgets/primary_button.dart';

class BatteryHealthScreen extends StatelessWidget {
  const BatteryHealthScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(title: 'Battery Health'),
      body: BlocBuilder<HealthBloc, HealthState>(
        builder: (context, state) {
          final healthPercent = state is HealthLoaded
              ? state.health.healthPercent
              : 85;
          final designCapacity = state is HealthLoaded
              ? state.health.designCapacityMah
              : 5000;
          final currentCapacity = state is HealthLoaded
              ? state.health.currentCapacityMah
              : 4250;
          final voltage = state is HealthLoaded ? state.health.voltage : 3.9;
          final temp = state is HealthLoaded ? state.health.temperature : 32;

          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              children: [
                const SizedBox(height: 20),
                _buildIllustration(),
                const SizedBox(height: 30),
                _buildMainText(),
                const SizedBox(height: 30),
                _buildHealthCard(
                  healthPercent,
                  designCapacity,
                  currentCapacity,
                  voltage,
                  temp,
                ),
                const Spacer(),
                PrimaryButton(
                  text: 'View Details',
                  gradient: const LinearGradient(
                    colors: [Color(0xFF00C853), Color(0xFF00E676)],
                    begin: Alignment.centerLeft,
                    end: Alignment.centerRight,
                  ),
                  onPressed: () {},
                ),
                const SizedBox(height: 30),
              ],
            ),
          );
        },
      ),
    );
  }

  Widget _buildIllustration() {
    return Container(
      height: 200,
      width: 200,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        boxShadow: [
          BoxShadow(
            color: AppColors.primary.withOpacity(0.2),
            blurRadius: 100,
            spreadRadius: 20,
          ),
        ],
      ),
      child: Stack(
        alignment: Alignment.center,
        children: [
          Icon(Icons.battery_full, size: 120, color: Colors.blue.shade300),
          const Icon(Icons.thermostat, size: 40, color: Colors.white),
        ],
      ),
    );
  }

  Widget _buildMainText() {
    return Column(
      children: [
        RichText(
          textAlign: TextAlign.center,
          text: TextSpan(
            children: [
              TextSpan(
                text: 'Monitor & Protect\n',
                style: AppTextStyles.headline3.copyWith(
                  color: const Color(0xFF39FF14),
                  fontSize: 24,
                ),
              ),
              TextSpan(
                text: 'Your Battery',
                style: AppTextStyles.headline3.copyWith(
                  color: const Color(0xFF39FF14),
                  fontSize: 24,
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 12),
        Text(
          'Check battery health and get\ntips to extend battery\nlifespan.',
          textAlign: TextAlign.center,
          style: AppTextStyles.bodyMedium.copyWith(
            color: AppColors.textSecondary,
            height: 1.5,
          ),
        ),
      ],
    );
  }

  Widget _buildHealthCard(
    int percent,
    int design,
    int current,
    double voltage,
    double temp,
  ) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: const Color(0xFF1A1F38),
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: Colors.blue.withOpacity(0.3)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Battery Health',
            style: TextStyle(
              color: Colors.white,
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 4),
          const Text(
            'Good',
            style: TextStyle(color: Color(0xFF39FF14), fontSize: 14),
          ),
          const SizedBox(height: 12),
          Text(
            '$percent%',
            style: const TextStyle(
              color: Colors.white,
              fontSize: 32,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 12),
          _buildProgressBar(percent / 100),
          const SizedBox(height: 24),
          _buildDetailRow('Design Capacity', '$design mah'),
          const SizedBox(height: 12),
          _buildDetailRow('Current Capacity', '${current}mah'),
          const SizedBox(height: 12),
          _buildDetailRow('Battery Voltage', '$voltage V'),
          const SizedBox(height: 12),
          _buildDetailRow('Battery Temperature', '${temp.toInt()}°C'),
        ],
      ),
    );
  }

  Widget _buildProgressBar(double val) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(10),
      child: LinearProgressIndicator(
        value: val,
        minHeight: 8,
        backgroundColor: Colors.white.withOpacity(0.1),
        valueColor: const AlwaysStoppedAnimation<Color>(Color(0xFF39FF14)),
      ),
    );
  }

  Widget _buildDetailRow(String label, String val) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          label,
          style: const TextStyle(color: Colors.white70, fontSize: 14),
        ),
        Text(
          val,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 14,
            fontWeight: FontWeight.w500,
          ),
        ),
      ],
    );
  }
}
