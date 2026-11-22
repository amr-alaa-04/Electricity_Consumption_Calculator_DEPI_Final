import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'app_localizations_ar.dart';
import 'app_localizations_en.dart';

// ignore_for_file: type=lint

/// Callers can lookup localized strings with an instance of AppLocalizations
/// returned by `AppLocalizations.of(context)`.
///
/// Applications need to include `AppLocalizations.delegate()` in their app's
/// `localizationDelegates` list, and the locales they support in the app's
/// `supportedLocales` list. For example:
///
/// ```dart
/// import 'generated/app_localizations.dart';
///
/// return MaterialApp(
///   localizationsDelegates: AppLocalizations.localizationsDelegates,
///   supportedLocales: AppLocalizations.supportedLocales,
///   home: MyApplicationHome(),
/// );
/// ```
///
/// ## Update pubspec.yaml
///
/// Please make sure to update your pubspec.yaml to include the following
/// packages:
///
/// ```yaml
/// dependencies:
///   # Internationalization support.
///   flutter_localizations:
///     sdk: flutter
///   intl: any # Use the pinned version from flutter_localizations
///
///   # Rest of dependencies
/// ```
///
/// ## iOS Applications
///
/// iOS applications define key application metadata, including supported
/// locales, in an Info.plist file that is built into the application bundle.
/// To configure the locales supported by your app, you’ll need to edit this
/// file.
///
/// First, open your project’s ios/Runner.xcworkspace Xcode workspace file.
/// Then, in the Project Navigator, open the Info.plist file under the Runner
/// project’s Runner folder.
///
/// Next, select the Information Property List item, select Add Item from the
/// Editor menu, then select Localizations from the pop-up menu.
///
/// Select and expand the newly-created Localizations item then, for each
/// locale your application supports, add a new item and select the locale
/// you wish to add from the pop-up menu in the Value field. This list should
/// be consistent with the languages listed in the AppLocalizations.supportedLocales
/// property.
abstract class AppLocalizations {
  AppLocalizations(String locale) : localeName = intl.Intl.canonicalizedLocale(locale.toString());

  final String localeName;

  static AppLocalizations? of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations);
  }

  static const LocalizationsDelegate<AppLocalizations> delegate = _AppLocalizationsDelegate();

  /// A list of this localizations delegate along with the default localizations
  /// delegates.
  ///
  /// Returns a list of localizations delegates containing this delegate along with
  /// GlobalMaterialLocalizations.delegate, GlobalCupertinoLocalizations.delegate,
  /// and GlobalWidgetsLocalizations.delegate.
  ///
  /// Additional delegates can be added by appending to this list in
  /// MaterialApp. This list does not have to be used at all if a custom list
  /// of delegates is preferred or required.
  static const List<LocalizationsDelegate<dynamic>> localizationsDelegates =
      <LocalizationsDelegate<dynamic>>[
        delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ];

  /// A list of this localizations delegate's supported locales.
  static const List<Locale> supportedLocales = <Locale>[
    Locale('ar'),
    Locale('ar', 'EG'),
    Locale('en'),
    Locale('en', 'US'),
  ];

  /// No description provided for @appTitle.
  ///
  /// In en_US, this message translates to:
  /// **'Electricity Consumption Calculator'**
  String get appTitle;

  /// No description provided for @showPassword.
  ///
  /// In en_US, this message translates to:
  /// **'Show password'**
  String get showPassword;

  /// No description provided for @hidePassword.
  ///
  /// In en_US, this message translates to:
  /// **'Hide password'**
  String get hidePassword;

  /// No description provided for @loading.
  ///
  /// In en_US, this message translates to:
  /// **'Loading'**
  String get loading;

  /// No description provided for @invalidNumber.
  ///
  /// In en_US, this message translates to:
  /// **'Enter a valid number'**
  String get invalidNumber;

  /// No description provided for @onboardingSkip.
  ///
  /// In en_US, this message translates to:
  /// **'Skip'**
  String get onboardingSkip;

  /// No description provided for @onboardingOcrStatus.
  ///
  /// In en_US, this message translates to:
  /// **'Smart scanner (OCR)'**
  String get onboardingOcrStatus;

  /// No description provided for @onboardingAccuracy.
  ///
  /// In en_US, this message translates to:
  /// **'99.8% accurate'**
  String get onboardingAccuracy;

  /// No description provided for @onboardingCurrentMeter.
  ///
  /// In en_US, this message translates to:
  /// **'Current digital meter'**
  String get onboardingCurrentMeter;

  /// No description provided for @onboardingAutoRecognition.
  ///
  /// In en_US, this message translates to:
  /// **'Automatic number recognition'**
  String get onboardingAutoRecognition;

  /// No description provided for @onboardingCaptured.
  ///
  /// In en_US, this message translates to:
  /// **'Captured'**
  String get onboardingCaptured;

  /// No description provided for @onboardingTierInstant.
  ///
  /// In en_US, this message translates to:
  /// **'Instant tier calculation'**
  String get onboardingTierInstant;

  /// No description provided for @onboardingTierExample.
  ///
  /// In en_US, this message translates to:
  /// **'Illustrative tier 4 (up to 350 kWh)'**
  String get onboardingTierExample;

  /// No description provided for @onboardingSampleTariffDisclaimer.
  ///
  /// In en_US, this message translates to:
  /// **'Sample Illustrative Tariff — Requires Verification against Official EgyptERA Schedules'**
  String get onboardingSampleTariffDisclaimer;

  /// No description provided for @onboardingTrackTitle.
  ///
  /// In en_US, this message translates to:
  /// **'Record your meter readings easily and accurately'**
  String get onboardingTrackTitle;

  /// No description provided for @onboardingTrackDescription.
  ///
  /// In en_US, this message translates to:
  /// **'Capture a photo with OCR, enter a reading by voice, or record it manually. Avoid accumulated bills and rough estimates.'**
  String get onboardingTrackDescription;

  /// No description provided for @onboardingCameraFeatureTitle.
  ///
  /// In en_US, this message translates to:
  /// **'Smart AI camera scanning'**
  String get onboardingCameraFeatureTitle;

  /// No description provided for @onboardingCameraFeatureDescription.
  ///
  /// In en_US, this message translates to:
  /// **'Quick capture for mechanical dial or digital display meters'**
  String get onboardingCameraFeatureDescription;

  /// No description provided for @onboardingVoiceFeatureTitle.
  ///
  /// In en_US, this message translates to:
  /// **'Quick voice entry for numbers'**
  String get onboardingVoiceFeatureTitle;

  /// No description provided for @onboardingVoiceFeatureDescription.
  ///
  /// In en_US, this message translates to:
  /// **'Speak the numbers directly without typing them by hand'**
  String get onboardingVoiceFeatureDescription;

  /// No description provided for @onboardingAlertFeatureTitle.
  ///
  /// In en_US, this message translates to:
  /// **'Alert for unusual readings'**
  String get onboardingAlertFeatureTitle;

  /// No description provided for @onboardingAlertFeatureDescription.
  ///
  /// In en_US, this message translates to:
  /// **'Compare usage patterns and avoid unexplained tier jumps'**
  String get onboardingAlertFeatureDescription;

  /// No description provided for @onboardingAccuracyLabel.
  ///
  /// In en_US, this message translates to:
  /// **'Accurate billing'**
  String get onboardingAccuracyLabel;

  /// No description provided for @onboardingNext.
  ///
  /// In en_US, this message translates to:
  /// **'Next'**
  String get onboardingNext;

  /// No description provided for @onboardingStepCount.
  ///
  /// In en_US, this message translates to:
  /// **'Step {current} of {total}'**
  String onboardingStepCount(int current, int total);

  /// No description provided for @onboardingPrevious.
  ///
  /// In en_US, this message translates to:
  /// **'Previous'**
  String get onboardingPrevious;

  /// No description provided for @onboardingBillTitle.
  ///
  /// In en_US, this message translates to:
  /// **'Accurate calculations with Egyptian electricity tiers'**
  String get onboardingBillTitle;

  /// No description provided for @onboardingBillDescription.
  ///
  /// In en_US, this message translates to:
  /// **'Estimate your cost using Egypt’s progressive electricity tiers and see your target tier before the bill arrives.'**
  String get onboardingBillDescription;

  /// No description provided for @onboardingBillIllustrativeDisclaimer.
  ///
  /// In en_US, this message translates to:
  /// **'Illustrative sample values only — not an official tariff or bill calculation.'**
  String get onboardingBillIllustrativeDisclaimer;

  /// No description provided for @onboardingBillTierThree.
  ///
  /// In en_US, this message translates to:
  /// **'Tier 3 (101–200 kWh)'**
  String get onboardingBillTierThree;

  /// No description provided for @onboardingBillTierThreeRate.
  ///
  /// In en_US, this message translates to:
  /// **'120 piastres/kWh'**
  String get onboardingBillTierThreeRate;

  /// No description provided for @onboardingBillTierTwo.
  ///
  /// In en_US, this message translates to:
  /// **'Tier 2 (51–100 kWh)'**
  String get onboardingBillTierTwo;

  /// No description provided for @onboardingBillTargetTier.
  ///
  /// In en_US, this message translates to:
  /// **'Current target tier'**
  String get onboardingBillTargetTier;

  /// No description provided for @onboardingBillActive.
  ///
  /// In en_US, this message translates to:
  /// **'Active now'**
  String get onboardingBillActive;

  /// No description provided for @onboardingBillEstimatedValue.
  ///
  /// In en_US, this message translates to:
  /// **'Estimated usage value'**
  String get onboardingBillEstimatedValue;

  /// No description provided for @onboardingBillExampleAmount.
  ///
  /// In en_US, this message translates to:
  /// **'148.50'**
  String get onboardingBillExampleAmount;

  /// No description provided for @onboardingBillCurrency.
  ///
  /// In en_US, this message translates to:
  /// **'EGP'**
  String get onboardingBillCurrency;

  /// No description provided for @onboardingBillEquivalentBalance.
  ///
  /// In en_US, this message translates to:
  /// **'Equivalent consumption'**
  String get onboardingBillEquivalentBalance;

  /// No description provided for @onboardingBillExampleUsage.
  ///
  /// In en_US, this message translates to:
  /// **'95'**
  String get onboardingBillExampleUsage;

  /// No description provided for @onboardingBillUsageUnit.
  ///
  /// In en_US, this message translates to:
  /// **'kWh'**
  String get onboardingBillUsageUnit;

  /// No description provided for @onboardingBillSafetyIndicator.
  ///
  /// In en_US, this message translates to:
  /// **'Tier safety indicator'**
  String get onboardingBillSafetyIndicator;

  /// No description provided for @onboardingBillRemainingUsage.
  ///
  /// In en_US, this message translates to:
  /// **'5 kWh left before tier 3'**
  String get onboardingBillRemainingUsage;

  /// No description provided for @onboardingBillThresholdStart.
  ///
  /// In en_US, this message translates to:
  /// **'50 kWh'**
  String get onboardingBillThresholdStart;

  /// No description provided for @onboardingBillThresholdEnd.
  ///
  /// In en_US, this message translates to:
  /// **'100 kWh'**
  String get onboardingBillThresholdEnd;

  /// No description provided for @onboardingBillCapacityPercent.
  ///
  /// In en_US, this message translates to:
  /// **'82% of tier capacity'**
  String get onboardingBillCapacityPercent;

  /// No description provided for @onboardingBillTierOneLabel.
  ///
  /// In en_US, this message translates to:
  /// **'Tier 1'**
  String get onboardingBillTierOneLabel;

  /// No description provided for @onboardingBillTierOneRate.
  ///
  /// In en_US, this message translates to:
  /// **'68 p'**
  String get onboardingBillTierOneRate;

  /// No description provided for @onboardingBillTierTwoLabel.
  ///
  /// In en_US, this message translates to:
  /// **'Tier 2'**
  String get onboardingBillTierTwoLabel;

  /// No description provided for @onboardingBillTierTwoRate.
  ///
  /// In en_US, this message translates to:
  /// **'78 p'**
  String get onboardingBillTierTwoRate;

  /// No description provided for @onboardingBillTierThreeLabel.
  ///
  /// In en_US, this message translates to:
  /// **'Tier 3'**
  String get onboardingBillTierThreeLabel;

  /// No description provided for @onboardingBillTierThreeShortRate.
  ///
  /// In en_US, this message translates to:
  /// **'95 p'**
  String get onboardingBillTierThreeShortRate;

  /// No description provided for @onboardingBillTierFourLabel.
  ///
  /// In en_US, this message translates to:
  /// **'Tier 4'**
  String get onboardingBillTierFourLabel;

  /// No description provided for @onboardingBillTierFourRate.
  ///
  /// In en_US, this message translates to:
  /// **'155 p'**
  String get onboardingBillTierFourRate;

  /// No description provided for @onboardingBillTierFiveLabel.
  ///
  /// In en_US, this message translates to:
  /// **'Tier 5'**
  String get onboardingBillTierFiveLabel;

  /// No description provided for @onboardingBillTierFiveRate.
  ///
  /// In en_US, this message translates to:
  /// **'195 p'**
  String get onboardingBillTierFiveRate;

  /// No description provided for @onboardingBillFeesTitle.
  ///
  /// In en_US, this message translates to:
  /// **'Additional fees included'**
  String get onboardingBillFeesTitle;

  /// No description provided for @onboardingBillFeesDescription.
  ///
  /// In en_US, this message translates to:
  /// **'Support for service fees and government duties according to official updates.'**
  String get onboardingBillFeesDescription;

  /// No description provided for @onboardingBillProximityTitle.
  ///
  /// In en_US, this message translates to:
  /// **'Know when a tier may change'**
  String get onboardingBillProximityTitle;

  /// No description provided for @onboardingBillProximityDescription.
  ///
  /// In en_US, this message translates to:
  /// **'See how close you are to a higher priced tier and avoid unexpected charges.'**
  String get onboardingBillProximityDescription;

  /// No description provided for @onboardingBillSavingsTitle.
  ///
  /// In en_US, this message translates to:
  /// **'Personalized saving guidance'**
  String get onboardingBillSavingsTitle;

  /// No description provided for @onboardingBillSavingsDescription.
  ///
  /// In en_US, this message translates to:
  /// **'Tips to help avoid the next tier based on when high consumption appliances are used.'**
  String get onboardingBillSavingsDescription;
}

class _AppLocalizationsDelegate extends LocalizationsDelegate<AppLocalizations> {
  const _AppLocalizationsDelegate();

  @override
  Future<AppLocalizations> load(Locale locale) {
    return SynchronousFuture<AppLocalizations>(lookupAppLocalizations(locale));
  }

  @override
  bool isSupported(Locale locale) => <String>['ar', 'en'].contains(locale.languageCode);

  @override
  bool shouldReload(_AppLocalizationsDelegate old) => false;
}

AppLocalizations lookupAppLocalizations(Locale locale) {
  // Lookup logic when language+country codes are specified.
  switch (locale.languageCode) {
    case 'ar':
      {
        switch (locale.countryCode) {
          case 'EG':
            return AppLocalizationsArEg();
        }
        break;
      }
    case 'en':
      {
        switch (locale.countryCode) {
          case 'US':
            return AppLocalizationsEnUs();
        }
        break;
      }
  }

  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'ar':
      return AppLocalizationsAr();
    case 'en':
      return AppLocalizationsEn();
  }

  throw FlutterError(
    'AppLocalizations.delegate failed to load unsupported locale "$locale". This is likely '
    'an issue with the localizations generation tool. Please file an issue '
    'on GitHub with a reproducible sample app and the gen-l10n configuration '
    'that was used.',
  );
}
