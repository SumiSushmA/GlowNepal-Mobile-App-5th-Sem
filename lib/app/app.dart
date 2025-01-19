import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:glownepal_mobile_app_5th_sem/app/constants/theme_constant.dart';
import 'package:glownepal_mobile_app_5th_sem/app/di/di.dart';
import 'package:glownepal_mobile_app_5th_sem/features/splash/presentation/view/splash_screen_view.dart';
import 'package:glownepal_mobile_app_5th_sem/features/splash/presentation/view_model/splash_cubit.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'GlowNepal',
      theme: ThemeData(
        primaryColor: ThemeConstant.primaryColor,
        appBarTheme: const AppBarTheme(color: ThemeConstant.appBarColor),
      ),
      home: BlocProvider(
        create: (_) => getIt<SplashCubit>(),
        child: const SplashScreenView(),
      ),
    );
  }
}
