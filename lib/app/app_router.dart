import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../features/auth/presentation/create_account_screen.dart';
import '../features/auth/presentation/welcome_login_screen.dart';
import '../features/home/presentation/main_home_screen.dart';
import '../features/onboarding/presentation/onboarding_budget_energy_saving_screen.dart';
import '../features/onboarding/presentation/onboarding_calculate_your_bill_screen.dart';
import '../features/onboarding/presentation/onboarding_track_electricity_screen.dart';
import '../features/readings/presentation/readings_screen.dart';

final appRouterProvider = Provider<GoRouter>((ref) {
  final router = GoRouter(
    initialLocation: '/onboarding/track-your-electricity',
    routes: [
      GoRoute(
        path: '/',
        redirect: (_, _) => '/onboarding/track-your-electricity',
      ),
      GoRoute(
        path: '/onboarding/track-your-electricity',
        builder: (_, _) => const OnboardingTrackElectricityScreen(),
      ),
      GoRoute(
        path: '/onboarding/calculate-your-bill',
        builder: (_, _) => const OnboardingCalculateYourBillScreen(),
      ),
      GoRoute(
        path: '/onboarding/budget-energy-saving',
        builder: (_, _) => const OnboardingBudgetEnergySavingScreen(),
      ),
      GoRoute(
        path: '/welcome-login',
        builder: (_, _) => const WelcomeLoginScreen(),
      ),
      GoRoute(
        path: '/main-home',
        builder: (_, _) => const MainHomeScreen(),
      ),
      GoRoute(
        path: '/readings',
        builder: (_, _) => const ReadingsScreen(),
      ),
      GoRoute(
        path: '/create-account',
        builder: (_, _) => const CreateAccountScreen(),
      ),
    ],
    errorBuilder: (_, _) => const SizedBox.shrink(),
  );

  ref.onDispose(router.dispose);
  return router;
});
