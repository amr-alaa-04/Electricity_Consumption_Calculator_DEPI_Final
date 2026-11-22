import 'package:flutter/material.dart';

import '../../../core/theme/app_colors.dart';

class OnboardingStatusDot extends StatelessWidget {
  const OnboardingStatusDot({super.key});

  @override
  Widget build(BuildContext context) => Container(
    width: 10,
    height: 10,
    decoration: const BoxDecoration(
      color: AppColors.primaryContainer,
      shape: BoxShape.circle,
    ),
  );
}
