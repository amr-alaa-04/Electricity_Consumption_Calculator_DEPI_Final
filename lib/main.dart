import 'dart:async';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'app/app.dart';
import 'core/logging/app_logger.dart';
export 'app/app.dart' show MyApp;


void main() {
  FlutterError.onError = (details) {
    FlutterError.presentError(details);
    appLogger.error(
      'Flutter framework error',
      error: details.exception,
      stackTrace: details.stack,
    );
  };

  PlatformDispatcher.instance.onError = (error, stackTrace) {
    appLogger.error('Uncaught platform error', error: error, stackTrace: stackTrace);
    return true;
  };

  runZonedGuarded(
    () {
      WidgetsFlutterBinding.ensureInitialized();
      runApp(const ProviderScope(child: MyApp()));
    },
    (error, stackTrace) {
      appLogger.error('Uncaught asynchronous error', error: error, stackTrace: stackTrace);
    },
  );
}
