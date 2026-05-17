import 'package:equatable/equatable.dart';

abstract class OptimizationEvent extends Equatable {
  const OptimizationEvent();
  @override
  List<Object?> get props => [];
}

class StartOptimization extends OptimizationEvent {
  final String mode;
  const StartOptimization(this.mode);
  @override
  List<Object?> get props => [mode];
}

class StartBoost extends OptimizationEvent {
  const StartBoost();
}

class StartCoolDown extends OptimizationEvent {
  const StartCoolDown();
}

class LoadHealth extends OptimizationEvent {
  const LoadHealth();
}

class ResetOptimization extends OptimizationEvent {
  const ResetOptimization();
}
