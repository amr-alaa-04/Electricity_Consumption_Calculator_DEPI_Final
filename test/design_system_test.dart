import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:electricity_consumption_calculator/core/theme/app_colors.dart';
import 'package:electricity_consumption_calculator/core/theme/app_shape_tokens.dart';
import 'package:electricity_consumption_calculator/core/theme/app_theme.dart';
import 'package:electricity_consumption_calculator/core/theme/app_typography.dart';
import 'package:electricity_consumption_calculator/features/onboarding/presentation/onboarding_track_electricity_screen.dart';
import 'package:electricity_consumption_calculator/main.dart';

void main() {
  test('design colors map explicitly to the Material 3 color scheme', () {
    final scheme = AppTheme.light.colorScheme;

    expect(scheme.primary, const Color(0xFF004131));
    expect(scheme.onPrimary, Colors.white);
    expect(scheme.primaryContainer, const Color(0xFF145A46));
    expect(scheme.onPrimaryContainer, const Color(0xFF8ECFB6));
    expect(scheme.inversePrimary, const Color(0xFF92D4BA));
    expect(scheme.secondary, const Color(0xFF006C53));
    expect(scheme.onSecondary, Colors.white);
    expect(scheme.secondaryContainer, const Color(0xFF9AF4D4));
    expect(scheme.onSecondaryContainer, const Color(0xFF027259));
    expect(scheme.tertiary, const Color(0xFF2A3D36));
    expect(scheme.onTertiary, Colors.white);
    expect(scheme.tertiaryContainer, const Color(0xFF40544D));
    expect(scheme.onTertiaryContainer, const Color(0xFFB2C7BE));
    expect(scheme.error, const Color(0xFFBA1A1A));
    expect(scheme.onError, Colors.white);
    expect(scheme.errorContainer, const Color(0xFFFFDAD6));
    expect(scheme.onErrorContainer, const Color(0xFF93000A));
    expect(AppColors.background, scheme.surface);
    expect(AppColors.onBackground, scheme.onSurface);
    expect(scheme.surface, const Color(0xFFEDFDF3));
    expect(scheme.surfaceContainerLowest, Colors.white);
    expect(scheme.surfaceContainerLow, const Color(0xFFE7F7EE));
    expect(scheme.surfaceContainer, const Color(0xFFE2F2E8));
    expect(scheme.surfaceContainerHigh, const Color(0xFFDCECE2));
    expect(scheme.surfaceContainerHighest, const Color(0xFFD6E6DD));
    expect(scheme.surfaceDim, const Color(0xFFCEDED4));
    expect(scheme.surfaceBright, const Color(0xFFEDFDF3));
    expect(scheme.surfaceTint, const Color(0xFF276954));
    expect(scheme.inverseSurface, const Color(0xFF26332D));
    expect(scheme.onInverseSurface, const Color(0xFFE5F5EB));
    expect(scheme.inversePrimary, const Color(0xFF92D4BA));
    expect(AppColors.surfaceVariant, scheme.surfaceContainerHighest);
    expect(scheme.primaryFixed, const Color(0xFFAEF0D6));
    expect(scheme.primaryFixedDim, const Color(0xFF92D4BA));
    expect(scheme.onPrimaryFixed, const Color(0xFF002117));
    expect(scheme.onPrimaryFixedVariant, const Color(0xFF04513D));
    expect(scheme.secondaryFixed, const Color(0xFF9AF4D4));
    expect(scheme.secondaryFixedDim, const Color(0xFF7ED7B8));
    expect(scheme.onSecondaryFixed, const Color(0xFF002117));
    expect(scheme.onSecondaryFixedVariant, const Color(0xFF00513E));
    expect(scheme.tertiaryFixed, const Color(0xFFD2E7DE));
    expect(scheme.tertiaryFixedDim, const Color(0xFFB6CBC2));
    expect(scheme.onTertiaryFixed, const Color(0xFF0C1F19));
    expect(scheme.onTertiaryFixedVariant, const Color(0xFF384B44));
    expect(scheme.onSurface, const Color(0xFF111E19));
    expect(scheme.onSurfaceVariant, const Color(0xFF404944));
    expect(scheme.outline, const Color(0xFF707974));
    expect(scheme.outlineVariant, const Color(0xFFBFC9C3));
    expect(AppColors.success, const Color(0xFF2E9D69));
    expect(AppColors.warning, const Color(0xFFE6A23C));
  });

  test('typography scale preserves design sizes, weights, and font families', () {
    expect(AppTypography.latinFontFamily, 'IBM Plex Sans');
    expect(AppTypography.arabicFontFamily, 'IBM Plex Sans Arabic');
    expect(AppTypography.textTheme.displayLarge?.fontSize, 36);
    expect(AppTypography.textTheme.displayLarge?.height, 44 / 36);
    expect(AppTypography.textTheme.displayLarge?.fontWeight, FontWeight.w700);
    expect(AppTypography.textTheme.headlineLarge?.fontSize, 28);
    expect(AppTypography.textTheme.headlineLarge?.height, 36 / 28);
    expect(AppTypography.textTheme.headlineLarge?.fontWeight, FontWeight.w600);
    expect(AppTypography.textTheme.headlineMedium?.fontSize, 20);
    expect(AppTypography.textTheme.headlineSmall?.fontSize, 18);
    expect(AppTypography.textTheme.bodyLarge?.fontSize, 16);
    expect(
      AppTypography.textTheme.bodyLarge?.fontFamilyFallback,
      contains(AppTypography.arabicFontFamily),
    );
    expect(AppTypography.textTheme.bodyMedium?.fontSize, 14);
    expect(AppTypography.textTheme.bodySmall?.fontSize, 12);
    expect(AppTypography.textTheme.labelLarge?.fontWeight, FontWeight.w600);
    expect(AppTypography.textTheme.labelMedium?.fontWeight, FontWeight.w500);
    expect(AppTypography.textTheme.labelSmall?.fontSize, 11);
    expect(AppTypography.displayLargeMobile.fontSize, 30);
    expect(AppTypography.displayLargeMobile.height, 38 / 30);
    expect(AppTypography.headlineLargeMobile.fontSize, 24);
    expect(AppTypography.headlineLargeMobile.height, 32 / 24);
    expect(AppTypography.currencyDisplay.fontSize, 40);
    expect(AppTypography.currencyDisplay.height, 48 / 40);
    expect(AppTypography.currencyDisplay.fontWeight, FontWeight.w700);
    expect(AppTypography.currencyDisplayMobile.fontSize, 32);
    expect(AppTypography.currencyDisplayMobile.height, 40 / 32);
    expect(
      AppTypography.currencyDisplay.fontFeatures,
      contains(const FontFeature.tabularFigures()),
    );
    expect(
      AppTheme.light.textTheme.bodyLarge?.fontFamily,
      AppTypography.latinFontFamily,
    );
    expect(
      AppTheme.light.textTheme.bodyLarge?.fontFamilyFallback,
      contains(AppTypography.arabicFontFamily),
    );
  });

  test('bundled fonts include all four weights for both scripts', () async {
    const fontAssets = [
      'assets/fonts/ibm_plex_sans/IBMPlexSans-Regular.ttf',
      'assets/fonts/ibm_plex_sans/IBMPlexSans-Medium.ttf',
      'assets/fonts/ibm_plex_sans/IBMPlexSans-SemiBold.ttf',
      'assets/fonts/ibm_plex_sans/IBMPlexSans-Bold.ttf',
      'assets/fonts/ibm_plex_sans_arabic/IBMPlexSansArabic-Regular.ttf',
      'assets/fonts/ibm_plex_sans_arabic/IBMPlexSansArabic-Medium.ttf',
      'assets/fonts/ibm_plex_sans_arabic/IBMPlexSansArabic-SemiBold.ttf',
      'assets/fonts/ibm_plex_sans_arabic/IBMPlexSansArabic-Bold.ttf',
    ];

    for (final asset in fontAssets) {
      expect((await rootBundle.load(asset)).lengthInBytes, greaterThan(1000));
    }
  });

  test('shape and spacing tokens match documented dimensions', () {
    expect(AppShapeTokens.small.x, 4);
    expect(AppShapeTokens.standard.x, 8);
    expect(AppShapeTokens.medium.x, 12);
    expect(AppShapeTokens.large.x, 16);
    expect(AppShapeTokens.extraLarge.x, 24);
    expect(AppShapeTokens.pill.x, 9999);
    expect(AppShapeTokens.standardBorderRadius.topLeft.x, 16);
    expect(AppSpacing.micro, 4);
    expect(AppSpacing.small, 8);
    expect(AppSpacing.mobileGutter, 12);
    expect(AppSpacing.gutter, 16);
    expect(AppSpacing.marginMobile, 16);
    expect(AppSpacing.margin, 24);
    expect(AppSpacing.extraLarge, 32);
  });

  testWidgets('Material 3 app follows Arabic RTL and English LTR locales', (
    tester,
  ) async {
    expect(AppTheme.light.useMaterial3, isTrue);
    for (final testCase in [
      (const Locale('ar', 'EG'), TextDirection.rtl),
      (const Locale('en', 'US'), TextDirection.ltr),
    ]) {
      tester.platformDispatcher.localesTestValue = [testCase.$1];
      await tester.pumpWidget(const ProviderScope(child: MyApp()));
      await tester.pumpAndSettle();

      final screen = find.byType(OnboardingTrackElectricityScreen);
      expect(screen, findsOneWidget);
      expect(Directionality.of(tester.element(screen)), testCase.$2);
      expect(tester.takeException(), isNull);
    }
  });
}
