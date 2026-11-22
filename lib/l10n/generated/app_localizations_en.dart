// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for English (`en`).
class AppLocalizationsEn extends AppLocalizations {
  AppLocalizationsEn([String locale = 'en']) : super(locale);

  @override
  String get appTitle => 'Electricity Consumption Calculator';

  @override
  String get showPassword => 'Show password';

  @override
  String get hidePassword => 'Hide password';

  @override
  String get loading => 'Loading';

  @override
  String get invalidNumber => 'Enter a valid number';

  @override
  String get onboardingSkip => 'Skip';

  @override
  String get onboardingOcrStatus => 'Smart scanner (OCR)';

  @override
  String get onboardingAccuracy => '99.8% accurate';

  @override
  String get onboardingCurrentMeter => 'Current digital meter';

  @override
  String get onboardingAutoRecognition => 'Automatic number recognition';

  @override
  String get onboardingCaptured => 'Captured';

  @override
  String get onboardingTierInstant => 'Instant tier calculation';

  @override
  String get onboardingTierExample => 'Illustrative tier 4 (up to 350 kWh)';

  @override
  String get onboardingSampleTariffDisclaimer =>
      'Sample Illustrative Tariff — Requires Verification against Official EgyptERA Schedules';

  @override
  String get onboardingTrackTitle => 'Record your meter readings easily and accurately';

  @override
  String get onboardingTrackDescription =>
      'Capture a photo with OCR, enter a reading by voice, or record it manually. Avoid accumulated bills and rough estimates.';

  @override
  String get onboardingCameraFeatureTitle => 'Smart AI camera scanning';

  @override
  String get onboardingCameraFeatureDescription =>
      'Quick capture for mechanical dial or digital display meters';

  @override
  String get onboardingVoiceFeatureTitle => 'Quick voice entry for numbers';

  @override
  String get onboardingVoiceFeatureDescription =>
      'Speak the numbers directly without typing them by hand';

  @override
  String get onboardingAlertFeatureTitle => 'Alert for unusual readings';

  @override
  String get onboardingAlertFeatureDescription =>
      'Compare usage patterns and avoid unexplained tier jumps';

  @override
  String get onboardingAccuracyLabel => 'Accurate billing';

  @override
  String get onboardingNext => 'Next';

  @override
  String onboardingStepCount(int current, int total) {
    return 'Step $current of $total';
  }

  @override
  String get onboardingPrevious => 'Previous';

  @override
  String get onboardingBillTitle => 'Accurate calculations with Egyptian electricity tiers';

  @override
  String get onboardingBillDescription =>
      'Estimate your cost using Egypt’s progressive electricity tiers and see your target tier before the bill arrives.';

  @override
  String get onboardingBillIllustrativeDisclaimer =>
      'Illustrative sample values only — not an official tariff or bill calculation.';

  @override
  String get onboardingBillTierThree => 'Tier 3 (101–200 kWh)';

  @override
  String get onboardingBillTierThreeRate => '120 piastres/kWh';

  @override
  String get onboardingBillTierTwo => 'Tier 2 (51–100 kWh)';

  @override
  String get onboardingBillTargetTier => 'Current target tier';

  @override
  String get onboardingBillActive => 'Active now';

  @override
  String get onboardingBillEstimatedValue => 'Estimated usage value';

  @override
  String get onboardingBillExampleAmount => '148.50';

  @override
  String get onboardingBillCurrency => 'EGP';

  @override
  String get onboardingBillEquivalentBalance => 'Equivalent consumption';

  @override
  String get onboardingBillExampleUsage => '95';

  @override
  String get onboardingBillUsageUnit => 'kWh';

  @override
  String get onboardingBillSafetyIndicator => 'Tier safety indicator';

  @override
  String get onboardingBillRemainingUsage => '5 kWh left before tier 3';

  @override
  String get onboardingBillThresholdStart => '50 kWh';

  @override
  String get onboardingBillThresholdEnd => '100 kWh';

  @override
  String get onboardingBillCapacityPercent => '82% of tier capacity';

  @override
  String get onboardingBillTierOneLabel => 'Tier 1';

  @override
  String get onboardingBillTierOneRate => '68 p';

  @override
  String get onboardingBillTierTwoLabel => 'Tier 2';

  @override
  String get onboardingBillTierTwoRate => '78 p';

  @override
  String get onboardingBillTierThreeLabel => 'Tier 3';

  @override
  String get onboardingBillTierThreeShortRate => '95 p';

  @override
  String get onboardingBillTierFourLabel => 'Tier 4';

  @override
  String get onboardingBillTierFourRate => '155 p';

  @override
  String get onboardingBillTierFiveLabel => 'Tier 5';

  @override
  String get onboardingBillTierFiveRate => '195 p';

  @override
  String get onboardingBillFeesTitle => 'Additional fees included';

  @override
  String get onboardingBillFeesDescription =>
      'Support for service fees and government duties according to official updates.';

  @override
  String get onboardingBillProximityTitle => 'Know when a tier may change';

  @override
  String get onboardingBillProximityDescription =>
      'See how close you are to a higher priced tier and avoid unexpected charges.';

  @override
  String get onboardingBillSavingsTitle => 'Personalized saving guidance';

  @override
  String get onboardingBillSavingsDescription =>
      'Tips to help avoid the next tier based on when high consumption appliances are used.';
}

/// The translations for English, as used in the United States (`en_US`).
class AppLocalizationsEnUs extends AppLocalizationsEn {
  AppLocalizationsEnUs() : super('en_US');

  @override
  String get appTitle => 'Electricity Consumption Calculator';

  @override
  String get showPassword => 'Show password';

  @override
  String get hidePassword => 'Hide password';

  @override
  String get loading => 'Loading';

  @override
  String get invalidNumber => 'Enter a valid number';

  @override
  String get onboardingSkip => 'Skip';

  @override
  String get onboardingOcrStatus => 'Smart scanner (OCR)';

  @override
  String get onboardingAccuracy => '99.8% accurate';

  @override
  String get onboardingCurrentMeter => 'Current digital meter';

  @override
  String get onboardingAutoRecognition => 'Automatic number recognition';

  @override
  String get onboardingCaptured => 'Captured';

  @override
  String get onboardingTierInstant => 'Instant tier calculation';

  @override
  String get onboardingTierExample => 'Illustrative tier 4 (up to 350 kWh)';

  @override
  String get onboardingSampleTariffDisclaimer =>
      'Sample Illustrative Tariff — Requires Verification against Official EgyptERA Schedules';

  @override
  String get onboardingTrackTitle => 'Record your meter readings easily and accurately';

  @override
  String get onboardingTrackDescription =>
      'Capture a photo with OCR, enter a reading by voice, or record it manually. Avoid accumulated bills and rough estimates.';

  @override
  String get onboardingCameraFeatureTitle => 'Smart AI camera scanning';

  @override
  String get onboardingCameraFeatureDescription =>
      'Quick capture for mechanical dial or digital display meters';

  @override
  String get onboardingVoiceFeatureTitle => 'Quick voice entry for numbers';

  @override
  String get onboardingVoiceFeatureDescription =>
      'Speak the numbers directly without typing them by hand';

  @override
  String get onboardingAlertFeatureTitle => 'Alert for unusual readings';

  @override
  String get onboardingAlertFeatureDescription =>
      'Compare usage patterns and avoid unexplained tier jumps';

  @override
  String get onboardingAccuracyLabel => 'Accurate billing';

  @override
  String get onboardingNext => 'Next';

  @override
  String onboardingStepCount(int current, int total) {
    return 'Step $current of $total';
  }

  @override
  String get onboardingPrevious => 'Previous';

  @override
  String get onboardingBillTitle => 'Accurate calculations with Egyptian electricity tiers';

  @override
  String get onboardingBillDescription =>
      'Estimate your cost using Egypt’s progressive electricity tiers and see your target tier before the bill arrives.';

  @override
  String get onboardingBillIllustrativeDisclaimer =>
      'Illustrative sample values only — not an official tariff or bill calculation.';

  @override
  String get onboardingBillTierThree => 'Tier 3 (101–200 kWh)';

  @override
  String get onboardingBillTierThreeRate => '120 piastres/kWh';

  @override
  String get onboardingBillTierTwo => 'Tier 2 (51–100 kWh)';

  @override
  String get onboardingBillTargetTier => 'Current target tier';

  @override
  String get onboardingBillActive => 'Active now';

  @override
  String get onboardingBillEstimatedValue => 'Estimated usage value';

  @override
  String get onboardingBillExampleAmount => '148.50';

  @override
  String get onboardingBillCurrency => 'EGP';

  @override
  String get onboardingBillEquivalentBalance => 'Equivalent consumption';

  @override
  String get onboardingBillExampleUsage => '95';

  @override
  String get onboardingBillUsageUnit => 'kWh';

  @override
  String get onboardingBillSafetyIndicator => 'Tier safety indicator';

  @override
  String get onboardingBillRemainingUsage => '5 kWh left before tier 3';

  @override
  String get onboardingBillThresholdStart => '50 kWh';

  @override
  String get onboardingBillThresholdEnd => '100 kWh';

  @override
  String get onboardingBillCapacityPercent => '82% of tier capacity';

  @override
  String get onboardingBillTierOneLabel => 'Tier 1';

  @override
  String get onboardingBillTierOneRate => '68 p';

  @override
  String get onboardingBillTierTwoLabel => 'Tier 2';

  @override
  String get onboardingBillTierTwoRate => '78 p';

  @override
  String get onboardingBillTierThreeLabel => 'Tier 3';

  @override
  String get onboardingBillTierThreeShortRate => '95 p';

  @override
  String get onboardingBillTierFourLabel => 'Tier 4';

  @override
  String get onboardingBillTierFourRate => '155 p';

  @override
  String get onboardingBillTierFiveLabel => 'Tier 5';

  @override
  String get onboardingBillTierFiveRate => '195 p';

  @override
  String get onboardingBillFeesTitle => 'Additional fees included';

  @override
  String get onboardingBillFeesDescription =>
      'Support for service fees and government duties according to official updates.';

  @override
  String get onboardingBillProximityTitle => 'Know when a tier may change';

  @override
  String get onboardingBillProximityDescription =>
      'See how close you are to a higher priced tier and avoid unexpected charges.';

  @override
  String get onboardingBillSavingsTitle => 'Personalized saving guidance';

  @override
  String get onboardingBillSavingsDescription =>
      'Tips to help avoid the next tier based on when high consumption appliances are used.';
}
