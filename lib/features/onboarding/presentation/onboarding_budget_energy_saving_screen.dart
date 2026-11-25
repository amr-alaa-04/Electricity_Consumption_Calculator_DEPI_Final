import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../core/theme/app_colors.dart';
import '../../../core/theme/app_shape_tokens.dart';
import '../../../core/theme/app_typography.dart';
import '../../../core/widgets/buttons/app_button.dart';
import '../../../core/widgets/surfaces/app_icon_tile.dart';
import '../../../core/widgets/surfaces/app_surface_card.dart';
import '../../../l10n/generated/app_localizations.dart';
import '../data/onboarding_demo_data.dart';
import 'onboarding_step_indicator.dart';

class OnboardingBudgetEnergySavingScreen extends StatelessWidget {
  const OnboardingBudgetEnergySavingScreen({super.key});

  static const _maxWidth = 448.0;

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;

    return Scaffold(
      key: const ValueKey('onboarding-budget-energy-saving-screen'),
      backgroundColor: AppColors.background,
      body: SafeArea(
        child: Column(
          children: [
            _header(l10n),
            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.symmetric(
                  horizontal: AppSpacing.marginMobile,
                ),
                child: Center(
                  child: ConstrainedBox(
                    constraints: const BoxConstraints(maxWidth: _maxWidth),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        _budgetCard(context, l10n),
                        const SizedBox(height: AppSpacing.large),
                        Text(
                          l10n.onboardingBudgetTitle,
                          textAlign: TextAlign.start,
                          style: AppTypography.headlineLargeMobile.copyWith(
                            color: AppColors.primary,
                          ),
                        ),
                        const SizedBox(height: AppSpacing.small),
                        Text(
                          l10n.onboardingBudgetDescription,
                          style: AppTypography.textTheme.bodyMedium?.copyWith(
                            color: AppColors.onSurfaceVariant,
                            height: 1.5,
                          ),
                        ),
                        const SizedBox(height: AppSpacing.medium),
                        _benefits(l10n),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            _footer(context, l10n),
          ],
        ),
      ),
    );
  }

  Widget _header(AppLocalizations l10n) => Center(
    child: ConstrainedBox(
      constraints: const BoxConstraints(maxWidth: _maxWidth),
      child: Padding(
        padding: const EdgeInsets.fromLTRB(
          AppSpacing.marginMobile,
          AppSpacing.small,
          AppSpacing.marginMobile,
          AppSpacing.medium,
        ),
        child: Row(
          children: [
            const Icon(Icons.bolt, color: AppColors.primary, size: 21),
            const SizedBox(width: AppSpacing.micro),
            Expanded(
              child: Text(
                l10n.onboardingBrandShort,
                style: AppTypography.textTheme.titleLarge?.copyWith(
                  color: AppColors.primary,
                ),
              ),
            ),
            TextButton(
              key: const ValueKey('onboarding-skip'),
              onPressed: null,
              child: Text(l10n.onboardingSkip),
            ),
          ],
        ),
      ),
    ),
  );

  Widget _budgetCard(BuildContext context, AppLocalizations l10n) {
    final appliances = [
      (Icons.ac_unit, l10n.onboardingApplianceAirConditioner, OnboardingDemoData.applianceMetrics[0].share, OnboardingDemoData.applianceMetrics[0].amountEgp),
      (Icons.water, l10n.onboardingApplianceWaterHeater, OnboardingDemoData.applianceMetrics[1].share, OnboardingDemoData.applianceMetrics[1].amountEgp),
      (Icons.kitchen, l10n.onboardingApplianceRefrigerator, OnboardingDemoData.applianceMetrics[2].share, OnboardingDemoData.applianceMetrics[2].amountEgp),
    ];

    return AppSurfaceCard(
      padding: const EdgeInsets.all(AppSpacing.medium),
      borderRadius: const BorderRadius.all(AppShapeTokens.extraLarge),
      child: Column(
        children: [
          Row(
            children: [
              Expanded(
                child: Row(
                  children: [
                    const OnboardingStepIndicator(active: true),
                    const SizedBox(width: AppSpacing.small),
                    Flexible(
                      child: Text(
                        l10n.onboardingBudgetMonthly,
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
                  color: AppColors.errorContainer,
                  borderRadius: const BorderRadius.all(AppShapeTokens.pill),
                ),
                child: Text(
                  l10n.onboardingBudgetConsumedTemplate(
                    OnboardingDemoData.budgetConsumedPercent,
                  ),
                  style: AppTypography.textTheme.labelSmall?.copyWith(
                    color: AppColors.onErrorContainer,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: AppSpacing.small),
          SizedBox(
            width: 176,
            height: 176,
            child: Stack(
              alignment: Alignment.center,
              children: [
                const CustomPaint(
                  size: Size.square(176),
                  painter: _BudgetGaugePainter(OnboardingDemoData.budgetGaugeProgress),
                ),
                Container(
                  width: 148,
                  height: 148,
                  decoration: BoxDecoration(
                    color: AppColors.surfaceContainerLowest,
                    shape: BoxShape.circle,
                    border: Border.all(
                      color: AppColors.outlineVariant.withValues(alpha: 0.15),
                    ),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        l10n.onboardingBudgetRemaining,
                        style: AppTypography.textTheme.labelMedium?.copyWith(
                          color: AppColors.outline,
                        ),
                      ),
                      Directionality(
                        textDirection: TextDirection.ltr,
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.baseline,
                          textBaseline: TextBaseline.alphabetic,
                          children: [
                            Text(
                              OnboardingDemoData.remainingBudgetEgp,
                              style: AppTypography.currencyDisplayMobile.copyWith(
                                color: AppColors.primary,
                              ),
                            ),
                            const SizedBox(width: AppSpacing.micro),
                            Text(
                              l10n.onboardingBudgetCurrency,
                              style: AppTypography.textTheme.labelMedium?.copyWith(
                                color: AppColors.onSurfaceVariant,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        width: 64,
                        height: 1,
                        margin: const EdgeInsets.symmetric(
                          vertical: AppSpacing.micro,
                        ),
                        color: AppColors.outlineVariant.withValues(alpha: 0.3),
                      ),
                      Text(
                        l10n.onboardingBudgetCapTemplate(
                          OnboardingDemoData.monthlyBudgetEgp,
                          l10n.onboardingBudgetCurrency,
                        ),
                        textAlign: TextAlign.center,
                        style: AppTypography.textTheme.labelSmall?.copyWith(
                          color: AppColors.secondary,
                        ),
                      ),
                    ],
                  ),
                ),
                Positioned(
                  bottom: 1,
                  left: -40,
                  right: -40,
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: AppSpacing.small,
                      vertical: AppSpacing.micro,
                    ),
                    decoration: BoxDecoration(
                      color: AppColors.primaryContainer,
                      borderRadius: const BorderRadius.all(AppShapeTokens.pill),
                      boxShadow: [
                        BoxShadow(
                          color: AppColors.primary.withValues(alpha: 0.18),
                          blurRadius: 8,
                          offset: const Offset(0, 2),
                        ),
                      ],
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Flexible(
                          child: Text(
                            l10n.onboardingBudgetSavingsTemplate(
                              OnboardingDemoData.budgetSavingsEgp,
                              l10n.onboardingBudgetCurrency,
                            ),
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                            textAlign: TextAlign.center,
                            style: AppTypography.textTheme.labelSmall?.copyWith(
                              color: AppColors.onPrimary,
                            ),
                          ),
                        ),
                        const SizedBox(width: AppSpacing.small),
                        const Icon(
                          Icons.energy_savings_leaf,
                          size: 16,
                          color: AppColors.secondaryContainer,
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: AppSpacing.large),
          const Divider(height: 1),
          const SizedBox(height: AppSpacing.medium),
          Row(
            children: [
              for (var i = 0; i < appliances.length; i++) ...[
                if (i != 0) const SizedBox(width: AppSpacing.small),
                Expanded(
                  child: _applianceCard(appliances[i], i == 0, l10n),
                ),
              ],
            ],
          ),
        ],
      ),
    );
  }

  Widget _applianceCard(
    (IconData, String, String, String) appliance,
    bool warning,
    AppLocalizations l10n,
  ) => AppSurfaceCard(
    padding: const EdgeInsets.all(AppSpacing.small),
    backgroundColor: AppColors.surfaceContainerLow.withValues(alpha: 0.7),
    borderRadius: const BorderRadius.all(AppShapeTokens.medium),
    elevation: 0,
    child: Column(
      children: [
        AppIconTile(
          icon: appliance.$1,
          size: 28,
          iconSize: 18,
          backgroundColor: AppColors.surfaceContainerLowest,
          iconColor: warning ? AppColors.primaryContainer : AppColors.secondary,
          borderRadius: const BorderRadius.all(AppShapeTokens.standard),
        ),
        const SizedBox(height: AppSpacing.micro),
        Text(
          appliance.$2,
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
          style: AppTypography.textTheme.labelSmall?.copyWith(
            color: AppColors.onSurface,
            fontWeight: FontWeight.w600,
          ),
        ),
        Text(
          appliance.$3,
          style: AppTypography.textTheme.labelMedium?.copyWith(
            color: warning ? AppColors.error : AppColors.secondary,
            fontWeight: FontWeight.w700,
          ),
        ),
        Text(
          l10n.onboardingApplianceAmount(appliance.$4, l10n.onboardingBudgetCurrency),
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
          style: AppTypography.textTheme.labelSmall?.copyWith(
            color: AppColors.outline,
          ),
        ),
      ],
    ),
  );

  Widget _benefits(AppLocalizations l10n) => Column(
    children: [
      _benefit(Icons.notifications_active, l10n.onboardingBudgetAlerts),
      const SizedBox(height: AppSpacing.small),
      _benefit(Icons.tune, l10n.onboardingBudgetSimulator),
    ],
  );

  Widget _benefit(IconData icon, String text) => AppSurfaceCard(
    padding: const EdgeInsets.all(AppSpacing.small),
    borderRadius: const BorderRadius.all(AppShapeTokens.medium),
    backgroundColor: AppColors.surfaceContainerLowest.withValues(alpha: 0.8),
    elevation: 0,
    child: Row(
      children: [
        AppIconTile(
          icon: icon,
          size: 28,
          iconSize: 17,
          backgroundColor: AppColors.secondaryContainer,
          iconColor: AppColors.onSecondaryContainer,
          borderRadius: const BorderRadius.all(AppShapeTokens.pill),
        ),
        const SizedBox(width: AppSpacing.small),
        Expanded(
          child: Text(
            text,
            style: AppTypography.textTheme.labelMedium?.copyWith(
              color: AppColors.onSurface,
            ),
          ),
        ),
      ],
    ),
  );

  Widget _footer(BuildContext context, AppLocalizations l10n) => Center(
    child: ConstrainedBox(
      constraints: const BoxConstraints(maxWidth: _maxWidth),
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
                  for (var i = 0; i < 4; i++) ...[
                    if (i > 0) const SizedBox(width: AppSpacing.small),
                    OnboardingStepIndicator(active: i == 3),
                  ],
                ],
              ),
            ),
            const SizedBox(height: AppSpacing.medium),
            AppButton(
              key: const ValueKey('onboarding-start-now'),
              expand: true,
              onPressed: () => context.go('/welcome-login'),
              leadingIcon: MediaQuery.sizeOf(context).width < 360
                  ? null
                  : const Icon(
                      Icons.bolt,
                      color: AppColors.secondaryContainer,
                      size: 20,
                    ),
              style: FilledButton.styleFrom(
                minimumSize: const Size(0, 52),
                backgroundColor: AppColors.primary,
                foregroundColor: AppColors.onPrimary,
                shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(AppShapeTokens.large),
                ),
                elevation: 5,
                shadowColor: AppColors.primary.withValues(alpha: 0.18),
                textStyle: MediaQuery.sizeOf(context).width < 360
                    ? AppTypography.textTheme.labelLarge
                    : AppTypography.textTheme.headlineSmall,
              ),
              child: Text(l10n.onboardingBudgetStartNow),
            ),
            const SizedBox(height: AppSpacing.small),
            Text(
              l10n.onboardingBudgetDisclaimer,
              textAlign: TextAlign.center,
              style: AppTypography.textTheme.labelSmall?.copyWith(
                color: AppColors.outline,
              ),
            ),
          ],
        ),
      ),
    ),
  );
}

class _BudgetGaugePainter extends CustomPainter {
  const _BudgetGaugePainter(this.progress);

  final double progress;

  @override
  void paint(Canvas canvas, Size size) {
    const strokeWidth = 10.0;
    final rect = Offset.zero & size;
    final inset = strokeWidth / 2;
    final arcRect = rect.deflate(inset);
    final center = rect.center;
    const startAngle = 2.35;
    final sweepAngle = math.pi * 2 * progress;
    final trackPaint = Paint()
      ..color = AppColors.outlineVariant.withValues(alpha: 0.25)
      ..style = PaintingStyle.stroke
      ..strokeWidth = strokeWidth;
    canvas.drawCircle(center, size.width / 2 - inset, trackPaint);

    final gradient = SweepGradient(
      startAngle: startAngle,
      endAngle: startAngle + sweepAngle,
      colors: const [
        AppColors.primaryContainer,
        AppColors.secondary,
        AppColors.warning,
      ],
      stops: const [0, 0.72, 1],
      transform: const GradientRotation(startAngle),
    );
    final paint = Paint()
      ..shader = gradient.createShader(arcRect)
      ..style = PaintingStyle.stroke
      ..strokeWidth = strokeWidth
      ..strokeCap = StrokeCap.butt;
    canvas.drawArc(arcRect, startAngle, sweepAngle, false, paint);
  }

  @override
  bool shouldRepaint(covariant _BudgetGaugePainter oldDelegate) =>
      progress != oldDelegate.progress;
}
