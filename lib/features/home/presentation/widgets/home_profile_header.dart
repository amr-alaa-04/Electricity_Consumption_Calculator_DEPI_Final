import 'package:flutter/material.dart';

import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_shape_tokens.dart';
import '../../../../core/theme/app_typography.dart';
import '../../../../l10n/generated/app_localizations.dart';

class HomeProfileHeader extends StatelessWidget {
  const HomeProfileHeader({required this.l10n, super.key});

  final AppLocalizations l10n;

  @override
  Widget build(BuildContext context) => LayoutBuilder(
    builder: (context, constraints) {
      final identity = Row(
        children: [
          Container(
            width: 48,
            height: 48,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: AppColors.surfaceContainer,
              border: Border.all(color: AppColors.secondary.withValues(alpha: 0.35), width: 2),
            ),
            child: Center(
              child: Text(
                l10n.homeAvatarInitials,
                style: AppTypography.textTheme.labelLarge?.copyWith(
                  color: AppColors.primary,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
          ),
          const SizedBox(width: AppSpacing.small),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Flexible(
                      child: Text(
                        l10n.homeGreeting,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: AppTypography.textTheme.headlineSmall?.copyWith(
                          color: AppColors.onSurface,
                        ),
                      ),
                    ),
                    const SizedBox(width: AppSpacing.micro),
                    const Icon(Icons.verified, color: AppColors.secondary, size: 16),
                  ],
                ),
                Text(
                  l10n.homeGreetingDate,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: AppTypography.textTheme.labelMedium?.copyWith(
                    color: AppColors.outline,
                  ),
                ),
              ],
            ),
          ),
        ],
      );
      final meterBadge = DecoratedBox(
        decoration: BoxDecoration(
          color: AppColors.surfaceContainer,
          border: Border.all(color: AppColors.outlineVariant.withValues(alpha: 0.3)),
          borderRadius: const BorderRadius.all(AppShapeTokens.pill),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: AppSpacing.small + AppSpacing.micro,
            vertical: AppSpacing.micro,
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Icon(Icons.speed, color: AppColors.secondary, size: 16),
              const SizedBox(width: AppSpacing.micro),
              Text(
                l10n.homeSmartMeter,
                style: AppTypography.textTheme.labelSmall?.copyWith(
                  color: AppColors.secondary,
                ),
              ),
            ],
          ),
        ),
      );

      if (constraints.maxWidth < 380) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            identity,
            const SizedBox(height: AppSpacing.small),
            Align(alignment: AlignmentDirectional.centerEnd, child: meterBadge),
          ],
        );
      }
      return Row(
        children: [
          Expanded(child: identity),
          meterBadge,
        ],
      );
    },
  );
}
