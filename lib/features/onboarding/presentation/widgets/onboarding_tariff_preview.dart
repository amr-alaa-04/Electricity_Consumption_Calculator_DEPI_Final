import 'dart:ui';

import 'package:flutter/material.dart';

import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_shape_tokens.dart';
import '../../../../core/theme/app_typography.dart';
import '../../../../core/widgets/surfaces/app_icon_tile.dart';
import '../../../../core/widgets/surfaces/app_surface_card.dart';
import '../../../../l10n/generated/app_localizations.dart';
import '../../data/onboarding_demo_data.dart';

class OnboardingTariffPreview extends StatelessWidget {
  const OnboardingTariffPreview({required this.l10n, super.key});

  final AppLocalizations l10n;
  @override
  Widget build(BuildContext context) {
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
                        l10n.onboardingBillTierRangeTemplate(
                          OnboardingDemoData.billTierThreeNumber,
                          OnboardingDemoData.billTierThreeRangeStartKwh,
                          OnboardingDemoData.billTierThreeRangeEndKwh,
                        ),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: AppTypography.textTheme.bodySmall?.copyWith(
                          color: AppColors.onSurfaceVariant,
                        ),
                      ),
                    ),
                    const SizedBox(width: AppSpacing.small),
                    Text(
                      l10n.onboardingBillPaisaRateTemplate(
                        OnboardingDemoData.billTierThreeRatePiastresPerKwh,
                      ),
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
                  child: OnboardingAmbientGlow(
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
                l10n.onboardingBillTierRangeTemplate(
                  OnboardingDemoData.billTierTwoNumber,
                  OnboardingDemoData.billTierTwoRangeStartKwh,
                  OnboardingDemoData.billTierTwoRangeEndKwh,
                ),
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
            OnboardingDemoData.exampleBillEgp,
            l10n.onboardingBillCurrency,
            prominent: true,
          );
          final usage = _metric(
            context,
            l10n.onboardingBillEquivalentBalance,
            OnboardingDemoData.exampleUsageKwh,
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
                l10n.onboardingBillRemainingTemplate(
                  OnboardingDemoData.billUsageRemainingKwh,
                  OnboardingDemoData.billTierThreeNumber,
                ),
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
            value: OnboardingDemoData.billTierCapacityProgress,
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
              child: _thresholdLabel(
                l10n.onboardingBillThresholdTemplate(
                  OnboardingDemoData.billThresholdStartKwh,
                ),
              ),
            ),
            Expanded(
              child: _thresholdLabel(
                l10n.onboardingBillCapacityTemplate(
                  OnboardingDemoData.billTierCapacityPercent,
                ),
                color: AppColors.secondaryFixed,
              ),
            ),
            Expanded(
              child: _thresholdLabel(
                l10n.onboardingBillThresholdTemplate(
                  OnboardingDemoData.billThresholdEndKwh,
                ),
              ),
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
    final tierLabels = [
      for (final tier in OnboardingDemoData.tariffTiers)
        l10n.onboardingBillTierLabelTemplate(tier.labelNumber),
    ];

    return Row(
      children: [
        for (var index = 0; index < OnboardingDemoData.tariffTiers.length; index++) ...[
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
                    tierLabels[index],
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: AppTypography.textTheme.labelSmall?.copyWith(
                      color: index == 1 ? AppColors.primary : AppColors.onSurfaceVariant,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  Text(
                    l10n.onboardingBillTierRateTemplate(
                      OnboardingDemoData.tariffTiers[index].ratePiastres,
                    ),
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
}

class OnboardingAmbientGlow extends StatelessWidget {
  const OnboardingAmbientGlow({
    required this.size,
    required this.color,
    this.opacity = 0.16,
    super.key,
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
