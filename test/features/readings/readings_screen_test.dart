import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:go_router/go_router.dart';

import 'package:electricity_consumption_calculator/core/widgets/navigation/app_bottom_navigation_bar.dart';
import 'package:electricity_consumption_calculator/features/readings/presentation/widgets/reading_comparison_summary.dart';
import 'package:electricity_consumption_calculator/features/readings/presentation/widgets/reading_confirmation_card.dart';
import 'package:electricity_consumption_calculator/features/readings/presentation/widgets/reading_date_time_field.dart';
import 'package:electricity_consumption_calculator/features/readings/presentation/widgets/reading_input_methods.dart';
import 'package:electricity_consumption_calculator/features/readings/presentation/widgets/reading_safety_notice.dart';
import 'package:electricity_consumption_calculator/features/readings/presentation/widgets/reading_scanner_viewfinder.dart';
import 'package:electricity_consumption_calculator/features/readings/presentation/widgets/reading_voice_input_invitation.dart';
import 'package:electricity_consumption_calculator/features/readings/presentation/widgets/readings_header.dart';
import 'package:electricity_consumption_calculator/main.dart';

void main() {
  testWidgets('Readings route lays out every section on a narrow Arabic screen', (
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

    GoRouter.of(
      tester.element(find.byKey(const ValueKey('onboarding-next'))),
    ).go('/readings');
    await tester.pump();
    // The scanner intentionally animates continuously, so use a bounded pump.
    await tester.pump(const Duration(milliseconds: 500));

    expect(find.byKey(const ValueKey('readings-screen')), findsOneWidget);
    final sections = [
      find.byType(ReadingsHeader),
      find.byType(ReadingInputMethods),
      find.byType(ReadingScannerViewfinder),
      find.byType(ReadingConfirmationCard),
      find.byType(ReadingComparisonSummary),
      find.byType(ReadingDateTimeField),
      find.byType(ReadingVoiceInputInvitation),
      find.byType(ReadingSafetyNotice),
      find.byKey(const ValueKey('reading-review-confirm')),
    ];
    for (final section in sections) {
      expect(section, findsOneWidget);
      expect(tester.getSize(section).longestSide, greaterThan(0));
    }

    expect(tester.getTopLeft(find.byType(ReadingsHeader)).dy, lessThan(120));
    expect(tester.getTopLeft(find.byType(ReadingInputMethods)).dy, lessThan(240));
    expect(
      tester.getTopLeft(find.byType(AppBottomNavigationBar).last).dy,
      greaterThan(600),
    );
    expect(tester.takeException(), isNull);
  });
}
