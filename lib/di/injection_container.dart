import 'package:get_it/get_it.dart';

import '../data/datasources/battery_local_datasource.dart';
import '../data/repositories/battery_repository_impl.dart';
import '../domain/repositories/battery_repository.dart';
import '../domain/usecases/boost_device.dart';
import '../domain/usecases/cool_device.dart';
import '../domain/usecases/get_app_usage.dart';
import '../domain/usecases/get_battery_chart_data.dart';
import '../domain/usecases/get_battery_health.dart';
import '../domain/usecases/get_battery_info.dart';
import '../domain/usecases/optimize_battery.dart';
import '../presentation/blocs/battery/battery_bloc.dart';
import '../presentation/blocs/optimization/optimization_bloc.dart';
import '../presentation/blocs/usage/usage_bloc.dart';

final sl = GetIt.instance;

Future<void> init() async {
  // BLoCs
  sl.registerFactory(() => BatteryBloc(getBatteryInfo: sl()));
  sl.registerFactory(
    () => UsageBloc(
      getAppUsage: sl(),
      getBatteryChartData: sl(),
    ),
  );
  sl.registerFactory(
    () => OptimizationBloc(
      optimizeBattery: sl(),
      boostDevice: sl(),
      coolDevice: sl(),
      getBatteryHealth: sl(),
    ),
  );
  sl.registerFactory(() => HealthBloc(getBatteryHealth: sl()));

  // Use Cases
  sl.registerLazySingleton(() => GetBatteryInfo(sl()));
  sl.registerLazySingleton(() => GetAppUsage(sl()));
  sl.registerLazySingleton(() => GetBatteryHealth(sl()));
  sl.registerLazySingleton(() => GetBatteryChartData(sl()));
  sl.registerLazySingleton(() => OptimizeBattery(sl()));
  sl.registerLazySingleton(() => BoostDevice(sl()));
  sl.registerLazySingleton(() => CoolDevice(sl()));

  // Repository
  sl.registerLazySingleton<BatteryRepository>(
    () => BatteryRepositoryImpl(sl()),
  );

  // Data Sources
  sl.registerLazySingleton(() => BatteryLocalDataSource());
}
