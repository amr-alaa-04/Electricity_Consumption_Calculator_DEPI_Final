import 'package:speech_to_text/speech_recognition_error.dart';
import 'package:speech_to_text/speech_recognition_result.dart';
import 'package:speech_to_text/speech_to_text.dart';

typedef ReadingSpeechResultCallback =
    void Function(
      String recognizedText,
      bool isFinal,
    );
typedef ReadingSpeechErrorCallback = void Function(String message);
typedef ReadingSpeechStatusCallback = void Function(bool isListening);

/// Wraps the device speech recognizer for short meter-reading dictations.
///
/// Call [initialize] before starting recognition. An unavailable requested
/// locale falls back to another installed locale for that language, then to
/// the device's default locale when no matching locale is installed.
class ReadingSpeechService {
  ReadingSpeechService({SpeechToText? speechToText}) : _speech = speechToText ?? SpeechToText();

  final SpeechToText _speech;

  List<LocaleName> _availableLocales = const [];
  bool _isAvailable = false;
  String? _lastErrorMessage;
  ReadingSpeechErrorCallback? _onError;
  ReadingSpeechStatusCallback? _onStatusChanged;

  bool get isAvailable => _isAvailable;

  bool get isListening => _speech.isListening;

  List<LocaleName> get availableLocales => _availableLocales;

  String? get lastErrorMessage => _lastErrorMessage;

  /// Initializes the platform recognizer and loads locales reported by it.
  /// Returns false for permission denial, unavailable recognition services,
  /// or initialization errors. Locale-list failures are reported but do not
  /// disable a recognizer that initialized successfully.
  Future<bool> initialize({
    ReadingSpeechErrorCallback? onError,
    ReadingSpeechStatusCallback? onStatusChanged,
  }) async {
    _onError = onError;
    _onStatusChanged = onStatusChanged;
    _lastErrorMessage = null;

    try {
      _isAvailable = await _speech.initialize(
        onError: _handleSpeechError,
        onStatus: _handleSpeechStatus,
        options: [SpeechToText.androidNoBluetooth],
      );
    } catch (error) {
      _isAvailable = false;
      _reportError('Speech recognition initialization failed: $error');
      return false;
    }

    if (!_isAvailable) {
      bool? permissionGranted;
      try {
        permissionGranted = await _speech.hasPermission;
      } catch (_) {
        // Keep the initialization failure message when permission inspection
        // itself is unavailable on this platform.
      }

      if (_lastErrorMessage == null) {
        _reportError(
          permissionGranted == false
              ? 'Speech recognition permission was denied.'
              : 'Speech recognition is unavailable on this device.',
        );
      }
      return false;
    }

    try {
      _availableLocales = List.unmodifiable(await _speech.locales());
    } catch (error) {
      _availableLocales = const [];
      _reportError('Could not load speech recognition locales: $error');
    }

    return true;
  }

  /// Checks the current microphone/speech permission without prompting.
  Future<bool> checkPermission() async {
    try {
      return await _speech.hasPermission;
    } catch (error) {
      _reportError('Could not check speech recognition permission: $error');
      return false;
    }
  }

  /// Resolves a requested BCP-47 locale to a locale installed on the device.
  ///
  /// Exact matches are preferred. Arabic defaults to `ar-EG` and English to
  /// `en-US` when available; another locale for the same language is used as
  /// a fallback. A null result means the caller should use the system locale.
  String? resolveLocaleId(String requestedLocaleId) {
    final requested = _normalizeLocaleId(requestedLocaleId);
    final language = requested.split('-').first;

    final exactMatch = _findLocale(requested);
    if (exactMatch != null && requested.contains('-')) {
      return exactMatch.localeId;
    }

    final preferredLocale = switch (language) {
      'ar' => 'ar-eg',
      'en' => 'en-us',
      _ => null,
    };
    if (preferredLocale != null) {
      final preferredMatch = _findLocale(preferredLocale);
      if (preferredMatch != null) return preferredMatch.localeId;
    }

    if (exactMatch != null) return exactMatch.localeId;

    for (final locale in _availableLocales) {
      if (_normalizeLocaleId(locale.localeId).split('-').first == language) {
        return locale.localeId;
      }
    }
    return null;
  }

  /// Starts recognition and forwards partial and final transcripts.
  ///
  /// Reports an error if the recognizer is not initialized or the platform
  /// throws while starting. Use [isListening] or [onStatusChanged] to observe
  /// the platform's actual listening state.
  Future<void> startListening({
    required ReadingSpeechResultCallback onResult,
    String? localeId,
  }) async {
    if (!_isAvailable) {
      _reportError('Speech recognition has not been initialized.');
      return;
    }

    try {
      await _speech.listen(
        onResult: (SpeechRecognitionResult result) {
          onResult(result.recognizedWords, result.finalResult);
        },
        listenOptions: SpeechListenOptions(
          localeId: localeId == null ? null : resolveLocaleId(localeId),
          partialResults: true,
          cancelOnError: true,
        ),
      );
    } catch (error) {
      _reportError('Could not start speech recognition: $error');
    }
  }

  Future<void> stopListening() async {
    if (!_isAvailable) return;
    try {
      await _speech.stop();
    } catch (error) {
      _reportError('Could not stop speech recognition: $error');
    }
  }

  Future<void> cancelListening() async {
    if (!_isAvailable) return;
    try {
      await _speech.cancel();
    } catch (error) {
      _reportError('Could not cancel speech recognition: $error');
    }
  }

  /// Ends any active recognition session when the service owner is disposed.
  Future<void> dispose() async {
    _onError = null;
    _onStatusChanged = null;
    await cancelListening();
  }

  LocaleName? _findLocale(String normalizedLocaleId) {
    for (final locale in _availableLocales) {
      if (_normalizeLocaleId(locale.localeId) == normalizedLocaleId) {
        return locale;
      }
    }
    return null;
  }

  String _normalizeLocaleId(String localeId) => localeId.replaceAll('_', '-').toLowerCase();

  void _handleSpeechStatus(String status) {
    _onStatusChanged?.call(status == SpeechToText.listeningStatus);
  }

  void _handleSpeechError(SpeechRecognitionError error) {
    _reportError(error.errorMsg);
  }

  void _reportError(String message) {
    _lastErrorMessage = message;
    _onError?.call(message);
  }
}
