import 'package:flutter/material.dart';

/// Color tokens mapped from the approved design's Tailwind color scheme.
abstract final class AppColors {
  static const primary = Color(0xFF004131);
  static const onPrimary = Color(0xFFFFFFFF);
  static const primaryContainer = Color(0xFF145A46);
  static const onPrimaryContainer = Color(0xFF8ECFB6);
  static const inversePrimary = Color(0xFF92D4BA);

  static const secondary = Color(0xFF006C53);
  static const onSecondary = Color(0xFFFFFFFF);
  static const secondaryContainer = Color(0xFF9AF4D4);
  static const onSecondaryContainer = Color(0xFF027259);

  static const tertiary = Color(0xFF2A3D36);
  static const onTertiary = Color(0xFFFFFFFF);
  static const tertiaryContainer = Color(0xFF40544D);
  static const onTertiaryContainer = Color(0xFFB2C7BE);

  static const error = Color(0xFFBA1A1A);
  static const onError = Color(0xFFFFFFFF);
  static const errorContainer = Color(0xFFFFDAD6);
  static const onErrorContainer = Color(0xFF93000A);

  static const background = Color(0xFFEDFDF3);
  static const onBackground = Color(0xFF111E19);
  static const surface = Color(0xFFEDFDF3);
  static const surfaceDim = Color(0xFFCEDED4);
  static const surfaceBright = Color(0xFFEDFDF3);
  static const surfaceContainerLowest = Color(0xFFFFFFFF);
  static const surfaceContainerLow = Color(0xFFE7F7EE);
  static const surfaceContainer = Color(0xFFE2F2E8);
  static const surfaceContainerHigh = Color(0xFFDCECE2);
  static const surfaceContainerHighest = Color(0xFFD6E6DD);
  static const surfaceVariant = Color(0xFFD6E6DD);
  static const surfaceTint = Color(0xFF276954);
  static const onSurface = Color(0xFF111E19);
  static const onSurfaceVariant = Color(0xFF404944);
  static const inverseSurface = Color(0xFF26332D);
  static const inverseOnSurface = Color(0xFFE5F5EB);
  static const outline = Color(0xFF707974);
  static const outlineVariant = Color(0xFFBFC9C3);

  static const primaryFixed = Color(0xFFAEF0D6);
  static const primaryFixedDim = Color(0xFF92D4BA);
  static const onPrimaryFixed = Color(0xFF002117);
  static const onPrimaryFixedVariant = Color(0xFF04513D);
  static const secondaryFixed = Color(0xFF9AF4D4);
  static const secondaryFixedDim = Color(0xFF7ED7B8);
  static const onSecondaryFixed = Color(0xFF002117);
  static const onSecondaryFixedVariant = Color(0xFF00513E);
  static const tertiaryFixed = Color(0xFFD2E7DE);
  static const tertiaryFixedDim = Color(0xFFB6CBC2);
  static const onTertiaryFixed = Color(0xFF0C1F19);
  static const onTertiaryFixedVariant = Color(0xFF384B44);

  /// Semantic state colors documented for the product's non-Material states.
  static const success = Color(0xFF2E9D69);
  static const warning = Color(0xFFE6A23C);
}
