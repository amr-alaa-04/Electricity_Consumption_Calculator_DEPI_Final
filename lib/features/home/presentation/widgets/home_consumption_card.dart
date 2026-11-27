import 'package:flutter/material.dart';

import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_shape_tokens.dart';
import '../../../../core/theme/app_typography.dart';
import '../../data/home_dashboard_demo_data.dart';
import '../../../../l10n/generated/app_localizations.dart';

class HomeConsumptionCard extends StatelessWidget {
  const HomeConsumptionCard({required this.l10n, super.key});

  final AppLocalizations l10n;
  @override
  Widget build(BuildContext context) => LayoutBuilder(
    builder: (context, constraints) {
      final header = Wrap(
        alignment: WrapAlignment.spaceBetween,
        crossAxisAlignment: WrapCrossAlignment.center,
        spacing: AppSpacing.small,
        runSpacing: AppSpacing.small,
        children: [
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Icon(Icons.speed, color: AppColors.secondaryFixed, size: 22),
              const SizedBox(width: AppSpacing.small),
              Flexible(
                child: Text(
                  l10n.homeCurrentConsumption,
                  maxLines: 2,
                  softWrap: true,
                  style: AppTypography.textTheme.titleLarge?.copyWith(
                    color: AppColors.secondaryFixed,
                  ),
                ),
              ),
            ],
          ),
          _heroPill(
            l10n.homeCurrentTierTemplate(
              HomeDashboardDemoData.currentTierStartKwh,
              HomeDashboardDemoData.currentTierEndKwh,
            ),
          ),
        ],
      );

      return Container(
        padding: const EdgeInsets.all(AppSpacing.medium + AppSpacing.small),
        decoration: BoxDecoration(
          gradient: const LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [AppColors.primary, AppColors.primaryContainer, AppColors.secondary],
          ),
          borderRadius: const BorderRadius.all(AppShapeTokens.extraLarge),
          border: Border.all(color: AppColors.secondaryFixed.withValues(alpha: 0.2)),
          boxShadow: [
            BoxShadow(
              color: AppColors.primary.withValues(alpha: 0.16),
              blurRadius: 24,
              offset: const Offset(0, 10),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            header,
            const SizedBox(height: AppSpacing.medium),
            if (constraints.maxWidth < 380)
              Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  _heroMetric(
                    l10n.homeTotalEnergy,
                    HomeDashboardDemoData.currentConsumptionKwh,
                    l10n.homeEnergyUnit,
                  ),
                  const SizedBox(height: AppSpacing.small),
                  Divider(color: AppColors.onPrimary.withValues(alpha: 0.16)),
                  const SizedBox(height: AppSpacing.small),
                  _heroMetric(
                    l10n.homeEstimatedBill,
                    HomeDashboardDemoData.estimatedBillEgp,
                    l10n.homeCurrency,
                    accent: AppColors.secondaryFixed,
                  ),
                ],
              )
            else
              Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Expanded(
                    child: _heroMetric(
                      l10n.homeTotalEnergy,
                      HomeDashboardDemoData.currentConsumptionKwh,
                      l10n.homeEnergyUnit,
                    ),
                  ),
                  Container(
                    width: 1,
                    height: 64,
                    margin: const EdgeInsets.symmetric(horizontal: AppSpacing.medium),
                    color: AppColors.onPrimary.withValues(alpha: 0.16),
                  ),
                  Expanded(
                    child: _heroMetric(
                      l10n.homeEstimatedBill,
                      HomeDashboardDemoData.estimatedBillEgp,
                      l10n.homeCurrency,
                      accent: AppColors.secondaryFixed,
                    ),
                  ),
                ],
              ),
            const SizedBox(height: AppSpacing.medium),
            Divider(color: AppColors.onPrimary.withValues(alpha: 0.16)),
            const SizedBox(height: AppSpacing.small),
            Wrap(
              alignment: WrapAlignment.spaceBetween,
              crossAxisAlignment: WrapCrossAlignment.center,
              spacing: AppSpacing.small,
              runSpacing: AppSpacing.small,
              children: [
                _heroPill(
                  l10n.homeComparedPreviousTemplate(
                    HomeDashboardDemoData.previousMonthChange,
                  ),
                  icon: Icons.trending_up,
                  color: AppColors.secondaryFixed,
                ),
                Text(
                  l10n.homeDaysRemainingTemplate(
                    HomeDashboardDemoData.billingDaysRemaining,
                  ),
                  style: AppTypography.textTheme.labelSmall?.copyWith(
                    color: AppColors.surfaceVariant,
                  ),
                ),
              ],
            ),
          ],
        ),
      );
    },
  );

  Widget _heroMetric(String label, String value, String unit, {Color? accent}) => Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text(
        label,
        style: AppTypography.textTheme.labelSmall?.copyWith(
          color: AppColors.surfaceVariant.withValues(alpha: 0.9),
        ),
      ),
      const SizedBox(height: AppSpacing.micro),
      FittedBox(
        fit: BoxFit.scaleDown,
        alignment: AlignmentDirectional.centerStart,
        child: Row(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.baseline,
          textBaseline: TextBaseline.alphabetic,
          children: [
            Text(
              value,
              style: AppTypography.currencyDisplayMobile.copyWith(
                color: accent ?? AppColors.onPrimary,
              ),
            ),
            const SizedBox(width: AppSpacing.micro),
            Text(
              unit,
              style: AppTypography.textTheme.labelMedium?.copyWith(
                color: accent ?? AppColors.surfaceVariant,
              ),
            ),
          ],
        ),
      ),
    ],
  );

  Widget _heroPill(String text, {IconData? icon, Color? color}) => DecoratedBox(
    decoration: BoxDecoration(
      color: AppColors.surfaceContainerLowest.withValues(alpha: 0.14),
      border: Border.all(color: AppColors.onPrimary.withValues(alpha: 0.18)),
      borderRadius: const BorderRadius.all(AppShapeTokens.pill),
    ),
    child: Padding(
      padding: const EdgeInsets.symmetric(horizontal: AppSpacing.small, vertical: AppSpacing.micro),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          if (icon != null) ...[
            Icon(icon, size: 16, color: color ?? AppColors.onPrimary),
            const SizedBox(width: AppSpacing.micro),
          ],
          Flexible(
            child: Text(
              text,
              maxLines: 2,
              softWrap: true,
              textAlign: TextAlign.center,
              style: AppTypography.textTheme.labelSmall?.copyWith(
                color: color ?? AppColors.onPrimary,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ],
      ),
    ),
  );
}
