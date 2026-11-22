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
  String get onboardingTierExample => 'مثال توضيحي: الشريحة الرابعة (حتى 350 ك.و.س)';

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
  String get onboardingBillTierThree => 'الشريحة 3 (101 - 200 ك.و.س)';

  @override
  String get onboardingBillTierThreeRate => '120 قرش/ك.و.س';

  @override
  String get onboardingBillTierTwo => 'الشريحة 2 (51 - 100 ك.و.س)';

  @override
  String get onboardingBillTargetTier => 'الشريحة الحالية المستهدفة';

  @override
  String get onboardingBillActive => 'نشطة الآن';

  @override
  String get onboardingBillEstimatedValue => 'القيمة المقدرة للاستهلاك';

  @override
  String get onboardingBillExampleAmount => '148.50';

  @override
  String get onboardingBillCurrency => 'ج.م';

  @override
  String get onboardingBillEquivalentBalance => 'الرصيد المكافئ';

  @override
  String get onboardingBillExampleUsage => '95';

  @override
  String get onboardingBillUsageUnit => 'ك.و.س';

  @override
  String get onboardingBillSafetyIndicator => 'مؤشر أمان الشريحة';

  @override
  String get onboardingBillRemainingUsage => 'باقي 5 ك.و.س قبل الشريحة 3';

  @override
  String get onboardingBillThresholdStart => '50 ك.و';

  @override
  String get onboardingBillThresholdEnd => '100 ك.و';

  @override
  String get onboardingBillCapacityPercent => '82% من سعة الشريحة';

  @override
  String get onboardingBillTierOneLabel => 'شريحة 1';

  @override
  String get onboardingBillTierOneRate => '68 ق';

  @override
  String get onboardingBillTierTwoLabel => 'شريحة 2';

  @override
  String get onboardingBillTierTwoRate => '78 ق';

  @override
  String get onboardingBillTierThreeLabel => 'شريحة 3';

  @override
  String get onboardingBillTierThreeShortRate => '95 ق';

  @override
  String get onboardingBillTierFourLabel => 'شريحة 4';

  @override
  String get onboardingBillTierFourRate => '155 ق';

  @override
  String get onboardingBillTierFiveLabel => 'شريحة 5';

  @override
  String get onboardingBillTierFiveRate => '195 ق';

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
  String get onboardingTierExample => 'مثال توضيحي: الشريحة الرابعة (حتى 350 ك.و.س)';

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
  String get onboardingBillTierThree => 'الشريحة 3 (101 - 200 ك.و.س)';

  @override
  String get onboardingBillTierThreeRate => '120 قرش/ك.و.س';

  @override
  String get onboardingBillTierTwo => 'الشريحة 2 (51 - 100 ك.و.س)';

  @override
  String get onboardingBillTargetTier => 'الشريحة الحالية المستهدفة';

  @override
  String get onboardingBillActive => 'نشطة الآن';

  @override
  String get onboardingBillEstimatedValue => 'القيمة المقدرة للاستهلاك';

  @override
  String get onboardingBillExampleAmount => '148.50';

  @override
  String get onboardingBillCurrency => 'ج.م';

  @override
  String get onboardingBillEquivalentBalance => 'الرصيد المكافئ';

  @override
  String get onboardingBillExampleUsage => '95';

  @override
  String get onboardingBillUsageUnit => 'ك.و.س';

  @override
  String get onboardingBillSafetyIndicator => 'مؤشر أمان الشريحة';

  @override
  String get onboardingBillRemainingUsage => 'باقي 5 ك.و.س قبل الشريحة 3';

  @override
  String get onboardingBillThresholdStart => '50 ك.و';

  @override
  String get onboardingBillThresholdEnd => '100 ك.و';

  @override
  String get onboardingBillCapacityPercent => '82% من سعة الشريحة';

  @override
  String get onboardingBillTierOneLabel => 'شريحة 1';

  @override
  String get onboardingBillTierOneRate => '68 ق';

  @override
  String get onboardingBillTierTwoLabel => 'شريحة 2';

  @override
  String get onboardingBillTierTwoRate => '78 ق';

  @override
  String get onboardingBillTierThreeLabel => 'شريحة 3';

  @override
  String get onboardingBillTierThreeShortRate => '95 ق';

  @override
  String get onboardingBillTierFourLabel => 'شريحة 4';

  @override
  String get onboardingBillTierFourRate => '155 ق';

  @override
  String get onboardingBillTierFiveLabel => 'شريحة 5';

  @override
  String get onboardingBillTierFiveRate => '195 ق';

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
}
