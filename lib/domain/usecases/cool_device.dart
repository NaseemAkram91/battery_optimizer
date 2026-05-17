import '../repositories/battery_repository.dart';

class CoolDevice {
  final BatteryRepository repository;
  const CoolDevice(this.repository);

  Future<bool> call() => repository.coolDevice();
}
