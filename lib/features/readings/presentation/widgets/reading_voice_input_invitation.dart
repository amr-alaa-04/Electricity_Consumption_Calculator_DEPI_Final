import 'package:flutter/material.dart';

import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_shape_tokens.dart';
import '../../../../core/theme/app_typography.dart';
import '../../../../core/widgets/buttons/app_icon_button.dart';
import '../../../../l10n/generated/app_localizations.dart';

class ReadingVoiceInputInvitation extends StatelessWidget {
  const ReadingVoiceInputInvitation({
    required this.l10n,
    required this.onPressed,
    super.key,
  });

  final AppLocalizations l10n;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) => Container(
    key: const ValueKey('reading-voice-input-invitation'),
    padding: const EdgeInsets.all(AppSpacing.small),
    decoration: BoxDecoration(
      color: AppColors.surfaceContainerLow,
      border: Border.all(color: AppColors.secondary.withValues(alpha: 0.2)),
      borderRadius: const BorderRadius.all(AppShapeTokens.large),
    ),
    child: Row(
      children: [
        AppIconButton(
          icon: const Icon(Icons.mic),
          tooltip: l10n.readingsMethodVoice,
          onPressed: onPressed,
          backgroundColor: AppColors.secondaryFixed,
          foregroundColor: AppColors.primary,
          iconSize: 20,
        ),
        const SizedBox(width: AppSpacing.small + AppSpacing.micro),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                l10n.readingsVoiceInvitation,
                style: AppTypography.textTheme.labelSmall?.copyWith(
                  color: AppColors.onSurfaceVariant,
                ),
              ),
              Text(
                l10n.readingsVoiceSamplePhrase,
                style: AppTypography.textTheme.labelMedium?.copyWith(
                  color: AppColors.primary,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
        ),
        const SizedBox(width: AppSpacing.small),
        const Icon(Icons.chevron_left, size: 16, color: AppColors.secondary),
      ],
    ),
  );
}
