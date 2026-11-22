import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:go_router/go_router.dart';

import 'package:electricity_consumption_calculator/core/theme/app_colors.dart';
import 'package:electricity_consumption_calculator/l10n/generated/app_localizations.dart';
import 'package:electricity_consumption_calculator/features/onboarding/presentation/onboarding_calculate_your_bill_screen.dart';
import 'package:electricity_consumption_calculator/main.dart';

void main() {
  testWidgets('application starts on the first onboarding screen', (tester) async {
    await tester.pumpWidget(const ProviderScope(child: MyApp()));
    await tester.pumpAndSettle();

    final exception = tester.takeException();
    expect(exception, isNull, reason: exception?.toString());
    expect(find.byKey(const ValueKey('onboarding-next')), findsOneWidget);
    expect(find.byType(Scaffold), findsOneWidget);

    final app = tester.widget<MaterialApp>(find.byType(MaterialApp));
    expect(app.routerConfig, isNotNull);
    expect(app.onGenerateTitle, isNotNull);
    expect(app.theme?.useMaterial3, isTrue);
    expect(app.theme?.colorScheme.primary, AppColors.primary);
    expect(app.supportedLocales, contains(const Locale('ar', 'EG')));
    expect(app.supportedLocales, contains(const Locale('en', 'US')));
    expect(app.localizationsDelegates, contains(AppLocalizations.delegate));

    final arabic = await AppLocalizations.delegate.load(const Locale('ar', 'EG'));
    final english = await AppLocalizations.delegate.load(const Locale('en', 'US'));
    expect(arabic.appTitle, 'حاسبة استهلاك الكهرباء');
    expect(english.appTitle, 'Electricity Consumption Calculator');
  });

  testWidgets('onboarding next opens the bill estimate screen', (
    tester,
  ) async {
    tester.view.physicalSize = const Size(800, 900);
    tester.view.devicePixelRatio = 1;
    addTearDown(tester.view.resetPhysicalSize);
    addTearDown(tester.view.resetDevicePixelRatio);
    await tester.pumpWidget(const ProviderScope(child: MyApp()));
    await tester.pumpAndSettle();

    await tester.tap(find.byKey(const ValueKey('onboarding-next')));
    await tester.pumpAndSettle();

    expect(find.byKey(const ValueKey('onboarding-calculate-your-bill-screen')), findsOneWidget);
    expect(find.byKey(const ValueKey('onboarding-previous')), findsOneWidget);
    expect(find.textContaining('82%'), findsOneWidget);
    expect(find.byKey(const ValueKey('onboarding-skip')), findsOneWidget);
    final skip = tester.widget<TextButton>(
      find.byKey(const ValueKey('onboarding-skip')),
    );
    expect(skip.onPressed, isNull);
    expect(tester.takeException(), isNull);
  });

  testWidgets('screen two previous returns to screen one', (tester) async {
    tester.view.physicalSize = const Size(800, 900);
    tester.view.devicePixelRatio = 1;
    addTearDown(tester.view.resetPhysicalSize);
    addTearDown(tester.view.resetDevicePixelRatio);
    await tester.pumpWidget(const ProviderScope(child: MyApp()));
    await tester.pumpAndSettle();
    await tester.tap(find.byKey(const ValueKey('onboarding-next')));
    await tester.pumpAndSettle();

    await tester.tap(find.byKey(const ValueKey('onboarding-previous')));
    await tester.pumpAndSettle();

    expect(find.byKey(const ValueKey('onboarding-calculate-your-bill-screen')), findsNothing);
    expect(find.text('Record your meter readings easily and accurately'), findsOneWidget);
    expect(tester.takeException(), isNull);
  });

  testWidgets('screen two next opens only the screen three placeholder', (
    tester,
  ) async {
    tester.view.physicalSize = const Size(800, 900);
    tester.view.devicePixelRatio = 1;
    addTearDown(tester.view.resetPhysicalSize);
    addTearDown(tester.view.resetDevicePixelRatio);
    await tester.pumpWidget(const ProviderScope(child: MyApp()));
    await tester.pumpAndSettle();
    await tester.tap(find.byKey(const ValueKey('onboarding-next')));
    await tester.pumpAndSettle();

    await tester.tap(find.byKey(const ValueKey('onboarding-next')));
    await tester.pumpAndSettle();

    expect(
      find.byKey(const ValueKey('onboarding-budget-energy-saving-placeholder')),
      findsOneWidget,
    );
    expect(tester.takeException(), isNull);
  });

  testWidgets('Arabic onboarding layout fits a narrow mobile viewport', (
    tester,
  ) async {
    tester.view.physicalSize = const Size(360, 800);
    tester.view.devicePixelRatio = 1;
    tester.platformDispatcher.localesTestValue = const [Locale('ar', 'EG')];
    addTearDown(tester.view.resetPhysicalSize);
    addTearDown(tester.view.resetDevicePixelRatio);
    addTearDown(tester.platformDispatcher.clearLocalesTestValue);

    await tester.pumpWidget(const ProviderScope(child: MyApp()));
    await tester.pumpAndSettle();

    final exception = tester.takeException();
    expect(exception, isNull, reason: exception?.toString());
    expect(find.byKey(const ValueKey('onboarding-next')), findsOneWidget);
  });

  testWidgets('Arabic screen 02 meter reading fits a narrow viewport', (
    tester,
  ) async {
    tester.view.physicalSize = const Size(320, 720);
    tester.view.devicePixelRatio = 1;
    tester.platformDispatcher.localesTestValue = const [Locale('ar', 'EG')];
    addTearDown(tester.view.resetPhysicalSize);
    addTearDown(tester.view.resetDevicePixelRatio);
    addTearDown(tester.platformDispatcher.clearLocalesTestValue);

    await tester.pumpWidget(const ProviderScope(child: MyApp()));
    await tester.pumpAndSettle();

    final exception = tester.takeException();
    expect(exception, isNull, reason: exception?.toString());
    expect(find.text('14,892'), findsOneWidget);
    expect(find.byKey(const ValueKey('onboarding-next')), findsOneWidget);
  });

  testWidgets('Arabic screen two fits a narrow viewport and scrolls content', (
    tester,
  ) async {
    tester.view.physicalSize = const Size(360, 640);
    tester.view.devicePixelRatio = 1;
    tester.platformDispatcher.localesTestValue = const [Locale('ar', 'EG')];
    addTearDown(tester.view.resetPhysicalSize);
    addTearDown(tester.view.resetDevicePixelRatio);
    addTearDown(tester.platformDispatcher.clearLocalesTestValue);

    final router = GoRouter(
      initialLocation: '/onboarding/calculate-your-bill',
      routes: [
        GoRoute(
          path: '/onboarding/calculate-your-bill',
          builder: (_, _) => const OnboardingCalculateYourBillScreen(),
        ),
      ],
    );
    addTearDown(router.dispose);

    await tester.pumpWidget(
      MaterialApp.router(
        routerConfig: router,
        locale: const Locale('ar', 'EG'),
        supportedLocales: const [Locale('ar', 'EG')],
        localizationsDelegates: AppLocalizations.localizationsDelegates,
      ),
    );
    await tester.pumpAndSettle();

    expect(find.byKey(const ValueKey('onboarding-calculate-your-bill-screen')), findsOneWidget);
    expect(find.byKey(const ValueKey('onboarding-next')), findsOneWidget);
    expect(find.byKey(const ValueKey('onboarding-previous')), findsOneWidget);
    expect(tester.takeException(), isNull);
  });
}
