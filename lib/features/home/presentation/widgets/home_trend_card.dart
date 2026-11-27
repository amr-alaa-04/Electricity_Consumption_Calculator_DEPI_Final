import 'package:flutter/material.dart';

import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_shape_tokens.dart';
import '../../../../core/theme/app_typography.dart';
import '../../../../core/widgets/surfaces/app_surface_card.dart';
import '../../data/home_dashboard_demo_data.dart';
import '../../../../l10n/generated/app_localizations.dart';

class HomeTrendCard extends StatefulWidget {
  const HomeTrendCard({required this.l10n, super.key});

  final AppLocalizations l10n;

  @override
  State<HomeTrendCard> createState() => _HomeTrendCardState();
}

class _HomeTrendCardState extends State<HomeTrendCard> {
  int _selectedTrend = 0;

  @override
  Widget build(BuildContext context) {
    final l10n = widget.l10n;
    return AppSurfaceCard(
      key: const ValueKey('home-trend-card'),
      padding: const EdgeInsets.all(AppSpacing.medium),
      borderRadius: const BorderRadius.all(AppShapeTokens.extraLarge),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          LayoutBuilder(
            builder: (context, constraints) {
              final title = Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    l10n.homeConsumptionRate,
                    style: AppTypography.textTheme.headlineSmall?.copyWith(
                      color: AppColors.primary,
                    ),
                  ),
                  Text(
                    l10n.homeLastSevenDays,
                    style: AppTypography.textTheme.bodySmall?.copyWith(color: AppColors.outline),
                  ),
                ],
              );
              final filters = _trendFilters(l10n);
              if (constraints.maxWidth < 360) {
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    title,
                    const SizedBox(height: AppSpacing.small),
                    filters,
                  ],
                );
              }
              return Row(
                children: [
                  Expanded(child: title),
                  const SizedBox(width: AppSpacing.small),
                  filters,
                ],
              );
            },
          ),
          const SizedBox(height: AppSpacing.medium),
          _chart(l10n),
        ],
      ),
    );
  }

  Widget _trendFilters(AppLocalizations l10n) => Container(
    padding: const EdgeInsets.all(AppSpacing.micro),
    decoration: BoxDecoration(
      color: AppColors.surfaceContainerHigh,
      borderRadius: const BorderRadius.all(AppShapeTokens.medium),
    ),
    child: Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        _trendFilter(0, l10n.homeDaily),
        _trendFilter(1, l10n.homeWeekly),
        _trendFilter(2, l10n.homeMonthly),
      ],
    ),
  );

  Widget _trendFilter(int index, String label) {
    final selected = _selectedTrend == index;
    return TextButton(
      key: ValueKey('home-trend-filter-$index'),
      onPressed: () => setState(() => _selectedTrend = index),
      style: TextButton.styleFrom(
        minimumSize: const Size(0, 38),
        padding: const EdgeInsets.symmetric(horizontal: AppSpacing.micro),
        foregroundColor: selected ? AppColors.primary : AppColors.onSurfaceVariant,
        backgroundColor: selected ? AppColors.surfaceContainerLowest : Colors.transparent,
        textStyle: AppTypography.textTheme.labelSmall?.copyWith(
          fontWeight: selected ? FontWeight.w700 : FontWeight.w500,
        ),
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(AppShapeTokens.standard),
        ),
      ),
      child: Text(label),
    );
  }

  Widget _chart(AppLocalizations l10n) {
    final points = HomeDashboardDemoData.trendPoints;
    final days = [
      l10n.homeSaturday,
      l10n.homeSunday,
      l10n.homeMonday,
      l10n.homeTuesday,
      l10n.homeWednesday,
      l10n.homeThursday,
      l10n.homeToday,
    ];

    return SizedBox(
      height: 132,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          for (var index = 0; index < points.length; index++)
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: AppSpacing.micro),
                child: Column(
                  children: [
                    SizedBox(
                      height: 16,
                      child: FittedBox(
                        fit: BoxFit.scaleDown,
                        child: Text(
                          points[index].value,
                          style: AppTypography.textTheme.labelSmall?.copyWith(
                            color: index == points.length - 1
                                ? AppColors.primary
                                : AppColors.outline,
                            fontWeight: index == points.length - 1 ? FontWeight.w700 : null,
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      child: Align(
                        alignment: Alignment.bottomCenter,
                        child: Container(
                          width: 22,
                          height: points[index].barHeight,
                          decoration: BoxDecoration(
                            color: index == points.length - 1
                                ? AppColors.primary
                                : AppColors.secondaryFixedDim.withValues(alpha: 0.75),
                            borderRadius: const BorderRadius.vertical(
                              top: AppShapeTokens.standard,
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 18,
                      child: FittedBox(
                        fit: BoxFit.scaleDown,
                        child: Text(
                          days[index],
                          maxLines: 1,
                          style: AppTypography.textTheme.labelSmall?.copyWith(
                            color: index == points.length - 1
                                ? AppColors.primary
                                : AppColors.onSurfaceVariant,
                            fontWeight: index == points.length - 1 ? FontWeight.w700 : null,
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
    );
  }
}
