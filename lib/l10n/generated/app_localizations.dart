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

  /// No description provided for @onboardingTierExampleTemplate.
  ///
  /// In en_US, this message translates to:
  /// **'Illustrative tier 4 (up to {limit} kWh)'**
  String onboardingTierExampleTemplate(Object limit);

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

  /// No description provided for @onboardingBrandShort.
  ///
  /// In en_US, this message translates to:
  /// **'Electricity Tracker'**
  String get onboardingBrandShort;

  /// No description provided for @onboardingBudgetMonthly.
  ///
  /// In en_US, this message translates to:
  /// **'Estimated monthly budget'**
  String get onboardingBudgetMonthly;

  /// No description provided for @onboardingBudgetRemaining.
  ///
  /// In en_US, this message translates to:
  /// **'Remaining budget'**
  String get onboardingBudgetRemaining;

  /// No description provided for @onboardingBudgetCurrency.
  ///
  /// In en_US, this message translates to:
  /// **'EGP'**
  String get onboardingBudgetCurrency;

  /// No description provided for @onboardingApplianceAirConditioner.
  ///
  /// In en_US, this message translates to:
  /// **'AC'**
  String get onboardingApplianceAirConditioner;

  /// No description provided for @onboardingApplianceWaterHeater.
  ///
  /// In en_US, this message translates to:
  /// **'Heater'**
  String get onboardingApplianceWaterHeater;

  /// No description provided for @onboardingApplianceRefrigerator.
  ///
  /// In en_US, this message translates to:
  /// **'Fridge'**
  String get onboardingApplianceRefrigerator;

  /// No description provided for @onboardingApplianceAmount.
  ///
  /// In en_US, this message translates to:
  /// **'{amount} {currency}'**
  String onboardingApplianceAmount(Object amount, Object currency);

  /// No description provided for @onboardingBudgetTitle.
  ///
  /// In en_US, this message translates to:
  /// **'Track your budget and control appliance use'**
  String get onboardingBudgetTitle;

  /// No description provided for @onboardingBudgetDescription.
  ///
  /// In en_US, this message translates to:
  /// **'Set a monthly electricity budget, get an early alert when you reach 80%, and discover which appliances use the most energy.'**
  String get onboardingBudgetDescription;

  /// No description provided for @onboardingBudgetAlerts.
  ///
  /// In en_US, this message translates to:
  /// **'Get early alerts before your budget runs out or usage moves into a higher tier.'**
  String get onboardingBudgetAlerts;

  /// No description provided for @onboardingBudgetSimulator.
  ///
  /// In en_US, this message translates to:
  /// **'Explore usage scenarios to reduce your air conditioner hours each month.'**
  String get onboardingBudgetSimulator;

  /// No description provided for @onboardingBudgetStartNow.
  ///
  /// In en_US, this message translates to:
  /// **'Start now for free'**
  String get onboardingBudgetStartNow;

  /// No description provided for @onboardingBudgetDisclaimer.
  ///
  /// In en_US, this message translates to:
  /// **'Illustrative estimates to help you save based on Egypt’s official electricity tariffs.'**
  String get onboardingBudgetDisclaimer;

  /// No description provided for @welcomeSubtitle.
  ///
  /// In en_US, this message translates to:
  /// **'Your smart assistant for managing and tracking home bills'**
  String get welcomeSubtitle;

  /// No description provided for @welcomeLoginTitle.
  ///
  /// In en_US, this message translates to:
  /// **'Log in'**
  String get welcomeLoginTitle;

  /// No description provided for @welcomeLoginGreeting.
  ///
  /// In en_US, this message translates to:
  /// **'Welcome back. Enter your details to continue.'**
  String get welcomeLoginGreeting;

  /// No description provided for @welcomeIdentifierLabel.
  ///
  /// In en_US, this message translates to:
  /// **'Email or phone number'**
  String get welcomeIdentifierLabel;

  /// No description provided for @welcomeIdentifierHint.
  ///
  /// In en_US, this message translates to:
  /// **'name@example.com'**
  String get welcomeIdentifierHint;

  /// No description provided for @welcomePasswordLabel.
  ///
  /// In en_US, this message translates to:
  /// **'Password'**
  String get welcomePasswordLabel;

  /// No description provided for @welcomePasswordHint.
  ///
  /// In en_US, this message translates to:
  /// **'••••••••'**
  String get welcomePasswordHint;

  /// No description provided for @welcomeRememberMe.
  ///
  /// In en_US, this message translates to:
  /// **'Remember me'**
  String get welcomeRememberMe;

  /// No description provided for @welcomeForgotPassword.
  ///
  /// In en_US, this message translates to:
  /// **'Forgot password?'**
  String get welcomeForgotPassword;

  /// No description provided for @welcomeContinueDivider.
  ///
  /// In en_US, this message translates to:
  /// **'Or continue as a guest'**
  String get welcomeContinueDivider;

  /// No description provided for @welcomeGuest.
  ///
  /// In en_US, this message translates to:
  /// **'Continue as guest and try the calculator'**
  String get welcomeGuest;

  /// No description provided for @welcomeNoAccount.
  ///
  /// In en_US, this message translates to:
  /// **'Don’t have an account?'**
  String get welcomeNoAccount;

  /// No description provided for @welcomeCreateAccount.
  ///
  /// In en_US, this message translates to:
  /// **'Create a new account'**
  String get welcomeCreateAccount;

  /// No description provided for @welcomePrivacy.
  ///
  /// In en_US, this message translates to:
  /// **'Your meter data is stored locally and handled under Egyptian privacy policy.'**
  String get welcomePrivacy;

  /// No description provided for @createAccountTitle.
  ///
  /// In en_US, this message translates to:
  /// **'Create your account'**
  String get createAccountTitle;

  /// No description provided for @createAccountFullNameLabel.
  ///
  /// In en_US, this message translates to:
  /// **'Full Name'**
  String get createAccountFullNameLabel;

  /// No description provided for @createAccountFullNameHint.
  ///
  /// In en_US, this message translates to:
  /// **'Enter your full name'**
  String get createAccountFullNameHint;

  /// No description provided for @createAccountEmailLabel.
  ///
  /// In en_US, this message translates to:
  /// **'Email Address'**
  String get createAccountEmailLabel;

  /// No description provided for @createAccountEmailHint.
  ///
  /// In en_US, this message translates to:
  /// **'name@example.com'**
  String get createAccountEmailHint;

  /// No description provided for @createAccountPhoneLabel.
  ///
  /// In en_US, this message translates to:
  /// **'Phone Number'**
  String get createAccountPhoneLabel;

  /// No description provided for @createAccountPhoneHint.
  ///
  /// In en_US, this message translates to:
  /// **'+20 10 1234 5678'**
  String get createAccountPhoneHint;

  /// No description provided for @createAccountPasswordHint.
  ///
  /// In en_US, this message translates to:
  /// **'Create a password'**
  String get createAccountPasswordHint;

  /// No description provided for @createAccountConfirmPasswordLabel.
  ///
  /// In en_US, this message translates to:
  /// **'Confirm Password'**
  String get createAccountConfirmPasswordLabel;

  /// No description provided for @createAccountConfirmPasswordHint.
  ///
  /// In en_US, this message translates to:
  /// **'Re-enter your password'**
  String get createAccountConfirmPasswordHint;

  /// No description provided for @createAccountButton.
  ///
  /// In en_US, this message translates to:
  /// **'Create Account'**
  String get createAccountButton;

  /// No description provided for @createAccountBackToLogin.
  ///
  /// In en_US, this message translates to:
  /// **'Back to Login'**
  String get createAccountBackToLogin;

  /// No description provided for @homeBrand.
  ///
  /// In en_US, this message translates to:
  /// **'Electricity Tracker'**
  String get homeBrand;

  /// No description provided for @homeGovernment.
  ///
  /// In en_US, this message translates to:
  /// **'Arab Republic of Egypt'**
  String get homeGovernment;

  /// No description provided for @homeNotifications.
  ///
  /// In en_US, this message translates to:
  /// **'Notifications'**
  String get homeNotifications;

  /// No description provided for @homeDisclaimerTitle.
  ///
  /// In en_US, this message translates to:
  /// **'Notice:'**
  String get homeDisclaimerTitle;

  /// No description provided for @homeDisclaimer.
  ///
  /// In en_US, this message translates to:
  /// **'Illustrative estimates for personal tracking and tariff tiers, not an official electricity bill.'**
  String get homeDisclaimer;

  /// No description provided for @homeGreeting.
  ///
  /// In en_US, this message translates to:
  /// **'Hello, Ahmed Mostafa'**
  String get homeGreeting;

  /// No description provided for @homeGreetingDate.
  ///
  /// In en_US, this message translates to:
  /// **'Sunday, 15 October 2023'**
  String get homeGreetingDate;

  /// No description provided for @homeAvatarInitials.
  ///
  /// In en_US, this message translates to:
  /// **'AM'**
  String get homeAvatarInitials;

  /// No description provided for @homeSmartMeter.
  ///
  /// In en_US, this message translates to:
  /// **'Smart meter'**
  String get homeSmartMeter;

  /// No description provided for @homeCurrentConsumption.
  ///
  /// In en_US, this message translates to:
  /// **'Current month consumption'**
  String get homeCurrentConsumption;

  /// No description provided for @homeCurrentTierTemplate.
  ///
  /// In en_US, this message translates to:
  /// **'Tier four ({start}–{end} kWh)'**
  String homeCurrentTierTemplate(Object start, Object end);

  /// No description provided for @homeTotalEnergy.
  ///
  /// In en_US, this message translates to:
  /// **'Total energy consumed'**
  String get homeTotalEnergy;

  /// No description provided for @homeEstimatedBill.
  ///
  /// In en_US, this message translates to:
  /// **'Estimated bill'**
  String get homeEstimatedBill;

  /// No description provided for @homeEnergyUnit.
  ///
  /// In en_US, this message translates to:
  /// **'kWh'**
  String get homeEnergyUnit;

  /// No description provided for @homeCurrency.
  ///
  /// In en_US, this message translates to:
  /// **'EGP'**
  String get homeCurrency;

  /// No description provided for @homeMonthlyBudget.
  ///
  /// In en_US, this message translates to:
  /// **'Monthly budget'**
  String get homeMonthlyBudget;

  /// No description provided for @homeBudgetWarning.
  ///
  /// In en_US, this message translates to:
  /// **'Warning: over 80%'**
  String get homeBudgetWarning;

  /// No description provided for @homeBudgetSpent.
  ///
  /// In en_US, this message translates to:
  /// **'Spent'**
  String get homeBudgetSpent;

  /// No description provided for @homeBudgetLimit.
  ///
  /// In en_US, this message translates to:
  /// **'Maximum limit'**
  String get homeBudgetLimit;

  /// No description provided for @homeBudgetRemaining.
  ///
  /// In en_US, this message translates to:
  /// **'Remaining in this month’s budget:'**
  String get homeBudgetRemaining;

  /// No description provided for @homeQuickActions.
  ///
  /// In en_US, this message translates to:
  /// **'Quick actions'**
  String get homeQuickActions;

  /// No description provided for @homeMore.
  ///
  /// In en_US, this message translates to:
  /// **'More'**
  String get homeMore;

  /// No description provided for @homeActionRecordReading.
  ///
  /// In en_US, this message translates to:
  /// **'Record reading'**
  String get homeActionRecordReading;

  /// No description provided for @homeActionScanMeter.
  ///
  /// In en_US, this message translates to:
  /// **'Scan meter'**
  String get homeActionScanMeter;

  /// No description provided for @homeActionVoiceEntry.
  ///
  /// In en_US, this message translates to:
  /// **'Voice entry'**
  String get homeActionVoiceEntry;

  /// No description provided for @homeActionCalculateBill.
  ///
  /// In en_US, this message translates to:
  /// **'Calculate bill'**
  String get homeActionCalculateBill;

  /// No description provided for @homeConsumptionRate.
  ///
  /// In en_US, this message translates to:
  /// **'Consumption trend'**
  String get homeConsumptionRate;

  /// No description provided for @homeLastSevenDays.
  ///
  /// In en_US, this message translates to:
  /// **'Last 7 days (kWh)'**
  String get homeLastSevenDays;

  /// No description provided for @homeDaily.
  ///
  /// In en_US, this message translates to:
  /// **'Daily'**
  String get homeDaily;

  /// No description provided for @homeWeekly.
  ///
  /// In en_US, this message translates to:
  /// **'Weekly'**
  String get homeWeekly;

  /// No description provided for @homeMonthly.
  ///
  /// In en_US, this message translates to:
  /// **'Monthly'**
  String get homeMonthly;

  /// No description provided for @homeSaturday.
  ///
  /// In en_US, this message translates to:
  /// **'Sat'**
  String get homeSaturday;

  /// No description provided for @homeSunday.
  ///
  /// In en_US, this message translates to:
  /// **'Sun'**
  String get homeSunday;

  /// No description provided for @homeMonday.
  ///
  /// In en_US, this message translates to:
  /// **'Mon'**
  String get homeMonday;

  /// No description provided for @homeTuesday.
  ///
  /// In en_US, this message translates to:
  /// **'Tue'**
  String get homeTuesday;

  /// No description provided for @homeWednesday.
  ///
  /// In en_US, this message translates to:
  /// **'Wed'**
  String get homeWednesday;

  /// No description provided for @homeThursday.
  ///
  /// In en_US, this message translates to:
  /// **'Thu'**
  String get homeThursday;

  /// No description provided for @homeToday.
  ///
  /// In en_US, this message translates to:
  /// **'Today'**
  String get homeToday;

  /// No description provided for @homeTopAppliances.
  ///
  /// In en_US, this message translates to:
  /// **'Top consuming appliances'**
  String get homeTopAppliances;

  /// No description provided for @homeDetails.
  ///
  /// In en_US, this message translates to:
  /// **'Details'**
  String get homeDetails;

  /// No description provided for @homeAirConditioner.
  ///
  /// In en_US, this message translates to:
  /// **'Living room air conditioner'**
  String get homeAirConditioner;

  /// No description provided for @homeAirConditionerUsage.
  ///
  /// In en_US, this message translates to:
  /// **'Average 7 hours daily'**
  String get homeAirConditionerUsage;

  /// No description provided for @homeRefrigerator.
  ///
  /// In en_US, this message translates to:
  /// **'18 cubic foot refrigerator'**
  String get homeRefrigerator;

  /// No description provided for @homeRefrigeratorUsage.
  ///
  /// In en_US, this message translates to:
  /// **'Runs continuously'**
  String get homeRefrigeratorUsage;

  /// No description provided for @homeWaterHeater.
  ///
  /// In en_US, this message translates to:
  /// **'Electric water heater'**
  String get homeWaterHeater;

  /// No description provided for @homeWaterHeaterUsage.
  ///
  /// In en_US, this message translates to:
  /// **'2.5 hours daily'**
  String get homeWaterHeaterUsage;

  /// No description provided for @homeLastReading.
  ///
  /// In en_US, this message translates to:
  /// **'Last meter reading'**
  String get homeLastReading;

  /// No description provided for @homeReadingDate.
  ///
  /// In en_US, this message translates to:
  /// **'12 October'**
  String get homeReadingDate;

  /// No description provided for @homeNavHome.
  ///
  /// In en_US, this message translates to:
  /// **'Home'**
  String get homeNavHome;

  /// No description provided for @homeNavReadings.
  ///
  /// In en_US, this message translates to:
  /// **'Readings'**
  String get homeNavReadings;

  /// No description provided for @homeNavAnalytics.
  ///
  /// In en_US, this message translates to:
  /// **'Analytics'**
  String get homeNavAnalytics;

  /// No description provided for @homeNavAppliances.
  ///
  /// In en_US, this message translates to:
  /// **'Appliances'**
  String get homeNavAppliances;

  /// No description provided for @homeNavSettings.
  ///
  /// In en_US, this message translates to:
  /// **'Settings'**
  String get homeNavSettings;

  /// No description provided for @onboardingBillTierRangeTemplate.
  ///
  /// In en_US, this message translates to:
  /// **'Tier {tier} ({start}–{end} kWh)'**
  String onboardingBillTierRangeTemplate(Object tier, Object start, Object end);

  /// No description provided for @onboardingBillTierLabelTemplate.
  ///
  /// In en_US, this message translates to:
  /// **'Tier {tier}'**
  String onboardingBillTierLabelTemplate(Object tier);

  /// No description provided for @onboardingBillTierRateTemplate.
  ///
  /// In en_US, this message translates to:
  /// **'{rate} p'**
  String onboardingBillTierRateTemplate(Object rate);

  /// No description provided for @onboardingBillPaisaRateTemplate.
  ///
  /// In en_US, this message translates to:
  /// **'{rate} piastres/kWh'**
  String onboardingBillPaisaRateTemplate(Object rate);

  /// No description provided for @onboardingBillRemainingTemplate.
  ///
  /// In en_US, this message translates to:
  /// **'{amount} kWh left before tier {tier}'**
  String onboardingBillRemainingTemplate(Object amount, Object tier);

  /// No description provided for @onboardingBillThresholdTemplate.
  ///
  /// In en_US, this message translates to:
  /// **'{amount} kWh'**
  String onboardingBillThresholdTemplate(Object amount);

  /// No description provided for @onboardingBillCapacityTemplate.
  ///
  /// In en_US, this message translates to:
  /// **'{percent} of tier capacity'**
  String onboardingBillCapacityTemplate(Object percent);

  /// No description provided for @onboardingBudgetConsumedTemplate.
  ///
  /// In en_US, this message translates to:
  /// **'{percent} consumed'**
  String onboardingBudgetConsumedTemplate(Object percent);

  /// No description provided for @onboardingBudgetCapTemplate.
  ///
  /// In en_US, this message translates to:
  /// **'Budget cap: {amount} {currency}'**
  String onboardingBudgetCapTemplate(Object amount, Object currency);

  /// No description provided for @onboardingBudgetSavingsTemplate.
  ///
  /// In en_US, this message translates to:
  /// **'Save up to {amount} {currency} this month'**
  String onboardingBudgetSavingsTemplate(Object amount, Object currency);

  /// No description provided for @homeComparedPreviousTemplate.
  ///
  /// In en_US, this message translates to:
  /// **'{change} compared with last month'**
  String homeComparedPreviousTemplate(Object change);

  /// No description provided for @homeDaysRemainingTemplate.
  ///
  /// In en_US, this message translates to:
  /// **'{days} days remaining in the billing cycle'**
  String homeDaysRemainingTemplate(Object days);

  /// No description provided for @readingsBack.
  ///
  /// In en_US, this message translates to:
  /// **'Back'**
  String get readingsBack;

  /// No description provided for @readingsTitle.
  ///
  /// In en_US, this message translates to:
  /// **'Record a new reading'**
  String get readingsTitle;

  /// No description provided for @readingsActiveMeterLabel.
  ///
  /// In en_US, this message translates to:
  /// **'Active meter:'**
  String get readingsActiveMeterLabel;

  /// No description provided for @readingsActiveMeterName.
  ///
  /// In en_US, this message translates to:
  /// **'Main apartment meter'**
  String get readingsActiveMeterName;

  /// No description provided for @readingsNotificationsHelp.
  ///
  /// In en_US, this message translates to:
  /// **'Notifications and help'**
  String get readingsNotificationsHelp;

  /// No description provided for @readingsMethodManual.
  ///
  /// In en_US, this message translates to:
  /// **'Manual'**
  String get readingsMethodManual;

  /// No description provided for @readingsMethodCamera.
  ///
  /// In en_US, this message translates to:
  /// **'Scan with camera'**
  String get readingsMethodCamera;

  /// No description provided for @readingsMethodVoice.
  ///
  /// In en_US, this message translates to:
  /// **'Voice input'**
  String get readingsMethodVoice;

  /// No description provided for @readingsDetectedMeterScreen.
  ///
  /// In en_US, this message translates to:
  /// **'Detected meter display'**
  String get readingsDetectedMeterScreen;

  /// No description provided for @readingsFlash.
  ///
  /// In en_US, this message translates to:
  /// **'Flash'**
  String get readingsFlash;

  /// No description provided for @readingsRetake.
  ///
  /// In en_US, this message translates to:
  /// **'Retake'**
  String get readingsRetake;

  /// No description provided for @readingsOcrSuccess.
  ///
  /// In en_US, this message translates to:
  /// **'Reading detected successfully ({accuracy}% accuracy)'**
  String readingsOcrSuccess(int accuracy);

  /// No description provided for @readingsOcrVersion.
  ///
  /// In en_US, this message translates to:
  /// **'OCR v{version}'**
  String readingsOcrVersion(String version);

  /// No description provided for @readingsCurrentReading.
  ///
  /// In en_US, this message translates to:
  /// **'Current confirmed reading'**
  String get readingsCurrentReading;

  /// No description provided for @readingsEditableManually.
  ///
  /// In en_US, this message translates to:
  /// **'Can be edited manually'**
  String get readingsEditableManually;

  /// No description provided for @readingsEnergyUnitParenthetical.
  ///
  /// In en_US, this message translates to:
  /// **'(kWh)'**
  String get readingsEnergyUnitParenthetical;

  /// No description provided for @readingsPreviousReadingTemplate.
  ///
  /// In en_US, this message translates to:
  /// **'Previous reading ({date}):'**
  String readingsPreviousReadingTemplate(String date);

  /// No description provided for @readingsConsumptionDifference.
  ///
  /// In en_US, this message translates to:
  /// **'Net consumption difference:'**
  String get readingsConsumptionDifference;

  /// No description provided for @readingsTierTemplate.
  ///
  /// In en_US, this message translates to:
  /// **'(Tier {tier})'**
  String readingsTierTemplate(String tier);

  /// No description provided for @readingsVerificationStatus.
  ///
  /// In en_US, this message translates to:
  /// **'Reading is correct and consistent with your usual consumption rate'**
  String get readingsVerificationStatus;

  /// No description provided for @readingsDateTimeLabel.
  ///
  /// In en_US, this message translates to:
  /// **'Reading date and time'**
  String get readingsDateTimeLabel;

  /// No description provided for @readingsSelectDate.
  ///
  /// In en_US, this message translates to:
  /// **'Select reading date'**
  String get readingsSelectDate;

  /// No description provided for @readingsSelectTime.
  ///
  /// In en_US, this message translates to:
  /// **'Select reading time'**
  String get readingsSelectTime;

  /// No description provided for @readingsNotesLabel.
  ///
  /// In en_US, this message translates to:
  /// **'Additional notes (optional)'**
  String get readingsNotesLabel;

  /// No description provided for @readingsNotesHint.
  ///
  /// In en_US, this message translates to:
  /// **'Add a note about this reading...'**
  String get readingsNotesHint;

  /// No description provided for @readingsSampleNotes.
  ///
  /// In en_US, this message translates to:
  /// **'Regular mid-month reading'**
  String get readingsSampleNotes;

  /// No description provided for @readingsVoiceInvitation.
  ///
  /// In en_US, this message translates to:
  /// **'Or tap and speak to record the reading:'**
  String get readingsVoiceInvitation;

  /// No description provided for @readingsVoiceSamplePhrase.
  ///
  /// In en_US, this message translates to:
  /// **'\"Fourteen thousand eight hundred and ninety-two\"'**
  String get readingsVoiceSamplePhrase;

  /// No description provided for @readingsSafetyWarning.
  ///
  /// In en_US, this message translates to:
  /// **'Automatically extracted readings are not accepted without your review and manual confirmation to preserve the accuracy of tariff tier and monthly cost calculations.'**
  String get readingsSafetyWarning;

  /// No description provided for @readingsReviewConfirm.
  ///
  /// In en_US, this message translates to:
  /// **'Review and confirm reading'**
  String get readingsReviewConfirm;

  /// No description provided for @readingsConfirmationPreviewMessage.
  ///
  /// In en_US, this message translates to:
  /// **'This is a preview only; the reading was not saved.'**
  String get readingsConfirmationPreviewMessage;
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
