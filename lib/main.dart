// import 'package:flutter/material.dart';
// import 'package:glownepal_mobile_app_5th_sem/app/app.dart';
// import 'package:glownepal_mobile_app_5th_sem/app/di/di.dart';
// import 'package:glownepal_mobile_app_5th_sem/core/network/hive_service.dart';

// void main() async {
//   WidgetsFlutterBinding.ensureInitialized();

//   // Initialize Hive Database
//   await HiveService().init();

//   // Initialize Dependencies
//   await initDependencies();

//   runApp(const App());
// }

import 'package:flutter/material.dart';
<<<<<<< Updated upstream
import 'app.dart';
=======
import 'package:glownepal_mobile_app_5th_sem/app/app.dart';
import 'package:glownepal_mobile_app_5th_sem/app/di/di.dart';
import 'package:glownepal_mobile_app_5th_sem/core/network/hive_service.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Initialize HiveService
  final hiveService = HiveService();
  await hiveService.init();

  // Initialize Dependencies
  await initDependencies();
>>>>>>> Stashed changes

  runApp(const App());
}
