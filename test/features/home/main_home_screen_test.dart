import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:go_router/go_router.dart';

import 'package:electricity_consumption_calculator/features/home/presentation/main_home_screen.dart';
import 'package:electricity_consumption_calculator/l10n/generated/app_localizations.dart';
import 'package:electricity_consumption_calculator/main.dart';

void main() {
  testWidgets('Main Home dashboard renders in Arabic RTL and English LTR', (
    tester,
  ) async {
    Widget app(Locale locale) => MaterialApp(
      locale: locale,
      supportedLocales: AppLocalizations.supportedLocales,
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      home: const MainHomeScreen(),
    );

    await tester.pumpWidget(app(const Locale('ar', 'EG')));
    expect(
      Directionality.of(tester.element(find.byKey(const ValueKey('main-home-screen')))),
      TextDirection.rtl,
    );
    expect(find.text('استهلاك الشهر الحالي'), findsOneWidget);
    expect(find.text('الميزانية الشهرية'), findsOneWidget);
    expect(find.byKey(const ValueKey('home-budget-progress')), findsOneWidget);

    await tester.pumpWidget(app(const Locale('en', 'US')));
    expect(
      Directionality.of(tester.element(find.byKey(const ValueKey('main-home-screen')))),
      TextDirection.ltr,
    );
    expect(find.text('Current month consumption'), findsOneWidget);
    expect(find.text('Monthly budget'), findsOneWidget);
    expect(tester.takeException(), isNull);
  });

  testWidgets('Login navigates to Main Home', (tester) async {
    tester.view.physicalSize = const Size(800, 1200);
    tester.view.devicePixelRatio = 1;
    addTearDown(tester.view.resetPhysicalSize);
    addTearDown(tester.view.resetDevicePixelRatio);

    await tester.pumpWidget(const ProviderScope(child: MyApp()));
    await tester.pumpAndSettle();
    GoRouter.of(tester.element(find.byKey(const ValueKey('onboarding-next')))).go('/welcome-login');
    await tester.pumpAndSettle();

    await tester.tap(find.byKey(const ValueKey('welcome-login-button')));
    await tester.pumpAndSettle();
    expect(find.byKey(const ValueKey('main-home-screen')), findsOneWidget);
    expect(find.byKey(const ValueKey('home-budget-card')), findsOneWidget);
    expect(tester.takeException(), isNull);
  });

  testWidgets('Main Home adapts to a narrow Arabic viewport', (tester) async {
    tester.view.physicalSize = const Size(320, 720);
    tester.view.devicePixelRatio = 1;
    addTearDown(tester.view.resetPhysicalSize);
    addTearDown(tester.view.resetDevicePixelRatio);

    await tester.pumpWidget(
      const MaterialApp(
        locale: Locale('ar', 'EG'),
        supportedLocales: AppLocalizations.supportedLocales,
        localizationsDelegates: AppLocalizations.localizationsDelegates,
        home: MainHomeScreen(),
      ),
    );
    await tester.pumpAndSettle();

    expect(find.byKey(const ValueKey('main-home-screen')), findsOneWidget);
    expect(find.byKey(const ValueKey('home-budget-card')), findsOneWidget);
    expect(find.byKey(const ValueKey('home-trend-card')), findsOneWidget);
    expect(tester.takeException(), isNull);
  });
}
