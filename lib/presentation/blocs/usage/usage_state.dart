import 'package:equatable/equatable.dart';
import '../../../domain/entities/app_usage.dart';

abstract class UsageState extends Equatable {
  const UsageState();
  @override
  List<Object?> get props => [];
}

class UsageInitial extends UsageState { const UsageInitial(); }
class UsageLoading extends UsageState { const UsageLoading(); }

class UsageLoaded extends UsageState {
  final List<AppUsage> apps;
  final List<double> chartData;
  final String period;
  const UsageLoaded({
    required this.apps,
    required this.chartData,
    required this.period,
  });
  @override
  List<Object?> get props => [apps, chartData, period];
}

class UsageError extends UsageState {
  final String message;
  const UsageError(this.message);
  @override
  List<Object?> get props => [message];
}
