import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:electricity_consumption_calculator/core/theme/app_theme.dart';
import 'package:electricity_consumption_calculator/core/widgets/buttons/app_button.dart';
import 'package:electricity_consumption_calculator/core/widgets/buttons/app_icon_button.dart';
import 'package:electricity_consumption_calculator/core/widgets/inputs/app_dropdown_field.dart';
import 'package:electricity_consumption_calculator/core/widgets/inputs/app_email_field.dart';
import 'package:electricity_consumption_calculator/core/widgets/inputs/app_number_field.dart';
import 'package:electricity_consumption_calculator/core/widgets/inputs/app_password_field.dart';
import 'package:electricity_consumption_calculator/core/widgets/inputs/app_search_field.dart';
import 'package:electricity_consumption_calculator/core/widgets/inputs/app_text_field.dart';
import 'package:electricity_consumption_calculator/l10n/generated/app_localizations.dart';

Widget _testApp(Widget child, {Locale locale = const Locale('en', 'US')}) {
  return MaterialApp(
    locale: locale,
    theme: AppTheme.light,
    supportedLocales: AppLocalizations.supportedLocales,
    localizationsDelegates: AppLocalizations.localizationsDelegates,
    home: Scaffold(body: Center(child: child)),
  );
}

void main() {
  group('AppButton', () {
    testWidgets('renders primary, secondary, outlined, and text variants', (
      tester,
    ) async {
      var pressed = 0;
      await tester.pumpWidget(
        _testApp(
          Column(
            children: [
              AppButton(
                onPressed: () => pressed++,
                child: const Text('Primary'),
              ),
              AppButton(
                variant: AppButtonVariant.secondary,
                onPressed: () => pressed++,
                child: const Text('Secondary'),
              ),
              AppButton(
                variant: AppButtonVariant.outlined,
                onPressed: () => pressed++,
                child: const Text('Outlined'),
              ),
              AppButton(
                variant: AppButtonVariant.text,
                onPressed: () => pressed++,
                child: const Text('Text'),
              ),
            ],
          ),
        ),
      );

      expect(find.byType(FilledButton), findsOneWidget);
      expect(find.byType(OutlinedButton), findsNWidgets(2));
      expect(find.byType(TextButton), findsOneWidget);
      await tester.tap(find.text('Primary'));
      await tester.tap(find.text('Secondary'));
      await tester.tap(find.text('Outlined'));
      await tester.tap(find.text('Text'));
      expect(pressed, 4);
    });

    testWidgets('disabled and loading states cannot invoke callbacks', (
      tester,
    ) async {
      var pressed = false;
      await tester.pumpWidget(
        _testApp(
          Column(
            children: [
              AppButton(onPressed: null, child: const Text('Disabled')),
              AppButton(
                isLoading: true,
                onPressed: () => pressed = true,
                child: const Text('Save'),
              ),
            ],
          ),
        ),
      );

      final buttons = tester.widgetList<FilledButton>(find.byType(FilledButton));
      expect(buttons.first.onPressed, isNull);
      expect(buttons.last.onPressed, isNull);
      expect(find.byType(CircularProgressIndicator), findsOneWidget);
      expect(find.bySemanticsLabel('Loading'), findsOneWidget);
      await tester.tap(find.byType(FilledButton).last);
      expect(pressed, isFalse);
    });

    testWidgets('parent loading transition blocks rapid repeated taps', (
      tester,
    ) async {
      final operation = Completer<void>();
      var isLoading = false;
      var callbackCount = 0;

      await tester.pumpWidget(
        _testApp(
          StatefulBuilder(
            builder: (context, setState) => AppButton(
              isLoading: isLoading,
              onPressed: () async {
                callbackCount++;
                setState(() => isLoading = true);
                await operation.future;
                setState(() => isLoading = false);
              },
              child: const Text('Submit'),
            ),
          ),
        ),
      );

      await tester.tap(find.text('Submit'));
      await tester.pump();
      expect(callbackCount, 1);
      expect(tester.widget<FilledButton>(find.byType(FilledButton)).onPressed, isNull);

      await tester.tap(find.byType(FilledButton));
      expect(callbackCount, 1);

      operation.complete();
      await tester.pumpAndSettle();
      expect(tester.widget<FilledButton>(find.byType(FilledButton)).onPressed, isNotNull);
    });

    testWidgets('icon button exposes its tooltip as an accessible label', (
      tester,
    ) async {
      var pressed = false;
      await tester.pumpWidget(
        _testApp(
          AppIconButton(
            icon: const Icon(Icons.add),
            tooltip: 'Add item',
            onPressed: () => pressed = true,
          ),
        ),
      );

      expect(find.byTooltip('Add item'), findsOneWidget);
      await tester.tap(find.byTooltip('Add item'));
      expect(pressed, isTrue);
    });

    testWidgets('disabled icon button has no callback', (tester) async {
      var pressed = false;
      await tester.pumpWidget(
        _testApp(
          AppIconButton(
            icon: const Icon(Icons.add),
            tooltip: 'Add item',
            onPressed: null,
          ),
        ),
      );

      expect(tester.widget<IconButton>(find.byType(IconButton)).onPressed, isNull);
      await tester.tap(find.byTooltip('Add item'));
      expect(pressed, isFalse);
    });
  });

  group('App input fields', () {
    testWidgets('standard and email fields accept input and configure email', (
      tester,
    ) async {
      final standardController = TextEditingController();
      final emailController = TextEditingController();
      await tester.pumpWidget(
        _testApp(
          Column(
            children: [
              AppTextField(controller: standardController, labelText: 'Name'),
              AppEmailField(controller: emailController, labelText: 'Email'),
            ],
          ),
        ),
      );

      await tester.enterText(find.byType(TextFormField).first, 'Amira');
      await tester.enterText(find.byType(TextFormField).last, 'amira@example.com');
      expect(standardController.text, 'Amira');
      expect(emailController.text, 'amira@example.com');
      final emailField = tester.widget<TextField>(find.byType(TextField).last);
      expect(emailField.keyboardType, TextInputType.emailAddress);
      expect(emailField.textDirection, TextDirection.ltr);
      expect(emailField.autofillHints, contains(AutofillHints.email));
    });

    testWidgets('password visibility toggles and labels localize in both scripts', (
      tester,
    ) async {
      await tester.pumpWidget(
        _testApp(const AppPasswordField(), locale: const Locale('en', 'US')),
      );
      expect(tester.widget<TextField>(find.byType(TextField)).obscureText, isTrue);
      expect(find.byTooltip('Show password'), findsOneWidget);
      await tester.tap(find.byTooltip('Show password'));
      await tester.pumpAndSettle();
      expect(tester.widget<TextField>(find.byType(TextField)).obscureText, isFalse);
      expect(find.byTooltip('Hide password'), findsOneWidget);

      await tester.pumpWidget(
        _testApp(
          const AppPasswordField(key: ValueKey('arabic-password')),
          locale: const Locale('ar', 'EG'),
        ),
      );
      expect(Directionality.of(tester.element(find.byType(TextField))), TextDirection.rtl);
      expect(find.byTooltip('إظهار كلمة المرور'), findsOneWidget);
    });

    testWidgets('number field filters non-numeric symbols and supports decimals', (
      tester,
    ) async {
      final controller = TextEditingController();
      await tester.pumpWidget(_testApp(AppNumberField(controller: controller)));

      await tester.enterText(find.byType(TextFormField), '12a-3.5');
      expect(controller.text, '123.5');
      await tester.enterText(find.byType(TextFormField), '1..2');
      expect(controller.text, '123.5');
      final numberField = tester.widget<TextField>(find.byType(TextField));
      expect(numberField.keyboardType, const TextInputType.numberWithOptions(decimal: true));
      expect(numberField.textDirection, TextDirection.ltr);
    });

    test('numeric normalization handles localized digits and separators', () {
      expect(AppNumberField.normalize('123.45'), '123.45');
      expect(AppNumberField.normalize('١٢٣'), '123');
      expect(AppNumberField.normalize('۱۲۳'), '123');
      expect(AppNumberField.normalize('١٢٣٫٤٥'), '123.45');
      expect(AppNumberField.normalize('۱٬۲۳۴٫۵۶'), '1234.56');
      expect(AppNumberField.normalize('1,234.56'), '1234.56');
      expect(AppNumberField.tryParse('١٢٣٫٥'), 123.5);
      expect(AppNumberField.tryParse('1,234.5'), 1234.5);
    });

    test('numeric normalization rejects malformed values and grouping', () {
      expect(AppNumberField.normalize('1..2'), isNull);
      expect(AppNumberField.normalize('1.2٫3'), isNull);
      expect(AppNumberField.normalize('1,23'), isNull);
      expect(AppNumberField.normalize('1٬23'), isNull);
      expect(AppNumberField.normalize('1,234٬567'), isNull);
      expect(AppNumberField.normalize('١٢٣x'), isNull);
      expect(AppNumberField.tryParse('-1'), isNull);
      expect(AppNumberField.tryParse(''), isNull);
    });

    testWidgets('number field preserves displayed digits and validates syntax', (
      tester,
    ) async {
      final controller = TextEditingController(text: '١٢٣٫٤٥');
      final formKey = GlobalKey<FormState>();
      await tester.pumpWidget(
        _testApp(
          Form(
            key: formKey,
            child: AppNumberField(controller: controller),
          ),
        ),
      );

      expect(controller.text, '١٢٣٫٤٥');
      expect(formKey.currentState!.validate(), isTrue);
      expect(controller.text, '١٢٣٫٤٥');
      expect(AppNumberField.tryParse(controller.text), 123.45);

      controller.text = '1..2';
      await tester.pump();
      expect(formKey.currentState!.validate(), isFalse);
      await tester.pumpAndSettle();
      expect(find.text('Enter a valid number'), findsOneWidget);
      expect(controller.text, '1..2');
    });

    testWidgets('search field has search affordance and reports changed text', (
      tester,
    ) async {
      String? query;
      await tester.pumpWidget(_testApp(AppSearchField(onChanged: (value) => query = value)));

      expect(find.byIcon(Icons.search), findsOneWidget);
      await tester.enterText(find.byType(TextFormField), 'meter');
      expect(query, 'meter');
      expect(
        tester.widget<TextField>(find.byType(TextField)).textInputAction,
        TextInputAction.search,
      );
    });

    testWidgets('field validators show errors and disabled fields stay disabled', (
      tester,
    ) async {
      final formKey = GlobalKey<FormState>();
      await tester.pumpWidget(
        _testApp(
          Form(
            key: formKey,
            child: Column(
              children: [
                AppTextField(
                  labelText: 'Required field',
                  validator: (value) =>
                      value == null || value.isEmpty ? 'Please enter a value' : null,
                ),
                AppTextField(labelText: 'Disabled field', enabled: false),
                AppButton(
                  onPressed: () => formKey.currentState!.validate(),
                  child: const Text('Validate'),
                ),
              ],
            ),
          ),
        ),
      );

      await tester.tap(find.text('Validate'));
      await tester.pumpAndSettle();
      expect(find.text('Please enter a value'), findsOneWidget);
      expect(tester.widgetList<TextFormField>(find.byType(TextFormField)).last.enabled, isFalse);
    });

    testWidgets('dropdown selects an item and displays validation errors', (
      tester,
    ) async {
      final formKey = GlobalKey<FormState>();
      String? selected;
      await tester.pumpWidget(
        _testApp(
          Form(
            key: formKey,
            child: Column(
              children: [
                AppDropdownField<String>(
                  hintText: 'Meter type',
                  items: const [
                    DropdownMenuItem(value: 'digital', child: Text('Digital')),
                    DropdownMenuItem(value: 'mechanical', child: Text('Mechanical')),
                  ],
                  validator: (value) => value == null ? 'Select a meter type' : null,
                  onChanged: (value) => selected = value,
                ),
                AppButton(
                  onPressed: () => formKey.currentState!.validate(),
                  child: const Text('Validate'),
                ),
              ],
            ),
          ),
        ),
      );

      await tester.tap(find.text('Validate'));
      await tester.pumpAndSettle();
      expect(find.text('Select a meter type'), findsOneWidget);

      await tester.tap(find.byType(DropdownButtonFormField<String>));
      await tester.pumpAndSettle();
      await tester.tap(find.text('Digital').last);
      await tester.pumpAndSettle();
      expect(selected, 'digital');
    });

    testWidgets('stale selected value is normalized before validation', (
      tester,
    ) async {
      final formKey = GlobalKey<FormState>();
      await tester.pumpWidget(
        _testApp(
          Form(
            key: formKey,
            child: AppDropdownField<String>(
              value: 'removed',
              hintText: 'Choose a meter',
              items: const [DropdownMenuItem(value: 'digital', child: Text('Digital'))],
              validator: (value) => value == null ? 'Select a meter' : null,
            ),
          ),
        ),
      );

      expect(tester.takeException(), isNull);
      expect(formKey.currentState!.validate(), isFalse);
      await tester.pumpAndSettle();
      expect(find.text('Select a meter'), findsOneWidget);
    });

    testWidgets('initially empty dropdown is safe and disabled', (tester) async {
      final formKey = GlobalKey<FormState>();
      await tester.pumpWidget(
        _testApp(
          Form(
            key: formKey,
            child: AppDropdownField<String>(
              value: 'stale',
              hintText: 'No meters available',
              items: const [],
              validator: (value) => value == null ? 'Select a meter' : null,
            ),
          ),
        ),
      );

      final dropdown = tester.widget<DropdownButtonFormField<String>>(
        find.byType(DropdownButtonFormField<String>),
      );
      expect(dropdown.onChanged, isNull);
      expect(tester.takeException(), isNull);
      expect(formKey.currentState!.validate(), isFalse);
      await tester.pumpAndSettle();
      expect(find.text('Select a meter'), findsOneWidget);
    });

    testWidgets('removing current option resets the FormField selection', (
      tester,
    ) async {
      final formKey = GlobalKey<FormState>();
      var items = const [
        DropdownMenuItem(value: 'digital', child: Text('Digital')),
        DropdownMenuItem(value: 'mechanical', child: Text('Mechanical')),
      ];
      var selected = 'digital';

      await tester.pumpWidget(
        _testApp(
          StatefulBuilder(
            builder: (context, setState) => Form(
              key: formKey,
              child: Column(
                children: [
                  AppDropdownField<String>(
                    value: selected,
                    hintText: 'Choose a meter',
                    items: items,
                    validator: (value) => value == null ? 'Select a meter' : null,
                    onChanged: (value) => setState(() => selected = value ?? ''),
                  ),
                  TextButton(
                    onPressed: () => setState(() {
                      items = const [
                        DropdownMenuItem(value: 'mechanical', child: Text('Mechanical')),
                      ];
                    }),
                    child: const Text('Remove current option'),
                  ),
                ],
              ),
            ),
          ),
        ),
      );

      await tester.tap(find.text('Remove current option'));
      await tester.pumpAndSettle();
      expect(tester.takeException(), isNull);
      expect(formKey.currentState!.validate(), isFalse);
      await tester.pumpAndSettle();
      expect(find.text('Select a meter'), findsOneWidget);
    });

    testWidgets('dropdown is disabled when requested and follows RTL direction', (
      tester,
    ) async {
      await tester.pumpWidget(
        _testApp(
          AppDropdownField<String>(
            enabled: false,
            items: const [DropdownMenuItem(value: 'one', child: Text('One'))],
          ),
          locale: const Locale('ar', 'EG'),
        ),
      );

      expect(
        Directionality.of(tester.element(find.byType(DropdownButtonFormField<String>))),
        TextDirection.rtl,
      );
      expect(
        tester
            .widget<DropdownButtonFormField<String>>(
              find.byType(DropdownButtonFormField<String>),
            )
            .onChanged,
        isNull,
      );
    });
  });
}
