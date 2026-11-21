import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../config/app_environment.dart';

final appEnvironmentProvider = Provider<AppEnvironment>((ref) => AppEnvironment.current);

final apiClientProvider = Provider<Dio>((ref) {
  final environment = ref.watch(appEnvironmentProvider);
  final client = Dio(
    BaseOptions(
      baseUrl: environment.apiBaseUrl,
      connectTimeout: const Duration(seconds: 10),
      receiveTimeout: const Duration(seconds: 20),
      sendTimeout: const Duration(seconds: 20),
      headers: const {'Content-Type': 'application/json'},
    ),
  );

  ref.onDispose(client.close);
  return client;
});
