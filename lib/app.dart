import 'package:flutter/material.dart';
import 'core/routes/app_router.dart';
import 'core/theme/app_theme.dart';

class BatteryOptymizerApp extends StatelessWidget {
  const BatteryOptymizerApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Battery Optimizer',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.darkTheme,
      initialRoute: AppRouter.main,
      onGenerateRoute: AppRouter.onGenerateRoute,
    );
  }
}
