import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'app.dart';
import 'di/injection_container.dart' as di;
import 'presentation/blocs/battery/battery_bloc.dart';
import 'presentation/blocs/battery/battery_event.dart';
import 'presentation/blocs/optimization/optimization_bloc.dart';
import 'presentation/blocs/optimization/optimization_event.dart';
import 'presentation/blocs/usage/usage_bloc.dart';
import 'presentation/blocs/usage/usage_event.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Initialize dependency injection
  await di.init();

  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (_) => di.sl<BatteryBloc>()..add(const LoadBatteryInfo()),
        ),
        BlocProvider(create: (_) => di.sl<UsageBloc>()..add(const LoadUsage())),
        BlocProvider(create: (_) => di.sl<OptimizationBloc>()),
        BlocProvider(
          create: (_) => di.sl<HealthBloc>()..add(const LoadHealth()),
        ),
      ],
      child: const BatteryOptymizerApp(),
    ),
  );
}
