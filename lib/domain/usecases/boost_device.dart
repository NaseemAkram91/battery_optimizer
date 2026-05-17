import '../repositories/battery_repository.dart';

class BoostDevice {
  final BatteryRepository repository;
  const BoostDevice(this.repository);

  Future<bool> call() => repository.boostDevice();
}
