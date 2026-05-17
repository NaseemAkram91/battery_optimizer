import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../core/theme/app_colors.dart';
import '../../../core/theme/app_text_styles.dart';
import '../../blocs/optimization/optimization_bloc.dart';
import '../../blocs/optimization/optimization_event.dart';
import '../../blocs/optimization/optimization_state.dart';
import '../../widgets/custom_app_bar.dart';
import '../../widgets/primary_button.dart';

class TemperatureScreen extends StatelessWidget {
  const TemperatureScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(title: 'Temperature Control'),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: [
            const SizedBox(height: 100),
            _buildMainText(),
            const SizedBox(height: 60),
            _buildTempCard(),
            const Spacer(),
            PrimaryButton(
              text: 'Cancle', // Matching the typo in screenshot as requested/seen
              gradient: const LinearGradient(
                colors: [Color(0xFF00D2FF), Color(0xFF3A7BD5)],
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
        Text(
          'Keep Your Device\nCool',
          textAlign: TextAlign.center,
          style: AppTextStyles.headline3.copyWith(color: const Color(0xFF00D2FF), fontSize: 24),
        ),
        const SizedBox(height: 12),
        Text(
          'Monitor and reduce device\ntemperature for batter\nperformance and safety.',
          textAlign: TextAlign.center,
          style: AppTextStyles.bodyMedium.copyWith(color: AppColors.textSecondary, height: 1.5),
        ),
      ],
    );
  }

  Widget _buildTempCard() {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: const Color(0xFF1A1F38),
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: Colors.blue.withOpacity(0.3)),
      ),
      child: Column(
        children: [
          const Text('Current Temperature', style: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold)),
          const SizedBox(height: 12),
          const Text('32°C', style: TextStyle(color: Colors.white, fontSize: 32, fontWeight: FontWeight.bold)),
          const SizedBox(height: 4),
          const Text('Normal', style: TextStyle(color: Color(0xFF39FF14), fontSize: 14)),
          const SizedBox(height: 16),
          _buildGradientSlider(),
          const SizedBox(height: 8),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: const [
              Text('Cool', style: TextStyle(color: Color(0xFF39FF14), fontSize: 10)),
              Text('Normal', style: TextStyle(color: Colors.blue, fontSize: 10)),
              Text('Hot', style: TextStyle(color: Colors.red, fontSize: 10)),
            ],
          ),
          const SizedBox(height: 20),
          const Divider(color: Colors.white24),
          _buildToggleRow(Icons.ac_unit, 'Auto Cool', 'Automatically reduce\ntemperature', true),
          const Divider(color: Colors.white24),
          _buildToggleRow(Icons.memory, 'CPU Cooler', 'Reduce CPU usage\nto cool down', false),
        ],
      ),
    );
  }

  Widget _buildGradientSlider() {
    return Stack(
      alignment: Alignment.centerLeft,
      children: [
        Container(
          height: 6,
          width: double.infinity,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            gradient: const LinearGradient(
              colors: [Colors.green, Colors.yellow, Colors.red],
            ),
          ),
        ),
        Positioned(
          left: 100, // Placeholder position
          child: Container(
            height: 12,
            width: 12,
            decoration: const BoxDecoration(
              color: Colors.white,
              shape: BoxShape.circle,
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildToggleRow(IconData icon, String title, String sub, bool val) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
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
          Switch(
            value: val,
            onChanged: (v) {},
            activeColor: Colors.white,
            activeTrackColor: Colors.blue,
          ),
        ],
      ),
    );
  }
}
