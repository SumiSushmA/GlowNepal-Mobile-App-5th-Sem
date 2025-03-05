import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:glownepal_mobile_app_5th_sem/features/onboarding/presentation/view/onboarding_screen_view.dart';
import 'package:glownepal_mobile_app_5th_sem/features/splash/presentation/view_model/splash_cubit.dart';
import 'package:mocktail/mocktail.dart';

// Mock the SplashCubit class
class MockSplashCubit extends Mock implements SplashCubit {}

class MockNavigatorObserver extends Mock implements NavigatorObserver {}

void main() {
  setUpAll(() {
    // Register fallback value for Route<dynamic> to handle navigation in mocktail
    registerFallbackValue(
        MaterialPageRoute(builder: (_) => const OnboardingScreenView()));
  });
}
