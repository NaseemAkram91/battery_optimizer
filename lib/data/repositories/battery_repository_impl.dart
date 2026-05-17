import '../../domain/entities/battery_info.dart';
import '../../domain/entities/app_usage.dart';
import '../../domain/entities/battery_health.dart';
import '../../domain/repositories/battery_repository.dart';
import '../datasources/battery_local_datasource.dart';

class BatteryRepositoryImpl implements BatteryRepository {
  final BatteryLocalDataSource dataSource;
  const BatteryRepositoryImpl(this.dataSource);

  @override
  Future<BatteryInfo> getBatteryInfo() => dataSource.getBatteryInfo();

  @override
  Future<List<AppUsage>> getAppUsage() => dataSource.getAppUsage();

  @override
  Future<BatteryHealth> getBatteryHealth() => dataSource.getBatteryHealth();

  @override
  Future<List<double>> getBatteryChartData(String period) =>
      dataSource.getBatteryChartData(period);

  @override
  Future<bool> optimizeBattery(String mode) =>
      dataSource.optimizeBattery(mode);

  @override
  Future<bool> boostDevice() => dataSource.boostDevice();

  @override
  Future<bool> coolDevice() => dataSource.coolDevice();
}
