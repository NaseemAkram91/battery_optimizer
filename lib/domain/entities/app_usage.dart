import 'package:equatable/equatable.dart';

/// Domain entity for per-app battery usage.
class AppUsage extends Equatable {
  final String appName;
  final String iconPath;
  final double usagePercent;
  final int usageMinutes;
  final String category;

  const AppUsage({
    required this.appName,
    required this.iconPath,
    required this.usagePercent,
    required this.usageMinutes,
    required this.category,
  });

  @override
  List<Object?> get props => [appName, usagePercent, usageMinutes];
}
