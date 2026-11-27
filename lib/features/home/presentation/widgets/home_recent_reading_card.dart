import 'package:flutter/material.dart';

import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_shape_tokens.dart';
import '../../../../core/theme/app_typography.dart';
import '../../../../core/widgets/surfaces/app_icon_tile.dart';
import '../../../../core/widgets/surfaces/app_surface_card.dart';
import '../../../../l10n/generated/app_localizations.dart';
import '../../data/home_dashboard_demo_data.dart';

class HomeRecentReadingCard extends StatelessWidget {
  const HomeRecentReadingCard({required this.l10n, super.key});

  final AppLocalizations l10n;

  @override
  Widget build(BuildContext context) => AppSurfaceCard(
    key: const ValueKey('home-recent-reading-card'),
    padding: const EdgeInsets.all(AppSpacing.medium),
    borderRadius: const BorderRadius.all(AppShapeTokens.extraLarge),
    elevation: 1,
    child: LayoutBuilder(
      builder: (context, constraints) {
        final reading = Row(
          children: [
            AppIconTile(
              icon: Icons.push_pin_outlined,
              size: 40,
              iconSize: 20,
              backgroundColor: AppColors.secondaryContainer.withValues(alpha: 0.4),
              iconColor: AppColors.secondary,
              borderRadius: const BorderRadius.all(AppShapeTokens.medium),
            ),
            const SizedBox(width: AppSpacing.small),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    l10n.homeLastReading,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: AppTypography.textTheme.labelSmall?.copyWith(
                      color: AppColors.outline,
                    ),
                  ),
                  Text(
                    '${HomeDashboardDemoData.meterReading} ${l10n.homeEnergyUnit}',
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: AppTypography.textTheme.headlineSmall?.copyWith(
                      color: AppColors.primary,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ],
              ),
            ),
          ],
        );
        final date = DecoratedBox(
          decoration: BoxDecoration(
            color: AppColors.surfaceContainer,
            borderRadius: const BorderRadius.all(AppShapeTokens.pill),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: AppSpacing.small,
              vertical: AppSpacing.micro,
            ),
            child: Text(
              l10n.homeReadingDate,
              style: AppTypography.textTheme.labelSmall?.copyWith(
                color: AppColors.onSurfaceVariant,
              ),
            ),
          ),
        );

        if (constraints.maxWidth < 320) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              reading,
              const SizedBox(height: AppSpacing.small),
              Align(alignment: AlignmentDirectional.centerEnd, child: date),
            ],
          );
        }
        return Row(
          children: [
            Expanded(child: reading),
            const SizedBox(width: AppSpacing.small),
            date,
          ],
        );
      },
    ),
  );
}
