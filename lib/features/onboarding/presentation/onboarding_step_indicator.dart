import 'package:flutter/material.dart';

import '../../../core/theme/app_colors.dart';
import '../../../core/theme/app_shape_tokens.dart';

class OnboardingStepIndicator extends StatelessWidget {
  const OnboardingStepIndicator({
    required this.active,
    this.activeColor = AppColors.primaryContainer,
    super.key,
  });

  final bool active;
  final Color activeColor;

  @override
  Widget build(BuildContext context) => AnimatedContainer(
    duration: const Duration(milliseconds: 300),
    width: active ? 32 : 8,
    height: 8,
    decoration: BoxDecoration(
      color: active ? activeColor : AppColors.outlineVariant.withValues(alpha: 0.5),
      borderRadius: const BorderRadius.all(AppShapeTokens.pill),
    ),
  );
}
