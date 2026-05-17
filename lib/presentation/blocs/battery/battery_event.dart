import 'package:equatable/equatable.dart';

abstract class BatteryEvent extends Equatable {
  const BatteryEvent();
  @override
  List<Object?> get props => [];
}

class LoadBatteryInfo extends BatteryEvent {
  const LoadBatteryInfo();
}

class RefreshBatteryInfo extends BatteryEvent {
  const RefreshBatteryInfo();
}
