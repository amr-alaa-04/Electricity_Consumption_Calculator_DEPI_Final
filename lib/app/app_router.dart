import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

final appRouterProvider = Provider<GoRouter>((ref) {
  final router = GoRouter(
    initialLocation: '/',
    routes: [
      GoRoute(
        path: '/',
        builder: (_, _) => const SizedBox.shrink(key: ValueKey('blank-root-route')),
      ),
    ],
    errorBuilder: (_, _) => const SizedBox.shrink(),
  );

  ref.onDispose(router.dispose);
  return router;
});
