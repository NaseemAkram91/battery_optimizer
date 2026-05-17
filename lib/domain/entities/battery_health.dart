import 'package:equatable/equatable.dart';

/// Domain entity for battery health details.
class BatteryHealth extends Equatable {
  final int healthPercent;
  final int designCapacityMah;
  final int currentCapacityMah;
  final double voltage;
  final double temperature;
  final int chargeCycles;

  const BatteryHealth({
    required this.healthPercent,
    required this.designCapacityMah,
    required this.currentCapacityMah,
    required this.voltage,
    required this.temperature,
    required this.chargeCycles,
  });

  double get capacityRatio => currentCapacityMah / designCapacityMah;

  @override
  List<Object?> get props => [
        healthPercent, designCapacityMah, currentCapacityMah,
        voltage, temperature, chargeCycles,
      ];
}
