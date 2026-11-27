import 'package:flutter/material.dart';

import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_shape_tokens.dart';
import '../../../../core/theme/app_typography.dart';
import '../../../../core/widgets/surfaces/app_icon_tile.dart';
import '../../../../core/widgets/surfaces/app_surface_card.dart';
import '../../../../l10n/generated/app_localizations.dart';

class HomeQuickActions extends StatelessWidget {
  const HomeQuickActions({
    required this.l10n,
    required this.onRecordReadingPressed,
    super.key,
  });

  final AppLocalizations l10n;
  final VoidCallback onRecordReadingPressed;

  @override
  Widget build(BuildContext context) => Column(
    crossAxisAlignment: CrossAxisAlignment.stretch,
    children: [
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: AppSpacing.micro),
        child: Row(
          children: [
            Expanded(
              child: Text(
                l10n.homeQuickActions,
                style: AppTypography.textTheme.titleLarge?.copyWith(color: AppColors.primary),
              ),
            ),
            const SizedBox(width: AppSpacing.small),
            Text(
              l10n.homeMore,
              style: AppTypography.textTheme.labelSmall?.copyWith(color: AppColors.secondary),
            ),
          ],
        ),
      ),
      const SizedBox(height: AppSpacing.small),
      LayoutBuilder(
        builder: (context, constraints) {
          final tileWidth = (constraints.maxWidth - AppSpacing.small * 3) / 4;
          return Row(
            children: [
              _QuickAction(
                tileWidth,
                Icons.edit_note,
                l10n.homeActionRecordReading,
                onPressed: onRecordReadingPressed,
              ),
              const SizedBox(width: AppSpacing.small),
              _QuickAction(tileWidth, Icons.photo_camera_outlined, l10n.homeActionScanMeter),
              const SizedBox(width: AppSpacing.small),
              _QuickAction(tileWidth, Icons.mic_none, l10n.homeActionVoiceEntry),
              const SizedBox(width: AppSpacing.small),
              _QuickAction(tileWidth, Icons.calculate_outlined, l10n.homeActionCalculateBill),
            ],
          );
        },
      ),
    ],
  );
}

class _QuickAction extends StatelessWidget {
  const _QuickAction(
    this.width,
    this.icon,
    this.label, {
    this.onPressed,
  });

  final double width;
  final IconData icon;
  final String label;
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    final card = AppSurfaceCard(
      width: width,
      padding: const EdgeInsets.all(AppSpacing.small),
      borderRadius: const BorderRadius.all(AppShapeTokens.extraLarge),
      elevation: 0.5,
      child: Column(
        children: [
          AppIconTile(
            icon: icon,
            size: 48,
            iconSize: 24,
            backgroundColor: AppColors.surfaceContainer,
            iconColor: AppColors.primary,
            borderRadius: const BorderRadius.all(AppShapeTokens.large),
          ),
          const SizedBox(height: AppSpacing.small - AppSpacing.micro),
          Text(
            label,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            textAlign: TextAlign.center,
            style: AppTypography.textTheme.labelSmall?.copyWith(color: AppColors.onSurface),
          ),
        ],
      ),
    );

    if (onPressed == null) return card;

    return InkWell(
      onTap: onPressed,
      borderRadius: const BorderRadius.all(AppShapeTokens.extraLarge),
      child: card,
    );
  }
}
