import 'package:equatable/equatable.dart';

/// Domain entity representing core battery information.
class BatteryInfo extends Equatable {
  final int percentage;
  final int remainingMinutes;
  final double temperature;
  final double voltage;
  final int healthPercent;
  final String status; // 'charging' | 'discharging' | 'full'

  const BatteryInfo({
    required this.percentage,
    required this.remainingMinutes,
    required this.temperature,
    required this.voltage,
    required this.healthPercent,
    required this.status,
  });

  String get remainingTime {
    final h = remainingMinutes ~/ 60;
    final m = remainingMinutes % 60;
    return '${h}h ${m}m';
  }

  String get healthLabel {
    if (healthPercent >= 80) return 'Good';
    if (healthPercent >= 60) return 'Fair';
    return 'Poor Health';
  }

  @override
  List<Object?> get props => [
    percentage,
    remainingMinutes,
    temperature,
    voltage,
    healthPercent,
    status,
  ];
}
