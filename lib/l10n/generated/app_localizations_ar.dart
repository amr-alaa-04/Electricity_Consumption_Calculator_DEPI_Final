// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Arabic (`ar`).
class AppLocalizationsAr extends AppLocalizations {
  AppLocalizationsAr([String locale = 'ar']) : super(locale);

  @override
  String get appTitle => 'حاسبة استهلاك الكهرباء';

  @override
  String get showPassword => 'إظهار كلمة المرور';

  @override
  String get hidePassword => 'إخفاء كلمة المرور';

  @override
  String get loading => 'جارٍ التحميل';

  @override
  String get invalidNumber => 'أدخل رقمًا صحيحًا';

  @override
  String get onboardingSkip => 'تخطي';

  @override
  String get onboardingOcrStatus => 'الماسح الضوئي الذكي (OCR)';

  @override
  String get onboardingAccuracy => 'دقة 99.8%';

  @override
  String get onboardingCurrentMeter => 'العداد الرقمي الحالي';

  @override
  String get onboardingAutoRecognition => 'التعرف التلقائي على الأرقام';

  @override
  String get onboardingCaptured => 'تم الالتقاط';

  @override
  String get onboardingTierInstant => 'حساب الشريحة فوري';

  @override
  String onboardingTierExampleTemplate(Object limit) {
    return 'مثال توضيحي: الشريحة الرابعة (حتى $limit ك.و.س)';
  }

  @override
  String get onboardingSampleTariffDisclaimer =>
      'تعريفة استرشادية — يلزم التحقق من جداول EgyptERA الرسمية';

  @override
  String get onboardingTrackTitle => 'سجّل قراءات عدادك بسهولة ودقة';

  @override
  String get onboardingTrackDescription =>
      'سواء بالتقاط صورة عبر الكاميرا (OCR)، أو الإدخال الصوتي، أو التسجيل اليدوي. تخلص من تراكم الفواتير والتقديرات الجزافية.';

  @override
  String get onboardingCameraFeatureTitle => 'مسح ذكي بالكاميرا عبر الذكاء الاصطناعي';

  @override
  String get onboardingCameraFeatureDescription =>
      'التقاط فوري لعداد القرص الميكانيكي أو الشاشة الرقمية';

  @override
  String get onboardingVoiceFeatureTitle => 'إمكانية الإملاء الصوتي السريع للأرقام';

  @override
  String get onboardingVoiceFeatureDescription => 'تحدث بالأرقام مباشرة دون الحاجة للكتابة اليدوية';

  @override
  String get onboardingAlertFeatureTitle => 'تنبيه تلقائي في حال وجود قراءة غير منطقية';

  @override
  String get onboardingAlertFeatureDescription =>
      'مقارنة نمط الاستهلاك وتفادي القفز غير المبرر للشرائح';

  @override
  String get onboardingAccuracyLabel => 'دقة المحاسبة';

  @override
  String get onboardingNext => 'التالي';

  @override
  String onboardingStepCount(int current, int total) {
    return 'خطوة $current من $total';
  }

  @override
  String get onboardingPrevious => 'السابق';

  @override
  String get onboardingBillTitle => 'حساب دقيق وفق شرائح الكهرباء المصرية';

  @override
  String get onboardingBillDescription =>
      'احسب تكلفتك المقدرة بنظام الشرائح التصاعدية المعمول به في مصر، وتعرف على الشريحة المستهدفة قبل صدور الفاتورة.';

  @override
  String get onboardingBillIllustrativeDisclaimer =>
      'قيم توضيحية فقط — لا تمثل تعريفة رسمية أو حسابًا فعليًا للفاتورة.';

  @override
  String get onboardingBillTargetTier => 'الشريحة الحالية المستهدفة';

  @override
  String get onboardingBillActive => 'نشطة الآن';

  @override
  String get onboardingBillEstimatedValue => 'القيمة المقدرة للاستهلاك';

  @override
  String get onboardingBillCurrency => 'ج.م';

  @override
  String get onboardingBillEquivalentBalance => 'الرصيد المكافئ';

  @override
  String get onboardingBillUsageUnit => 'ك.و.س';

  @override
  String get onboardingBillSafetyIndicator => 'مؤشر أمان الشريحة';

  @override
  String get onboardingBillFeesTitle => 'احتساب شامل لكل الرسوم الإضافية';

  @override
  String get onboardingBillFeesDescription =>
      'دعم كامل لحساب الرسوم وخدمة العملاء والدمغات الحكومية طبقًا لآخر التحديثات الرسمية.';

  @override
  String get onboardingBillProximityTitle => 'مؤشر استباقي لتغير الشريحة';

  @override
  String get onboardingBillProximityDescription =>
      'مؤشر ذكي يوضح قرب انتقالك لشريحة أعلى وأغلى سعرًا لتفادي الحساب بأثر رجعي.';

  @override
  String get onboardingBillSavingsTitle => 'إرشادات توفير مخصصة';

  @override
  String get onboardingBillSavingsDescription =>
      'نصائح لتفادي القفز للشريحة التالية بناءً على مواعيد تشغيل الأجهزة الأعلى استهلاكًا.';

  @override
  String get onboardingBrandShort => 'استهلاك الكهرباء';

  @override
  String get onboardingBudgetMonthly => 'الميزانية الشهرية المقدرة';

  @override
  String get onboardingBudgetRemaining => 'الرصيد المتبقي';

  @override
  String get onboardingBudgetCurrency => 'ج.م';

  @override
  String get onboardingApplianceAirConditioner => 'تكييف';

  @override
  String get onboardingApplianceWaterHeater => 'سخان';

  @override
  String get onboardingApplianceRefrigerator => 'ثلاجة';

  @override
  String onboardingApplianceAmount(Object amount, Object currency) {
    return '$amount $currency';
  }

  @override
  String get onboardingBudgetTitle => 'راقب ميزانيتك وتحكّم باستهلاك أجهزتك';

  @override
  String get onboardingBudgetDescription =>
      'حدد سقفًا لمصاريف الكهرباء الشهرية وتلقَّ تنبيهات مبكرة عند استهلاك 80%، واكتشف الأجهزة الأكثر سحبًا للطاقة في منزلك بدقة.';

  @override
  String get onboardingBudgetAlerts =>
      'تنبيهات استباقية قبل نفاد الرصيد أو الانتقال إلى شريحة أعلى';

  @override
  String get onboardingBudgetSimulator =>
      'محاكي سيناريوهات التشغيل لتخفيض ساعات عمل التكييف شهريًا';

  @override
  String get onboardingBudgetStartNow => 'ابدأ الآن مجانًا';

  @override
  String get onboardingBudgetDisclaimer =>
      'تقديرات استرشادية لمساعدتك على الترشيد وفقًا لتعريفة الكهرباء المصرية الرسمية';

  @override
  String get welcomeSubtitle => 'مساعدك الذكي لإدارة ومتابعة فواتيرك المنزلية';

  @override
  String get welcomeLoginTitle => 'تسجيل الدخول';

  @override
  String get welcomeLoginGreeting => 'أهلًا بك مجددًا، أدخل بياناتك للمتابعة';

  @override
  String get welcomeIdentifierLabel => 'البريد الإلكتروني أو رقم الهاتف';

  @override
  String get welcomeIdentifierHint => 'name@example.com';

  @override
  String get welcomePasswordLabel => 'كلمة المرور';

  @override
  String get welcomePasswordHint => '••••••••';

  @override
  String get welcomeRememberMe => 'تذكرني';

  @override
  String get welcomeForgotPassword => 'نسيت كلمة المرور؟';

  @override
  String get welcomeContinueDivider => 'أو المتابعة كزائر';

  @override
  String get welcomeGuest => 'الدخول كضيف وتجربة الحاسبة مباشرة';

  @override
  String get welcomeNoAccount => 'ليس لديك حساب؟';

  @override
  String get welcomeCreateAccount => 'إنشاء حساب جديد';

  @override
  String get welcomePrivacy => 'جميع بيانات العدادات تخزن محليًا وتخضع لسياسة الخصوصية المصرية';

  @override
  String get createAccountTitle => 'أنشئ حسابك';

  @override
  String get createAccountFullNameLabel => 'الاسم بالكامل';

  @override
  String get createAccountFullNameHint => 'أدخل اسمك بالكامل';

  @override
  String get createAccountEmailLabel => 'البريد الإلكتروني';

  @override
  String get createAccountEmailHint => 'name@example.com';

  @override
  String get createAccountPhoneLabel => 'رقم الهاتف';

  @override
  String get createAccountPhoneHint => '+20 10 1234 5678';

  @override
  String get createAccountPasswordHint => 'أنشئ كلمة مرور';

  @override
  String get createAccountConfirmPasswordLabel => 'تأكيد كلمة المرور';

  @override
  String get createAccountConfirmPasswordHint => 'أعد إدخال كلمة المرور';

  @override
  String get createAccountButton => 'إنشاء حساب';

  @override
  String get createAccountBackToLogin => 'العودة إلى تسجيل الدخول';

  @override
  String get homeBrand => 'استهلاك الكهرباء';

  @override
  String get homeGovernment => 'الجمهورية المصرية';

  @override
  String get homeNotifications => 'الإشعارات';

  @override
  String get homeDisclaimerTitle => 'تنبيه:';

  @override
  String get homeDisclaimer =>
      'تقديرات استرشادية للمتابعة الشخصية وحساب الشرائح وليست فاتورة رسمية صادرة عن وزارة الكهرباء.';

  @override
  String get homeGreeting => 'مرحباً، أحمد مصطفى';

  @override
  String get homeGreetingDate => 'الأحد، 15 أكتوبر 2023';

  @override
  String get homeAvatarInitials => 'أ م';

  @override
  String get homeSmartMeter => 'العداد الذكي';

  @override
  String get homeCurrentConsumption => 'استهلاك الشهر الحالي';

  @override
  String homeCurrentTierTemplate(Object start, Object end) {
    return 'الشريحة الرابعة ($start–$end ك.و.س)';
  }

  @override
  String get homeTotalEnergy => 'إجمالي الطاقة المستهلكة';

  @override
  String get homeEstimatedBill => 'الفاتورة التقديرية';

  @override
  String get homeEnergyUnit => 'ك.و.س';

  @override
  String get homeCurrency => 'ج.م';

  @override
  String get homeMonthlyBudget => 'الميزانية الشهرية';

  @override
  String get homeBudgetWarning => 'تنبيه: تجاوزت 80%';

  @override
  String get homeBudgetSpent => 'المستهلك';

  @override
  String get homeBudgetLimit => 'الحد الأقصى';

  @override
  String get homeBudgetRemaining => 'المتبقي من الميزانية هذا الشهر:';

  @override
  String get homeQuickActions => 'الإجراءات السريعة';

  @override
  String get homeMore => 'المزيد';

  @override
  String get homeActionRecordReading => 'تسجيل قراءة';

  @override
  String get homeActionScanMeter => 'مسح العداد';

  @override
  String get homeActionVoiceEntry => 'تسجيل صوتي';

  @override
  String get homeActionCalculateBill => 'حساب الفاتورة';

  @override
  String get homeConsumptionRate => 'معدل الاستهلاك';

  @override
  String get homeLastSevenDays => 'آخر 7 أيام (ك.و.س)';

  @override
  String get homeDaily => 'يومي';

  @override
  String get homeWeekly => 'أسبوعي';

  @override
  String get homeMonthly => 'شهري';

  @override
  String get homeSaturday => 'السبت';

  @override
  String get homeSunday => 'الأحد';

  @override
  String get homeMonday => 'الإثنين';

  @override
  String get homeTuesday => 'الثلاثاء';

  @override
  String get homeWednesday => 'الأربعاء';

  @override
  String get homeThursday => 'الخميس';

  @override
  String get homeToday => 'اليوم';

  @override
  String get homeTopAppliances => 'الأجهزة الأكثر استهلاكاً';

  @override
  String get homeDetails => 'التفاصيل';

  @override
  String get homeAirConditioner => 'التكييف (غرفة المعيشة)';

  @override
  String get homeAirConditionerUsage => 'متوسط 7 ساعات يومياً';

  @override
  String get homeRefrigerator => 'الثلاجة 18 قدم';

  @override
  String get homeRefrigeratorUsage => 'تعمل باستمرار';

  @override
  String get homeWaterHeater => 'سخان المياه الكهربائي';

  @override
  String get homeWaterHeaterUsage => '2.5 ساعة يومياً';

  @override
  String get homeLastReading => 'آخر قراءة مسجلة في العداد';

  @override
  String get homeReadingDate => '12 أكتوبر';

  @override
  String get homeNavHome => 'الرئيسية';

  @override
  String get homeNavReadings => 'القراءات';

  @override
  String get homeNavAnalytics => 'التحليلات';

  @override
  String get homeNavAppliances => 'الأجهزة';

  @override
  String get homeNavSettings => 'الإعدادات';

  @override
  String onboardingBillTierRangeTemplate(Object tier, Object start, Object end) {
    return 'الشريحة $tier ($start–$end ك.و.س)';
  }

  @override
  String onboardingBillTierLabelTemplate(Object tier) {
    return 'شريحة $tier';
  }

  @override
  String onboardingBillTierRateTemplate(Object rate) {
    return '$rate ق';
  }

  @override
  String onboardingBillPaisaRateTemplate(Object rate) {
    return '$rate قرش/ك.و.س';
  }

  @override
  String onboardingBillRemainingTemplate(Object amount, Object tier) {
    return 'باقي $amount ك.و.س قبل الشريحة $tier';
  }

  @override
  String onboardingBillThresholdTemplate(Object amount) {
    return '$amount ك.و';
  }

  @override
  String onboardingBillCapacityTemplate(Object percent) {
    return '$percent من سعة الشريحة';
  }

  @override
  String onboardingBudgetConsumedTemplate(Object percent) {
    return 'تم استهلاك $percent';
  }

  @override
  String onboardingBudgetCapTemplate(Object amount, Object currency) {
    return 'سقف الميزانية: $amount $currency';
  }

  @override
  String onboardingBudgetSavingsTemplate(Object amount, Object currency) {
    return 'وفّر حتى $amount $currency هذا الشهر';
  }

  @override
  String homeComparedPreviousTemplate(Object change) {
    return '$change مقارنة بالشهر السابق';
  }

  @override
  String homeDaysRemainingTemplate(Object days) {
    return 'متبقي $days يوم على الإغلاق';
  }
}

/// The translations for Arabic, as used in Egypt (`ar_EG`).
class AppLocalizationsArEg extends AppLocalizationsAr {
  AppLocalizationsArEg() : super('ar_EG');

  @override
  String get appTitle => 'حاسبة استهلاك الكهرباء';

  @override
  String get showPassword => 'إظهار كلمة المرور';

  @override
  String get hidePassword => 'إخفاء كلمة المرور';

  @override
  String get loading => 'جارٍ التحميل';

  @override
  String get invalidNumber => 'أدخل رقمًا صحيحًا';

  @override
  String get onboardingSkip => 'تخطي';

  @override
  String get onboardingOcrStatus => 'الماسح الضوئي الذكي (OCR)';

  @override
  String get onboardingAccuracy => 'دقة 99.8%';

  @override
  String get onboardingCurrentMeter => 'العداد الرقمي الحالي';

  @override
  String get onboardingAutoRecognition => 'التعرف التلقائي على الأرقام';

  @override
  String get onboardingCaptured => 'تم الالتقاط';

  @override
  String get onboardingTierInstant => 'حساب الشريحة فوري';

  @override
  String onboardingTierExampleTemplate(Object limit) {
    return 'مثال توضيحي: الشريحة الرابعة (حتى $limit ك.و.س)';
  }

  @override
  String get onboardingSampleTariffDisclaimer =>
      'تعريفة استرشادية — يلزم التحقق من جداول EgyptERA الرسمية';

  @override
  String get onboardingTrackTitle => 'سجّل قراءات عدادك بسهولة ودقة';

  @override
  String get onboardingTrackDescription =>
      'سواء بالتقاط صورة عبر الكاميرا (OCR)، أو الإدخال الصوتي، أو التسجيل اليدوي. تخلص من تراكم الفواتير والتقديرات الجزافية.';

  @override
  String get onboardingCameraFeatureTitle => 'مسح ذكي بالكاميرا عبر الذكاء الاصطناعي';

  @override
  String get onboardingCameraFeatureDescription =>
      'التقاط فوري لعداد القرص الميكانيكي أو الشاشة الرقمية';

  @override
  String get onboardingVoiceFeatureTitle => 'إمكانية الإملاء الصوتي السريع للأرقام';

  @override
  String get onboardingVoiceFeatureDescription => 'تحدث بالأرقام مباشرة دون الحاجة للكتابة اليدوية';

  @override
  String get onboardingAlertFeatureTitle => 'تنبيه تلقائي في حال وجود قراءة غير منطقية';

  @override
  String get onboardingAlertFeatureDescription =>
      'مقارنة نمط الاستهلاك وتفادي القفز غير المبرر للشرائح';

  @override
  String get onboardingAccuracyLabel => 'دقة المحاسبة';

  @override
  String get onboardingNext => 'التالي';

  @override
  String onboardingStepCount(int current, int total) {
    return 'خطوة $current من $total';
  }

  @override
  String get onboardingPrevious => 'السابق';

  @override
  String get onboardingBillTitle => 'حساب دقيق وفق شرائح الكهرباء المصرية';

  @override
  String get onboardingBillDescription =>
      'احسب تكلفتك المقدرة بنظام الشرائح التصاعدية المعمول به في مصر، وتعرف على الشريحة المستهدفة قبل صدور الفاتورة.';

  @override
  String get onboardingBillIllustrativeDisclaimer =>
      'قيم توضيحية فقط — لا تمثل تعريفة رسمية أو حسابًا فعليًا للفاتورة.';

  @override
  String get onboardingBillTargetTier => 'الشريحة الحالية المستهدفة';

  @override
  String get onboardingBillActive => 'نشطة الآن';

  @override
  String get onboardingBillEstimatedValue => 'القيمة المقدرة للاستهلاك';

  @override
  String get onboardingBillCurrency => 'ج.م';

  @override
  String get onboardingBillEquivalentBalance => 'الرصيد المكافئ';

  @override
  String get onboardingBillUsageUnit => 'ك.و.س';

  @override
  String get onboardingBillSafetyIndicator => 'مؤشر أمان الشريحة';

  @override
  String get onboardingBillFeesTitle => 'احتساب شامل لكل الرسوم الإضافية';

  @override
  String get onboardingBillFeesDescription =>
      'دعم كامل لحساب الرسوم وخدمة العملاء والدمغات الحكومية طبقًا لآخر التحديثات الرسمية.';

  @override
  String get onboardingBillProximityTitle => 'مؤشر استباقي لتغير الشريحة';

  @override
  String get onboardingBillProximityDescription =>
      'مؤشر ذكي يوضح قرب انتقالك لشريحة أعلى وأغلى سعرًا لتفادي الحساب بأثر رجعي.';

  @override
  String get onboardingBillSavingsTitle => 'إرشادات توفير مخصصة';

  @override
  String get onboardingBillSavingsDescription =>
      'نصائح لتفادي القفز للشريحة التالية بناءً على مواعيد تشغيل الأجهزة الأعلى استهلاكًا.';

  @override
  String get onboardingBrandShort => 'استهلاك الكهرباء';

  @override
  String get onboardingBudgetMonthly => 'الميزانية الشهرية المقدرة';

  @override
  String get onboardingBudgetRemaining => 'الرصيد المتبقي';

  @override
  String get onboardingBudgetCurrency => 'ج.م';

  @override
  String get onboardingApplianceAirConditioner => 'تكييف';

  @override
  String get onboardingApplianceWaterHeater => 'سخان';

  @override
  String get onboardingApplianceRefrigerator => 'ثلاجة';

  @override
  String onboardingApplianceAmount(Object amount, Object currency) {
    return '$amount $currency';
  }

  @override
  String get onboardingBudgetTitle => 'راقب ميزانيتك وتحكّم باستهلاك أجهزتك';

  @override
  String get onboardingBudgetDescription =>
      'حدد سقفًا لمصاريف الكهرباء الشهرية وتلقَّ تنبيهات مبكرة عند استهلاك 80%، واكتشف الأجهزة الأكثر سحبًا للطاقة في منزلك بدقة.';

  @override
  String get onboardingBudgetAlerts =>
      'تنبيهات استباقية قبل نفاد الرصيد أو الانتقال إلى شريحة أعلى';

  @override
  String get onboardingBudgetSimulator =>
      'محاكي سيناريوهات التشغيل لتخفيض ساعات عمل التكييف شهريًا';

  @override
  String get onboardingBudgetStartNow => 'ابدأ الآن مجانًا';

  @override
  String get onboardingBudgetDisclaimer =>
      'تقديرات استرشادية لمساعدتك على الترشيد وفقًا لتعريفة الكهرباء المصرية الرسمية';

  @override
  String get welcomeSubtitle => 'مساعدك الذكي لإدارة ومتابعة فواتيرك المنزلية';

  @override
  String get welcomeLoginTitle => 'تسجيل الدخول';

  @override
  String get welcomeLoginGreeting => 'أهلًا بك مجددًا، أدخل بياناتك للمتابعة';

  @override
  String get welcomeIdentifierLabel => 'البريد الإلكتروني أو رقم الهاتف';

  @override
  String get welcomeIdentifierHint => 'name@example.com';

  @override
  String get welcomePasswordLabel => 'كلمة المرور';

  @override
  String get welcomePasswordHint => '••••••••';

  @override
  String get welcomeRememberMe => 'تذكرني';

  @override
  String get welcomeForgotPassword => 'نسيت كلمة المرور؟';

  @override
  String get welcomeContinueDivider => 'أو المتابعة كزائر';

  @override
  String get welcomeGuest => 'الدخول كضيف وتجربة الحاسبة مباشرة';

  @override
  String get welcomeNoAccount => 'ليس لديك حساب؟';

  @override
  String get welcomeCreateAccount => 'إنشاء حساب جديد';

  @override
  String get welcomePrivacy => 'جميع بيانات العدادات تخزن محليًا وتخضع لسياسة الخصوصية المصرية';

  @override
  String get createAccountTitle => 'أنشئ حسابك';

  @override
  String get createAccountFullNameLabel => 'الاسم بالكامل';

  @override
  String get createAccountFullNameHint => 'أدخل اسمك بالكامل';

  @override
  String get createAccountEmailLabel => 'البريد الإلكتروني';

  @override
  String get createAccountEmailHint => 'name@example.com';

  @override
  String get createAccountPhoneLabel => 'رقم الهاتف';

  @override
  String get createAccountPhoneHint => '+20 10 1234 5678';

  @override
  String get createAccountPasswordHint => 'أنشئ كلمة مرور';

  @override
  String get createAccountConfirmPasswordLabel => 'تأكيد كلمة المرور';

  @override
  String get createAccountConfirmPasswordHint => 'أعد إدخال كلمة المرور';

  @override
  String get createAccountButton => 'إنشاء حساب';

  @override
  String get createAccountBackToLogin => 'العودة إلى تسجيل الدخول';

  @override
  String get homeBrand => 'استهلاك الكهرباء';

  @override
  String get homeGovernment => 'الجمهورية المصرية';

  @override
  String get homeNotifications => 'الإشعارات';

  @override
  String get homeDisclaimerTitle => 'تنبيه:';

  @override
  String get homeDisclaimer =>
      'تقديرات استرشادية للمتابعة الشخصية وحساب الشرائح وليست فاتورة رسمية صادرة عن وزارة الكهرباء.';

  @override
  String get homeGreeting => 'مرحباً، أحمد مصطفى';

  @override
  String get homeGreetingDate => 'الأحد، 15 أكتوبر 2023';

  @override
  String get homeAvatarInitials => 'أ م';

  @override
  String get homeSmartMeter => 'العداد الذكي';

  @override
  String get homeCurrentConsumption => 'استهلاك الشهر الحالي';

  @override
  String homeCurrentTierTemplate(Object start, Object end) {
    return 'الشريحة الرابعة ($start–$end ك.و.س)';
  }

  @override
  String get homeTotalEnergy => 'إجمالي الطاقة المستهلكة';

  @override
  String get homeEstimatedBill => 'الفاتورة التقديرية';

  @override
  String get homeEnergyUnit => 'ك.و.س';

  @override
  String get homeCurrency => 'ج.م';

  @override
  String get homeMonthlyBudget => 'الميزانية الشهرية';

  @override
  String get homeBudgetWarning => 'تنبيه: تجاوزت 80%';

  @override
  String get homeBudgetSpent => 'المستهلك';

  @override
  String get homeBudgetLimit => 'الحد الأقصى';

  @override
  String get homeBudgetRemaining => 'المتبقي من الميزانية هذا الشهر:';

  @override
  String get homeQuickActions => 'الإجراءات السريعة';

  @override
  String get homeMore => 'المزيد';

  @override
  String get homeActionRecordReading => 'تسجيل قراءة';

  @override
  String get homeActionScanMeter => 'مسح العداد';

  @override
  String get homeActionVoiceEntry => 'تسجيل صوتي';

  @override
  String get homeActionCalculateBill => 'حساب الفاتورة';

  @override
  String get homeConsumptionRate => 'معدل الاستهلاك';

  @override
  String get homeLastSevenDays => 'آخر 7 أيام (ك.و.س)';

  @override
  String get homeDaily => 'يومي';

  @override
  String get homeWeekly => 'أسبوعي';

  @override
  String get homeMonthly => 'شهري';

  @override
  String get homeSaturday => 'السبت';

  @override
  String get homeSunday => 'الأحد';

  @override
  String get homeMonday => 'الإثنين';

  @override
  String get homeTuesday => 'الثلاثاء';

  @override
  String get homeWednesday => 'الأربعاء';

  @override
  String get homeThursday => 'الخميس';

  @override
  String get homeToday => 'اليوم';

  @override
  String get homeTopAppliances => 'الأجهزة الأكثر استهلاكاً';

  @override
  String get homeDetails => 'التفاصيل';

  @override
  String get homeAirConditioner => 'التكييف (غرفة المعيشة)';

  @override
  String get homeAirConditionerUsage => 'متوسط 7 ساعات يومياً';

  @override
  String get homeRefrigerator => 'الثلاجة 18 قدم';

  @override
  String get homeRefrigeratorUsage => 'تعمل باستمرار';

  @override
  String get homeWaterHeater => 'سخان المياه الكهربائي';

  @override
  String get homeWaterHeaterUsage => '2.5 ساعة يومياً';

  @override
  String get homeLastReading => 'آخر قراءة مسجلة في العداد';

  @override
  String get homeReadingDate => '12 أكتوبر';

  @override
  String get homeNavHome => 'الرئيسية';

  @override
  String get homeNavReadings => 'القراءات';

  @override
  String get homeNavAnalytics => 'التحليلات';

  @override
  String get homeNavAppliances => 'الأجهزة';

  @override
  String get homeNavSettings => 'الإعدادات';

  @override
  String onboardingBillTierRangeTemplate(Object tier, Object start, Object end) {
    return 'الشريحة $tier ($start–$end ك.و.س)';
  }

  @override
  String onboardingBillTierLabelTemplate(Object tier) {
    return 'شريحة $tier';
  }

  @override
  String onboardingBillTierRateTemplate(Object rate) {
    return '$rate ق';
  }

  @override
  String onboardingBillPaisaRateTemplate(Object rate) {
    return '$rate قرش/ك.و.س';
  }

  @override
  String onboardingBillRemainingTemplate(Object amount, Object tier) {
    return 'باقي $amount ك.و.س قبل الشريحة $tier';
  }

  @override
  String onboardingBillThresholdTemplate(Object amount) {
    return '$amount ك.و';
  }

  @override
  String onboardingBillCapacityTemplate(Object percent) {
    return '$percent من سعة الشريحة';
  }

  @override
  String onboardingBudgetConsumedTemplate(Object percent) {
    return 'تم استهلاك $percent';
  }

  @override
  String onboardingBudgetCapTemplate(Object amount, Object currency) {
    return 'سقف الميزانية: $amount $currency';
  }

  @override
  String onboardingBudgetSavingsTemplate(Object amount, Object currency) {
    return 'وفّر حتى $amount $currency هذا الشهر';
  }

  @override
  String homeComparedPreviousTemplate(Object change) {
    return '$change مقارنة بالشهر السابق';
  }

  @override
  String homeDaysRemainingTemplate(Object days) {
    return 'متبقي $days يوم على الإغلاق';
  }
}
