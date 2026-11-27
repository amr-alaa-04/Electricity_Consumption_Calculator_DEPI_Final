import 'package:flutter/material.dart';

import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_shape_tokens.dart';
import '../../../../core/theme/app_typography.dart';
import '../../../../core/widgets/surfaces/app_icon_tile.dart';
import '../../../../core/widgets/surfaces/app_surface_card.dart';
import '../../../../l10n/generated/app_localizations.dart';
import '../../data/home_dashboard_demo_data.dart';

class HomeAppliancesCard extends StatelessWidget {
  const HomeAppliancesCard({required this.l10n, super.key});

  final AppLocalizations l10n;

  @override
  Widget build(BuildContext context) => AppSurfaceCard(
    key: const ValueKey('home-appliances-card'),
    padding: const EdgeInsets.all(AppSpacing.medium),
    borderRadius: const BorderRadius.all(AppShapeTokens.extraLarge),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Row(
          children: [
            const Icon(Icons.pie_chart_outline, color: AppColors.secondary, size: 22),
            const SizedBox(width: AppSpacing.small),
            Expanded(
              child: Text(
                l10n.homeTopAppliances,
                style: AppTypography.textTheme.headlineSmall?.copyWith(color: AppColors.primary),
              ),
            ),
            Text(
              l10n.homeDetails,
              style: AppTypography.textTheme.labelSmall?.copyWith(color: AppColors.secondary),
            ),
          ],
        ),
        const SizedBox(height: AppSpacing.small),
        _applianceRow(
          icon: Icons.ac_unit,
          name: l10n.homeAirConditioner,
          usage: l10n.homeAirConditionerUsage,
          metric: HomeDashboardDemoData.applianceMetrics[0],
        ),
        const SizedBox(height: AppSpacing.small),
        _applianceRow(
          icon: Icons.kitchen_outlined,
          name: l10n.homeRefrigerator,
          usage: l10n.homeRefrigeratorUsage,
          metric: HomeDashboardDemoData.applianceMetrics[1],
        ),
        const SizedBox(height: AppSpacing.small),
        _applianceRow(
          icon: Icons.water_drop_outlined,
          name: l10n.homeWaterHeater,
          usage: l10n.homeWaterHeaterUsage,
          metric: HomeDashboardDemoData.applianceMetrics[2],
        ),
      ],
    ),
  );

  Widget _applianceRow({
    required IconData icon,
    required String name,
    required String usage,
    required HomeApplianceDemoMetric metric,
  }) => Container(
    padding: const EdgeInsets.all(AppSpacing.small),
    decoration: BoxDecoration(
      color: AppColors.surfaceContainer.withValues(alpha: 0.6),
      borderRadius: const BorderRadius.all(AppShapeTokens.medium),
    ),
    child: Row(
      children: [
        AppIconTile(
          icon: icon,
          size: 40,
          iconSize: 22,
          backgroundColor: AppColors.surfaceContainerLowest,
          iconColor: AppColors.primary,
          borderRadius: const BorderRadius.all(AppShapeTokens.medium),
        ),
        const SizedBox(width: AppSpacing.small),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                name,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: AppTypography.textTheme.labelLarge?.copyWith(color: AppColors.onSurface),
              ),
              Text(
                usage,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: AppTypography.textTheme.bodySmall?.copyWith(color: AppColors.outline),
              ),
            ],
          ),
        ),
        const SizedBox(width: AppSpacing.small),
        Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Text(
              metric.share,
              style: AppTypography.textTheme.titleLarge?.copyWith(
                color: AppColors.primary,
                fontWeight: FontWeight.w700,
              ),
            ),
            Text(
              '${metric.energyKwh} ${l10n.homeEnergyUnit}',
              textAlign: TextAlign.end,
              style: AppTypography.textTheme.labelSmall?.copyWith(color: AppColors.outline),
            ),
          ],
        ),
      ],
    ),
  );
}
