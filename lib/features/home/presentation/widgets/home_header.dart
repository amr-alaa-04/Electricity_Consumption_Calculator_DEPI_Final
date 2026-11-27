import 'package:flutter/material.dart';

import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_shape_tokens.dart';
import '../../../../core/theme/app_typography.dart';
import '../../../../core/widgets/buttons/app_icon_button.dart';
import '../../../../core/widgets/surfaces/app_icon_tile.dart';
import '../../../../l10n/generated/app_localizations.dart';

class HomeHeader extends StatelessWidget {
  const HomeHeader({required this.l10n, required this.onNotificationsPressed, super.key});

  final AppLocalizations l10n;
  final VoidCallback onNotificationsPressed;

  @override
  Widget build(BuildContext context) => Container(
    color: AppColors.background,
    padding: const EdgeInsets.symmetric(
      horizontal: AppSpacing.gutter,
      vertical: AppSpacing.small,
    ),
    child: Row(
      children: [
        const AppIconTile(
          icon: Icons.bolt,
          size: 40,
          iconSize: 24,
          backgroundColor: AppColors.primary,
          iconColor: AppColors.onPrimary,
          borderRadius: BorderRadius.all(AppShapeTokens.medium),
        ),
        const SizedBox(width: AppSpacing.small),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                l10n.homeBrand,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: AppTypography.textTheme.titleLarge?.copyWith(
                  color: AppColors.primary,
                  fontWeight: FontWeight.w700,
                ),
              ),
              Text(
                l10n.homeGovernment,
                style: AppTypography.textTheme.labelSmall?.copyWith(
                  color: AppColors.onSurfaceVariant,
                ),
              ),
            ],
          ),
        ),
        AppIconButton(
          key: const ValueKey('home-notifications'),
          icon: const Icon(Icons.notifications_none),
          tooltip: l10n.homeNotifications,
          onPressed: onNotificationsPressed,
          foregroundColor: AppColors.primary,
        ),
      ],
    ),
  );
}
