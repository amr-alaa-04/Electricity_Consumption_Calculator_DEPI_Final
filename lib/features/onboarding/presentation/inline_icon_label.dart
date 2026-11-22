import 'package:flutter/material.dart';

import '../../../core/theme/app_shape_tokens.dart';
import '../../../core/theme/app_typography.dart';

class InlineIconLabel extends StatelessWidget {
  const InlineIconLabel({
    required this.icon,
    required this.label,
    required this.color,
    super.key,
  });

  final IconData icon;
  final String label;
  final Color color;

  @override
  Widget build(BuildContext context) => Row(
    mainAxisSize: MainAxisSize.min,
    children: [
      Icon(icon, size: 17, color: color),
      const SizedBox(width: AppSpacing.micro),
      Flexible(
        child: Text(
          label,
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
          style: AppTypography.textTheme.labelSmall?.copyWith(color: color),
        ),
      ),
    ],
  );
}
