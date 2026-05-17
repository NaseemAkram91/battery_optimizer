import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../core/theme/app_colors.dart';
import '../../../core/theme/app_text_styles.dart';
import '../../blocs/optimization/optimization_bloc.dart';
import '../../blocs/optimization/optimization_event.dart';
import '../../blocs/optimization/optimization_state.dart';
import '../../widgets/custom_app_bar.dart';
import '../../widgets/primary_button.dart';

class BatterySaverScreen extends StatelessWidget {
  const BatterySaverScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(title: 'Battery Saver'),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: [
            const SizedBox(height: 20),
            _buildIllustration(),
            const SizedBox(height: 30),
            _buildMainText(),
            const SizedBox(height: 30),
            _buildSaverCard(),
            const Spacer(),
            PrimaryButton(
              text: 'Done',
              gradient: const LinearGradient(
                colors: [Color(0xFF8E2DE2), Color(0xFFF000FF)],
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

  Widget _buildIllustration() {
    return Container(
      height: 200,
      width: 200,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        boxShadow: [
          BoxShadow(
            color: Colors.cyan.withOpacity(0.2),
            blurRadius: 100,
            spreadRadius: 20,
          ),
        ],
      ),
      child: Stack(
        alignment: Alignment.center,
        children: [
          Icon(Icons.battery_saver, size: 120, color: Colors.cyan.shade300),
          Positioned(
            bottom: 40,
            right: 40,
            child: Icon(Icons.security, size: 40, color: Colors.white),
          ),
        ],
      ),
    );
  }

  Widget _buildMainText() {
    return Column(
      children: [
        Text(
          'Battery Saver\nis Active',
          textAlign: TextAlign.center,
          style: AppTextStyles.headline3.copyWith(color: const Color(0xFF00D2FF), fontSize: 24),
        ),
        const SizedBox(height: 12),
        Text(
          'Your device is now in Smart Saver\nmode to extend battery life.',
          textAlign: TextAlign.center,
          style: AppTextStyles.bodyMedium.copyWith(color: AppColors.textSecondary, height: 1.5),
        ),
      ],
    );
  }

  Widget _buildSaverCard() {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: const Color(0xFF1A1F38),
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: Colors.blue.withOpacity(0.3)),
      ),
      child: Column(
        children: [
          const Text('Expected Battery Life', style: TextStyle(color: Colors.white70, fontSize: 14)),
          const SizedBox(height: 8),
          const Text('15h 30m', style: TextStyle(color: Colors.white, fontSize: 32, fontWeight: FontWeight.bold)),
          const Text('Extended', style: TextStyle(color: Color(0xFF39FF14), fontSize: 14)),
          const SizedBox(height: 24),
          const Divider(color: Colors.white24),
          _buildDetailRow(Icons.wb_sunny_outlined, 'Brightness', 'Optimized'),
          _buildDetailRow(Icons.grid_view, 'Background Apps', 'Limited'),
          _buildDetailRow(Icons.sync, 'Auto Sync', 'Disabled'),
          _buildDetailRow(Icons.notifications_none, 'Notifications', 'Limited'),
        ],
      ),
    );
  }

  Widget _buildDetailRow(IconData icon, String label, String status) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        children: [
          Icon(icon, color: Colors.white60, size: 20),
          const SizedBox(width: 12),
          Text(label, style: const TextStyle(color: Colors.white, fontSize: 14)),
          const Spacer(),
          Text(status, style: const TextStyle(color: Color(0xFF39FF14), fontSize: 14, fontWeight: FontWeight.bold)),
        ],
      ),
    );
  }
}
