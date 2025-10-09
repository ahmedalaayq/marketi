import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:marketi/core/utils/service_locator.dart';

initAppConfigurations() async {
  WidgetsFlutterBinding.ensureInitialized();
  setupServiceLocator();
  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);
}
