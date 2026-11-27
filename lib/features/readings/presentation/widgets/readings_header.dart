import 'package:flutter/material.dart';

import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_shape_tokens.dart';
import '../../../../core/theme/app_typography.dart';
import '../../../../core/widgets/buttons/app_icon_button.dart';
import '../../../../l10n/generated/app_localizations.dart';

class ReadingsHeader extends StatelessWidget {
  const ReadingsHeader({
    required this.l10n,
    required this.meterNumber,
    required this.onBackPressed,
    required this.onHelpPressed,
    super.key,
  });

  final AppLocalizations l10n;
  final String meterNumber;
  final VoidCallback onBackPressed;
  final VoidCallback onHelpPressed;

  @override
  Widget build(BuildContext context) => DecoratedBox(
    decoration: BoxDecoration(
      color: AppColors.surface.withValues(alpha: 0.95),
      boxShadow: [
        BoxShadow(
          color: AppColors.onSurface.withValues(alpha: 0.05),
          blurRadius: 8,
          offset: const Offset(0, 2),
        ),
      ],
    ),
    child: Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: AppSpacing.medium,
        vertical: AppSpacing.small,
      ),
      child: Row(
        children: [
          AppIconButton(
            icon: Transform.flip(
              flipX: Directionality.of(context) == TextDirection.ltr,
              child: const Icon(Icons.arrow_forward),
            ),
            tooltip: l10n.readingsBack,
            onPressed: onBackPressed,
            foregroundColor: AppColors.primary,
          ),
          const SizedBox(width: AppSpacing.small),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  l10n.readingsTitle,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: AppTypography.textTheme.headlineSmall?.copyWith(
                    color: AppColors.primary,
                  ),
                ),
                const SizedBox(height: AppSpacing.micro),
                Wrap(
                  crossAxisAlignment: WrapCrossAlignment.center,
                  spacing: AppSpacing.micro,
                  runSpacing: AppSpacing.micro,
                  children: [
                    Text(
                      l10n.readingsActiveMeterLabel,
                      style: AppTypography.textTheme.labelSmall?.copyWith(
                        color: AppColors.onSurfaceVariant,
                      ),
                    ),
                    InkWell(
                      onTap: () {},
                      borderRadius: const BorderRadius.all(AppShapeTokens.small),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Flexible(
                            child: Text(
                              l10n.readingsActiveMeterName,
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              style: AppTypography.textTheme.labelSmall?.copyWith(
                                color: AppColors.secondary,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                          const SizedBox(width: AppSpacing.micro),
                          Text(
                            meterNumber,
                            style: AppTypography.textTheme.labelSmall?.copyWith(
                              color: AppColors.secondary,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          const Icon(
                            Icons.expand_more,
                            size: 16,
                            color: AppColors.secondary,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          AppIconButton(
            icon: const Icon(Icons.notifications_none),
            tooltip: l10n.readingsNotificationsHelp,
            onPressed: onHelpPressed,
            foregroundColor: AppColors.primary,
          ),
        ],
      ),
    ),
  );
}
