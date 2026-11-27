import 'package:flutter/material.dart';

import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_shape_tokens.dart';
import '../../../../core/theme/app_typography.dart';
import '../../../../core/widgets/surfaces/app_surface_card.dart';
import '../../../../l10n/generated/app_localizations.dart';

class HomeDisclaimer extends StatelessWidget {
  const HomeDisclaimer({required this.l10n, super.key});

  final AppLocalizations l10n;

  @override
  Widget build(BuildContext context) => AppSurfaceCard(
    padding: const EdgeInsets.all(AppSpacing.small + AppSpacing.micro),
    backgroundColor: AppColors.surfaceContainerHigh.withValues(alpha: 0.6),
    borderColor: AppColors.outlineVariant.withValues(alpha: 0.4),
    borderRadius: const BorderRadius.all(AppShapeTokens.medium),
    elevation: 0,
    child: Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Icon(Icons.info_outline, color: AppColors.secondary, size: 20),
        const SizedBox(width: AppSpacing.small),
        Expanded(
          child: Text.rich(
            TextSpan(
              children: [
                TextSpan(
                  text: '${l10n.homeDisclaimerTitle} ',
                  style: const TextStyle(
                    color: AppColors.primary,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                TextSpan(text: l10n.homeDisclaimer),
              ],
            ),
            style: AppTypography.textTheme.bodySmall?.copyWith(
              color: AppColors.onSurfaceVariant,
            ),
          ),
        ),
      ],
    ),
  );
}
