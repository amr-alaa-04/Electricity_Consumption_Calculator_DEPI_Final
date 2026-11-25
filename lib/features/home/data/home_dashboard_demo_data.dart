/// Static sample values shown on the Home dashboard.
///
/// These values are illustrative and are not calculated from meter data.
final class HomeDashboardDemoData {
  const HomeDashboardDemoData._();

  static const String meterReading = '14,892';
  static const String currentConsumptionKwh = '342';
  static const String estimatedBillEgp = '485.50';

  static const double budgetProgress = 0.81;
  static const String budgetSpentEgp = '485.50';
  static const String budgetPercent = '81%';
  static const String budgetLimitEgp = '600';
  static const String budgetRemainingEgp = '114.50';

  static const String previousMonthChange = '+4.2%';
  static const String billingDaysRemaining = '16';
  static const String currentTierStartKwh = '201';
  static const String currentTierEndKwh = '350';

  static const List<HomeTrendPoint> trendPoints = [
    HomeTrendPoint(value: '11.2', barHeight: 61),
    HomeTrendPoint(value: '13.8', barHeight: 75),
    HomeTrendPoint(value: '9.4', barHeight: 49),
    HomeTrendPoint(value: '10.1', barHeight: 54),
    HomeTrendPoint(value: '14.6', barHeight: 81),
    HomeTrendPoint(value: '16.2', barHeight: 88),
    HomeTrendPoint(value: '12.5', barHeight: 68),
  ];

  static const List<HomeApplianceDemoMetric> applianceMetrics = [
    HomeApplianceDemoMetric(share: '42%', energyKwh: '143.6'),
    HomeApplianceDemoMetric(share: '26%', energyKwh: '88.9'),
    HomeApplianceDemoMetric(share: '14%', energyKwh: '47.8'),
  ];
}

final class HomeTrendPoint {
  const HomeTrendPoint({required this.value, required this.barHeight});

  final String value;
  final double barHeight;
}

final class HomeApplianceDemoMetric {
  const HomeApplianceDemoMetric({required this.share, required this.energyKwh});

  final String share;
  final String energyKwh;
}
