import '../entities/app_usage.dart';
import '../repositories/battery_repository.dart';

class GetAppUsage {
  final BatteryRepository repository;
  const GetAppUsage(this.repository);

  Future<List<AppUsage>> call() => repository.getAppUsage();
}
