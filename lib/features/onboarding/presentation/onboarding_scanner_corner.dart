import 'package:flutter/material.dart';

import '../../../core/theme/app_colors.dart';

class OnboardingScannerCorner extends StatelessWidget {
  const OnboardingScannerCorner({required this.top, required this.right, super.key});

  final bool top;
  final bool right;

  @override
  Widget build(BuildContext context) {
    const color = AppColors.primaryContainer;
    return SizedBox(
      width: 16,
      height: 16,
      child: DecoratedBox(
        decoration: BoxDecoration(
          border: Border(
            top: top ? const BorderSide(color: color, width: 2) : BorderSide.none,
            bottom: top ? BorderSide.none : const BorderSide(color: color, width: 2),
            right: right ? const BorderSide(color: color, width: 2) : BorderSide.none,
            left: right ? BorderSide.none : const BorderSide(color: color, width: 2),
          ),
        ),
      ),
    );
  }
}
