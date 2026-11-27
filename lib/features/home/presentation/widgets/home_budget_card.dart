import 'package:flutter/material.dart';

import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_shape_tokens.dart';
import '../../../../core/theme/app_typography.dart';
import '../../../../core/widgets/surfaces/app_surface_card.dart';
import '../../../../core/widgets/surfaces/app_icon_tile.dart';
import '../../data/home_dashboard_demo_data.dart';
import '../../../../l10n/generated/app_localizations.dart';

class HomeBudgetCard extends StatelessWidget {
  const HomeBudgetCard({required this.l10n, super.key});

  final AppLocalizations l10n;
  @override
  Widget build(BuildContext context) => AppSurfaceCard(
    key: const ValueKey('home-budget-card'),
    padding: const EdgeInsets.all(AppSpacing.medium),
    borderRadius: const BorderRadius.all(AppShapeTokens.extraLarge),
    elevation: 1,
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        LayoutBuilder(
          builder: (context, constraints) {
            final title = Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                const AppIconTile(
                  icon: Icons.account_balance_wallet_outlined,
                  size: 36,
                  iconSize: 20,
                  backgroundColor: AppColors.surfaceContainerHigh,
                  iconColor: AppColors.primary,
                  borderRadius: BorderRadius.all(AppShapeTokens.medium),
                ),
                const SizedBox(width: AppSpacing.small),
                Flexible(
                  child: Text(
                    l10n.homeMonthlyBudget,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: AppTypography.textTheme.headlineSmall?.copyWith(
                      color: AppColors.primary,
                    ),
                  ),
                ),
              ],
            );
            final warning = _warningBadge(l10n.homeBudgetWarning);
            if (constraints.maxWidth < 360) {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  title,
                  const SizedBox(height: AppSpacing.small),
                  Align(alignment: AlignmentDirectional.centerEnd, child: warning),
                ],
              );
            }
            return Row(
              children: [
                Expanded(child: title),
                const SizedBox(width: AppSpacing.small),
                warning,
              ],
            );
          },
        ),
        const SizedBox(height: AppSpacing.medium),
        ClipRRect(
          borderRadius: const BorderRadius.all(AppShapeTokens.pill),
          child: const LinearProgressIndicator(
            key: ValueKey('home-budget-progress'),
            value: HomeDashboardDemoData.budgetProgress,
            minHeight: 10,
            backgroundColor: AppColors.surfaceContainerHigh,
            valueColor: AlwaysStoppedAnimation(AppColors.secondary),
          ),
        ),
        const SizedBox(height: AppSpacing.small),
        Wrap(
          alignment: WrapAlignment.spaceBetween,
          spacing: AppSpacing.small,
          runSpacing: AppSpacing.micro,
          children: [
            Text.rich(
              TextSpan(
                children: [
                  TextSpan(text: '${l10n.homeBudgetSpent}: '),
                  TextSpan(
                    text:
                        '${HomeDashboardDemoData.budgetSpentEgp} ${l10n.homeCurrency} (${HomeDashboardDemoData.budgetPercent})',
                    style: const TextStyle(fontWeight: FontWeight.w700),
                  ),
                ],
              ),
              style: AppTypography.textTheme.labelSmall?.copyWith(color: AppColors.outline),
            ),
            Text.rich(
              TextSpan(
                children: [
                  TextSpan(text: '${l10n.homeBudgetLimit}: '),
                  TextSpan(
                    text: '${HomeDashboardDemoData.budgetLimitEgp} ${l10n.homeCurrency}',
                    style: const TextStyle(fontWeight: FontWeight.w700),
                  ),
                ],
              ),
              style: AppTypography.textTheme.labelSmall?.copyWith(color: AppColors.outline),
            ),
          ],
        ),
        const SizedBox(height: AppSpacing.small),
        Divider(color: AppColors.outlineVariant.withValues(alpha: 0.3)),
        const SizedBox(height: AppSpacing.small),
        Wrap(
          alignment: WrapAlignment.spaceBetween,
          crossAxisAlignment: WrapCrossAlignment.center,
          spacing: AppSpacing.small,
          runSpacing: AppSpacing.micro,
          children: [
            Text(
              l10n.homeBudgetRemaining,
              style: AppTypography.textTheme.bodySmall?.copyWith(color: AppColors.onSurfaceVariant),
            ),
            Text(
              '${HomeDashboardDemoData.budgetRemainingEgp} ${l10n.homeCurrency}',
              style: AppTypography.textTheme.titleLarge?.copyWith(
                color: AppColors.secondary,
                fontWeight: FontWeight.w700,
              ),
            ),
          ],
        ),
      ],
    ),
  );

  Widget _warningBadge(String text) => DecoratedBox(
    decoration: BoxDecoration(
      color: AppColors.warning.withValues(alpha: 0.1),
      border: Border.all(color: AppColors.warning.withValues(alpha: 0.45)),
      borderRadius: const BorderRadius.all(AppShapeTokens.pill),
    ),
    child: Padding(
      padding: const EdgeInsets.symmetric(horizontal: AppSpacing.small, vertical: AppSpacing.micro),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Icon(Icons.warning_amber_rounded, size: 16, color: AppColors.warning),
          const SizedBox(width: AppSpacing.micro),
          Text(
            text,
            style: AppTypography.textTheme.labelSmall?.copyWith(color: AppColors.onSurface),
          ),
        ],
      ),
    ),
  );
}
