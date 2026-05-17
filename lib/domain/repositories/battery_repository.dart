import '../entities/battery_info.dart';
import '../entities/app_usage.dart';
import '../entities/battery_health.dart';

/// Abstract repository interface for battery data.
abstract class BatteryRepository {
  Future<BatteryInfo> getBatteryInfo();
  Future<List<AppUsage>> getAppUsage();
  Future<BatteryHealth> getBatteryHealth();
  Future<List<double>> getBatteryChartData(String period);
  Future<bool> optimizeBattery(String mode);
  Future<bool> boostDevice();
  Future<bool> coolDevice();
}
