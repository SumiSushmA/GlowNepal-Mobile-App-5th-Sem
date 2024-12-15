import 'package:flutter/material.dart';
import 'package:glownepal_mobile_app_5th_sem/Login/login_screen_view.dart';
import 'package:glownepal_mobile_app_5th_sem/home%20screen/home_screen.dart';
import 'package:glownepal_mobile_app_5th_sem/onboarding/onboarding_screen_view.dart';
import 'package:glownepal_mobile_app_5th_sem/register/register_screen_view.dart';
import 'package:glownepal_mobile_app_5th_sem/splash/splash_screen_view.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'GlowNepal',
      theme: ThemeData(
        primarySwatch: Colors.pink,
      ),
      initialRoute: '/', // Start with the SplashScreenView
      routes: {
        '/': (context) => const SplashScreenView(), // Splash screen route
        '/onboarding': (context) =>
            const OnboardingScreenView(), // Onboarding route
        '/login': (context) => const LoginScreen(), // Login route
        '/register': (context) =>
            const RegisterScreenView(), //register screen route
        '/home': (context) => const HomeScreen(), //home screen route
      },
    );
  }
}
