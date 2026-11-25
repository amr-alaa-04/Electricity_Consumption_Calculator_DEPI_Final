import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../core/theme/app_colors.dart';
import '../../../core/theme/app_shape_tokens.dart';
import '../../../core/theme/app_typography.dart';
import '../../../core/widgets/buttons/app_button.dart';
import '../../../l10n/generated/app_localizations.dart';
import '../data/onboarding_demo_data.dart';
import 'inline_icon_label.dart';
import 'onboarding_scanner_corners.dart';
import 'onboarding_status_dot.dart';
import 'onboarding_step_indicator.dart';

class OnboardingTrackElectricityScreen extends StatelessWidget {
  const OnboardingTrackElectricityScreen({super.key});

  static const _contentMaxWidth = 448.0;

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;

    return Scaffold(
      backgroundColor: AppColors.background,
      body: SafeArea(
        child: Column(
          children: [
            _buildHeader(context, l10n),
            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.symmetric(
                  horizontal: AppSpacing.marginMobile,
                  vertical: AppSpacing.small,
                ),
                child: Center(
                  child: ConstrainedBox(
                    constraints: const BoxConstraints(
                      maxWidth: _contentMaxWidth,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        _buildMeterIllustration(context, l10n),
                        const SizedBox(height: AppSpacing.large),
                        Text(
                          l10n.onboardingTrackTitle,
                          textAlign: TextAlign.start,
                          style: AppTypography.headlineLargeMobile.copyWith(
                            color: AppColors.primary,
                          ),
                        ),
                        const SizedBox(height: AppSpacing.small),
                        Text(
                          l10n.onboardingTrackDescription,
                          textAlign: TextAlign.start,
                          style: AppTypography.textTheme.bodyMedium?.copyWith(
                            color: AppColors.onSurfaceVariant,
                            height: 1.55,
                          ),
                        ),
                        const SizedBox(height: AppSpacing.medium),
                        _buildFeatureCards(l10n),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            _buildFooter(context, l10n),
          ],
        ),
      ),
    );
  }

  Widget _buildHeader(BuildContext context, AppLocalizations l10n) {
    return Center(
      child: ConstrainedBox(
        constraints: const BoxConstraints(maxWidth: _contentMaxWidth),
        child: Padding(
          padding: const EdgeInsets.fromLTRB(
            AppSpacing.marginMobile,
            AppSpacing.medium,
            AppSpacing.marginMobile,
            AppSpacing.small,
          ),
          child: Row(
            children: [
              Container(
                width: 36,
                height: 36,
                decoration: BoxDecoration(
                  color: AppColors.surfaceContainerHighest,
                  borderRadius: const BorderRadius.all(AppShapeTokens.medium),
                  border: Border.all(
                    color: AppColors.outlineVariant.withValues(alpha: 0.3),
                  ),
                ),
                child: const Icon(
                  Icons.bolt,
                  color: AppColors.primaryContainer,
                  size: 21,
                ),
              ),
              const SizedBox(width: AppSpacing.small),
              Expanded(
                child: Text(
                  l10n.appTitle,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: AppTypography.textTheme.headlineSmall?.copyWith(
                    color: AppColors.primary,
                  ),
                ),
              ),
              TextButton(
                key: const ValueKey('onboarding-skip'),
                onPressed: null,
                style: TextButton.styleFrom(
                  minimumSize: const Size(48, 48),
                  padding: const EdgeInsets.symmetric(
                    horizontal: AppSpacing.medium,
                  ),
                  foregroundColor: AppColors.primary,
                  shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(AppShapeTokens.pill),
                  ),
                  textStyle: AppTypography.textTheme.labelMedium?.copyWith(
                    fontWeight: FontWeight.w600,
                  ),
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(l10n.onboardingSkip),
                    const SizedBox(width: AppSpacing.micro),
                    const Icon(Icons.chevron_right, size: 18),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildMeterIllustration(
    BuildContext context,
    AppLocalizations l10n,
  ) {
    final meterLabel = Text(
      l10n.onboardingCurrentMeter,
      maxLines: 2,
      overflow: TextOverflow.ellipsis,
      style: AppTypography.textTheme.labelMedium?.copyWith(
        color: AppColors.onSurfaceVariant,
      ),
    );
    final meterReading = FittedBox(
      fit: BoxFit.scaleDown,
      alignment: AlignmentDirectional.centerEnd,
      child: Directionality(
        textDirection: TextDirection.ltr,
        child: Row(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.baseline,
          textBaseline: TextBaseline.alphabetic,
          children: [
            Text(
              OnboardingDemoData.meterReading,
              style: AppTypography.currencyDisplayMobile.copyWith(
                color: AppColors.primary,
              ),
            ),
            const SizedBox(width: AppSpacing.micro),
            Text(
              'kWh',
              style: AppTypography.textTheme.labelSmall?.copyWith(
                color: AppColors.onSurfaceVariant,
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        ),
      ),
    );

    return Container(
      padding: const EdgeInsets.all(AppSpacing.medium),
      decoration: BoxDecoration(
        color: AppColors.surfaceContainerLowest,
        borderRadius: const BorderRadius.all(AppShapeTokens.large),
        border: Border.all(
          color: AppColors.outlineVariant.withValues(alpha: 0.3),
        ),
        boxShadow: [
          BoxShadow(
            color: AppColors.primary.withValues(alpha: 0.08),
            blurRadius: 16,
            offset: const Offset(0, 6),
          ),
        ],
      ),
      child: Column(
        children: [
          Row(
            children: [
              Expanded(
                child: Row(
                  children: [
                    const OnboardingStatusDot(),
                    const SizedBox(width: AppSpacing.small),
                    Flexible(
                      child: Text(
                        l10n.onboardingOcrStatus,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: AppTypography.textTheme.labelSmall?.copyWith(
                          color: AppColors.onSurfaceVariant,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(width: AppSpacing.small),
              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: AppSpacing.small,
                  vertical: AppSpacing.micro,
                ),
                decoration: BoxDecoration(
                  color: AppColors.surfaceContainerLow,
                  borderRadius: const BorderRadius.all(AppShapeTokens.pill),
                  border: Border.all(color: AppColors.primaryFixed),
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const Icon(
                      Icons.verified,
                      color: AppColors.secondary,
                      size: 16,
                    ),
                    const SizedBox(width: AppSpacing.micro),
                    Text(
                      l10n.onboardingAccuracy,
                      style: AppTypography.textTheme.labelSmall?.copyWith(
                        color: AppColors.secondary,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          const Padding(
            padding: EdgeInsets.symmetric(vertical: AppSpacing.small),
            child: Divider(height: 1, color: AppColors.outlineVariant),
          ),
          Container(
            padding: const EdgeInsets.all(AppSpacing.medium),
            decoration: BoxDecoration(
              color: AppColors.surfaceContainerLow.withValues(alpha: 0.7),
              borderRadius: const BorderRadius.all(AppShapeTokens.medium),
              border: Border.all(
                color: AppColors.outlineVariant.withValues(alpha: 0.6),
              ),
            ),
            child: Stack(
              children: [
                const Positioned.fill(child: OnboardingScannerCorners()),
                Column(
                  children: [
                    Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: AppSpacing.small,
                        vertical: AppSpacing.medium,
                      ),
                      decoration: BoxDecoration(
                        color: AppColors.surfaceContainerLowest,
                        borderRadius: const BorderRadius.all(
                          AppShapeTokens.standard,
                        ),
                        border: Border.all(
                          color: AppColors.outlineVariant.withValues(
                            alpha: 0.4,
                          ),
                        ),
                      ),
                      child: LayoutBuilder(
                        builder: (context, constraints) {
                          if (constraints.maxWidth < 280) {
                            return Column(
                              crossAxisAlignment: CrossAxisAlignment.stretch,
                              children: [
                                Row(
                                  children: [
                                    const Icon(
                                      Icons.speed,
                                      color: AppColors.primary,
                                      size: 22,
                                    ),
                                    const SizedBox(width: AppSpacing.small),
                                    Expanded(child: meterLabel),
                                  ],
                                ),
                                const SizedBox(height: AppSpacing.small),
                                Align(
                                  alignment: AlignmentDirectional.centerEnd,
                                  child: meterReading,
                                ),
                              ],
                            );
                          }

                          return Row(
                            children: [
                              const Icon(
                                Icons.speed,
                                color: AppColors.primary,
                                size: 22,
                              ),
                              const SizedBox(width: AppSpacing.small),
                              Expanded(child: meterLabel),
                              const SizedBox(width: AppSpacing.small),
                              meterReading,
                            ],
                          );
                        },
                      ),
                    ),
                    const SizedBox(height: AppSpacing.medium),
                    Row(
                      children: [
                        Expanded(
                          child: InlineIconLabel(
                            icon: Icons.photo_camera_outlined,
                            label: l10n.onboardingAutoRecognition,
                            color: AppColors.onSurfaceVariant,
                          ),
                        ),
                        const SizedBox(width: AppSpacing.small),
                        InlineIconLabel(
                          icon: Icons.check_circle,
                          label: l10n.onboardingCaptured,
                          color: AppColors.secondary,
                        ),
                      ],
                    ),
                  ],
                ),
                Positioned(
                  top: AppSpacing.large,
                  left: AppSpacing.micro,
                  right: AppSpacing.micro,
                  child: ExcludeSemantics(
                    child: Container(
                      height: 2,
                      decoration: BoxDecoration(
                        gradient: const LinearGradient(
                          colors: [
                            Colors.transparent,
                            AppColors.secondary,
                            Colors.transparent,
                          ],
                        ),
                        boxShadow: [
                          BoxShadow(
                            color: AppColors.secondary.withValues(alpha: 0.5),
                            blurRadius: 8,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: AppSpacing.small),
          Container(
            padding: const EdgeInsets.all(AppSpacing.small),
            decoration: const BoxDecoration(
              color: AppColors.primaryContainer,
              borderRadius: BorderRadius.all(AppShapeTokens.medium),
            ),
            child: Row(
              children: [
                Container(
                  width: 32,
                  height: 32,
                  decoration: BoxDecoration(
                    color: AppColors.surfaceContainerLowest.withValues(
                      alpha: 0.15,
                    ),
                    borderRadius: const BorderRadius.all(
                      AppShapeTokens.standard,
                    ),
                  ),
                  child: const Icon(
                    Icons.equalizer,
                    color: AppColors.secondaryContainer,
                    size: 19,
                  ),
                ),
                const SizedBox(width: AppSpacing.small),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        l10n.onboardingTierInstant,
                        style: AppTypography.textTheme.labelSmall?.copyWith(
                          color: AppColors.onPrimaryContainer,
                        ),
                      ),
                      Text(
                      l10n.onboardingTierExampleTemplate(
                        OnboardingDemoData.exampleTierLimitKwh,
                      ),
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: AppTypography.textTheme.labelMedium?.copyWith(
                          color: AppColors.onPrimary,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      const SizedBox(height: AppSpacing.micro),
                      Text(
                        l10n.onboardingSampleTariffDisclaimer,
                        maxLines: 3,
                        overflow: TextOverflow.ellipsis,
                        style: AppTypography.textTheme.labelSmall?.copyWith(
                          color: AppColors.onPrimaryContainer,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(width: AppSpacing.small),
                const Icon(
                  Icons.trending_up,
                  color: AppColors.secondaryContainer,
                  size: 22,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildFeatureCards(AppLocalizations l10n) {
    final features = [
      (
        Icons.document_scanner_outlined,
        l10n.onboardingCameraFeatureTitle,
        l10n.onboardingCameraFeatureDescription,
      ),
      (
        Icons.mic_none,
        l10n.onboardingVoiceFeatureTitle,
        l10n.onboardingVoiceFeatureDescription,
      ),
      (
        Icons.shield_outlined,
        l10n.onboardingAlertFeatureTitle,
        l10n.onboardingAlertFeatureDescription,
      ),
    ];

    return Column(
      children: [
        for (final (icon, title, description) in features) ...[
          Container(
            margin: const EdgeInsets.only(bottom: AppSpacing.small),
            padding: const EdgeInsets.all(AppSpacing.small),
            decoration: BoxDecoration(
              color: AppColors.surfaceContainerLowest,
              borderRadius: const BorderRadius.all(AppShapeTokens.medium),
              border: Border.all(
                color: AppColors.outlineVariant.withValues(alpha: 0.3),
              ),
              boxShadow: [
                BoxShadow(
                  color: AppColors.primary.withValues(alpha: 0.04),
                  blurRadius: 8,
                  offset: const Offset(0, 2),
                ),
              ],
            ),
            child: Row(
              children: [
                Container(
                  width: 40,
                  height: 40,
                  decoration: BoxDecoration(
                    color: AppColors.secondaryContainer.withValues(
                      alpha: 0.4,
                    ),
                    borderRadius: const BorderRadius.all(
                      AppShapeTokens.standard,
                    ),
                  ),
                  child: Icon(icon, color: AppColors.secondary, size: 22),
                ),
                const SizedBox(width: AppSpacing.small),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        title,
                        style: AppTypography.textTheme.labelMedium?.copyWith(
                          color: AppColors.onSurface,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      const SizedBox(height: AppSpacing.micro),
                      Text(
                        description,
                        style: AppTypography.textTheme.labelSmall?.copyWith(
                          color: AppColors.onSurfaceVariant,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ],
    );
  }

  Widget _buildFooter(BuildContext context, AppLocalizations l10n) {
    return Center(
      child: ConstrainedBox(
        constraints: const BoxConstraints(maxWidth: _contentMaxWidth),
        child: Padding(
          padding: const EdgeInsets.fromLTRB(
            AppSpacing.marginMobile,
            AppSpacing.small,
            AppSpacing.marginMobile,
            AppSpacing.large,
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Row(
                children: [
                  Expanded(
                    child: Text(
                      l10n.onboardingStepCount(1, 4),
                      style: AppTypography.textTheme.labelSmall?.copyWith(
                        color: AppColors.onSurfaceVariant,
                      ),
                    ),
                  ),
                  ExcludeSemantics(
                    child: Row(
                      children: [
                        for (var index = 0; index < 4; index++) ...[
                          if (index > 0) const SizedBox(width: AppSpacing.small),
                          OnboardingStepIndicator(active: index == 0),
                        ],
                      ],
                    ),
                  ),
                  Expanded(
                    child: Text(
                      l10n.onboardingAccuracyLabel,
                      textAlign: TextAlign.end,
                      style: AppTypography.textTheme.labelSmall?.copyWith(
                        color: AppColors.secondary,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: AppSpacing.medium),
              AppButton(
                key: const ValueKey('onboarding-next'),
                expand: true,
                onPressed: () => context.go('/onboarding/calculate-your-bill'),
                trailingIcon: const Icon(Icons.arrow_forward, size: 22),
                style: FilledButton.styleFrom(
                  minimumSize: const Size(0, 64),
                  padding: const EdgeInsets.symmetric(
                    horizontal: AppSpacing.medium,
                  ),
                  backgroundColor: AppColors.primaryContainer,
                  foregroundColor: AppColors.onPrimary,
                  shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(AppShapeTokens.large),
                  ),
                  elevation: 4,
                  shadowColor: AppColors.primary.withValues(alpha: 0.18),
                  textStyle: AppTypography.textTheme.headlineSmall?.copyWith(
                    fontWeight: FontWeight.w600,
                  ),
                ),
                child: Text(l10n.onboardingNext),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
