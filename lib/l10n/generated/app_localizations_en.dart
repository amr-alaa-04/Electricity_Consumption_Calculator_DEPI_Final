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
  String onboardingTierExampleTemplate(Object limit) {
    return 'Illustrative tier 4 (up to $limit kWh)';
  }

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
  String get onboardingBillTargetTier => 'Current target tier';

  @override
  String get onboardingBillActive => 'Active now';

  @override
  String get onboardingBillEstimatedValue => 'Estimated usage value';

  @override
  String get onboardingBillCurrency => 'EGP';

  @override
  String get onboardingBillEquivalentBalance => 'Equivalent consumption';

  @override
  String get onboardingBillUsageUnit => 'kWh';

  @override
  String get onboardingBillSafetyIndicator => 'Tier safety indicator';

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

  @override
  String get onboardingBrandShort => 'Electricity Tracker';

  @override
  String get onboardingBudgetMonthly => 'Estimated monthly budget';

  @override
  String get onboardingBudgetRemaining => 'Remaining budget';

  @override
  String get onboardingBudgetCurrency => 'EGP';

  @override
  String get onboardingApplianceAirConditioner => 'AC';

  @override
  String get onboardingApplianceWaterHeater => 'Heater';

  @override
  String get onboardingApplianceRefrigerator => 'Fridge';

  @override
  String onboardingApplianceAmount(Object amount, Object currency) {
    return '$amount $currency';
  }

  @override
  String get onboardingBudgetTitle => 'Track your budget and control appliance use';

  @override
  String get onboardingBudgetDescription =>
      'Set a monthly electricity budget, get an early alert when you reach 80%, and discover which appliances use the most energy.';

  @override
  String get onboardingBudgetAlerts =>
      'Get early alerts before your budget runs out or usage moves into a higher tier.';

  @override
  String get onboardingBudgetSimulator =>
      'Explore usage scenarios to reduce your air conditioner hours each month.';

  @override
  String get onboardingBudgetStartNow => 'Start now for free';

  @override
  String get onboardingBudgetDisclaimer =>
      'Illustrative estimates to help you save based on Egypt’s official electricity tariffs.';

  @override
  String get welcomeSubtitle => 'Your smart assistant for managing and tracking home bills';

  @override
  String get welcomeLoginTitle => 'Log in';

  @override
  String get welcomeLoginGreeting => 'Welcome back. Enter your details to continue.';

  @override
  String get welcomeIdentifierLabel => 'Email or phone number';

  @override
  String get welcomeIdentifierHint => 'name@example.com';

  @override
  String get welcomePasswordLabel => 'Password';

  @override
  String get welcomePasswordHint => '••••••••';

  @override
  String get welcomeRememberMe => 'Remember me';

  @override
  String get welcomeForgotPassword => 'Forgot password?';

  @override
  String get welcomeContinueDivider => 'Or continue as a guest';

  @override
  String get welcomeGuest => 'Continue as guest and try the calculator';

  @override
  String get welcomeNoAccount => 'Don’t have an account?';

  @override
  String get welcomeCreateAccount => 'Create a new account';

  @override
  String get welcomePrivacy =>
      'Your meter data is stored locally and handled under Egyptian privacy policy.';

  @override
  String get createAccountTitle => 'Create your account';

  @override
  String get createAccountFullNameLabel => 'Full Name';

  @override
  String get createAccountFullNameHint => 'Enter your full name';

  @override
  String get createAccountEmailLabel => 'Email Address';

  @override
  String get createAccountEmailHint => 'name@example.com';

  @override
  String get createAccountPhoneLabel => 'Phone Number';

  @override
  String get createAccountPhoneHint => '+20 10 1234 5678';

  @override
  String get createAccountPasswordHint => 'Create a password';

  @override
  String get createAccountConfirmPasswordLabel => 'Confirm Password';

  @override
  String get createAccountConfirmPasswordHint => 'Re-enter your password';

  @override
  String get createAccountButton => 'Create Account';

  @override
  String get createAccountBackToLogin => 'Back to Login';

  @override
  String get homeBrand => 'Electricity Tracker';

  @override
  String get homeGovernment => 'Arab Republic of Egypt';

  @override
  String get homeNotifications => 'Notifications';

  @override
  String get homeDisclaimerTitle => 'Notice:';

  @override
  String get homeDisclaimer =>
      'Illustrative estimates for personal tracking and tariff tiers, not an official electricity bill.';

  @override
  String get homeGreeting => 'Hello, Ahmed Mostafa';

  @override
  String get homeGreetingDate => 'Sunday, 15 October 2023';

  @override
  String get homeAvatarInitials => 'AM';

  @override
  String get homeSmartMeter => 'Smart meter';

  @override
  String get homeCurrentConsumption => 'Current month consumption';

  @override
  String homeCurrentTierTemplate(Object start, Object end) {
    return 'Tier four ($start–$end kWh)';
  }

  @override
  String get homeTotalEnergy => 'Total energy consumed';

  @override
  String get homeEstimatedBill => 'Estimated bill';

  @override
  String get homeEnergyUnit => 'kWh';

  @override
  String get homeCurrency => 'EGP';

  @override
  String get homeMonthlyBudget => 'Monthly budget';

  @override
  String get homeBudgetWarning => 'Warning: over 80%';

  @override
  String get homeBudgetSpent => 'Spent';

  @override
  String get homeBudgetLimit => 'Maximum limit';

  @override
  String get homeBudgetRemaining => 'Remaining in this month’s budget:';

  @override
  String get homeQuickActions => 'Quick actions';

  @override
  String get homeMore => 'More';

  @override
  String get homeActionRecordReading => 'Record reading';

  @override
  String get homeActionScanMeter => 'Scan meter';

  @override
  String get homeActionVoiceEntry => 'Voice entry';

  @override
  String get homeActionCalculateBill => 'Calculate bill';

  @override
  String get homeConsumptionRate => 'Consumption trend';

  @override
  String get homeLastSevenDays => 'Last 7 days (kWh)';

  @override
  String get homeDaily => 'Daily';

  @override
  String get homeWeekly => 'Weekly';

  @override
  String get homeMonthly => 'Monthly';

  @override
  String get homeSaturday => 'Sat';

  @override
  String get homeSunday => 'Sun';

  @override
  String get homeMonday => 'Mon';

  @override
  String get homeTuesday => 'Tue';

  @override
  String get homeWednesday => 'Wed';

  @override
  String get homeThursday => 'Thu';

  @override
  String get homeToday => 'Today';

  @override
  String get homeTopAppliances => 'Top consuming appliances';

  @override
  String get homeDetails => 'Details';

  @override
  String get homeAirConditioner => 'Living room air conditioner';

  @override
  String get homeAirConditionerUsage => 'Average 7 hours daily';

  @override
  String get homeRefrigerator => '18 cubic foot refrigerator';

  @override
  String get homeRefrigeratorUsage => 'Runs continuously';

  @override
  String get homeWaterHeater => 'Electric water heater';

  @override
  String get homeWaterHeaterUsage => '2.5 hours daily';

  @override
  String get homeLastReading => 'Last meter reading';

  @override
  String get homeReadingDate => '12 October';

  @override
  String get homeNavHome => 'Home';

  @override
  String get homeNavReadings => 'Readings';

  @override
  String get homeNavAnalytics => 'Analytics';

  @override
  String get homeNavAppliances => 'Appliances';

  @override
  String get homeNavSettings => 'Settings';

  @override
  String onboardingBillTierRangeTemplate(Object tier, Object start, Object end) {
    return 'Tier $tier ($start–$end kWh)';
  }

  @override
  String onboardingBillTierLabelTemplate(Object tier) {
    return 'Tier $tier';
  }

  @override
  String onboardingBillTierRateTemplate(Object rate) {
    return '$rate p';
  }

  @override
  String onboardingBillPaisaRateTemplate(Object rate) {
    return '$rate piastres/kWh';
  }

  @override
  String onboardingBillRemainingTemplate(Object amount, Object tier) {
    return '$amount kWh left before tier $tier';
  }

  @override
  String onboardingBillThresholdTemplate(Object amount) {
    return '$amount kWh';
  }

  @override
  String onboardingBillCapacityTemplate(Object percent) {
    return '$percent of tier capacity';
  }

  @override
  String onboardingBudgetConsumedTemplate(Object percent) {
    return '$percent consumed';
  }

  @override
  String onboardingBudgetCapTemplate(Object amount, Object currency) {
    return 'Budget cap: $amount $currency';
  }

  @override
  String onboardingBudgetSavingsTemplate(Object amount, Object currency) {
    return 'Save up to $amount $currency this month';
  }

  @override
  String homeComparedPreviousTemplate(Object change) {
    return '$change compared with last month';
  }

  @override
  String homeDaysRemainingTemplate(Object days) {
    return '$days days remaining in the billing cycle';
  }

  @override
  String get readingsBack => 'Back';

  @override
  String get readingsTitle => 'Record a new reading';

  @override
  String get readingsActiveMeterLabel => 'Active meter:';

  @override
  String get readingsActiveMeterName => 'Main apartment meter';

  @override
  String get readingsNotificationsHelp => 'Notifications and help';

  @override
  String get readingsMethodManual => 'Manual';

  @override
  String get readingsMethodCamera => 'Scan with camera';

  @override
  String get readingsMethodVoice => 'Voice input';

  @override
  String get readingsManualInputLabel => 'Enter meter reading';

  @override
  String get readingsManualInputHint => 'Enter the reading in kWh; decimals are supported';

  @override
  String get readingsManualInputRequired => 'Enter a meter reading.';

  @override
  String get readingsManualInputConfirm => 'Use this reading';

  @override
  String get readingsDetectedMeterScreen => 'Detected meter display';

  @override
  String get readingsFlash => 'Flash';

  @override
  String get readingsRetake => 'Retake';

  @override
  String readingsOcrSuccess(int accuracy) {
    return 'Reading detected successfully ($accuracy% accuracy)';
  }

  @override
  String readingsOcrVersion(String version) {
    return 'OCR v$version';
  }

  @override
  String get readingsCurrentReading => 'Current confirmed reading';

  @override
  String get readingsEditableManually => 'Can be edited manually';

  @override
  String get readingsEnergyUnitParenthetical => '(kWh)';

  @override
  String readingsPreviousReadingTemplate(String date) {
    return 'Previous reading ($date):';
  }

  @override
  String get readingsConsumptionDifference => 'Net consumption difference:';

  @override
  String readingsTierTemplate(String tier) {
    return '(Tier $tier)';
  }

  @override
  String get readingsVerificationStatus =>
      'Reading is correct and consistent with your usual consumption rate';

  @override
  String get readingsDateTimeLabel => 'Reading date and time';

  @override
  String get readingsSelectDate => 'Select reading date';

  @override
  String get readingsSelectTime => 'Select reading time';

  @override
  String get readingsNotesLabel => 'Additional notes (optional)';

  @override
  String get readingsNotesHint => 'Add a note about this reading...';

  @override
  String get readingsSampleNotes => 'Regular mid-month reading';

  @override
  String get readingsVoiceInvitation => 'Or tap and speak to record the reading:';

  @override
  String get readingsVoiceSamplePhrase => '\"Fourteen thousand eight hundred and ninety-two\"';

  @override
  String get readingsSafetyWarning =>
      'Automatically extracted readings are not accepted without your review and manual confirmation to preserve the accuracy of tariff tier and monthly cost calculations.';

  @override
  String get readingsReviewConfirm => 'Review and confirm reading';

  @override
  String get readingsConfirmationPreviewMessage =>
      'This is a preview only; the reading was not saved.';

  @override
  String get readingsVoiceTitle => 'Voice reading input';

  @override
  String get readingsVoicePrompt => 'Speak your meter reading after tapping the microphone.';

  @override
  String get readingsVoiceInitializing => 'Preparing speech recognition…';

  @override
  String get readingsVoiceUnavailable => 'Speech recognition is unavailable on this device.';

  @override
  String get readingsVoicePermissionDenied =>
      'Microphone or speech recognition permission was denied. Allow access in Settings, then try again.';

  @override
  String get readingsVoiceError => 'Speech recognition encountered an error. Please try again.';

  @override
  String get readingsVoiceNoNumberDetected =>
      'No meter reading was found. Try speaking the reading again.';

  @override
  String get readingsVoiceMultipleNumbersDetected =>
      'More than one number was detected. Please say a single meter reading.';

  @override
  String get readingsVoiceInvalidDecimal => 'The decimal reading was unclear. Please try again.';

  @override
  String get readingsVoiceInvalidNumber =>
      'The recognized reading is not a valid number. Please try again.';

  @override
  String get readingsVoiceStart => 'Start listening';

  @override
  String get readingsVoiceStop => 'Stop listening';

  @override
  String get readingsVoiceListening => 'Listening… Speak now.';

  @override
  String get readingsVoiceRecognizedText => 'Recognized text';

  @override
  String get readingsVoiceWaitingForText => 'Your spoken words will appear here.';

  @override
  String readingsVoiceActiveLanguage(String language, String locale) {
    return 'Recognition language: $language ($locale)';
  }

  @override
  String get readingsVoiceLanguageArabic => 'Arabic';

  @override
  String get readingsVoiceLanguageEnglish => 'English';

  @override
  String get readingsVoiceLanguageSelector => 'Recognition language';

  @override
  String readingsVoiceLanguageFallback(String requestedLanguage, String activeLanguage) {
    return '$requestedLanguage speech recognition is unavailable. Using $activeLanguage instead.';
  }

  @override
  String get readingsVoiceLanguagesUnsupported =>
      'This device has no Arabic or English speech recognition language installed.';

  @override
  String get readingsVoiceRetry => 'Try again';
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
  String onboardingTierExampleTemplate(Object limit) {
    return 'Illustrative tier 4 (up to $limit kWh)';
  }

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
  String get onboardingBillTargetTier => 'Current target tier';

  @override
  String get onboardingBillActive => 'Active now';

  @override
  String get onboardingBillEstimatedValue => 'Estimated usage value';

  @override
  String get onboardingBillCurrency => 'EGP';

  @override
  String get onboardingBillEquivalentBalance => 'Equivalent consumption';

  @override
  String get onboardingBillUsageUnit => 'kWh';

  @override
  String get onboardingBillSafetyIndicator => 'Tier safety indicator';

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

  @override
  String get onboardingBrandShort => 'Electricity Tracker';

  @override
  String get onboardingBudgetMonthly => 'Estimated monthly budget';

  @override
  String get onboardingBudgetRemaining => 'Remaining budget';

  @override
  String get onboardingBudgetCurrency => 'EGP';

  @override
  String get onboardingApplianceAirConditioner => 'AC';

  @override
  String get onboardingApplianceWaterHeater => 'Heater';

  @override
  String get onboardingApplianceRefrigerator => 'Fridge';

  @override
  String onboardingApplianceAmount(Object amount, Object currency) {
    return '$amount $currency';
  }

  @override
  String get onboardingBudgetTitle => 'Track your budget and control appliance use';

  @override
  String get onboardingBudgetDescription =>
      'Set a monthly electricity budget, get an early alert when you reach 80%, and discover which appliances use the most energy.';

  @override
  String get onboardingBudgetAlerts =>
      'Get early alerts before your budget runs out or usage moves into a higher tier.';

  @override
  String get onboardingBudgetSimulator =>
      'Explore usage scenarios to reduce your air conditioner hours each month.';

  @override
  String get onboardingBudgetStartNow => 'Start now for free';

  @override
  String get onboardingBudgetDisclaimer =>
      'Illustrative estimates to help you save based on Egypt’s official electricity tariffs.';

  @override
  String get welcomeSubtitle => 'Your smart assistant for managing and tracking home bills';

  @override
  String get welcomeLoginTitle => 'Log in';

  @override
  String get welcomeLoginGreeting => 'Welcome back. Enter your details to continue.';

  @override
  String get welcomeIdentifierLabel => 'Email or phone number';

  @override
  String get welcomeIdentifierHint => 'name@example.com';

  @override
  String get welcomePasswordLabel => 'Password';

  @override
  String get welcomePasswordHint => '••••••••';

  @override
  String get welcomeRememberMe => 'Remember me';

  @override
  String get welcomeForgotPassword => 'Forgot password?';

  @override
  String get welcomeContinueDivider => 'Or continue as a guest';

  @override
  String get welcomeGuest => 'Continue as guest and try the calculator';

  @override
  String get welcomeNoAccount => 'Don’t have an account?';

  @override
  String get welcomeCreateAccount => 'Create a new account';

  @override
  String get welcomePrivacy =>
      'Your meter data is stored locally and handled under Egyptian privacy policy.';

  @override
  String get createAccountTitle => 'Create your account';

  @override
  String get createAccountFullNameLabel => 'Full Name';

  @override
  String get createAccountFullNameHint => 'Enter your full name';

  @override
  String get createAccountEmailLabel => 'Email Address';

  @override
  String get createAccountEmailHint => 'name@example.com';

  @override
  String get createAccountPhoneLabel => 'Phone Number';

  @override
  String get createAccountPhoneHint => '+20 10 1234 5678';

  @override
  String get createAccountPasswordHint => 'Create a password';

  @override
  String get createAccountConfirmPasswordLabel => 'Confirm Password';

  @override
  String get createAccountConfirmPasswordHint => 'Re-enter your password';

  @override
  String get createAccountButton => 'Create Account';

  @override
  String get createAccountBackToLogin => 'Back to Login';

  @override
  String get homeBrand => 'Electricity Tracker';

  @override
  String get homeGovernment => 'Arab Republic of Egypt';

  @override
  String get homeNotifications => 'Notifications';

  @override
  String get homeDisclaimerTitle => 'Notice:';

  @override
  String get homeDisclaimer =>
      'Illustrative estimates for personal tracking and tariff tiers, not an official electricity bill.';

  @override
  String get homeGreeting => 'Hello, Ahmed Mostafa';

  @override
  String get homeGreetingDate => 'Sunday, 15 October 2023';

  @override
  String get homeAvatarInitials => 'AM';

  @override
  String get homeSmartMeter => 'Smart meter';

  @override
  String get homeCurrentConsumption => 'Current month consumption';

  @override
  String homeCurrentTierTemplate(Object start, Object end) {
    return 'Tier four ($start–$end kWh)';
  }

  @override
  String get homeTotalEnergy => 'Total energy consumed';

  @override
  String get homeEstimatedBill => 'Estimated bill';

  @override
  String get homeEnergyUnit => 'kWh';

  @override
  String get homeCurrency => 'EGP';

  @override
  String get homeMonthlyBudget => 'Monthly budget';

  @override
  String get homeBudgetWarning => 'Warning: over 80%';

  @override
  String get homeBudgetSpent => 'Spent';

  @override
  String get homeBudgetLimit => 'Maximum limit';

  @override
  String get homeBudgetRemaining => 'Remaining in this month’s budget:';

  @override
  String get homeQuickActions => 'Quick actions';

  @override
  String get homeMore => 'More';

  @override
  String get homeActionRecordReading => 'Record reading';

  @override
  String get homeActionScanMeter => 'Scan meter';

  @override
  String get homeActionVoiceEntry => 'Voice entry';

  @override
  String get homeActionCalculateBill => 'Calculate bill';

  @override
  String get homeConsumptionRate => 'Consumption trend';

  @override
  String get homeLastSevenDays => 'Last 7 days (kWh)';

  @override
  String get homeDaily => 'Daily';

  @override
  String get homeWeekly => 'Weekly';

  @override
  String get homeMonthly => 'Monthly';

  @override
  String get homeSaturday => 'Sat';

  @override
  String get homeSunday => 'Sun';

  @override
  String get homeMonday => 'Mon';

  @override
  String get homeTuesday => 'Tue';

  @override
  String get homeWednesday => 'Wed';

  @override
  String get homeThursday => 'Thu';

  @override
  String get homeToday => 'Today';

  @override
  String get homeTopAppliances => 'Top consuming appliances';

  @override
  String get homeDetails => 'Details';

  @override
  String get homeAirConditioner => 'Living room air conditioner';

  @override
  String get homeAirConditionerUsage => 'Average 7 hours daily';

  @override
  String get homeRefrigerator => '18 cubic foot refrigerator';

  @override
  String get homeRefrigeratorUsage => 'Runs continuously';

  @override
  String get homeWaterHeater => 'Electric water heater';

  @override
  String get homeWaterHeaterUsage => '2.5 hours daily';

  @override
  String get homeLastReading => 'Last meter reading';

  @override
  String get homeReadingDate => '12 October';

  @override
  String get homeNavHome => 'Home';

  @override
  String get homeNavReadings => 'Readings';

  @override
  String get homeNavAnalytics => 'Analytics';

  @override
  String get homeNavAppliances => 'Appliances';

  @override
  String get homeNavSettings => 'Settings';

  @override
  String onboardingBillTierRangeTemplate(Object tier, Object start, Object end) {
    return 'Tier $tier ($start–$end kWh)';
  }

  @override
  String onboardingBillTierLabelTemplate(Object tier) {
    return 'Tier $tier';
  }

  @override
  String onboardingBillTierRateTemplate(Object rate) {
    return '$rate p';
  }

  @override
  String onboardingBillPaisaRateTemplate(Object rate) {
    return '$rate piastres/kWh';
  }

  @override
  String onboardingBillRemainingTemplate(Object amount, Object tier) {
    return '$amount kWh left before tier $tier';
  }

  @override
  String onboardingBillThresholdTemplate(Object amount) {
    return '$amount kWh';
  }

  @override
  String onboardingBillCapacityTemplate(Object percent) {
    return '$percent of tier capacity';
  }

  @override
  String onboardingBudgetConsumedTemplate(Object percent) {
    return '$percent consumed';
  }

  @override
  String onboardingBudgetCapTemplate(Object amount, Object currency) {
    return 'Budget cap: $amount $currency';
  }

  @override
  String onboardingBudgetSavingsTemplate(Object amount, Object currency) {
    return 'Save up to $amount $currency this month';
  }

  @override
  String homeComparedPreviousTemplate(Object change) {
    return '$change compared with last month';
  }

  @override
  String homeDaysRemainingTemplate(Object days) {
    return '$days days remaining in the billing cycle';
  }

  @override
  String get readingsBack => 'Back';

  @override
  String get readingsTitle => 'Record a new reading';

  @override
  String get readingsActiveMeterLabel => 'Active meter:';

  @override
  String get readingsActiveMeterName => 'Main apartment meter';

  @override
  String get readingsNotificationsHelp => 'Notifications and help';

  @override
  String get readingsMethodManual => 'Manual';

  @override
  String get readingsMethodCamera => 'Scan with camera';

  @override
  String get readingsMethodVoice => 'Voice input';

  @override
  String get readingsManualInputLabel => 'Enter meter reading';

  @override
  String get readingsManualInputHint => 'Enter the reading in kWh; decimals are supported';

  @override
  String get readingsManualInputRequired => 'Enter a meter reading.';

  @override
  String get readingsManualInputConfirm => 'Use this reading';

  @override
  String get readingsDetectedMeterScreen => 'Detected meter display';

  @override
  String get readingsFlash => 'Flash';

  @override
  String get readingsRetake => 'Retake';

  @override
  String readingsOcrSuccess(int accuracy) {
    return 'Reading detected successfully ($accuracy% accuracy)';
  }

  @override
  String readingsOcrVersion(String version) {
    return 'OCR v$version';
  }

  @override
  String get readingsCurrentReading => 'Current confirmed reading';

  @override
  String get readingsEditableManually => 'Can be edited manually';

  @override
  String get readingsEnergyUnitParenthetical => '(kWh)';

  @override
  String readingsPreviousReadingTemplate(String date) {
    return 'Previous reading ($date):';
  }

  @override
  String get readingsConsumptionDifference => 'Net consumption difference:';

  @override
  String readingsTierTemplate(String tier) {
    return '(Tier $tier)';
  }

  @override
  String get readingsVerificationStatus =>
      'Reading is correct and consistent with your usual consumption rate';

  @override
  String get readingsDateTimeLabel => 'Reading date and time';

  @override
  String get readingsSelectDate => 'Select reading date';

  @override
  String get readingsSelectTime => 'Select reading time';

  @override
  String get readingsNotesLabel => 'Additional notes (optional)';

  @override
  String get readingsNotesHint => 'Add a note about this reading...';

  @override
  String get readingsSampleNotes => 'Regular mid-month reading';

  @override
  String get readingsVoiceInvitation => 'Or tap and speak to record the reading:';

  @override
  String get readingsVoiceSamplePhrase => '\"Fourteen thousand eight hundred and ninety-two\"';

  @override
  String get readingsSafetyWarning =>
      'Automatically extracted readings are not accepted without your review and manual confirmation to preserve the accuracy of tariff tier and monthly cost calculations.';

  @override
  String get readingsReviewConfirm => 'Review and confirm reading';

  @override
  String get readingsConfirmationPreviewMessage =>
      'This is a preview only; the reading was not saved.';

  @override
  String get readingsVoiceTitle => 'Voice reading input';

  @override
  String get readingsVoicePrompt => 'Speak your meter reading after tapping the microphone.';

  @override
  String get readingsVoiceInitializing => 'Preparing speech recognition…';

  @override
  String get readingsVoiceUnavailable => 'Speech recognition is unavailable on this device.';

  @override
  String get readingsVoicePermissionDenied =>
      'Microphone or speech recognition permission was denied. Allow access in Settings, then try again.';

  @override
  String get readingsVoiceError => 'Speech recognition encountered an error. Please try again.';

  @override
  String get readingsVoiceNoNumberDetected =>
      'No meter reading was found. Try speaking the reading again.';

  @override
  String get readingsVoiceMultipleNumbersDetected =>
      'More than one number was detected. Please say a single meter reading.';

  @override
  String get readingsVoiceInvalidDecimal => 'The decimal reading was unclear. Please try again.';

  @override
  String get readingsVoiceInvalidNumber =>
      'The recognized reading is not a valid number. Please try again.';

  @override
  String get readingsVoiceStart => 'Start listening';

  @override
  String get readingsVoiceStop => 'Stop listening';

  @override
  String get readingsVoiceListening => 'Listening… Speak now.';

  @override
  String get readingsVoiceRecognizedText => 'Recognized text';

  @override
  String get readingsVoiceWaitingForText => 'Your spoken words will appear here.';

  @override
  String readingsVoiceActiveLanguage(String language, String locale) {
    return 'Recognition language: $language ($locale)';
  }

  @override
  String get readingsVoiceLanguageArabic => 'Arabic';

  @override
  String get readingsVoiceLanguageEnglish => 'English';

  @override
  String get readingsVoiceLanguageSelector => 'Recognition language';

  @override
  String readingsVoiceLanguageFallback(String requestedLanguage, String activeLanguage) {
    return '$requestedLanguage speech recognition is unavailable. Using $activeLanguage instead.';
  }

  @override
  String get readingsVoiceLanguagesUnsupported =>
      'This device has no Arabic or English speech recognition language installed.';

  @override
  String get readingsVoiceRetry => 'Try again';
}
