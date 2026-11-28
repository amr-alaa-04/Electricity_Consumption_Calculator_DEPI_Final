import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:electricity_consumption_calculator/core/theme/app_theme.dart';
import 'package:electricity_consumption_calculator/features/readings/presentation/widgets/manual_reading_input.dart';
import 'package:electricity_consumption_calculator/l10n/generated/app_localizations.dart';

void main() {
  testWidgets('Manual reading requires a number and rejects invalid decimals', (
    tester,
  ) async {
    final acceptedReadings = <String>[];
    await tester.pumpWidget(_manualInputApp(acceptedReadings.add));

    await tester.tap(find.byKey(const ValueKey('manual-reading-confirm')));
    await tester.pump();
    expect(find.text('Enter a meter reading.'), findsOneWidget);
    expect(acceptedReadings, isEmpty);

    await tester.enterText(_manualReadingEditor(), '12,3');
    await tester.tap(find.byKey(const ValueKey('manual-reading-confirm')));
    await tester.pump();
    expect(find.text('Enter a valid number'), findsOneWidget);
    expect(acceptedReadings, isEmpty);
  });

  testWidgets('Manual reading accepts a decimal value', (tester) async {
    final acceptedReadings = <String>[];
    await tester.pumpWidget(_manualInputApp(acceptedReadings.add));

    await tester.enterText(_manualReadingEditor(), '1234.5');
    await tester.tap(find.byKey(const ValueKey('manual-reading-confirm')));
    await tester.pump();

    expect(acceptedReadings, ['1234.5']);
    expect(tester.takeException(), isNull);
  });
}

Finder _manualReadingEditor() => find.descendant(
  of: find.byKey(const ValueKey('manual-reading-value')),
  matching: find.byType(EditableText),
);

Widget _manualInputApp(ValueChanged<String> onReadingConfirmed) => MaterialApp(
  theme: AppTheme.light,
  locale: const Locale('en', 'US'),
  supportedLocales: AppLocalizations.supportedLocales,
  localizationsDelegates: AppLocalizations.localizationsDelegates,
  home: Builder(
    builder: (context) => Scaffold(
      body: SingleChildScrollView(
        child: ManualReadingInput(
          l10n: AppLocalizations.of(context)!,
          onReadingConfirmed: onReadingConfirmed,
        ),
      ),
    ),
  ),
);
