import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../domain/usecases/get_app_usage.dart';
import '../../../domain/usecases/get_battery_chart_data.dart';
import 'usage_event.dart';
import 'usage_state.dart';

class UsageBloc extends Bloc<UsageEvent, UsageState> {
  final GetAppUsage getAppUsage;
  final GetBatteryChartData getBatteryChartData;

  UsageBloc({
    required this.getAppUsage,
    required this.getBatteryChartData,
  }) : super(const UsageInitial()) {
    on<LoadUsage>(_onLoad);
    on<ChangePeriod>(_onChangePeriod);
  }

  Future<void> _onLoad(LoadUsage event, Emitter<UsageState> emit) async {
    emit(const UsageLoading());
    try {
      final apps = await getAppUsage();
      final chart = await getBatteryChartData(event.period);
      emit(UsageLoaded(apps: apps, chartData: chart, period: event.period));
    } catch (e) {
      emit(UsageError(e.toString()));
    }
  }

  Future<void> _onChangePeriod(ChangePeriod event, Emitter<UsageState> emit) async {
    if (state is UsageLoaded) {
      final current = state as UsageLoaded;
      try {
        final chart = await getBatteryChartData(event.period);
        emit(UsageLoaded(apps: current.apps, chartData: chart, period: event.period));
      } catch (e) {
        emit(UsageError(e.toString()));
      }
    }
  }
}
