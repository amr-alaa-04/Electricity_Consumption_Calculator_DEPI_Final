import 'dart:developer' as developer;

final class AppLogger {
  const AppLogger();

  static const _name = 'electricity_consumption_calculator';

  void info(String message) {
    developer.log(message, name: _name, level: 800);
  }

  void error(String message, {Object? error, StackTrace? stackTrace}) {
    developer.log(
      message,
      name: _name,
      error: error,
      stackTrace: stackTrace,
      level: 1000,
    );
  }
}

const appLogger = AppLogger();
