import '../repositories/battery_repository.dart';

class GetBatteryChartData {
  final BatteryRepository repository;
  const GetBatteryChartData(this.repository);

  /// [period]: 'today' | 'week' | 'month'
  Future<List<double>> call(String period) =>
      repository.getBatteryChartData(period);
}
