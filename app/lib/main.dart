import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:galileo_champions/app.dart';
import 'package:galileo_champions/di/injector.dart';
import 'package:logger/logger.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await SystemChrome.setPreferredOrientations(
    [DeviceOrientation.portraitUp],
  );

  await initializeInjectedDepedencies();
  runZonedGuarded(() => runApp(App()), (error, stack) {
    if (!kReleaseMode) {
      getIt<Logger>().e(error);
    }
  });
}
