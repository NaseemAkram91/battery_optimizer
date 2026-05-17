import 'package:equatable/equatable.dart';

abstract class OptimizationState extends Equatable {
  const OptimizationState();
  @override
  List<Object?> get props => [];
}

class OptimizationIdle extends OptimizationState { const OptimizationIdle(); }
class OptimizationRunning extends OptimizationState {
  final String action;
  const OptimizationRunning(this.action);
  @override
  List<Object?> get props => [action];
}
class OptimizationSuccess extends OptimizationState {
  final String action;
  final String title;
  final String subtitle;
  const OptimizationSuccess({
    required this.action,
    required this.title,
    required this.subtitle,
  });
  @override
  List<Object?> get props => [action];
}
class OptimizationError extends OptimizationState {
  final String message;
  const OptimizationError(this.message);
  @override
  List<Object?> get props => [message];
}

// Battery Health states
abstract class HealthState extends Equatable {
  const HealthState();
  @override
  List<Object?> get props => [];
}
class HealthInitial extends HealthState { const HealthInitial(); }
class HealthLoading extends HealthState { const HealthLoading(); }
class HealthLoaded extends HealthState {
  final dynamic health;
  const HealthLoaded(this.health);
  @override
  List<Object?> get props => [health];
}
class HealthError extends HealthState {
  final String message;
  const HealthError(this.message);
  @override
  List<Object?> get props => [message];
}
