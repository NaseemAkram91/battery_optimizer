import '../../domain/entities/battery_info.dart';
import '../../domain/entities/app_usage.dart';
import '../../domain/entities/battery_health.dart';

/// Simulates local battery data. Replace with real platform channels later.
class BatteryLocalDataSource {
  Future<BatteryInfo> getBatteryInfo() async {
    await Future.delayed(const Duration(milliseconds: 300));
    return const BatteryInfo(
      percentage: 72,
      remainingMinutes: 765, // 12h 45m
      temperature: 32,
      voltage: 4.2,
      healthPercent: 85,
      status: 'discharging',
    );
  }

  Future<List<AppUsage>> getAppUsage() async {
    await Future.delayed(const Duration(milliseconds: 300));
    return const [
      AppUsage(
        appName: 'Instagram',
        iconPath: '',
        usagePercent: 23,
        usageMinutes: 138,
        category: 'Social',
      ),
      AppUsage(
        appName: 'YouTube',
        iconPath: '',
        usagePercent: 18,
        usageMinutes: 108,
        category: 'Media',
      ),
      AppUsage(
        appName: 'WhatsApp',
        iconPath: '',
        usagePercent: 14,
        usageMinutes: 84,
        category: 'Social',
      ),
      AppUsage(
        appName: 'Chrome',
        iconPath: '',
        usagePercent: 12,
        usageMinutes: 72,
        category: 'Browser',
      ),
      AppUsage(
        appName: 'Spotify',
        iconPath: '',
        usagePercent: 10,
        usageMinutes: 60,
        category: 'Media',
      ),
      AppUsage(
        appName: 'Maps',
        iconPath: '',
        usagePercent: 8,
        usageMinutes: 48,
        category: 'Navigation',
      ),
      AppUsage(
        appName: 'Gmail',
        iconPath: '',
        usagePercent: 6,
        usageMinutes: 36,
        category: 'Productivity',
      ),
      AppUsage(
        appName: 'Other',
        iconPath: '',
        usagePercent: 9,
        usageMinutes: 54,
        category: 'Other',
      ),
    ];
  }

  Future<BatteryHealth> getBatteryHealth() async {
    await Future.delayed(const Duration(milliseconds: 300));
    return const BatteryHealth(
      healthPercent: 85,
      designCapacityMah: 4500,
      currentCapacityMah: 3825,
      voltage: 4.2,
      temperature: 32,
      chargeCycles: 187,
    );
  }

  Future<List<double>> getBatteryChartData(String period) async {
    await Future.delayed(const Duration(milliseconds: 300));
    switch (period) {
      case 'week':
        return [45, 60, 55, 80, 70, 65, 72];
      case 'month':
        return [
          70,
          65,
          72,
          68,
          75,
          60,
          55,
          72,
          78,
          65,
          70,
          62,
          58,
          72,
          80,
          75,
          68,
          72,
          65,
          70,
          72,
          68,
          75,
          80,
          72,
          65,
          70,
          72,
          68,
          72,
        ];
      default: // today
        return [100, 95, 88, 80, 72, 65, 72, 75, 68, 72, 78, 72];
    }
  }

  Future<bool> optimizeBattery(String mode) async {
    await Future.delayed(const Duration(seconds: 2));
    return true;
  }

  Future<bool> boostDevice() async {
    await Future.delayed(const Duration(seconds: 2));
    return true;
  }

  Future<bool> coolDevice() async {
    await Future.delayed(const Duration(seconds: 2));
    return true;
  }
}
