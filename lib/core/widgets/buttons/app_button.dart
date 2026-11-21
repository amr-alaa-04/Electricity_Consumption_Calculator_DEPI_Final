import 'package:flutter/material.dart';

import '../../theme/app_colors.dart';
import '../../theme/app_shape_tokens.dart';
import '../../theme/app_typography.dart';
import '../../../l10n/generated/app_localizations.dart';

enum AppButtonVariant { primary, secondary, outlined, text }

/// Shared action button with design-system variants and common async states.
///
/// For asynchronous actions, callers should set [isLoading] to true before the
/// first `await`. While loading, this widget sets its button callback to null.
/// It intentionally does not own asynchronous state or lock callbacks itself.
class AppButton extends StatelessWidget {
  const AppButton({
    required this.child,
    required this.onPressed,
    this.variant = AppButtonVariant.primary,
    this.isLoading = false,
    this.leadingIcon,
    this.trailingIcon,
    this.expand = false,
    this.style,
    super.key,
  });

  final Widget child;
  final VoidCallback? onPressed;
  final AppButtonVariant variant;
  final bool isLoading;
  final Widget? leadingIcon;
  final Widget? trailingIcon;
  final bool expand;
  final ButtonStyle? style;

  @override
  Widget build(BuildContext context) {
    final effectiveStyle = style ?? _styleFor(variant);
    final buttonChild = isLoading
        ? Semantics(
            liveRegion: true,
            label: AppLocalizations.of(context)!.loading,
            child: SizedBox.square(
              dimension: 20,
              child: CircularProgressIndicator(
                strokeWidth: 2,
                color: variant == AppButtonVariant.primary
                    ? AppColors.onPrimary
                    : AppColors.primaryContainer,
              ),
            ),
          )
        : Row(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              if (leadingIcon != null) ...[
                leadingIcon!,
                const SizedBox(width: AppSpacing.small),
              ],
              child,
              if (trailingIcon != null) ...[
                const SizedBox(width: AppSpacing.small),
                trailingIcon!,
              ],
            ],
          );

    final enabledCallback = isLoading ? null : onPressed;
    final button = switch (variant) {
      AppButtonVariant.primary => FilledButton(
        onPressed: enabledCallback,
        style: effectiveStyle,
        child: buttonChild,
      ),
      AppButtonVariant.secondary => OutlinedButton(
        onPressed: enabledCallback,
        style: effectiveStyle,
        child: buttonChild,
      ),
      AppButtonVariant.outlined => OutlinedButton(
        onPressed: enabledCallback,
        style: effectiveStyle,
        child: buttonChild,
      ),
      AppButtonVariant.text => TextButton(
        onPressed: enabledCallback,
        style: effectiveStyle,
        child: buttonChild,
      ),
    };

    return expand ? SizedBox(width: double.infinity, child: button) : button;
  }

  ButtonStyle _styleFor(AppButtonVariant variant) {
    final textStyle = AppTypography.textTheme.labelLarge?.copyWith(
      fontWeight: FontWeight.w700,
    );
    final shape = RoundedRectangleBorder(
      borderRadius: AppShapeTokens.standardBorderRadius,
    );

    return switch (variant) {
      AppButtonVariant.primary => FilledButton.styleFrom(
        minimumSize: const Size(0, 52),
        padding: const EdgeInsets.symmetric(horizontal: 16),
        backgroundColor: AppColors.primaryContainer,
        foregroundColor: AppColors.onPrimary,
        disabledBackgroundColor: AppColors.onSurface.withValues(alpha: 0.12),
        disabledForegroundColor: AppColors.onSurface.withValues(alpha: 0.38),
        elevation: 4,
        shadowColor: AppColors.primary.withValues(alpha: 0.2),
        overlayColor: AppColors.primary.withValues(alpha: 0.08),
        shape: shape,
        textStyle: textStyle,
      ),
      AppButtonVariant.secondary => OutlinedButton.styleFrom(
        minimumSize: const Size(0, 52),
        padding: const EdgeInsets.symmetric(horizontal: 16),
        backgroundColor: AppColors.secondaryContainer.withValues(alpha: 0.6),
        foregroundColor: AppColors.primaryContainer,
        disabledBackgroundColor: AppColors.onSurface.withValues(alpha: 0.12),
        disabledForegroundColor: AppColors.onSurface.withValues(alpha: 0.38),
        side: BorderSide(color: AppColors.secondary.withValues(alpha: 0.3)),
        shape: shape,
        textStyle: textStyle,
      ),
      AppButtonVariant.outlined => OutlinedButton.styleFrom(
        minimumSize: const Size(0, 52),
        padding: const EdgeInsets.symmetric(horizontal: 16),
        foregroundColor: AppColors.primaryContainer,
        disabledForegroundColor: AppColors.onSurface.withValues(alpha: 0.38),
        side: const BorderSide(color: AppColors.secondary),
        shape: shape,
        textStyle: textStyle,
      ),
      AppButtonVariant.text => TextButton.styleFrom(
        minimumSize: const Size(0, 44),
        padding: const EdgeInsets.symmetric(horizontal: 12),
        foregroundColor: AppColors.primaryContainer,
        disabledForegroundColor: AppColors.onSurface.withValues(alpha: 0.38),
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(AppShapeTokens.pill),
        ),
        textStyle: textStyle,
      ),
    };
  }
}
