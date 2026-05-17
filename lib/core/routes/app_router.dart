import 'package:flutter/material.dart';

import '../../presentation/screens/main_screen.dart';
import '../../presentation/screens/battery_saver/battery_saver_screen.dart';
import '../../presentation/screens/power_boost/power_boost_screen.dart';
import '../../presentation/screens/temperature/temperature_screen.dart';
import '../../presentation/screens/battery_health/battery_health_screen.dart';
import '../../presentation/screens/success/success_screen.dart';

/// Centralized named-route definitions.
class AppRouter {
  AppRouter._();

  // Route names
  static const String main = '/';
  static const String batterySaver = '/battery-saver';
  static const String powerBoost = '/power-boost';
  static const String temperature = '/temperature';
  static const String batteryHealth = '/battery-health';
  static const String success = '/success';

  static Route<dynamic> onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case main:
        return _buildRoute(const MainScreen());
      case batterySaver:
        return _buildRoute(const BatterySaverScreen());
      case powerBoost:
        return _buildRoute(const PowerBoostScreen());
      case temperature:
        return _buildRoute(const TemperatureScreen());
      case batteryHealth:
        return _buildRoute(const BatteryHealthScreen());
      case success:
        final args = settings.arguments as SuccessScreenArgs;
        return _buildRoute(SuccessScreen(args: args));
      default:
        return _buildRoute(const MainScreen());
    }
  }

  static PageRouteBuilder _buildRoute(Widget page) {
    return PageRouteBuilder(
      pageBuilder: (context, animation, secondaryAnimation) => page,
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        return FadeTransition(
          opacity: CurvedAnimation(parent: animation, curve: Curves.easeInOut),
          child: child,
        );
      },
      transitionDuration: const Duration(milliseconds: 300),
    );
  }
}
