import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../domain/usecases/get_battery_info.dart';
import 'battery_event.dart';
import 'battery_state.dart';

class BatteryBloc extends Bloc<BatteryEvent, BatteryState> {
  final GetBatteryInfo getBatteryInfo;

  BatteryBloc({required this.getBatteryInfo}) : super(const BatteryInitial()) {
    on<LoadBatteryInfo>(_onLoad);
    on<RefreshBatteryInfo>(_onRefresh);
  }

  Future<void> _onLoad(LoadBatteryInfo event, Emitter<BatteryState> emit) async {
    emit(const BatteryLoading());
    try {
      final info = await getBatteryInfo();
      emit(BatteryLoaded(info));
    } catch (e) {
      emit(BatteryError(e.toString()));
    }
  }

  Future<void> _onRefresh(RefreshBatteryInfo event, Emitter<BatteryState> emit) async {
    try {
      final info = await getBatteryInfo();
      emit(BatteryLoaded(info));
    } catch (e) {
      emit(BatteryError(e.toString()));
    }
  }
}
