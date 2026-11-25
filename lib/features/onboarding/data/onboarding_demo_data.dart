/// Static illustrative values used in onboarding examples.
///
/// They are presentation samples and do not represent live tariff calculations.
final class OnboardingDemoData {
  const OnboardingDemoData._();

  static const String meterReading = '14,892';
  static const String exampleTierLimitKwh = '350';

  static const String exampleBillEgp = '148.50';
  static const String exampleUsageKwh = '95';
  static const double billTierCapacityProgress = 0.82;
  static const String billUsageRemainingKwh = '5';
  static const String billTierThreeRangeStartKwh = '101';
  static const String billTierThreeRangeEndKwh = '200';
  static const String billTierTwoRangeStartKwh = '51';
  static const String billTierTwoRangeEndKwh = '100';
  static const String billThresholdStartKwh = '50';
  static const String billThresholdEndKwh = '100';
  static const String billTierCapacityPercent = '82%';
  static const String billTierThreeRatePiastresPerKwh = '120';
  static const String billTierTwoNumber = '2';
  static const String billTierThreeNumber = '3';

  static const List<OnboardingTariffTierDemo> tariffTiers = [
    OnboardingTariffTierDemo(labelNumber: '1', ratePiastres: '68'),
    OnboardingTariffTierDemo(labelNumber: '2', ratePiastres: '78'),
    OnboardingTariffTierDemo(labelNumber: '3', ratePiastres: '95'),
    OnboardingTariffTierDemo(labelNumber: '4', ratePiastres: '155'),
    OnboardingTariffTierDemo(labelNumber: '5', ratePiastres: '195'),
  ];

  static const String monthlyBudgetEgp = '600';
  static const String remainingBudgetEgp = '480';
  static const String budgetConsumedPercent = '20%';
  static const double budgetGaugeProgress = 0.8;
  static const String budgetSavingsEgp = '95';
  static const List<OnboardingApplianceDemoMetric> applianceMetrics = [
    OnboardingApplianceDemoMetric(share: '42%', amountEgp: '201'),
    OnboardingApplianceDemoMetric(share: '26%', amountEgp: '124'),
    OnboardingApplianceDemoMetric(share: '18%', amountEgp: '86'),
  ];
}

final class OnboardingTariffTierDemo {
  const OnboardingTariffTierDemo({
    required this.labelNumber,
    required this.ratePiastres,
  });

  final String labelNumber;
  final String ratePiastres;
}

final class OnboardingApplianceDemoMetric {
  const OnboardingApplianceDemoMetric({
    required this.share,
    required this.amountEgp,
  });

  final String share;
  final String amountEgp;
}
