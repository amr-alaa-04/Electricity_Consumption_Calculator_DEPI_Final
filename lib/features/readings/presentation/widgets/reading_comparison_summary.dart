import 'package:flutter/material.dart';

import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_shape_tokens.dart';
import '../../../../core/theme/app_typography.dart';
import '../../../../l10n/generated/app_localizations.dart';

class ReadingComparisonSummary extends StatelessWidget {
  const ReadingComparisonSummary({
    required this.l10n,
    required this.previousReading,
    required this.consumptionDifference,
    required this.consumptionTier,
    required this.previousReadingDate,
    super.key,
  });

  final AppLocalizations l10n;
  final String previousReading;
  final String consumptionDifference;
  final String consumptionTier;
  final DateTime previousReadingDate;

  @override
  Widget build(BuildContext context) {
    final previousDate = MaterialLocalizations.of(context).formatMediumDate(previousReadingDate);

    return Container(
      padding: const EdgeInsets.all(AppSpacing.small),
      decoration: BoxDecoration(
        color: AppColors.surfaceContainerLow.withValues(alpha: 0.7),
        border: Border.all(color: AppColors.outlineVariant.withValues(alpha: 0.25)),
        borderRadius: const BorderRadius.all(AppShapeTokens.medium),
      ),
      child: Column(
        children: [
          Wrap(
            alignment: WrapAlignment.spaceBetween,
            crossAxisAlignment: WrapCrossAlignment.center,
            spacing: AppSpacing.small,
            runSpacing: AppSpacing.micro,
            children: [
              Text(
                l10n.readingsPreviousReadingTemplate(previousDate),
                style: AppTypography.textTheme.bodyMedium?.copyWith(
                  color: AppColors.onSurfaceVariant,
                ),
              ),
              Text(
                '$previousReading ${l10n.homeEnergyUnit}',
                textDirection: TextDirection.ltr,
                style: AppTypography.textTheme.titleLarge?.copyWith(
                  color: AppColors.primary,
                  fontWeight: FontWeight.w700,
                  fontFeatures: const [FontFeature.tabularFigures()],
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: AppSpacing.small),
            child: Divider(
              height: 1,
              color: AppColors.outlineVariant.withValues(alpha: 0.2),
            ),
          ),
          Wrap(
            alignment: WrapAlignment.spaceBetween,
            crossAxisAlignment: WrapCrossAlignment.center,
            spacing: AppSpacing.small,
            runSpacing: AppSpacing.micro,
            children: [
              Text(
                l10n.readingsConsumptionDifference,
                style: AppTypography.textTheme.labelSmall?.copyWith(
                  color: AppColors.onSurfaceVariant,
                ),
              ),
              Wrap(
                crossAxisAlignment: WrapCrossAlignment.center,
                spacing: AppSpacing.micro,
                runSpacing: AppSpacing.micro,
                children: [
                  const Icon(Icons.trending_up, size: 16, color: AppColors.secondary),
                  Text(
                    '$consumptionDifference ${l10n.homeEnergyUnit}',
                    textDirection: TextDirection.ltr,
                    style: AppTypography.textTheme.labelLarge?.copyWith(
                      color: AppColors.secondary,
                      fontWeight: FontWeight.w700,
                      fontFeatures: const [FontFeature.tabularFigures()],
                    ),
                  ),
                  Text(
                    l10n.readingsTierTemplate(consumptionTier),
                    style: AppTypography.textTheme.bodySmall?.copyWith(
                      color: AppColors.onSurfaceVariant,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
