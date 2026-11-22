import 'package:flutter/material.dart';

import '../../theme/app_colors.dart';
import '../../theme/app_shape_tokens.dart';

/// Tinted icon container used to identify actions and content categories.
class AppIconTile extends StatelessWidget {
  const AppIconTile({
    required this.icon,
    this.size = 40,
    this.iconSize = 20,
    this.backgroundColor,
    this.iconColor = AppColors.secondary,
    this.borderRadius = const BorderRadius.all(AppShapeTokens.medium),
    this.onTap,
    this.semanticLabel,
    super.key,
  }) : assert(size > 0),
       assert(iconSize > 0);

  final IconData icon;
  final double size;
  final double iconSize;
  final Color? backgroundColor;
  final Color iconColor;
  final BorderRadius borderRadius;
  final VoidCallback? onTap;
  final String? semanticLabel;

  @override
  Widget build(BuildContext context) {
    final effectiveBackgroundColor =
        backgroundColor ?? AppColors.secondaryContainer.withValues(alpha: 0.4);

    return Semantics(
      label: semanticLabel,
      button: onTap != null,
      child: Material(
        color: effectiveBackgroundColor,
        borderRadius: borderRadius,
        child: InkWell(
          onTap: onTap,
          borderRadius: borderRadius,
          child: SizedBox.square(
            dimension: size,
            child: Center(
              child: Icon(icon, size: iconSize, color: iconColor),
            ),
          ),
        ),
      ),
    );
  }
}
