import 'package:flutter/material.dart';

import '../../theme/app_colors.dart';
import '../../theme/app_shape_tokens.dart';

/// Shared field decoration so wrappers keep identical dimensions and states.
abstract final class AppInputDecoration {
  static InputDecoration build(
    BuildContext context, {
    String? labelText,
    String? hintText,
    String? helperText,
    Widget? prefixIcon,
    Widget? suffixIcon,
  }) {
    final scheme = Theme.of(context).colorScheme;
    final borderRadius = BorderRadius.all(AppShapeTokens.medium);

    return InputDecoration(
      labelText: labelText,
      hintText: hintText,
      helperText: helperText,
      prefixIcon: prefixIcon,
      suffixIcon: suffixIcon,
      filled: true,
      fillColor: AppColors.surfaceContainerLowest,
      isDense: false,
      constraints: const BoxConstraints(minHeight: 52),
      contentPadding: const EdgeInsets.symmetric(
        horizontal: AppSpacing.medium,
        vertical: AppSpacing.small,
      ),
      hintStyle: Theme.of(context).textTheme.bodyMedium?.copyWith(
        color: AppColors.outlineVariant,
      ),
      border: OutlineInputBorder(
        borderRadius: borderRadius,
        borderSide: BorderSide(color: AppColors.outlineVariant.withValues(alpha: 0.6)),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: borderRadius,
        borderSide: BorderSide(color: AppColors.outlineVariant.withValues(alpha: 0.6)),
      ),
      disabledBorder: OutlineInputBorder(
        borderRadius: borderRadius,
        borderSide: BorderSide(color: AppColors.outlineVariant.withValues(alpha: 0.3)),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: borderRadius,
        borderSide: BorderSide(color: AppColors.secondary, width: 2),
      ),
      errorBorder: OutlineInputBorder(
        borderRadius: borderRadius,
        borderSide: BorderSide(color: scheme.error),
      ),
      focusedErrorBorder: OutlineInputBorder(
        borderRadius: borderRadius,
        borderSide: BorderSide(color: scheme.error, width: 2),
      ),
    );
  }
}
