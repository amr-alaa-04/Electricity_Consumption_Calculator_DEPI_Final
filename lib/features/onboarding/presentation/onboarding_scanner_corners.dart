import 'package:flutter/material.dart';

import 'onboarding_scanner_corner.dart';

class OnboardingScannerCorners extends StatelessWidget {
  const OnboardingScannerCorners({super.key});

  @override
  Widget build(BuildContext context) {
    return const Stack(
      children: [
        Positioned(top: 0, right: 0, child: OnboardingScannerCorner(top: true, right: true)),
        Positioned(top: 0, left: 0, child: OnboardingScannerCorner(top: true, right: false)),
        Positioned(bottom: 0, right: 0, child: OnboardingScannerCorner(top: false, right: true)),
        Positioned(bottom: 0, left: 0, child: OnboardingScannerCorner(top: false, right: false)),
      ],
    );
  }
}
