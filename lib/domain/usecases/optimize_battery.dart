import '../repositories/battery_repository.dart';

class OptimizeBattery {
  final BatteryRepository repository;
  const OptimizeBattery(this.repository);

  /// [mode]: 'smart' | 'ultra' | 'custom'
  Future<bool> call(String mode) => repository.optimizeBattery(mode);
}
