import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../core/theme/app_colors.dart';
import '../../../core/theme/app_shape_tokens.dart';
import '../../../core/theme/app_typography.dart';
import '../../../core/widgets/buttons/app_button.dart';
import '../../../core/widgets/navigation/app_bottom_navigation_bar.dart';
import '../../../l10n/generated/app_localizations.dart';
import '../data/readings_demo_data.dart';
import '../services/reading_number_parser.dart';
import 'widgets/manual_reading_input.dart';
import 'widgets/reading_confirmation_card.dart';
import 'widgets/reading_input_methods.dart';
import 'widgets/reading_scanner_viewfinder.dart';
import 'widgets/reading_safety_notice.dart';
import 'widgets/reading_voice_input_invitation.dart';
import 'widgets/reading_voice_input.dart';
import 'widgets/readings_header.dart';

class ReadingsScreen extends StatefulWidget {
  const ReadingsScreen({super.key});

  @override
  State<ReadingsScreen> createState() => _ReadingsScreenState();
}

class _ReadingsScreenState extends State<ReadingsScreen> {
  ReadingInputMethod _selectedInputMethod = ReadingInputMethod.camera;
  String _acceptedReading = ReadingsDemoData.confirmedReading;
  String? _voiceParsingError;

  void _handleVoiceFinalResult(String transcript, AppLocalizations l10n) {
    final result = const ReadingNumberParser().parse(transcript);
    if (result.succeeded) {
      setState(() {
        _acceptedReading = result.value.toString();
        _voiceParsingError = null;
      });
      return;
    }

    setState(
      () => _voiceParsingError = switch (result.failureReason) {
        ReadingNumberParseFailure.noNumberFound => l10n.readingsVoiceNoNumberDetected,
        ReadingNumberParseFailure.multipleNumbersFound => l10n.readingsVoiceMultipleNumbersDetected,
        ReadingNumberParseFailure.invalidDecimalExpression => l10n.readingsVoiceInvalidDecimal,
        ReadingNumberParseFailure.numberOutOfRange => l10n.readingsVoiceInvalidNumber,
        null => l10n.readingsVoiceInvalidNumber,
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;

    return Scaffold(
      key: const ValueKey('readings-screen'),
      backgroundColor: AppColors.background,
      body: SafeArea(
        bottom: false,
        child: Center(
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 448),
            child: Column(
              children: [
                ReadingsHeader(
                  l10n: l10n,
                  meterNumber: ReadingsDemoData.activeMeterNumber,
                  onBackPressed: () {},
                  onHelpPressed: () {},
                ),
                Expanded(
                  child: SingleChildScrollView(
                    padding: const EdgeInsets.fromLTRB(
                      AppSpacing.medium,
                      AppSpacing.small,
                      AppSpacing.medium,
                      AppSpacing.large,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        ReadingInputMethods(
                          l10n: l10n,
                          selectedMethod: _selectedInputMethod,
                          onMethodSelected: (method) {
                            setState(() {
                              _selectedInputMethod = method;
                              _voiceParsingError = null;
                            });
                          },
                        ),
                        const SizedBox(height: AppSpacing.medium),
                        if (_selectedInputMethod == ReadingInputMethod.manual)
                          ManualReadingInput(
                            key: const ValueKey('manual-reading-input'),
                            l10n: l10n,
                            onReadingConfirmed: (reading) {
                              setState(() => _acceptedReading = reading);
                            },
                          )
                        else if (_selectedInputMethod == ReadingInputMethod.camera)
                          ReadingScannerViewfinder(
                            l10n: l10n,
                            readingDigits: ReadingsDemoData.detectedReadingDigits,
                            readingFraction: ReadingsDemoData.detectedReadingFraction,
                            accuracyPercent: ReadingsDemoData.ocrAccuracyPercent,
                            ocrVersion: ReadingsDemoData.ocrVersion,
                            onFlashPressed: () {},
                            onRetakePressed: () {},
                          )
                        else
                          ReadingVoiceInput(
                            l10n: l10n,
                            resultError: _voiceParsingError,
                            onFinalResult: (transcript) =>
                                _handleVoiceFinalResult(transcript, l10n),
                            onRecognitionStarted: () => setState(
                              () => _voiceParsingError = null,
                            ),
                          ),
                        const SizedBox(height: AppSpacing.medium),
                        ReadingConfirmationCard(
                          l10n: l10n,
                          initialReading: _acceptedReading,
                          previousReading: ReadingsDemoData.previousReading,
                          consumptionDifference: ReadingsDemoData.consumptionDifference,
                          consumptionTier: ReadingsDemoData.consumptionTier,
                          previousReadingDate: ReadingsDemoData.previousReadingDate,
                          initialRecordedAt: ReadingsDemoData.recordedAt,
                          initialNotes: l10n.readingsSampleNotes,
                        ),
                        const SizedBox(height: AppSpacing.medium),
                        if (_selectedInputMethod != ReadingInputMethod.voice)
                          ReadingVoiceInputInvitation(
                            l10n: l10n,
                            onPressed: () => setState(
                              () => _selectedInputMethod = ReadingInputMethod.voice,
                            ),
                          ),
                        const SizedBox(height: AppSpacing.medium),
                        ReadingSafetyNotice(l10n: l10n),
                        const SizedBox(height: AppSpacing.medium),
                        Padding(
                          padding: const EdgeInsets.only(top: AppSpacing.micro),
                          child: AppButton(
                            key: const ValueKey('reading-review-confirm'),
                            expand: true,
                            onPressed: () => ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                content: Text(l10n.readingsConfirmationPreviewMessage),
                              ),
                            ),
                            leadingIcon: const Icon(Icons.task_alt, size: 20),
                            style: FilledButton.styleFrom(
                              minimumSize: const Size(0, 52),
                              padding: const EdgeInsets.symmetric(
                                horizontal: AppSpacing.medium,
                              ),
                              backgroundColor: AppColors.primaryContainer,
                              foregroundColor: AppColors.onPrimary,
                              elevation: 4,
                              shadowColor: AppColors.primary.withValues(alpha: 0.2),
                              shape: const RoundedRectangleBorder(
                                borderRadius: BorderRadius.all(AppShapeTokens.large),
                              ),
                              textStyle: AppTypography.textTheme.headlineSmall?.copyWith(
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            child: Flexible(
                              child: Text(
                                l10n.readingsReviewConfirm,
                                textAlign: TextAlign.center,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: Center(
        heightFactor: 1,
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 448),
          child: AppBottomNavigationBar(
            currentIndex: 1,
            destinations: [
              NavigationDestination(
                icon: const Icon(Icons.home_outlined),
                selectedIcon: const Icon(Icons.home),
                label: l10n.homeNavHome,
              ),
              NavigationDestination(
                icon: const Icon(Icons.speed),
                label: l10n.homeNavReadings,
              ),
              NavigationDestination(
                icon: const Icon(Icons.analytics_outlined),
                label: l10n.homeNavAnalytics,
              ),
              NavigationDestination(
                icon: const Icon(Icons.kitchen_outlined),
                label: l10n.homeNavAppliances,
              ),
              NavigationDestination(
                icon: const Icon(Icons.settings_outlined),
                label: l10n.homeNavSettings,
              ),
            ],
            onDestinationSelected: (index) {
              if (index == 0) context.go('/main-home');
            },
          ),
        ),
      ),
    );
  }
}
