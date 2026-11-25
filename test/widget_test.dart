import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:go_router/go_router.dart';

import 'package:electricity_consumption_calculator/core/theme/app_colors.dart';
import 'package:electricity_consumption_calculator/l10n/generated/app_localizations.dart';
import 'package:electricity_consumption_calculator/features/auth/presentation/create_account_screen.dart';
import 'package:electricity_consumption_calculator/features/onboarding/presentation/onboarding_calculate_your_bill_screen.dart';
import 'package:electricity_consumption_calculator/features/onboarding/presentation/onboarding_budget_energy_saving_screen.dart';
import 'package:electricity_consumption_calculator/features/auth/presentation/welcome_login_screen.dart';
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

  testWidgets('screen three next opens the budget onboarding screen', (
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
      find.byKey(const ValueKey('onboarding-budget-energy-saving-screen')),
      findsOneWidget,
    );
    expect(find.byKey(const ValueKey('onboarding-start-now')), findsOneWidget);
    await tester.tap(find.byKey(const ValueKey('onboarding-start-now')));
    await tester.pumpAndSettle();
    expect(find.byKey(const ValueKey('welcome-login-screen')), findsOneWidget);
    expect(tester.takeException(), isNull);
  });

  testWidgets('Welcome/Login renders in Arabic RTL and English LTR', (
    tester,
  ) async {
    Widget app(Locale locale) => MaterialApp(
      locale: locale,
      supportedLocales: AppLocalizations.supportedLocales,
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      home: const WelcomeLoginScreen(),
    );

    await tester.pumpWidget(app(const Locale('ar', 'EG')));
    expect(
      Directionality.of(tester.element(find.byKey(const ValueKey('welcome-login-screen')))),
      TextDirection.rtl,
    );
    expect(find.byKey(const ValueKey('welcome-login-title')), findsOneWidget);

    await tester.pumpWidget(app(const Locale('en', 'US')));
    expect(
      Directionality.of(tester.element(find.byKey(const ValueKey('welcome-login-screen')))),
      TextDirection.ltr,
    );
    expect(
      tester.widget<Text>(find.byKey(const ValueKey('welcome-login-title'))).data,
      'Log in',
    );
    expect(tester.takeException(), isNull);
  });

  testWidgets('Welcome/Login password toggle and remember checkbox work', (
    tester,
  ) async {
    final router = GoRouter(
      initialLocation: '/welcome-login',
      routes: [
        GoRoute(
          path: '/welcome-login',
          builder: (_, _) => const WelcomeLoginScreen(),
        ),
      ],
    );
    addTearDown(router.dispose);
    await tester.pumpWidget(
      MaterialApp.router(
        routerConfig: router,
        localizationsDelegates: AppLocalizations.localizationsDelegates,
        supportedLocales: AppLocalizations.supportedLocales,
      ),
    );
    await tester.pumpAndSettle();

    final checkboxFinder = find.byKey(const ValueKey('welcome-remember-checkbox'));
    expect(tester.widget<Checkbox>(checkboxFinder).value, isTrue);
    await tester.tap(checkboxFinder);
    await tester.pump();
    expect(tester.widget<Checkbox>(checkboxFinder).value, isFalse);

    final passwordField = find.byType(TextFormField).last;
    final passwordInput = find.descendant(
      of: passwordField,
      matching: find.byType(TextField),
    );
    expect(tester.widget<TextField>(passwordInput).obscureText, isTrue);
    await tester.tap(find.byTooltip('Show password'));
    await tester.pump();
    expect(tester.widget<TextField>(passwordInput).obscureText, isFalse);
    expect(tester.takeException(), isNull);
  });

  testWidgets('Welcome/Login fits a narrow Arabic viewport', (tester) async {
    tester.view.physicalSize = const Size(320, 640);
    tester.view.devicePixelRatio = 1;
    addTearDown(tester.view.resetPhysicalSize);
    addTearDown(tester.view.resetDevicePixelRatio);
    await tester.pumpWidget(
      const MaterialApp(
        locale: Locale('ar', 'EG'),
        supportedLocales: AppLocalizations.supportedLocales,
        localizationsDelegates: AppLocalizations.localizationsDelegates,
        home: WelcomeLoginScreen(),
      ),
    );
    await tester.pumpAndSettle();

    expect(find.byKey(const ValueKey('welcome-login-button')), findsOneWidget);
    expect(find.byKey(const ValueKey('welcome-guest-button')), findsOneWidget);
    expect(tester.takeException(), isNull);
  });

  testWidgets('Create Account renders in Arabic RTL and English LTR', (
    tester,
  ) async {
    Widget app(Locale locale) => MaterialApp(
      locale: locale,
      supportedLocales: AppLocalizations.supportedLocales,
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      home: const CreateAccountScreen(),
    );

    await tester.pumpWidget(app(const Locale('ar', 'EG')));
    expect(
      Directionality.of(tester.element(find.byKey(const ValueKey('create-account-screen')))),
      TextDirection.rtl,
    );
    expect(find.text('الاسم بالكامل'), findsOneWidget);
    expect(find.text('البريد الإلكتروني'), findsOneWidget);
    expect(find.text('رقم الهاتف'), findsOneWidget);

    await tester.pumpWidget(app(const Locale('en', 'US')));
    expect(
      Directionality.of(tester.element(find.byKey(const ValueKey('create-account-screen')))),
      TextDirection.ltr,
    );
    expect(find.text('Full Name'), findsOneWidget);
    expect(find.text('Email Address'), findsOneWidget);
    expect(find.text('Phone Number'), findsOneWidget);
    expect(find.text('Create Account'), findsOneWidget);
    expect(tester.takeException(), isNull);
  });

  testWidgets('Create Account password fields toggle visibility independently', (
    tester,
  ) async {
    tester.view.physicalSize = const Size(800, 1200);
    tester.view.devicePixelRatio = 1;
    addTearDown(tester.view.resetPhysicalSize);
    addTearDown(tester.view.resetDevicePixelRatio);
    await tester.pumpWidget(
      const MaterialApp(
        supportedLocales: AppLocalizations.supportedLocales,
        localizationsDelegates: AppLocalizations.localizationsDelegates,
        home: CreateAccountScreen(),
      ),
    );
    await tester.pumpAndSettle();

    TextField passwordInput(String key) => tester.widget<TextField>(
      find.descendant(
        of: find.byKey(ValueKey(key)),
        matching: find.byType(TextField),
      ),
    );

    expect(passwordInput('create-account-password').obscureText, isTrue);
    expect(passwordInput('create-account-confirm-password').obscureText, isTrue);
    await tester.tap(find.byTooltip('Show password').first);
    await tester.pump();
    expect(passwordInput('create-account-password').obscureText, isFalse);
    expect(passwordInput('create-account-confirm-password').obscureText, isTrue);
    await tester.tap(find.byTooltip('Show password'));
    await tester.pump();
    expect(passwordInput('create-account-password').obscureText, isFalse);
    expect(passwordInput('create-account-confirm-password').obscureText, isFalse);
    expect(tester.takeException(), isNull);
  });

  testWidgets('Login and Create Account links navigate both ways', (
    tester,
  ) async {
    tester.view.physicalSize = const Size(800, 1200);
    tester.view.devicePixelRatio = 1;
    addTearDown(tester.view.resetPhysicalSize);
    addTearDown(tester.view.resetDevicePixelRatio);
    await tester.pumpWidget(const ProviderScope(child: MyApp()));
    await tester.pumpAndSettle();

    GoRouter.of(tester.element(find.byKey(const ValueKey('onboarding-next')))).go('/welcome-login');
    await tester.pumpAndSettle();
    expect(find.byKey(const ValueKey('welcome-login-screen')), findsOneWidget);

    await tester.tap(find.byKey(const ValueKey('welcome-create-account')));
    await tester.pumpAndSettle();
    expect(find.byKey(const ValueKey('create-account-screen')), findsOneWidget);

    await tester.tap(find.byKey(const ValueKey('create-account-back-to-login')));
    await tester.pumpAndSettle();
    expect(find.byKey(const ValueKey('welcome-login-screen')), findsOneWidget);
    expect(tester.takeException(), isNull);
  });

  testWidgets('Create Account fits a narrow Arabic viewport', (tester) async {
    tester.view.physicalSize = const Size(320, 640);
    tester.view.devicePixelRatio = 1;
    addTearDown(tester.view.resetPhysicalSize);
    addTearDown(tester.view.resetDevicePixelRatio);

    await tester.pumpWidget(
      const MaterialApp(
        locale: Locale('ar', 'EG'),
        supportedLocales: AppLocalizations.supportedLocales,
        localizationsDelegates: AppLocalizations.localizationsDelegates,
        home: CreateAccountScreen(),
      ),
    );
    await tester.pumpAndSettle();

    expect(find.byKey(const ValueKey('create-account-full-name')), findsOneWidget);
    expect(find.byKey(const ValueKey('create-account-submit')), findsOneWidget);
    expect(tester.takeException(), isNull);
  });

  testWidgets('screen 04 fits a narrow Arabic viewport and keeps actions visible', (
    tester,
  ) async {
    tester.view.physicalSize = const Size(320, 640);
    tester.view.devicePixelRatio = 1;
    addTearDown(tester.view.resetPhysicalSize);
    addTearDown(tester.view.resetDevicePixelRatio);

    final router = GoRouter(
      initialLocation: '/screen-04',
      routes: [
        GoRoute(
          path: '/screen-04',
          builder: (_, _) => const OnboardingBudgetEnergySavingScreen(),
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

    expect(find.byKey(const ValueKey('onboarding-skip')), findsOneWidget);
    expect(find.byKey(const ValueKey('onboarding-start-now')), findsOneWidget);
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
    final previousHandler = FlutterError.onError;
    FlutterError.onError = (details) {
      debugPrint(details.toString());
      previousHandler?.call(details);
    };
    addTearDown(() => FlutterError.onError = previousHandler);

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
