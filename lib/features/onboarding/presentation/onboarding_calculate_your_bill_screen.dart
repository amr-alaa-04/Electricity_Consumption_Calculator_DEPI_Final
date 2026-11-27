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
import 'widgets/onboarding_tariff_preview.dart';

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
            child: OnboardingAmbientGlow(size: 320, color: AppColors.primaryFixed),
          ),
          const Positioned(
            bottom: 80,
            left: -100,
            child: OnboardingAmbientGlow(size: 260, color: AppColors.secondaryFixed),
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
                            OnboardingTariffPreview(l10n: l10n),
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
