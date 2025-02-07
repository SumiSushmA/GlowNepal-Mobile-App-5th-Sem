import 'package:flutter/cupertino.dart';
import 'package:glownepal_mobile_app_5th_sem/app/app.dart';
import 'package:glownepal_mobile_app_5th_sem/app/di/di.dart';

import 'core/network/hive_service.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await HiveService().init();
  await initDependencies();
  runApp(
    App(),
  );
}
