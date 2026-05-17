import 'package:equatable/equatable.dart';

abstract class UsageEvent extends Equatable {
  const UsageEvent();
  @override
  List<Object?> get props => [];
}

class LoadUsage extends UsageEvent {
  final String period;
  const LoadUsage({this.period = 'today'});
  @override
  List<Object?> get props => [period];
}

class ChangePeriod extends UsageEvent {
  final String period;
  const ChangePeriod(this.period);
  @override
  List<Object?> get props => [period];
}
