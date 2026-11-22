import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../core/theme/app_colors.dart';
import '../../../core/theme/app_shape_tokens.dart';
import '../../../core/theme/app_typography.dart';
import '../../../core/widgets/buttons/app_button.dart';
import '../../../core/widgets/buttons/app_icon_button.dart';
import '../../../core/widgets/surfaces/app_icon_tile.dart';
import '../../../core/widgets/surfaces/app_surface_card.dart';
import '../../../l10n/generated/app_localizations.dart';
import 'onboarding_step_indicator.dart';

class OnboardingCalculateYourBillScreen extends StatelessWidget {
  const OnboardingCalculateYourBillScreen({super.key});

  static const _contentMaxWidth = 448.0;

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;

    return Scaffold(
      key: const ValueKey('onboarding-calculate-your-bill-screen'),
      backgroundColor: AppColors.background,
      body: Stack(
        children: [
          const Positioned(
            top: -100,
            right: -100,
            child: _AmbientGlow(size: 320, color: AppColors.primaryFixed),
          ),
          const Positioned(
            bottom: 80,
            left: -100,
            child: _AmbientGlow(size: 260, color: AppColors.secondaryFixed),
          ),
          SafeArea(
            child: Column(
              children: [
                _buildHeader(context, l10n),
                Expanded(
                  child: SingleChildScrollView(
                    padding: const EdgeInsets.fromLTRB(
                      AppSpacing.marginMobile,
                      AppSpacing.small,
                      AppSpacing.marginMobile,
                      AppSpacing.medium,
                    ),
                    child: Center(
                      child: ConstrainedBox(
                        constraints: const BoxConstraints(
                          maxWidth: _contentMaxWidth,
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            _buildTariffPreview(l10n),
                            const SizedBox(height: AppSpacing.large),
                            Text(
                              l10n.onboardingBillTitle,
                              textAlign: TextAlign.center,
                              style: AppTypography.headlineLargeMobile.copyWith(
                                color: AppColors.onSurface,
                              ),
                            ),
                            const SizedBox(height: AppSpacing.small),
                            Text(
                              l10n.onboardingBillDescription,
                              textAlign: TextAlign.center,
                              style: AppTypography.textTheme.bodyMedium?.copyWith(
                                color: AppColors.onSurfaceVariant,
                                height: 1.55,
                              ),
                            ),
                            const SizedBox(height: AppSpacing.medium),
                            _buildBenefits(l10n),
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
        ],
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
            AppSpacing.small,
            AppSpacing.marginMobile,
            AppSpacing.small,
          ),
          child: Row(
            children: [
              TextButton(
                key: const ValueKey('onboarding-skip'),
                onPressed: null,
                style: TextButton.styleFrom(
                  minimumSize: const Size(48, 44),
                  foregroundColor: AppColors.primary,
                  textStyle: AppTypography.textTheme.labelLarge,
                ),
                child: Text(l10n.onboardingSkip),
              ),
              const Spacer(),
              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: AppSpacing.small,
                  vertical: AppSpacing.micro,
                ),
                decoration: BoxDecoration(
                  color: AppColors.surfaceContainer,
                  borderRadius: const BorderRadius.all(AppShapeTokens.pill),
                  border: Border.all(
                    color: AppColors.outlineVariant.withValues(alpha: 0.3),
                  ),
                ),
                child: Text(
                  l10n.onboardingStepCount(2, 4),
                  style: AppTypography.textTheme.labelSmall?.copyWith(
                    color: AppColors.primary,
                  ),
                ),
              ),
              const Spacer(),
              AppIconButton(
                key: const ValueKey('onboarding-previous-header'),
                tooltip: l10n.onboardingPrevious,
                onPressed: () => context.go(
                  '/onboarding/track-your-electricity',
                ),
                foregroundColor: AppColors.onSurfaceVariant,
                backgroundColor: AppColors.surfaceContainerHighest.withValues(
                  alpha: 0.45,
                ),
                icon: Transform.flip(
                  flipX: Directionality.of(context) == TextDirection.rtl,
                  child: const Icon(Icons.arrow_back),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTariffPreview(AppLocalizations l10n) {
    return Column(
      children: [
        Transform.translate(
          offset: const Offset(0, 8),
          child: Transform.scale(
            scale: 0.95,
            child: Opacity(
              opacity: 0.82,
              child: AppSurfaceCard(
                padding: const EdgeInsets.symmetric(
                  horizontal: AppSpacing.small,
                  vertical: AppSpacing.small,
                ),
                backgroundColor: AppColors.surfaceContainerHigh,
                borderRadius: const BorderRadius.all(AppShapeTokens.large),
                child: Row(
                  children: [
                    const Icon(Icons.circle, size: 10, color: AppColors.outline),
                    const SizedBox(width: AppSpacing.small),
                    Expanded(
                      child: Text(
                        l10n.onboardingBillTierThree,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: AppTypography.textTheme.bodySmall?.copyWith(
                          color: AppColors.onSurfaceVariant,
                        ),
                      ),
                    ),
                    const SizedBox(width: AppSpacing.small),
                    Text(
                      l10n.onboardingBillTierThreeRate,
                      style: AppTypography.textTheme.bodySmall?.copyWith(
                        color: AppColors.onSurfaceVariant,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
        Transform.translate(
          offset: const Offset(0, -2),
          child: AppSurfaceCard(
            padding: const EdgeInsets.all(AppSpacing.medium),
            backgroundColor: AppColors.primaryContainer,
            borderColor: AppColors.primaryFixed.withValues(alpha: 0.2),
            borderRadius: const BorderRadius.all(AppShapeTokens.large),
            elevation: 2,
            child: Stack(
              children: [
                const Positioned(
                  bottom: -55,
                  right: -44,
                  child: _AmbientGlow(
                    size: 140,
                    color: AppColors.surfaceBright,
                    opacity: 0.1,
                  ),
                ),
                Column(
                  children: [
                    _buildActiveTierHeader(l10n),
                    const SizedBox(height: AppSpacing.medium),
                    _buildMetrics(l10n),
                    const SizedBox(height: AppSpacing.medium),
                    _buildThreshold(l10n),
                  ],
                ),
              ],
            ),
          ),
        ),
        _buildTierChips(l10n),
        const SizedBox(height: AppSpacing.medium),
        Text(
          l10n.onboardingBillIllustrativeDisclaimer,
          textAlign: TextAlign.center,
          style: AppTypography.textTheme.labelSmall?.copyWith(
            color: AppColors.onSurfaceVariant,
          ),
        ),
      ],
    );
  }

  Widget _buildActiveTierHeader(AppLocalizations l10n) {
    return Row(
      children: [
        const AppIconTile(
          icon: Icons.bolt,
          size: 36,
          iconSize: 23,
          backgroundColor: Color(0x26FFFFFF),
          iconColor: AppColors.secondaryFixed,
          borderRadius: BorderRadius.all(AppShapeTokens.medium),
        ),
        const SizedBox(width: AppSpacing.small),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                l10n.onboardingBillTargetTier,
                style: AppTypography.textTheme.labelSmall?.copyWith(
                  color: AppColors.onPrimaryContainer,
                ),
              ),
              Text(
                l10n.onboardingBillTierTwo,
                style: AppTypography.textTheme.headlineSmall?.copyWith(
                  color: AppColors.onPrimary,
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
            color: AppColors.secondaryFixed.withValues(alpha: 0.2),
            borderRadius: const BorderRadius.all(AppShapeTokens.pill),
            border: Border.all(
              color: AppColors.secondaryFixed.withValues(alpha: 0.3),
            ),
          ),
          child: Text(
            l10n.onboardingBillActive,
            style: AppTypography.textTheme.labelSmall?.copyWith(
              color: AppColors.secondaryFixed,
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildMetrics(AppLocalizations l10n) {
    return Container(
      padding: const EdgeInsets.all(AppSpacing.small),
      decoration: BoxDecoration(
        color: AppColors.surfaceContainerLowest.withValues(alpha: 0.1),
        borderRadius: const BorderRadius.all(AppShapeTokens.medium),
        border: Border.all(
          color: AppColors.surfaceContainerLowest.withValues(alpha: 0.1),
        ),
      ),
      child: LayoutBuilder(
        builder: (context, constraints) {
          final amount = _metric(
            context,
            l10n.onboardingBillEstimatedValue,
            l10n.onboardingBillExampleAmount,
            l10n.onboardingBillCurrency,
            prominent: true,
          );
          final usage = _metric(
            context,
            l10n.onboardingBillEquivalentBalance,
            l10n.onboardingBillExampleUsage,
            l10n.onboardingBillUsageUnit,
          );

          if (constraints.maxWidth < 300) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                amount,
                const SizedBox(height: AppSpacing.small),
                usage,
              ],
            );
          }

          return Row(
            children: [
              Expanded(child: amount),
              const SizedBox(width: AppSpacing.small),
              Expanded(child: usage),
            ],
          );
        },
      ),
    );
  }

  Widget _metric(
    BuildContext context,
    String label,
    String value,
    String unit, {
    bool prominent = false,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: AppTypography.textTheme.labelSmall?.copyWith(
            color: AppColors.onPrimaryContainer,
          ),
        ),
        const SizedBox(height: AppSpacing.micro),
        FittedBox(
          fit: BoxFit.scaleDown,
          alignment: AlignmentDirectional.centerStart,
          child: Directionality(
            textDirection: Directionality.of(context),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.baseline,
              textBaseline: TextBaseline.alphabetic,
              children: [
                Text(
                  value,
                  style:
                      (prominent
                              ? AppTypography.currencyDisplayMobile
                              : AppTypography.textTheme.headlineSmall!)
                          .copyWith(
                            color: AppColors.onPrimary,
                            fontWeight: FontWeight.w700,
                          ),
                ),
                const SizedBox(width: AppSpacing.micro),
                Text(
                  unit,
                  style: AppTypography.textTheme.labelSmall?.copyWith(
                    color: AppColors.primaryFixed,
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildThreshold(AppLocalizations l10n) {
    return Column(
      children: [
        Row(
          children: [
            Expanded(
              child: Text(
                l10n.onboardingBillSafetyIndicator,
                style: AppTypography.textTheme.labelSmall?.copyWith(
                  color: AppColors.onPrimaryContainer,
                ),
              ),
            ),
            const SizedBox(width: AppSpacing.small),
            Flexible(
              child: Text(
                l10n.onboardingBillRemainingUsage,
                textAlign: TextAlign.end,
                style: AppTypography.textTheme.labelSmall?.copyWith(
                  color: AppColors.secondaryFixed,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ],
        ),
        const SizedBox(height: AppSpacing.small),
        ClipRRect(
          borderRadius: const BorderRadius.all(AppShapeTokens.pill),
          child: LinearProgressIndicator(
            value: 0.82,
            minHeight: 10,
            backgroundColor: AppColors.surfaceContainerLowest.withValues(
              alpha: 0.2,
            ),
            valueColor: const AlwaysStoppedAnimation(AppColors.secondaryFixed),
          ),
        ),
        const SizedBox(height: AppSpacing.micro),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: _thresholdLabel(l10n.onboardingBillThresholdStart),
            ),
            Expanded(
              child: _thresholdLabel(
                l10n.onboardingBillCapacityPercent,
                color: AppColors.secondaryFixed,
              ),
            ),
            Expanded(
              child: _thresholdLabel(l10n.onboardingBillThresholdEnd),
            ),
          ],
        ),
      ],
    );
  }

  Widget _thresholdLabel(
    String text, {
    Color color = AppColors.onPrimaryContainer,
  }) => Text(
    text,
    textAlign: TextAlign.center,
    style: AppTypography.textTheme.labelSmall?.copyWith(color: color),
  );

  Widget _buildTierChips(AppLocalizations l10n) {
    final tiers = [
      (l10n.onboardingBillTierOneLabel, l10n.onboardingBillTierOneRate),
      (l10n.onboardingBillTierTwoLabel, l10n.onboardingBillTierTwoRate),
      (l10n.onboardingBillTierThreeLabel, l10n.onboardingBillTierThreeShortRate),
      (l10n.onboardingBillTierFourLabel, l10n.onboardingBillTierFourRate),
      (l10n.onboardingBillTierFiveLabel, l10n.onboardingBillTierFiveRate),
    ];

    return Row(
      children: [
        for (var index = 0; index < tiers.length; index++) ...[
          if (index > 0) const SizedBox(width: AppSpacing.micro),
          Expanded(
            child: Container(
              padding: const EdgeInsets.symmetric(
                horizontal: AppSpacing.micro,
                vertical: AppSpacing.small,
              ),
              decoration: BoxDecoration(
                color: index == 1
                    ? AppColors.secondaryContainer.withValues(alpha: 0.5)
                    : AppColors.surfaceContainerHighest.withValues(alpha: 0.7),
                borderRadius: const BorderRadius.all(AppShapeTokens.standard),
                border: Border.all(
                  color: index == 1
                      ? AppColors.secondary.withValues(alpha: 0.3)
                      : AppColors.outlineVariant.withValues(alpha: 0.3),
                ),
              ),
              child: Column(
                children: [
                  Text(
                    tiers[index].$1,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: AppTypography.textTheme.labelSmall?.copyWith(
                      color: index == 1 ? AppColors.primary : AppColors.onSurfaceVariant,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  Text(
                    tiers[index].$2,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: AppTypography.textTheme.labelSmall?.copyWith(
                      color: index == 1 ? AppColors.secondary : AppColors.onSurfaceVariant,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ],
    );
  }

  Widget _buildBenefits(AppLocalizations l10n) {
    final benefits = [
      (
        Icons.receipt_long,
        l10n.onboardingBillFeesTitle,
        l10n.onboardingBillFeesDescription,
      ),
      (
        Icons.speed,
        l10n.onboardingBillProximityTitle,
        l10n.onboardingBillProximityDescription,
      ),
      (
        Icons.lightbulb,
        l10n.onboardingBillSavingsTitle,
        l10n.onboardingBillSavingsDescription,
      ),
    ];

    return Column(
      children: [
        for (final (icon, title, description) in benefits) ...[
          AppSurfaceCard(
            padding: const EdgeInsets.all(AppSpacing.small),
            borderRadius: const BorderRadius.all(AppShapeTokens.medium),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                AppIconTile(
                  icon: icon,
                  size: 32,
                  iconSize: 20,
                  backgroundColor: icon == Icons.speed
                      ? AppColors.secondaryContainer.withValues(alpha: 0.6)
                      : AppColors.surfaceContainerLow,
                  iconColor: icon == Icons.speed ? AppColors.primary : AppColors.secondary,
                  borderRadius: const BorderRadius.all(AppShapeTokens.standard),
                ),
                const SizedBox(width: AppSpacing.small),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        title,
                        style: AppTypography.textTheme.bodyMedium?.copyWith(
                          color: AppColors.onSurface,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      const SizedBox(height: AppSpacing.micro),
                      Text(
                        description,
                        style: AppTypography.textTheme.bodySmall?.copyWith(
                          color: AppColors.onSurfaceVariant,
                          height: 1.4,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          if (description != l10n.onboardingBillSavingsDescription)
            const SizedBox(height: AppSpacing.small),
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
            AppSpacing.medium,
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              ExcludeSemantics(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    for (var index = 0; index < 4; index++) ...[
                      if (index > 0) const SizedBox(width: AppSpacing.small),
                      OnboardingStepIndicator(
                        active: index == 1,
                        activeColor: AppColors.primary,
                      ),
                    ],
                  ],
                ),
              ),
              const SizedBox(height: AppSpacing.medium),
              AppButton(
                key: const ValueKey('onboarding-next'),
                expand: true,
                onPressed: () => context.go('/onboarding/budget-energy-saving'),
                trailingIcon: Transform.flip(
                  flipX: Directionality.of(context) == TextDirection.rtl,
                  child: const Icon(Icons.arrow_forward, size: 20),
                ),
                style: FilledButton.styleFrom(
                  minimumSize: const Size(0, 52),
                  backgroundColor: AppColors.primaryContainer,
                  foregroundColor: AppColors.onPrimary,
                  shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(AppShapeTokens.large),
                  ),
                  textStyle: AppTypography.textTheme.headlineSmall?.copyWith(
                    fontWeight: FontWeight.w600,
                  ),
                ),
                child: Text(l10n.onboardingNext),
              ),
              const SizedBox(height: AppSpacing.small),
              AppButton(
                key: const ValueKey('onboarding-previous'),
                expand: true,
                variant: AppButtonVariant.text,
                onPressed: () => context.go(
                  '/onboarding/track-your-electricity',
                ),
                style: TextButton.styleFrom(
                  minimumSize: const Size(0, 44),
                  foregroundColor: AppColors.primary,
                  textStyle: AppTypography.textTheme.bodyMedium?.copyWith(
                    fontWeight: FontWeight.w600,
                  ),
                  shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(AppShapeTokens.medium),
                  ),
                ),
                child: Text(l10n.onboardingPrevious),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _AmbientGlow extends StatelessWidget {
  const _AmbientGlow({
    required this.size,
    required this.color,
    this.opacity = 0.16,
  });

  final double size;
  final Color color;
  final double opacity;

  @override
  Widget build(BuildContext context) => IgnorePointer(
    child: ImageFiltered(
      imageFilter: ImageFilter.blur(sigmaX: 38, sigmaY: 38),
      child: Container(
        width: size,
        height: size,
        decoration: BoxDecoration(
          color: color.withValues(alpha: opacity),
          shape: BoxShape.circle,
        ),
      ),
    ),
  );
}
