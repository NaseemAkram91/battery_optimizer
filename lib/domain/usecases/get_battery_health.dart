import '../entities/battery_health.dart';
import '../repositories/battery_repository.dart';

class GetBatteryHealth {
  final BatteryRepository repository;
  const GetBatteryHealth(this.repository);

  Future<BatteryHealth> call() => repository.getBatteryHealth();
}
