import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../core/theme/app_colors.dart';
import '../../../core/theme/app_text_styles.dart';
import '../../blocs/optimization/optimization_bloc.dart';
import '../../blocs/optimization/optimization_event.dart';
import '../../blocs/optimization/optimization_state.dart';
import '../../widgets/custom_app_bar.dart';
import '../../widgets/primary_button.dart';

class PowerBoostScreen extends StatelessWidget {
  const PowerBoostScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(title: 'Power Boost'),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: [
            const SizedBox(height: 100),
            _buildMainText(),
            const SizedBox(height: 60),
            _buildBoostCard(),
            const Spacer(),
            PrimaryButton(
              text: 'Cancle',
              gradient: const LinearGradient(
                colors: [Color(0xFF00D2FF), Color(0xFF4A00E0)],
                begin: Alignment.centerLeft,
                end: Alignment.centerRight,
              ),
              onPressed: () => Navigator.pop(context),
            ),
            const SizedBox(height: 30),
          ],
        ),
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
                text: 'Boost Performance\n',
                style: AppTextStyles.headline3.copyWith(color: const Color(0xFF00D2FF), fontSize: 24),
              ),
              TextSpan(
                text: 'When You Need It',
                style: AppTextStyles.headline3.copyWith(color: const Color(0xFFFF4757).withOpacity(0.8), fontSize: 24),
              ),
            ],
          ),
        ),
        const SizedBox(height: 12),
        Text(
          'Clear memory, optimize system\nand speed up your device.',
          textAlign: TextAlign.center,
          style: AppTextStyles.bodyMedium.copyWith(color: AppColors.textSecondary, height: 1.5),
        ),
      ],
    );
  }

  Widget _buildBoostCard() {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: const Color(0xFF1A1F38),
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: Colors.blue.withOpacity(0.3)),
      ),
      child: Column(
        children: [
          _buildBoostRow(Icons.memory, 'Clear RAM', 'Free up memory for\nbattery performance', '1.2 GB'),
          const Divider(color: Colors.white24, height: 32),
          _buildBoostRow(Icons.settings_suggest, 'Optimize CPU', 'Improve processor\nperformance', ''),
          const Divider(color: Colors.white24, height: 32),
          _buildBoostRow(Icons.grid_view, 'Close Background Apps', 'Stop running apps to\nspeed up device', '12 Apps'),
        ],
      ),
    );
  }

  Widget _buildBoostRow(IconData icon, String title, String sub, String status) {
    return Row(
      children: [
        Container(
          padding: const EdgeInsets.all(8),
          decoration: BoxDecoration(
            color: Colors.white.withOpacity(0.1),
            borderRadius: BorderRadius.circular(10),
          ),
          child: Icon(icon, color: Colors.blue.shade300, size: 24),
        ),
        const SizedBox(width: 16),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(title, style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
              Text(sub, style: const TextStyle(color: Colors.white54, fontSize: 12)),
            ],
          ),
        ),
        if (status.isNotEmpty)
          Text(status, style: const TextStyle(color: Colors.blue, fontSize: 12, fontWeight: FontWeight.bold)),
        const SizedBox(width: 12),
        const Icon(Icons.check_circle, color: Color(0xFF39FF14), size: 20),
      ],
    );
  }
}
