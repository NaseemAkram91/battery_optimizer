import '../entities/battery_info.dart';
import '../repositories/battery_repository.dart';

class GetBatteryInfo {
  final BatteryRepository repository;
  const GetBatteryInfo(this.repository);

  Future<BatteryInfo> call() => repository.getBatteryInfo();
}
