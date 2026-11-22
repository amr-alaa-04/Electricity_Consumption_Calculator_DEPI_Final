import 'package:flutter/material.dart';

/// Temporary route target for the third onboarding step.
class OnboardingBudgetEnergySavingPlaceholder extends StatelessWidget {
  const OnboardingBudgetEnergySavingPlaceholder({super.key});

  @override
  Widget build(BuildContext context) {
    return const SizedBox.shrink(
      key: ValueKey('onboarding-budget-energy-saving-placeholder'),
    );
  }
}
