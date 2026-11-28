import 'dart:async';

import 'package:flutter/material.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_shape_tokens.dart';
import '../../../../core/theme/app_typography.dart';
import '../../../../core/widgets/buttons/app_button.dart';
import '../../../../core/widgets/surfaces/app_surface_card.dart';
import '../../../../l10n/generated/app_localizations.dart';
import '../../services/reading_speech_service.dart';

enum _VoiceLanguage { arabic, english }

enum _VoiceError { permissionDenied, unavailable, recognition }

class ReadingVoiceInput extends StatefulWidget {
  const ReadingVoiceInput({
    required this.l10n,
    this.speechService,
    this.onFinalResult,
    this.onRecognitionStarted,
    this.resultError,
    super.key,
  });

  final AppLocalizations l10n;

  /// Allows the owning feature or a test to provide a configured service.
  /// This widget owns its recognition session and cancels it when removed.
  final ReadingSpeechService? speechService;
  final ValueChanged<String>? onFinalResult;
  final VoidCallback? onRecognitionStarted;
  final String? resultError;

  @override
  State<ReadingVoiceInput> createState() => _ReadingVoiceInputState();
}

class _ReadingVoiceInputState extends State<ReadingVoiceInput> {
  late final ReadingSpeechService _speechService;
  bool _didInitialize = false;
  bool _isInitializing = true;
  bool _isStarting = false;
  bool _isListening = false;
  _VoiceLanguage _requestedLanguage = _VoiceLanguage.english;
  _VoiceLanguage? _selectedLanguage;
  _VoiceLanguage? _fallbackFrom;
  _VoiceError? _error;
  String _recognizedText = '';

  @override
  void initState() {
    super.initState();
    _speechService = widget.speechService ?? ReadingSpeechService();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    if (_didInitialize) return;
    _didInitialize = true;
    _requestedLanguage = Localizations.localeOf(context).languageCode == 'ar'
        ? _VoiceLanguage.arabic
        : _VoiceLanguage.english;
    unawaited(_initializeSpeech());
  }

  @override
  void dispose() {
    unawaited(_speechService.dispose());
    super.dispose();
  }

  Future<void> _initializeSpeech() async {
    final available = await _speechService.initialize(
      onError: _onSpeechError,
      onStatusChanged: _onListeningChanged,
    );
    if (!mounted) {
      await _speechService.dispose();
      return;
    }

    final supportedLanguages = _supportedLanguages;
    setState(() {
      _isInitializing = false;
      if (!available) {
        _error = _errorFor(_speechService.lastErrorMessage, duringInitialization: true);
        _selectedLanguage = null;
        return;
      }

      if (supportedLanguages.isEmpty) {
        _selectedLanguage = null;
        _fallbackFrom = null;
        return;
      }

      if (supportedLanguages.contains(_requestedLanguage)) {
        _selectedLanguage = _requestedLanguage;
      } else {
        _selectedLanguage = supportedLanguages.first;
        _fallbackFrom = _requestedLanguage;
      }
    });
  }

  List<_VoiceLanguage> get _supportedLanguages => [
    if (_speechService.resolveLocaleId('ar-EG') != null) _VoiceLanguage.arabic,
    if (_speechService.resolveLocaleId('en-US') != null) _VoiceLanguage.english,
  ];

  String? get _activeLocaleId {
    final language = _selectedLanguage;
    if (language == null) return null;
    return _speechService.resolveLocaleId(
      language == _VoiceLanguage.arabic ? 'ar-EG' : 'en-US',
    );
  }

  void _onSpeechError(String message) {
    if (!mounted) return;
    setState(() => _error = _errorFor(message));
  }

  void _onListeningChanged(bool isListening) {
    if (!mounted) return;
    setState(() {
      _isListening = isListening;
      if (isListening) _isStarting = false;
    });
  }

  _VoiceError _errorFor(String? message, {bool duringInitialization = false}) {
    final normalizedMessage = message?.toLowerCase() ?? '';
    if (normalizedMessage.contains('permission')) {
      return _VoiceError.permissionDenied;
    }
    return duringInitialization ? _VoiceError.unavailable : _VoiceError.recognition;
  }

  Future<void> _startListening() async {
    setState(() {
      _isStarting = true;
      _error = null;
      _recognizedText = '';
    });
    widget.onRecognitionStarted?.call();

    await _speechService.startListening(
      localeId: _activeLocaleId,
      onResult: (text, isFinal) {
        if (!mounted) return;
        setState(() => _recognizedText = text);
        if (isFinal) widget.onFinalResult?.call(text);
      },
    );

    if (mounted) setState(() => _isStarting = false);
  }

  Future<void> _stopListening() async {
    await _speechService.stopListening();
    if (mounted) setState(() => _isStarting = false);
  }

  void _selectLanguage(_VoiceLanguage language) {
    if (_isListening || _isStarting || language == _selectedLanguage) return;
    setState(() {
      _selectedLanguage = language;
      _fallbackFrom = null;
      _recognizedText = '';
      _error = null;
    });
  }

  void _retryInitialization() {
    setState(() {
      _isInitializing = true;
      _error = null;
      _recognizedText = '';
    });
    unawaited(_initializeSpeech());
  }

  String _languageLabel(_VoiceLanguage language) => language == _VoiceLanguage.arabic
      ? widget.l10n.readingsVoiceLanguageArabic
      : widget.l10n.readingsVoiceLanguageEnglish;

  @override
  Widget build(BuildContext context) {
    final l10n = widget.l10n;
    final supportedLanguages = _supportedLanguages;

    return AppSurfaceCard(
      key: const ValueKey('reading-voice-input'),
      padding: const EdgeInsets.all(AppSpacing.medium),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Icon(Icons.mic_none, color: AppColors.primary, size: 24),
              const SizedBox(width: AppSpacing.small),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      l10n.readingsVoiceTitle,
                      style: AppTypography.textTheme.titleLarge?.copyWith(
                        color: AppColors.primary,
                      ),
                    ),
                    const SizedBox(height: AppSpacing.micro),
                    Text(
                      l10n.readingsVoicePrompt,
                      style: AppTypography.textTheme.bodySmall?.copyWith(
                        color: AppColors.onSurfaceVariant,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: AppSpacing.medium),
          if (_isInitializing) _buildInitializingState(),
          if (!_isInitializing && !_speechService.isAvailable)
            _buildFailureState(_error ?? _VoiceError.unavailable),
          if (!_isInitializing && _speechService.isAvailable && supportedLanguages.isEmpty)
            _buildMessage(
              icon: Icons.language,
              message: l10n.readingsVoiceLanguagesUnsupported,
              isError: true,
            ),
          if (!_isInitializing && _speechService.isAvailable && supportedLanguages.isNotEmpty) ...[
            if (supportedLanguages.length > 1) ...[
              _buildLanguageSelector(supportedLanguages),
              const SizedBox(height: AppSpacing.small),
            ],
            if (_selectedLanguage != null && _activeLocaleId != null)
              _buildActiveLanguage(
                _languageLabel(_selectedLanguage!),
                _activeLocaleId!,
              ),
            if (_fallbackFrom != null && _selectedLanguage != null) ...[
              const SizedBox(height: AppSpacing.small),
              _buildMessage(
                icon: Icons.info_outline,
                message: l10n.readingsVoiceLanguageFallback(
                  _languageLabel(_fallbackFrom!),
                  _languageLabel(_selectedLanguage!),
                ),
              ),
            ],
            if (_isListening) ...[
              const SizedBox(height: AppSpacing.small),
              Semantics(
                liveRegion: true,
                child: Text(
                  l10n.readingsVoiceListening,
                  style: AppTypography.textTheme.bodySmall?.copyWith(
                    color: AppColors.primary,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ],
            if (_error != null) ...[
              const SizedBox(height: AppSpacing.small),
              _buildErrorMessage(_error!),
            ],
            if (widget.resultError != null) ...[
              const SizedBox(height: AppSpacing.small),
              _buildMessage(
                icon: Icons.error_outline,
                message: widget.resultError!,
                isError: true,
              ),
            ],
            const SizedBox(height: AppSpacing.medium),
            AppButton(
              key: const ValueKey('reading-voice-action'),
              expand: true,
              variant: _isListening ? AppButtonVariant.secondary : AppButtonVariant.primary,
              isLoading: _isStarting,
              onPressed: _isStarting
                  ? null
                  : _isListening
                  ? _stopListening
                  : _startListening,
              leadingIcon: Icon(
                _isListening ? Icons.stop_circle_outlined : Icons.mic,
                size: 20,
              ),
              child: Text(_isListening ? l10n.readingsVoiceStop : l10n.readingsVoiceStart),
            ),
            const SizedBox(height: AppSpacing.medium),
            _buildTranscript(),
          ],
        ],
      ),
    );
  }

  Widget _buildInitializingState() => Row(
    children: [
      const SizedBox.square(
        dimension: 20,
        child: CircularProgressIndicator(
          strokeWidth: 2,
          color: AppColors.primary,
        ),
      ),
      const SizedBox(width: AppSpacing.small),
      Expanded(
        child: Text(
          widget.l10n.readingsVoiceInitializing,
          style: AppTypography.textTheme.bodyMedium?.copyWith(
            color: AppColors.onSurfaceVariant,
          ),
        ),
      ),
    ],
  );

  Widget _buildFailureState(_VoiceError error) => Column(
    crossAxisAlignment: CrossAxisAlignment.stretch,
    children: [
      _buildErrorMessage(error),
      const SizedBox(height: AppSpacing.small),
      AppButton(
        key: const ValueKey('reading-voice-retry'),
        variant: AppButtonVariant.text,
        onPressed: _retryInitialization,
        child: Text(widget.l10n.readingsVoiceRetry),
      ),
    ],
  );

  Widget _buildErrorMessage(_VoiceError error) {
    final message = switch (error) {
      _VoiceError.permissionDenied => widget.l10n.readingsVoicePermissionDenied,
      _VoiceError.unavailable => widget.l10n.readingsVoiceUnavailable,
      _VoiceError.recognition => widget.l10n.readingsVoiceError,
    };
    return _buildMessage(
      icon: Icons.error_outline,
      message: message,
      isError: true,
    );
  }

  Widget _buildMessage({
    required IconData icon,
    required String message,
    bool isError = false,
  }) => Container(
    padding: const EdgeInsets.all(AppSpacing.small),
    decoration: BoxDecoration(
      color: isError ? AppColors.errorContainer : AppColors.surfaceContainerLow,
      borderRadius: const BorderRadius.all(AppShapeTokens.medium),
    ),
    child: Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Icon(
          icon,
          size: 18,
          color: isError ? AppColors.error : AppColors.secondary,
        ),
        const SizedBox(width: AppSpacing.small),
        Expanded(
          child: Text(
            message,
            style: AppTypography.textTheme.bodySmall?.copyWith(
              color: isError ? AppColors.error : AppColors.onSurfaceVariant,
            ),
          ),
        ),
      ],
    ),
  );

  Widget _buildLanguageSelector(List<_VoiceLanguage> languages) => Semantics(
    label: widget.l10n.readingsVoiceLanguageSelector,
    child: SegmentedButton<_VoiceLanguage>(
      key: const ValueKey('reading-voice-language-selector'),
      showSelectedIcon: false,
      segments: [
        for (final language in languages)
          ButtonSegment<_VoiceLanguage>(
            value: language,
            label: Text(_languageLabel(language)),
          ),
      ],
      selected: {_selectedLanguage!},
      onSelectionChanged: _isListening || _isStarting
          ? null
          : (selection) => _selectLanguage(selection.first),
      style: ButtonStyle(
        minimumSize: const WidgetStatePropertyAll(Size.fromHeight(44)),
        textStyle: WidgetStatePropertyAll(AppTypography.textTheme.labelMedium),
        foregroundColor: WidgetStateProperty.resolveWith(
          (states) =>
              states.contains(WidgetState.selected) ? AppColors.onPrimary : AppColors.primary,
        ),
        backgroundColor: WidgetStateProperty.resolveWith(
          (states) => states.contains(WidgetState.selected)
              ? AppColors.primary
              : AppColors.surfaceContainerLowest,
        ),
        side: WidgetStatePropertyAll(
          BorderSide(color: AppColors.secondary.withValues(alpha: 0.35)),
        ),
        shape: const WidgetStatePropertyAll(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.all(AppShapeTokens.medium),
          ),
        ),
      ),
    ),
  );

  Widget _buildActiveLanguage(String language, String localeId) => Semantics(
    key: const ValueKey('reading-voice-active-language'),
    liveRegion: true,
    child: Text(
      widget.l10n.readingsVoiceActiveLanguage(language, localeId),
      textAlign: TextAlign.start,
      style: AppTypography.textTheme.labelMedium?.copyWith(
        color: AppColors.onSurfaceVariant,
      ),
    ),
  );

  Widget _buildTranscript() => Column(
    crossAxisAlignment: CrossAxisAlignment.stretch,
    children: [
      Text(
        widget.l10n.readingsVoiceRecognizedText,
        style: AppTypography.textTheme.labelLarge?.copyWith(
          color: AppColors.primary,
        ),
      ),
      const SizedBox(height: AppSpacing.micro),
      Semantics(
        liveRegion: true,
        child: Container(
          key: const ValueKey('reading-voice-transcript'),
          constraints: const BoxConstraints(minHeight: 52),
          width: double.infinity,
          padding: const EdgeInsets.all(AppSpacing.small),
          decoration: BoxDecoration(
            color: AppColors.surfaceContainerLow,
            borderRadius: const BorderRadius.all(AppShapeTokens.medium),
          ),
          alignment: AlignmentDirectional.centerStart,
          child: Text(
            _recognizedText.isEmpty ? widget.l10n.readingsVoiceWaitingForText : _recognizedText,
            style: AppTypography.textTheme.bodyMedium?.copyWith(
              color: _recognizedText.isEmpty ? AppColors.onSurfaceVariant : AppColors.onSurface,
            ),
          ),
        ),
      ),
    ],
  );
}
