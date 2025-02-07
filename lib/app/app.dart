import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:glownepal_mobile_app_5th_sem/app/di/di.dart';
import 'package:glownepal_mobile_app_5th_sem/core/theme/app_theme.dart';
import 'package:glownepal_mobile_app_5th_sem/features/splash/presentation/view/splash_screen_view.dart';
import 'package:glownepal_mobile_app_5th_sem/features/splash/presentation/view_model/splash_cubit.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Glow Nepal',
      theme: AppTheme.getApplicationTheme(isDarkMode: false),
      home: BlocProvider.value(
        value: getIt<SplashCubit>(),
        child: SplashScreenView(),
      ),
    );
  }
}
