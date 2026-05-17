import 'package:equatable/equatable.dart';
import '../../../domain/entities/battery_info.dart';

abstract class BatteryState extends Equatable {
  const BatteryState();
  @override
  List<Object?> get props => [];
}

class BatteryInitial extends BatteryState {
  const BatteryInitial();
}

class BatteryLoading extends BatteryState {
  const BatteryLoading();
}

class BatteryLoaded extends BatteryState {
  final BatteryInfo info;
  const BatteryLoaded(this.info);
  @override
  List<Object?> get props => [info];
}

class BatteryError extends BatteryState {
  final String message;
  const BatteryError(this.message);
  @override
  List<Object?> get props => [message];
}
