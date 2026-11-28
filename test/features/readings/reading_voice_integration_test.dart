import 'dart:convert';

import 'package:electricity_consumption_calculator/features/readings/presentation/readings_screen.dart';
import 'package:electricity_consumption_calculator/l10n/generated/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';

const _speechChannel = MethodChannel('plugin.csdcorp.com/speech_to_text');
const _codec = StandardMethodCodec();

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();
  final messenger = TestDefaultBinaryMessengerBinding.instance.defaultBinaryMessenger;
  late List<MethodCall> calls;

  setUp(() {
    calls = [];
    messenger.setMockMethodCallHandler(_speechChannel, (call) async {
      calls.add(call);
      switch (call.method) {
        case 'initialize':
          return true;
        case 'locales':
          return const ['ar-EG:Arabic (Egypt)', 'en-US:English'];
        case 'has_permission':
          return true;
        case 'listen':
          return true;
        case 'stop':
        case 'cancel':
          return null;
        default:
          throw MissingPluginException('Unexpected method ${call.method}');
      }
    });
  });

  tearDown(() => messenger.setMockMethodCallHandler(_speechChannel, null));

  testWidgets('parses a final Arabic meter reading into the confirmation field', (
    tester,
  ) async {
    await _openVoiceInput(tester, const Locale('ar', 'EG'));
    await _startRecognition(tester);
    await _sendFinalResult('القراءة ١٢٣٤٥');
    await tester.pump();

    expect(await _currentReading(tester), '12345');
  });

  testWidgets('parses an English decimal reading into the confirmation field', (
    tester,
  ) async {
    await _openVoiceInput(tester, const Locale('en', 'US'));
    await _startRecognition(tester);
    await _sendFinalResult('Meter reading is 12345 point 6');
    await tester.pump();

    expect(await _currentReading(tester), '12345.6');
  });

  testWidgets('parses an Arabic decimal reading into the confirmation field', (
    tester,
  ) async {
    await _openVoiceInput(tester, const Locale('ar', 'EG'));
    await _startRecognition(tester);
    await _sendFinalResult('القراءة ١٢٣٤٥ فاصلة ٦');
    await tester.pump();

    expect(await _currentReading(tester), '12345.6');
  });

  testWidgets('partial speech text does not change the accepted reading', (
    tester,
  ) async {
    await _openVoiceInput(tester, const Locale('en', 'US'));
    await _startRecognition(tester);
    await _sendPartialResult('meter reading 999');
    await tester.pump();

    expect(await _currentReading(tester), '14892');
    expect(find.text('meter reading 999'), findsOneWidget);
  });

  testWidgets('invalid final speech shows a localized error and preserves value', (
    tester,
  ) async {
    await _openVoiceInput(tester, const Locale('en', 'US'));
    await _startRecognition(tester);
    await _sendFinalResult('read 123 and 456');
    await tester.pump();
    final l10n = _localizations(tester);

    expect(await _currentReading(tester), '14892');
    expect(find.text(l10n.readingsVoiceMultipleNumbersDetected), findsOneWidget);
  });

  testWidgets('user can edit a voice parsed reading in confirmation card', (
    tester,
  ) async {
    await _openVoiceInput(tester, const Locale('en', 'US'));
    await _startRecognition(tester);
    await _sendFinalResult('reading 321.5');
    await tester.pump();

    final editor = find.byKey(const ValueKey('reading-current-value'));
    await tester.ensureVisible(editor);
    await tester.enterText(editor, '322.25');
    await tester.pump();
    expect(await _currentReading(tester), '322.25');
  });

  testWidgets('switching away cancels voice and reentry starts with empty transcript', (
    tester,
  ) async {
    await _openVoiceInput(tester, const Locale('en', 'US'));
    await _startRecognition(tester);
    await _sendFinalResult('reading 321');
    await tester.pump();
    await _selectMethod(tester, _localizations(tester).readingsMethodManual);
    await tester.pump();

    expect(calls.any((call) => call.method == 'cancel'), isTrue);
    await _selectMethod(tester, _localizations(tester).readingsMethodVoice);
    await tester.pump(const Duration(milliseconds: 100));
    final l10n = _localizations(tester);
    expect(find.text(l10n.readingsVoiceWaitingForText), findsOneWidget);
    expect(await _currentReading(tester), '321');
  });
}

Future<void> _openVoiceInput(WidgetTester tester, Locale locale) async {
  tester.view.physicalSize = const Size(800, 1200);
  tester.view.devicePixelRatio = 1;
  addTearDown(tester.view.resetPhysicalSize);
  addTearDown(tester.view.resetDevicePixelRatio);
  await tester.pumpWidget(
    MaterialApp(
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
      locale: locale,
      home: const ReadingsScreen(),
    ),
  );
  await tester.pump();
  await _selectMethod(tester, _localizations(tester).readingsMethodVoice);
  await tester.pump(const Duration(milliseconds: 100));
}

Future<void> _selectMethod(WidgetTester tester, String label) async {
  final option = find.text(label).first;
  await tester.ensureVisible(option);
  await tester.tap(option);
  await tester.pump();
}

Future<void> _startRecognition(WidgetTester tester) async {
  final action = find.byKey(const ValueKey('reading-voice-action'));
  await tester.ensureVisible(action);
  await tester.tap(action);
  await tester.pump();
}

Future<String> _currentReading(WidgetTester tester) async {
  final editor = find.byKey(const ValueKey('reading-current-value'));
  await tester.ensureVisible(editor);
  return tester.widget<TextField>(editor).controller!.text;
}

AppLocalizations _localizations(WidgetTester tester) =>
    AppLocalizations.of(tester.element(find.byType(ReadingsScreen)))!;

Future<void> _sendFinalResult(String words) => _sendResult(words, resultType: 2);

Future<void> _sendPartialResult(String words) => _sendResult(words);

Future<void> _sendResult(String words, {int resultType = 0}) {
  final data = _codec.encodeMethodCall(
    MethodCall('textRecognition', _resultJson(words, resultType: resultType)),
  );
  return TestDefaultBinaryMessengerBinding.instance.defaultBinaryMessenger.handlePlatformMessage(
    _speechChannel.name,
    data,
    (_) {},
  );
}

String _resultJson(String words, {required int resultType}) => jsonEncode({
  'alternates': [
    {
      'recognizedWords': words,
      'recognizedPhrases': null,
      'confidence': -1.0,
    },
  ],
  'resultType': resultType,
});
