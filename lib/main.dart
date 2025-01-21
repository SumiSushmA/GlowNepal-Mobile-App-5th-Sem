import 'package:flutter/material.dart';
import 'package:glownepal_mobile_app_5th_sem/app/app.dart';
import 'package:glownepal_mobile_app_5th_sem/app/di/di.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Initialize Dependencies
  await initDependencies();

  runApp(const App());
}
