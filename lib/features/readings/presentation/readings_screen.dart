import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../core/theme/app_colors.dart';
import '../../../core/theme/app_shape_tokens.dart';
import '../../../core/theme/app_typography.dart';
import '../../../core/widgets/buttons/app_button.dart';
import '../../../core/widgets/navigation/app_bottom_navigation_bar.dart';
import '../../../l10n/generated/app_localizations.dart';
import '../data/readings_demo_data.dart';
import 'widgets/reading_confirmation_card.dart';
import 'widgets/reading_input_methods.dart';
import 'widgets/reading_scanner_viewfinder.dart';
import 'widgets/reading_safety_notice.dart';
import 'widgets/reading_voice_input_invitation.dart';
import 'widgets/readings_header.dart';

class ReadingsScreen extends StatelessWidget {
  const ReadingsScreen({super.key});

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
                        ReadingInputMethods(l10n: l10n),
                        const SizedBox(height: AppSpacing.medium),
                        ReadingScannerViewfinder(
                          l10n: l10n,
                          readingDigits: ReadingsDemoData.detectedReadingDigits,
                          readingFraction: ReadingsDemoData.detectedReadingFraction,
                          accuracyPercent: ReadingsDemoData.ocrAccuracyPercent,
                          ocrVersion: ReadingsDemoData.ocrVersion,
                          onFlashPressed: () {},
                          onRetakePressed: () {},
                        ),
                        const SizedBox(height: AppSpacing.medium),
                        ReadingConfirmationCard(
                          l10n: l10n,
                          initialReading: ReadingsDemoData.confirmedReading,
                          previousReading: ReadingsDemoData.previousReading,
                          consumptionDifference: ReadingsDemoData.consumptionDifference,
                          consumptionTier: ReadingsDemoData.consumptionTier,
                          previousReadingDate: ReadingsDemoData.previousReadingDate,
                          initialRecordedAt: ReadingsDemoData.recordedAt,
                          initialNotes: l10n.readingsSampleNotes,
                        ),
                        const SizedBox(height: AppSpacing.medium),
                        ReadingVoiceInputInvitation(l10n: l10n),
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
