import 'dart:convert';

import 'package:electricity_consumption_calculator/features/readings/services/reading_speech_service.dart';
import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:speech_to_text/speech_to_text.dart';

const _speechChannel = MethodChannel('plugin.csdcorp.com/speech_to_text');
const _codec = StandardMethodCodec();

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();
  final messenger = TestDefaultBinaryMessengerBinding.instance.defaultBinaryMessenger;

  tearDown(() {
    messenger.setMockMethodCallHandler(_speechChannel, null);
  });

  test('initializes and exposes the locales reported by the device', () async {
    _mockPlatform(messenger);
    final service = ReadingSpeechService(
      speechToText: SpeechToText.withMethodChannel(),
    );

    expect(await service.initialize(), isTrue);
    expect(service.isAvailable, isTrue);
    expect(
      service.availableLocales.map((locale) => locale.localeId),
      containsAll(['ar-EG', 'en-US']),
    );
  });

  test('reports denied permission and unavailable recognition', () async {
    _mockPlatform(
      messenger,
      initializeResult: false,
      permissionGranted: false,
    );
    final errors = <String>[];
    final service = ReadingSpeechService(
      speechToText: SpeechToText.withMethodChannel(),
    );

    expect(await service.initialize(onError: errors.add), isFalse);
    expect(service.isAvailable, isFalse);
    expect(service.lastErrorMessage, contains('permission was denied'));
    expect(errors, contains(service.lastErrorMessage));
  });

  test('reports unavailable recognition when permission is granted', () async {
    _mockPlatform(
      messenger,
      initializeResult: false,
      permissionGranted: true,
    );
    final service = ReadingSpeechService(
      speechToText: SpeechToText.withMethodChannel(),
    );

    expect(await service.initialize(), isFalse);
    expect(service.isAvailable, isFalse);
    expect(service.lastErrorMessage, contains('unavailable on this device'));
  });

  test('reports platform initialization failures', () async {
    _mockPlatform(
      messenger,
      initializeError: PlatformException(code: 'initialization_failed'),
    );
    final errors = <String>[];
    final service = ReadingSpeechService(
      speechToText: SpeechToText.withMethodChannel(),
    );

    expect(await service.initialize(onError: errors.add), isFalse);
    expect(service.lastErrorMessage, contains('initialization failed'));
    expect(errors, hasLength(1));
  });

  test('prefers Arabic Egypt and US English, then falls back by language', () async {
    _mockPlatform(
      messenger,
      locales: const ['ar-SA:Arabic', 'en-GB:English'],
    );
    final service = ReadingSpeechService(
      speechToText: SpeechToText.withMethodChannel(),
    );
    await service.initialize();

    expect(service.resolveLocaleId('ar-EG'), 'ar-SA');
    expect(service.resolveLocaleId('en-US'), 'en-GB');
    expect(service.resolveLocaleId('fr-FR'), isNull);
  });

  test('forwards partial and final results and reports listening status', () async {
    _mockPlatform(messenger);
    final service = ReadingSpeechService(
      speechToText: SpeechToText.withMethodChannel(),
    );
    final results = <(String, bool)>[];
    final listeningChanges = <bool>[];
    await service.initialize(
      onStatusChanged: listeningChanges.add,
    );

    await service.startListening(
      localeId: 'ar-EG',
      onResult: (text, isFinal) => results.add((text, isFinal)),
    );
    await _sendPlatformCallback('notifyStatus', 'listening');
    await _sendPlatformCallback(
      'textRecognition',
      _recognitionResultJson('١٢٣٤', resultType: 0),
    );
    await _sendPlatformCallback(
      'textRecognition',
      _recognitionResultJson('١٢٣٤', resultType: 2),
    );

    expect(service.isListening, isTrue);
    expect(listeningChanges, [true]);
    expect(results, [('١٢٣٤', false), ('١٢٣٤', true)]);
  });

  test('starts with supported locale and supports stop and cancel', () async {
    final calls = <MethodCall>[];
    _mockPlatform(messenger, onCall: calls.add);
    final service = ReadingSpeechService(
      speechToText: SpeechToText.withMethodChannel(),
    );
    await service.initialize();

    Future<void> start() => service.startListening(
      localeId: 'ar-EG',
      onResult: (text, isFinal) {},
    );

    await start();
    expect(calls.last.method, 'listen');
    expect(calls.last.arguments['localeId'], 'ar-EG');
    await service.stopListening();
    expect(calls.any((call) => call.method == 'stop'), isTrue);

    // Starting again clears the plugin's stop-result timeout before cancel.
    await start();
    await service.cancelListening();
    expect(calls.any((call) => call.method == 'cancel'), isTrue);
  });

  test('reports recognition errors and listen failures', () async {
    var failListening = false;
    _mockPlatform(
      messenger,
      onCall: (call) {
        if (failListening && call.method == 'listen') {
          throw PlatformException(code: 'recognition_failed');
        }
      },
    );
    final errors = <String>[];
    final service = ReadingSpeechService(
      speechToText: SpeechToText.withMethodChannel(),
    );
    await service.initialize(onError: errors.add);

    await _sendPlatformCallback(
      'notifyError',
      jsonEncode({'errorMsg': 'error_network', 'permanent': false}),
    );
    expect(service.lastErrorMessage, 'error_network');

    failListening = true;
    await service.startListening(onResult: (text, isFinal) {});
    expect(service.lastErrorMessage, contains('Could not start'));
    expect(errors, hasLength(2));
  });
}

void _mockPlatform(
  TestDefaultBinaryMessenger messenger, {
  bool initializeResult = true,
  bool permissionGranted = true,
  List<String> locales = const ['ar-EG:Arabic (Egypt)', 'en-US:English'],
  Object? initializeError,
  void Function(MethodCall call)? onCall,
}) {
  messenger.setMockMethodCallHandler(_speechChannel, (call) async {
    onCall?.call(call);
    switch (call.method) {
      case 'initialize':
        if (initializeError != null) throw initializeError;
        return initializeResult;
      case 'has_permission':
        return permissionGranted;
      case 'locales':
        return locales;
      case 'listen':
        return true;
      case 'stop':
      case 'cancel':
        return null;
      default:
        throw MissingPluginException('Unexpected speech method ${call.method}');
    }
  });
}

Future<void> _sendPlatformCallback(String method, String arguments) {
  final data = _codec.encodeMethodCall(MethodCall(method, arguments));
  return TestDefaultBinaryMessengerBinding.instance.defaultBinaryMessenger.handlePlatformMessage(
    _speechChannel.name,
    data,
    (_) {},
  );
}

String _recognitionResultJson(String words, {required int resultType}) => jsonEncode({
  'alternates': [
    {
      'recognizedWords': words,
      'recognizedPhrases': null,
      'confidence': -1.0,
    },
  ],
  'resultType': resultType,
});
