import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../domain/usecases/optimize_battery.dart';
import '../../../domain/usecases/boost_device.dart';
import '../../../domain/usecases/cool_device.dart';
import '../../../domain/usecases/get_battery_health.dart';
import 'optimization_event.dart';
import 'optimization_state.dart';

class OptimizationBloc extends Bloc<OptimizationEvent, OptimizationState> {
  final OptimizeBattery optimizeBattery;
  final BoostDevice boostDevice;
  final CoolDevice coolDevice;
  final GetBatteryHealth getBatteryHealth;

  OptimizationBloc({
    required this.optimizeBattery,
    required this.boostDevice,
    required this.coolDevice,
    required this.getBatteryHealth,
  }) : super(const OptimizationIdle()) {
    on<StartOptimization>(_onOptimize);
    on<StartBoost>(_onBoost);
    on<StartCoolDown>(_onCoolDown);
    on<ResetOptimization>(_onReset);
  }

  Future<void> _onOptimize(StartOptimization event, Emitter<OptimizationState> emit) async {
    emit(OptimizationRunning('optimize'));
    try {
      await optimizeBattery(event.mode);
      emit(const OptimizationSuccess(
        action: 'optimize',
        title: 'Battery Saver Active!',
        subtitle: 'Your battery is now optimized for longer life.',
      ));
    } catch (e) {
      emit(OptimizationError(e.toString()));
    }
  }

  Future<void> _onBoost(StartBoost event, Emitter<OptimizationState> emit) async {
    emit(const OptimizationRunning('boost'));
    try {
      await boostDevice();
      emit(const OptimizationSuccess(
        action: 'boost',
        title: 'Device Boosted!',
        subtitle: 'RAM cleared and CPU optimized for peak performance.',
      ));
    } catch (e) {
      emit(OptimizationError(e.toString()));
    }
  }

  Future<void> _onCoolDown(StartCoolDown event, Emitter<OptimizationState> emit) async {
    emit(const OptimizationRunning('cool'));
    try {
      await coolDevice();
      emit(const OptimizationSuccess(
        action: 'cool',
        title: 'Device Cooled Down!',
        subtitle: 'Overheating apps have been closed. Temperature dropping.',
      ));
    } catch (e) {
      emit(OptimizationError(e.toString()));
    }
  }

  Future<void> _onReset(ResetOptimization event, Emitter<OptimizationState> emit) async {
    emit(const OptimizationIdle());
  }
}

class HealthBloc extends Bloc<OptimizationEvent, HealthState> {
  final GetBatteryHealth getBatteryHealth;

  HealthBloc({required this.getBatteryHealth}) : super(const HealthInitial()) {
    on<LoadHealth>(_onLoad);
  }

  Future<void> _onLoad(LoadHealth event, Emitter<HealthState> emit) async {
    emit(const HealthLoading());
    try {
      final health = await getBatteryHealth();
      emit(HealthLoaded(health));
    } catch (e) {
      emit(HealthError(e.toString()));
    }
  }
}
