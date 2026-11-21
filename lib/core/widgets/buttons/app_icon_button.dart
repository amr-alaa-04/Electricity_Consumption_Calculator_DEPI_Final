import 'package:flutter/material.dart';

import '../../theme/app_colors.dart';
import '../../theme/app_shape_tokens.dart';

/// Icon-only action button. A descriptive tooltip is required for semantics.
class AppIconButton extends StatelessWidget {
  const AppIconButton({
    required this.icon,
    required this.tooltip,
    required this.onPressed,
    this.backgroundColor = Colors.transparent,
    this.foregroundColor = AppColors.primaryContainer,
    this.iconSize = 24,
    super.key,
  });

  final Widget icon;
  final String tooltip;
  final VoidCallback? onPressed;
  final Color backgroundColor;
  final Color foregroundColor;
  final double iconSize;

  @override
  Widget build(BuildContext context) {
    return IconButton(
      tooltip: tooltip,
      onPressed: onPressed,
      icon: icon,
      iconSize: iconSize,
      style: IconButton.styleFrom(
        minimumSize: const Size.square(44),
        padding: const EdgeInsets.all(10),
        backgroundColor: backgroundColor,
        foregroundColor: foregroundColor,
        disabledForegroundColor: AppColors.onSurface.withValues(alpha: 0.38),
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(AppShapeTokens.pill),
        ),
      ),
    );
  }
}
