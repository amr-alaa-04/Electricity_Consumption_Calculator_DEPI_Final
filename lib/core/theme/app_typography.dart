import 'package:flutter/material.dart';

/// Typography scale and font families from the approved HTML design.
abstract final class AppTypography {
  static const latinFontFamily = 'IBM Plex Sans';
  static const arabicFontFamily = 'IBM Plex Sans Arabic';

  /// The Arabic family is a fallback for Arabic glyphs; Latin uses Plex Sans.
  static const fontFallback = [arabicFontFamily];

  static TextStyle _style({
    required double fontSize,
    required double lineHeight,
    FontWeight fontWeight = FontWeight.w400,
    bool tabularFigures = false,
  }) => TextStyle(
    fontFamily: latinFontFamily,
    fontFamilyFallback: fontFallback,
    fontSize: fontSize,
    height: lineHeight / fontSize,
    fontWeight: fontWeight,
    fontFeatures: tabularFigures ? const [FontFeature.tabularFigures()] : null,
  );

  static final textTheme = TextTheme(
    displayLarge: _style(
      fontSize: 36,
      lineHeight: 44,
      fontWeight: FontWeight.w700,
    ),
    headlineLarge: _style(
      fontSize: 28,
      lineHeight: 36,
      fontWeight: FontWeight.w600,
    ),
    headlineMedium: _style(
      fontSize: 20,
      lineHeight: 28,
      fontWeight: FontWeight.w600,
    ),
    headlineSmall: _style(
      fontSize: 18,
      lineHeight: 24,
      fontWeight: FontWeight.w600,
    ),
    titleLarge: _style(
      fontSize: 16,
      lineHeight: 24,
      fontWeight: FontWeight.w600,
    ),
    bodyLarge: _style(fontSize: 16, lineHeight: 24),
    bodyMedium: _style(fontSize: 14, lineHeight: 20),
    bodySmall: _style(fontSize: 12, lineHeight: 16),
    labelLarge: _style(
      fontSize: 14,
      lineHeight: 20,
      fontWeight: FontWeight.w600,
    ),
    labelMedium: _style(
      fontSize: 12,
      lineHeight: 16,
      fontWeight: FontWeight.w500,
    ),
    labelSmall: _style(
      fontSize: 11,
      lineHeight: 14,
      fontWeight: FontWeight.w500,
    ),
  );

  static final displayLargeMobile = _style(
    fontSize: 30,
    lineHeight: 38,
    fontWeight: FontWeight.w700,
  );
  static final headlineLargeMobile = _style(
    fontSize: 24,
    lineHeight: 32,
    fontWeight: FontWeight.w600,
  );
  static final currencyDisplay = _style(
    fontSize: 40,
    lineHeight: 48,
    fontWeight: FontWeight.w700,
    tabularFigures: true,
  );
  static final currencyDisplayMobile = _style(
    fontSize: 32,
    lineHeight: 40,
    fontWeight: FontWeight.w700,
    tabularFigures: true,
  );

  /// Adds lining tabular figures to numerical metric styles.
  static TextStyle withTabularFigures(TextStyle style) => style.copyWith(
    fontFeatures: [...?style.fontFeatures, const FontFeature.tabularFigures()],
  );
}
