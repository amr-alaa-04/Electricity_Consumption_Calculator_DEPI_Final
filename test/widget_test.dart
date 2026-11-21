import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:electricity_consumption_calculator/core/theme/app_colors.dart';
import 'package:electricity_consumption_calculator/l10n/generated/app_localizations.dart';
import 'package:electricity_consumption_calculator/main.dart';

void main() {
  testWidgets('application starts with a blank localized root', (tester) async {
    await tester.pumpWidget(const ProviderScope(child: MyApp()));
    await tester.pumpAndSettle();

    expect(tester.takeException(), isNull);
    expect(find.byKey(const ValueKey('blank-root-route')), findsOneWidget);
    expect(find.byType(Scaffold), findsNothing);

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
}
