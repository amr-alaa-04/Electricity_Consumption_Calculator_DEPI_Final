import 'package:flutter/material.dart';

import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_shape_tokens.dart';
import '../../../../core/theme/app_typography.dart';
import '../../../../l10n/generated/app_localizations.dart';

enum ReadingInputMethod { manual, camera, voice }

class ReadingInputMethods extends StatelessWidget {
  const ReadingInputMethods({
    required this.l10n,
    required this.selectedMethod,
    required this.onMethodSelected,
    super.key,
  });

  final AppLocalizations l10n;
  final ReadingInputMethod selectedMethod;
  final ValueChanged<ReadingInputMethod> onMethodSelected;

  @override
  Widget build(BuildContext context) => Container(
    padding: const EdgeInsets.all(AppSpacing.micro + 2),
    decoration: BoxDecoration(
      color: AppColors.surfaceContainerHigh.withValues(alpha: 0.6),
      border: Border.all(color: AppColors.outlineVariant.withValues(alpha: 0.3)),
      borderRadius: const BorderRadius.all(AppShapeTokens.large),
    ),
    child: Row(
      children: [
        for (final method in ReadingInputMethod.values) Expanded(child: _methodButton(method)),
      ],
    ),
  );

  Widget _methodButton(ReadingInputMethod method) {
    final selected = method == selectedMethod;
    final label = switch (method) {
      ReadingInputMethod.manual => l10n.readingsMethodManual,
      ReadingInputMethod.camera => l10n.readingsMethodCamera,
      ReadingInputMethod.voice => l10n.readingsMethodVoice,
    };
    final icon = switch (method) {
      ReadingInputMethod.manual => Icons.edit_outlined,
      ReadingInputMethod.camera => Icons.photo_camera_outlined,
      ReadingInputMethod.voice => Icons.mic_none,
    };

    return Semantics(
      button: true,
      selected: selected,
      label: label,
      child: InkWell(
        onTap: () => onMethodSelected(method),
        borderRadius: const BorderRadius.all(AppShapeTokens.medium),
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 150),
          padding: const EdgeInsets.symmetric(
            horizontal: AppSpacing.micro,
            vertical: AppSpacing.small,
          ),
          decoration: BoxDecoration(
            color: selected ? AppColors.surfaceContainerLowest : Colors.transparent,
            border: selected ? Border.all(color: AppColors.secondary.withValues(alpha: 0.2)) : null,
            borderRadius: const BorderRadius.all(AppShapeTokens.medium),
            boxShadow: selected
                ? [
                    BoxShadow(
                      color: AppColors.primary.withValues(alpha: 0.06),
                      blurRadius: 4,
                      offset: const Offset(0, 2),
                    ),
                  ]
                : null,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                icon,
                size: 18,
                color: selected ? AppColors.secondary : AppColors.onSurfaceVariant,
              ),
              const SizedBox(width: AppSpacing.micro),
              Flexible(
                child: Text(
                  label,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  textAlign: TextAlign.center,
                  style: AppTypography.textTheme.labelMedium?.copyWith(
                    color: selected ? AppColors.primary : AppColors.onSurfaceVariant,
                    fontWeight: selected ? FontWeight.w700 : FontWeight.w500,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
