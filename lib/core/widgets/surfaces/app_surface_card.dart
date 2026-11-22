import 'package:flutter/material.dart';

import '../../theme/app_colors.dart';
import '../../theme/app_shape_tokens.dart';

/// White content surface with the app's standard border and soft elevation.
class AppSurfaceCard extends StatelessWidget {
  const AppSurfaceCard({
    required this.child,
    this.width,
    this.padding = const EdgeInsets.all(AppSpacing.medium),
    this.backgroundColor = AppColors.surfaceContainerLowest,
    this.borderRadius = const BorderRadius.all(AppShapeTokens.large),
    this.borderColor,
    this.borderWidth = 1,
    this.elevation = 1,
    this.boxShadow,
    super.key,
  }) : assert(borderWidth >= 0),
       assert(elevation >= 0);

  final Widget child;
  final double? width;
  final EdgeInsetsGeometry padding;
  final Color backgroundColor;
  final BorderRadius borderRadius;
  final Color? borderColor;
  final double borderWidth;

  /// Scales the default soft shadow; zero removes elevation.
  final double elevation;

  /// Replaces the default elevation shadow when provided.
  final List<BoxShadow>? boxShadow;

  @override
  Widget build(BuildContext context) {
    final effectiveBorderColor = borderColor ?? AppColors.outlineVariant.withValues(alpha: 0.3);

    return Container(
      width: width,
      padding: padding,
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: borderRadius,
        border: borderWidth == 0
            ? null
            : Border.all(color: effectiveBorderColor, width: borderWidth),
        boxShadow: boxShadow ?? _shadowsForElevation(),
      ),
      child: child,
    );
  }

  List<BoxShadow> _shadowsForElevation() {
    if (elevation == 0) return const [];

    return [
      BoxShadow(
        color: AppColors.primary.withValues(alpha: 0.04 * elevation),
        blurRadius: 8 * elevation,
        offset: Offset(0, 2 * elevation),
      ),
      BoxShadow(
        color: AppColors.onSurface.withValues(alpha: 0.02 * elevation),
        blurRadius: 2 * elevation,
        offset: Offset(0, elevation),
      ),
    ];
  }
}
