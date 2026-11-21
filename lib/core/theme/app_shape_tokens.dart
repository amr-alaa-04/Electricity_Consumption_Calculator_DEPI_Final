import 'package:flutter/material.dart';

/// Shared shape tokens from the design's Tailwind rounded scale.
abstract final class AppShapeTokens {
  static const small = Radius.circular(4);
  static const standard = Radius.circular(8);
  static const medium = Radius.circular(12);
  static const large = Radius.circular(16);
  static const extraLarge = Radius.circular(24);
  static const pill = Radius.circular(9999);

  static const standardBorderRadius = BorderRadius.all(large);
}

/// Core spacing values use the design's 4/8 point spacing scale.
abstract final class AppSpacing {
  static const double micro = 4;
  static const double small = 8;
  static const double medium = 16;
  static const double large = 24;
  static const double extraLarge = 32;
  static const double mobileGutter = 12;
  static const double gutter = 16;
  static const double marginMobile = medium;
  static const double margin = large;
}
