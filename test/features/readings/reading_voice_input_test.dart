import 'dart:convert';

import 'package:electricity_consumption_calculator/features/readings/presentation/readings_screen.dart';
import 'package:electricity_consumption_calculator/features/readings/presentation/widgets/reading_voice_input.dart';
import 'package:electricity_consumption_calculator/features/readings/services/reading_speech_service.dart';
import 'package:electricity_consumption_calculator/l10n/generated/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:speech_to_text/speech_to_text.dart';

const _speechChannel = MethodChannel('plugin.csdcorp.com/speech_to_text');
const _codec = StandardMethodCodec();

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();
  final messenger = TestDefaultBinaryMessengerBinding.instance.defaultBinaryMessenger;

  late List<MethodCall> calls;
  late List<String> locales;
  late bool initializeResult;
  late bool permissionGranted;
  late bool failListening;

  setUp(() {
    calls = [];
    locales = const ['ar-EG:Arabic (Egypt)', 'en-US:English'];
    initializeResult = true;
    permissionGranted = true;
    failListening = false;

    messenger.setMockMethodCallHandler(_speechChannel, (call) async {
      calls.add(call);
      switch (call.method) {
        case 'initialize':
          return initializeResult;
        case 'has_permission':
          return permissionGranted;
        case 'locales':
          return locales;
        case 'listen':
          if (failListening) {
            throw PlatformException(code: 'recognition_failed');
          }
          return true;
        case 'stop':
        case 'cancel':
          return null;
        default:
          throw MissingPluginException('Unexpected method ${call.method}');
      }
    });
  });

  tearDown(() {
    messenger.setMockMethodCallHandler(_speechChannel, null);
  });

  testWidgets('Readings screen only shows voice input when Voice is selected', (
    tester,
  ) async {
    await tester.pumpWidget(_readingsApp());
    await tester.pump(const Duration(milliseconds: 500));

    expect(find.byType(ReadingVoiceInput), findsNothing);
    expect(find.byKey(const ValueKey('reading-voice-input-invitation')), findsOneWidget);

    final invitationMic = find.descendant(
      of: find.byKey(const ValueKey('reading-voice-input-invitation')),
      matching: find.byType(IconButton),
    );
    await tester.ensureVisible(invitationMic);
    await tester.pump(const Duration(milliseconds: 100));
    await tester.tap(invitationMic);
    await tester.pump();
    await tester.pump(const Duration(milliseconds: 100));

    expect(find.byType(ReadingVoiceInput), findsOneWidget);
    expect(find.byKey(const ValueKey('reading-voice-input-invitation')), findsNothing);

    final manualOption = find.text('Manual').first;
    await tester.ensureVisible(manualOption);
    await tester.pump(const Duration(milliseconds: 100));
    await tester.tap(manualOption);
    await tester.pump();
    expect(find.byType(ReadingVoiceInput), findsNothing);
    expect(find.byKey(const ValueKey('reading-voice-input-invitation')), findsOneWidget);
  });

  testWidgets('starts and stops listening and displays partial and final text', (
    tester,
  ) async {
    final service = _newService();
    await _pumpVoiceInput(tester, service: service);
    final l10n = _localizations(tester);

    expect(find.text(l10n.readingsVoiceStart), findsOneWidget);
    await tester.tap(find.byKey(const ValueKey('reading-voice-action')));
    await tester.pump();
    expect(calls.any((call) => call.method == 'listen'), isTrue);

    await _sendCallback('notifyStatus', 'listening');
    await tester.pump();
    expect(find.text(l10n.readingsVoiceListening), findsOneWidget);
    expect(find.text(l10n.readingsVoiceStop), findsOneWidget);

    await _sendCallback('textRecognition', _resultJson('meter reading 125'));
    await tester.pump();
    expect(find.text('meter reading 125'), findsOneWidget);

    await _sendCallback(
      'textRecognition',
      _resultJson('meter reading 125.5', resultType: 2),
    );
    await tester.pump();
    expect(find.text('meter reading 125.5'), findsOneWidget);

    await tester.tap(find.byKey(const ValueKey('reading-voice-action')));
    await tester.pump();
    expect(calls.any((call) => call.method == 'stop'), isTrue);
    await _sendCallback('notifyStatus', 'notListening');
    await tester.pump();
    expect(find.text(l10n.readingsVoiceStart), findsOneWidget);
    // speech_to_text waits up to two seconds for its final result after stop.
    await tester.pump(const Duration(seconds: 2));
  });

  testWidgets('allows choosing Arabic or English when both are installed', (
    tester,
  ) async {
    final service = _newService();
    await _pumpVoiceInput(tester, service: service);
    final l10n = _localizations(tester);

    expect(find.byKey(const ValueKey('reading-voice-language-selector')), findsOneWidget);
    await tester.tap(find.text(l10n.readingsVoiceLanguageArabic));
    await tester.pump();

    expect(
      find.text(l10n.readingsVoiceActiveLanguage('Arabic', 'ar-EG')),
      findsOneWidget,
    );
    expect(service.resolveLocaleId('ar-EG'), 'ar-EG');
  });

  testWidgets('fits a narrow Arabic RTL layout', (tester) async {
    tester.view.physicalSize = const Size(320, 720);
    tester.view.devicePixelRatio = 1;
    addTearDown(tester.view.resetPhysicalSize);
    addTearDown(tester.view.resetDevicePixelRatio);
    await _pumpVoiceInput(
      tester,
      service: _newService(),
      locale: const Locale('ar', 'EG'),
    );

    expect(find.byKey(const ValueKey('reading-voice-input')), findsOneWidget);
    expect(find.byKey(const ValueKey('reading-voice-language-selector')), findsOneWidget);
    expect(tester.takeException(), isNull);
  });

  testWidgets('reports a missing requested language and uses the available one', (
    tester,
  ) async {
    locales = const ['en-GB:English'];
    final service = _newService();
    await _pumpVoiceInput(
      tester,
      service: service,
      locale: const Locale('ar', 'EG'),
    );
    final l10n = _localizations(tester);

    expect(
      find.text(
        l10n.readingsVoiceLanguageFallback(
          l10n.readingsVoiceLanguageArabic,
          l10n.readingsVoiceLanguageEnglish,
        ),
      ),
      findsOneWidget,
    );
    expect(
      find.text(
        l10n.readingsVoiceActiveLanguage(
          l10n.readingsVoiceLanguageEnglish,
          'en-GB',
        ),
      ),
      findsOneWidget,
    );
  });

  testWidgets('shows permission denied and unavailable service messages', (
    tester,
  ) async {
    initializeResult = false;
    permissionGranted = false;
    await _pumpVoiceInput(tester, service: _newService());
    var l10n = _localizations(tester);
    expect(find.text(l10n.readingsVoicePermissionDenied), findsOneWidget);

    await tester.pumpWidget(const SizedBox.shrink());
    initializeResult = false;
    permissionGranted = true;
    await _pumpVoiceInput(tester, service: _newService());
    l10n = _localizations(tester);
    expect(find.text(l10n.readingsVoiceUnavailable), findsOneWidget);
  });

  testWidgets('shows unsupported-language and recognition-error states', (
    tester,
  ) async {
    locales = const [];
    await _pumpVoiceInput(tester, service: _newService());
    var l10n = _localizations(tester);
    expect(find.text(l10n.readingsVoiceLanguagesUnsupported), findsOneWidget);

    await tester.pumpWidget(const SizedBox.shrink());
    locales = const ['en-US:English'];
    failListening = true;
    await _pumpVoiceInput(tester, service: _newService());
    l10n = _localizations(tester);
    await tester.tap(find.byKey(const ValueKey('reading-voice-action')));
    await tester.pump();
    expect(find.text(l10n.readingsVoiceError), findsOneWidget);
  });

  testWidgets('cancels its active recognition session when disposed', (
    tester,
  ) async {
    final service = _newService();
    await _pumpVoiceInput(tester, service: service);
    await service.startListening(onResult: (_, _) {});
    await _sendCallback('notifyStatus', 'listening');
    await tester.pump();

    await tester.pumpWidget(const SizedBox.shrink());
    await tester.pump();

    expect(calls.any((call) => call.method == 'cancel'), isTrue);
  });
}

Widget _readingsApp() => MaterialApp(
  localizationsDelegates: AppLocalizations.localizationsDelegates,
  supportedLocales: AppLocalizations.supportedLocales,
  locale: const Locale('en', 'US'),
  home: const ReadingsScreen(),
);

Future<void> _pumpVoiceInput(
  WidgetTester tester, {
  required ReadingSpeechService service,
  Locale locale = const Locale('en', 'US'),
}) async {
  await tester.pumpWidget(
    MaterialApp(
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
      locale: locale,
      home: Scaffold(
        body: Builder(
          builder: (context) => ReadingVoiceInput(
            l10n: AppLocalizations.of(context)!,
            speechService: service,
          ),
        ),
      ),
    ),
  );
  await tester.pump();
  await tester.pump(const Duration(milliseconds: 100));
}

AppLocalizations _localizations(WidgetTester tester) =>
    AppLocalizations.of(tester.element(find.byType(ReadingVoiceInput)))!;

ReadingSpeechService _newService() => ReadingSpeechService(
  speechToText: SpeechToText.withMethodChannel(),
);

Future<void> _sendCallback(String method, String arguments) {
  final data = _codec.encodeMethodCall(MethodCall(method, arguments));
  return TestDefaultBinaryMessengerBinding.instance.defaultBinaryMessenger.handlePlatformMessage(
    _speechChannel.name,
    data,
    (_) {},
  );
}

String _resultJson(String words, {int resultType = 0}) => jsonEncode({
  'alternates': [
    {
      'recognizedWords': words,
      'recognizedPhrases': null,
      'confidence': -1.0,
    },
  ],
  'resultType': resultType,
});
