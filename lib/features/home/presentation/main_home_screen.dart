import 'package:flutter/material.dart';

import '../../../core/theme/app_colors.dart';
import '../../../core/theme/app_shape_tokens.dart';
import '../../../core/theme/app_typography.dart';
import '../../../core/widgets/buttons/app_icon_button.dart';
import '../../../core/widgets/navigation/app_bottom_navigation_bar.dart';
import '../../../core/widgets/surfaces/app_icon_tile.dart';
import '../../../core/widgets/surfaces/app_surface_card.dart';
import '../data/home_dashboard_demo_data.dart';
import '../../../l10n/generated/app_localizations.dart';

class MainHomeScreen extends StatefulWidget {
  const MainHomeScreen({super.key});

  @override
  State<MainHomeScreen> createState() => _MainHomeScreenState();
}

class _MainHomeScreenState extends State<MainHomeScreen> {
  int _selectedTrend = 0;

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;

    return Scaffold(
      key: const ValueKey('main-home-screen'),
      backgroundColor: AppColors.surfaceContainerLowest,
      body: SafeArea(
        child: LayoutBuilder(
          builder: (context, constraints) {
            final contentWidth = constraints.maxWidth > 440 ? 440.0 : constraints.maxWidth;

            return Center(
              child: SizedBox(
                width: contentWidth,
                child: Column(
                  children: [
                    _topBar(context, l10n),
                    Expanded(
                      child: SingleChildScrollView(
                        padding: const EdgeInsets.fromLTRB(
                          AppSpacing.gutter,
                          AppSpacing.small + AppSpacing.micro,
                          AppSpacing.gutter,
                          AppSpacing.medium,
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            _disclaimer(l10n),
                            const SizedBox(height: AppSpacing.medium),
                            _profile(l10n),
                            const SizedBox(height: AppSpacing.medium),
                            _consumptionCard(l10n),
                            const SizedBox(height: AppSpacing.medium),
                            _budgetCard(l10n),
                            const SizedBox(height: AppSpacing.medium),
                            _quickActions(l10n),
                            const SizedBox(height: AppSpacing.medium),
                            _trendCard(l10n),
                            const SizedBox(height: AppSpacing.medium),
                            _appliancesCard(l10n),
                            const SizedBox(height: AppSpacing.medium),
                            _recentReadingCard(l10n),
                          ],
                        ),
                      ),
                    ),
                    AppBottomNavigationBar(
                      currentIndex: 0,
                      destinations: [
                        NavigationDestination(
                          icon: const Icon(Icons.home_outlined),
                          selectedIcon: const Icon(Icons.home),
                          label: l10n.homeNavHome,
                        ),
                        NavigationDestination(
                          icon: const Icon(Icons.speed),
                          label: l10n.homeNavReadings,
                        ),
                        NavigationDestination(
                          icon: const Icon(Icons.analytics_outlined),
                          label: l10n.homeNavAnalytics,
                        ),
                        NavigationDestination(
                          icon: const Icon(Icons.kitchen_outlined),
                          label: l10n.homeNavAppliances,
                        ),
                        NavigationDestination(
                          icon: const Icon(Icons.settings_outlined),
                          label: l10n.homeNavSettings,
                        ),
                      ],
                      onDestinationSelected: (_) {},
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }

  Widget _topBar(BuildContext context, AppLocalizations l10n) => Container(
    color: AppColors.background,
    padding: const EdgeInsets.symmetric(
      horizontal: AppSpacing.gutter,
      vertical: AppSpacing.small,
    ),
    child: Row(
      children: [
        const AppIconTile(
          icon: Icons.bolt,
          size: 40,
          iconSize: 24,
          backgroundColor: AppColors.primary,
          iconColor: AppColors.onPrimary,
          borderRadius: BorderRadius.all(AppShapeTokens.medium),
        ),
        const SizedBox(width: AppSpacing.small),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                l10n.homeBrand,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: AppTypography.textTheme.titleLarge?.copyWith(
                  color: AppColors.primary,
                  fontWeight: FontWeight.w700,
                ),
              ),
              Text(
                l10n.homeGovernment,
                style: AppTypography.textTheme.labelSmall?.copyWith(
                  color: AppColors.onSurfaceVariant,
                ),
              ),
            ],
          ),
        ),
        AppIconButton(
          key: const ValueKey('home-notifications'),
          icon: const Icon(Icons.notifications_none),
          tooltip: l10n.homeNotifications,
          onPressed: () {},
          foregroundColor: AppColors.primary,
        ),
      ],
    ),
  );

  Widget _disclaimer(AppLocalizations l10n) => AppSurfaceCard(
    padding: const EdgeInsets.all(AppSpacing.small + AppSpacing.micro),
    backgroundColor: AppColors.surfaceContainerHigh.withValues(alpha: 0.6),
    borderColor: AppColors.outlineVariant.withValues(alpha: 0.4),
    borderRadius: const BorderRadius.all(AppShapeTokens.medium),
    elevation: 0,
    child: Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Icon(Icons.info_outline, color: AppColors.secondary, size: 20),
        const SizedBox(width: AppSpacing.small),
        Expanded(
          child: Text.rich(
            TextSpan(
              children: [
                TextSpan(
                  text: '${l10n.homeDisclaimerTitle} ',
                  style: const TextStyle(
                    color: AppColors.primary,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                TextSpan(text: l10n.homeDisclaimer),
              ],
            ),
            style: AppTypography.textTheme.bodySmall?.copyWith(
              color: AppColors.onSurfaceVariant,
            ),
          ),
        ),
      ],
    ),
  );

  Widget _profile(AppLocalizations l10n) => LayoutBuilder(
    builder: (context, constraints) {
      final identity = Row(
        children: [
          Container(
            width: 48,
            height: 48,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: AppColors.surfaceContainer,
              border: Border.all(color: AppColors.secondary.withValues(alpha: 0.35), width: 2),
            ),
            child: Center(
              child: Text(
                l10n.homeAvatarInitials,
                style: AppTypography.textTheme.labelLarge?.copyWith(
                  color: AppColors.primary,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
          ),
          const SizedBox(width: AppSpacing.small),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Flexible(
                      child: Text(
                        l10n.homeGreeting,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: AppTypography.textTheme.headlineSmall?.copyWith(
                          color: AppColors.onSurface,
                        ),
                      ),
                    ),
                    const SizedBox(width: AppSpacing.micro),
                    const Icon(Icons.verified, color: AppColors.secondary, size: 16),
                  ],
                ),
                Text(
                  l10n.homeGreetingDate,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: AppTypography.textTheme.labelMedium?.copyWith(
                    color: AppColors.outline,
                  ),
                ),
              ],
            ),
          ),
        ],
      );
      final meterBadge = DecoratedBox(
        decoration: BoxDecoration(
          color: AppColors.surfaceContainer,
          border: Border.all(color: AppColors.outlineVariant.withValues(alpha: 0.3)),
          borderRadius: const BorderRadius.all(AppShapeTokens.pill),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: AppSpacing.small + AppSpacing.micro,
            vertical: AppSpacing.micro,
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Icon(Icons.speed, color: AppColors.secondary, size: 16),
              const SizedBox(width: AppSpacing.micro),
              Text(
                l10n.homeSmartMeter,
                style: AppTypography.textTheme.labelSmall?.copyWith(
                  color: AppColors.secondary,
                ),
              ),
            ],
          ),
        ),
      );

      if (constraints.maxWidth < 380) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            identity,
            const SizedBox(height: AppSpacing.small),
            Align(alignment: AlignmentDirectional.centerEnd, child: meterBadge),
          ],
        );
      }
      return Row(
        children: [
          Expanded(child: identity),
          meterBadge,
        ],
      );
    },
  );

  Widget _consumptionCard(AppLocalizations l10n) => LayoutBuilder(
    builder: (context, constraints) {
      final header = Wrap(
        alignment: WrapAlignment.spaceBetween,
        crossAxisAlignment: WrapCrossAlignment.center,
        spacing: AppSpacing.small,
        runSpacing: AppSpacing.small,
        children: [
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Icon(Icons.speed, color: AppColors.secondaryFixed, size: 22),
              const SizedBox(width: AppSpacing.small),
              Flexible(
                child: Text(
                  l10n.homeCurrentConsumption,
                  maxLines: 2,
                  softWrap: true,
                  style: AppTypography.textTheme.titleLarge?.copyWith(
                    color: AppColors.secondaryFixed,
                  ),
                ),
              ),
            ],
          ),
          _heroPill(
            l10n.homeCurrentTierTemplate(
              HomeDashboardDemoData.currentTierStartKwh,
              HomeDashboardDemoData.currentTierEndKwh,
            ),
          ),
        ],
      );

      return Container(
        padding: const EdgeInsets.all(AppSpacing.medium + AppSpacing.small),
        decoration: BoxDecoration(
          gradient: const LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [AppColors.primary, AppColors.primaryContainer, AppColors.secondary],
          ),
          borderRadius: const BorderRadius.all(AppShapeTokens.extraLarge),
          border: Border.all(color: AppColors.secondaryFixed.withValues(alpha: 0.2)),
          boxShadow: [
            BoxShadow(
              color: AppColors.primary.withValues(alpha: 0.16),
              blurRadius: 24,
              offset: const Offset(0, 10),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            header,
            const SizedBox(height: AppSpacing.medium),
            if (constraints.maxWidth < 380)
              Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  _heroMetric(l10n.homeTotalEnergy, HomeDashboardDemoData.currentConsumptionKwh, l10n.homeEnergyUnit),
                  const SizedBox(height: AppSpacing.small),
                  Divider(color: AppColors.onPrimary.withValues(alpha: 0.16)),
                  const SizedBox(height: AppSpacing.small),
                  _heroMetric(
                    l10n.homeEstimatedBill,
                    HomeDashboardDemoData.estimatedBillEgp,
                    l10n.homeCurrency,
                    accent: AppColors.secondaryFixed,
                  ),
                ],
              )
            else
              Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Expanded(child: _heroMetric(l10n.homeTotalEnergy, HomeDashboardDemoData.currentConsumptionKwh, l10n.homeEnergyUnit)),
                  Container(
                    width: 1,
                    height: 64,
                    margin: const EdgeInsets.symmetric(horizontal: AppSpacing.medium),
                    color: AppColors.onPrimary.withValues(alpha: 0.16),
                  ),
                  Expanded(
                    child: _heroMetric(
                      l10n.homeEstimatedBill,
                      HomeDashboardDemoData.estimatedBillEgp,
                      l10n.homeCurrency,
                      accent: AppColors.secondaryFixed,
                    ),
                  ),
                ],
              ),
            const SizedBox(height: AppSpacing.medium),
            Divider(color: AppColors.onPrimary.withValues(alpha: 0.16)),
            const SizedBox(height: AppSpacing.small),
            Wrap(
              alignment: WrapAlignment.spaceBetween,
              crossAxisAlignment: WrapCrossAlignment.center,
              spacing: AppSpacing.small,
              runSpacing: AppSpacing.small,
              children: [
                _heroPill(
                  l10n.homeComparedPreviousTemplate(
                    HomeDashboardDemoData.previousMonthChange,
                  ),
                  icon: Icons.trending_up,
                  color: AppColors.secondaryFixed,
                ),
                Text(
                  l10n.homeDaysRemainingTemplate(
                    HomeDashboardDemoData.billingDaysRemaining,
                  ),
                  style: AppTypography.textTheme.labelSmall?.copyWith(
                    color: AppColors.surfaceVariant,
                  ),
                ),
              ],
            ),
          ],
        ),
      );
    },
  );

  Widget _heroMetric(String label, String value, String unit, {Color? accent}) => Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text(
        label,
        style: AppTypography.textTheme.labelSmall?.copyWith(
          color: AppColors.surfaceVariant.withValues(alpha: 0.9),
        ),
      ),
      const SizedBox(height: AppSpacing.micro),
      FittedBox(
        fit: BoxFit.scaleDown,
        alignment: AlignmentDirectional.centerStart,
        child: Row(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.baseline,
          textBaseline: TextBaseline.alphabetic,
          children: [
            Text(
              value,
              style: AppTypography.currencyDisplayMobile.copyWith(
                color: accent ?? AppColors.onPrimary,
              ),
            ),
            const SizedBox(width: AppSpacing.micro),
            Text(
              unit,
              style: AppTypography.textTheme.labelMedium?.copyWith(
                color: accent ?? AppColors.surfaceVariant,
              ),
            ),
          ],
        ),
      ),
    ],
  );

  Widget _heroPill(String text, {IconData? icon, Color? color}) => DecoratedBox(
    decoration: BoxDecoration(
      color: AppColors.surfaceContainerLowest.withValues(alpha: 0.14),
      border: Border.all(color: AppColors.onPrimary.withValues(alpha: 0.18)),
      borderRadius: const BorderRadius.all(AppShapeTokens.pill),
    ),
    child: Padding(
      padding: const EdgeInsets.symmetric(horizontal: AppSpacing.small, vertical: AppSpacing.micro),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          if (icon != null) ...[
            Icon(icon, size: 16, color: color ?? AppColors.onPrimary),
            const SizedBox(width: AppSpacing.micro),
          ],
          Flexible(
            child: Text(
              text,
              maxLines: 2,
              softWrap: true,
              textAlign: TextAlign.center,
              style: AppTypography.textTheme.labelSmall?.copyWith(
                color: color ?? AppColors.onPrimary,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ],
      ),
    ),
  );

  Widget _budgetCard(AppLocalizations l10n) => AppSurfaceCard(
    key: const ValueKey('home-budget-card'),
    padding: const EdgeInsets.all(AppSpacing.medium),
    borderRadius: const BorderRadius.all(AppShapeTokens.extraLarge),
    elevation: 1,
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        LayoutBuilder(
          builder: (context, constraints) {
            final title = Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                const AppIconTile(
                  icon: Icons.account_balance_wallet_outlined,
                  size: 36,
                  iconSize: 20,
                  backgroundColor: AppColors.surfaceContainerHigh,
                  iconColor: AppColors.primary,
                  borderRadius: BorderRadius.all(AppShapeTokens.medium),
                ),
                const SizedBox(width: AppSpacing.small),
                Flexible(
                  child: Text(
                    l10n.homeMonthlyBudget,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: AppTypography.textTheme.headlineSmall?.copyWith(
                      color: AppColors.primary,
                    ),
                  ),
                ),
              ],
            );
            final warning = _warningBadge(l10n.homeBudgetWarning);
            if (constraints.maxWidth < 360) {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  title,
                  const SizedBox(height: AppSpacing.small),
                  Align(alignment: AlignmentDirectional.centerEnd, child: warning),
                ],
              );
            }
            return Row(
              children: [
                Expanded(child: title),
                const SizedBox(width: AppSpacing.small),
                warning,
              ],
            );
          },
        ),
        const SizedBox(height: AppSpacing.medium),
        ClipRRect(
          borderRadius: const BorderRadius.all(AppShapeTokens.pill),
          child: const LinearProgressIndicator(
            key: ValueKey('home-budget-progress'),
            value: HomeDashboardDemoData.budgetProgress,
            minHeight: 10,
            backgroundColor: AppColors.surfaceContainerHigh,
            valueColor: AlwaysStoppedAnimation(AppColors.secondary),
          ),
        ),
        const SizedBox(height: AppSpacing.small),
        Wrap(
          alignment: WrapAlignment.spaceBetween,
          spacing: AppSpacing.small,
          runSpacing: AppSpacing.micro,
          children: [
            Text.rich(
              TextSpan(
                children: [
                  TextSpan(text: '${l10n.homeBudgetSpent}: '),
                  TextSpan(
                    text: '${HomeDashboardDemoData.budgetSpentEgp} ${l10n.homeCurrency} (${HomeDashboardDemoData.budgetPercent})',
                    style: const TextStyle(fontWeight: FontWeight.w700),
                  ),
                ],
              ),
              style: AppTypography.textTheme.labelSmall?.copyWith(color: AppColors.outline),
            ),
            Text.rich(
              TextSpan(
                children: [
                  TextSpan(text: '${l10n.homeBudgetLimit}: '),
                  TextSpan(
                    text: '${HomeDashboardDemoData.budgetLimitEgp} ${l10n.homeCurrency}',
                    style: const TextStyle(fontWeight: FontWeight.w700),
                  ),
                ],
              ),
              style: AppTypography.textTheme.labelSmall?.copyWith(color: AppColors.outline),
            ),
          ],
        ),
        const SizedBox(height: AppSpacing.small),
        Divider(color: AppColors.outlineVariant.withValues(alpha: 0.3)),
        const SizedBox(height: AppSpacing.small),
        Wrap(
          alignment: WrapAlignment.spaceBetween,
          crossAxisAlignment: WrapCrossAlignment.center,
          spacing: AppSpacing.small,
          runSpacing: AppSpacing.micro,
          children: [
            Text(
              l10n.homeBudgetRemaining,
              style: AppTypography.textTheme.bodySmall?.copyWith(color: AppColors.onSurfaceVariant),
            ),
            Text(
              '${HomeDashboardDemoData.budgetRemainingEgp} ${l10n.homeCurrency}',
              style: AppTypography.textTheme.titleLarge?.copyWith(
                color: AppColors.secondary,
                fontWeight: FontWeight.w700,
              ),
            ),
          ],
        ),
      ],
    ),
  );

  Widget _warningBadge(String text) => DecoratedBox(
    decoration: BoxDecoration(
      color: AppColors.warning.withValues(alpha: 0.1),
      border: Border.all(color: AppColors.warning.withValues(alpha: 0.45)),
      borderRadius: const BorderRadius.all(AppShapeTokens.pill),
    ),
    child: Padding(
      padding: const EdgeInsets.symmetric(horizontal: AppSpacing.small, vertical: AppSpacing.micro),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Icon(Icons.warning_amber_rounded, size: 16, color: AppColors.warning),
          const SizedBox(width: AppSpacing.micro),
          Text(
            text,
            style: AppTypography.textTheme.labelSmall?.copyWith(color: AppColors.onSurface),
          ),
        ],
      ),
    ),
  );

  Widget _quickActions(AppLocalizations l10n) => Column(
    crossAxisAlignment: CrossAxisAlignment.stretch,
    children: [
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: AppSpacing.micro),
        child: Row(
          children: [
            Expanded(
              child: Text(
                l10n.homeQuickActions,
                style: AppTypography.textTheme.titleLarge?.copyWith(color: AppColors.primary),
              ),
            ),
            const SizedBox(width: AppSpacing.small),
            Text(
              l10n.homeMore,
              style: AppTypography.textTheme.labelSmall?.copyWith(color: AppColors.secondary),
            ),
          ],
        ),
      ),
      const SizedBox(height: AppSpacing.small),
      LayoutBuilder(
        builder: (context, constraints) {
          final tileWidth = (constraints.maxWidth - AppSpacing.small * 3) / 4;
          return Row(
            children: [
              _quickAction(tileWidth, Icons.edit_note, l10n.homeActionRecordReading),
              const SizedBox(width: AppSpacing.small),
              _quickAction(tileWidth, Icons.photo_camera_outlined, l10n.homeActionScanMeter),
              const SizedBox(width: AppSpacing.small),
              _quickAction(tileWidth, Icons.mic_none, l10n.homeActionVoiceEntry),
              const SizedBox(width: AppSpacing.small),
              _quickAction(tileWidth, Icons.calculate_outlined, l10n.homeActionCalculateBill),
            ],
          );
        },
      ),
    ],
  );

  Widget _quickAction(double width, IconData icon, String label) => AppSurfaceCard(
    width: width,
    padding: const EdgeInsets.all(AppSpacing.small),
    borderRadius: const BorderRadius.all(AppShapeTokens.extraLarge),
    elevation: 0.5,
    child: Column(
      children: [
        AppIconTile(
          icon: icon,
          size: 48,
          iconSize: 24,
          backgroundColor: AppColors.surfaceContainer,
          iconColor: AppColors.primary,
          borderRadius: const BorderRadius.all(AppShapeTokens.large),
        ),
        const SizedBox(height: AppSpacing.small - AppSpacing.micro),
        Text(
          label,
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
          textAlign: TextAlign.center,
          style: AppTypography.textTheme.labelSmall?.copyWith(color: AppColors.onSurface),
        ),
      ],
    ),
  );

  Widget _trendCard(AppLocalizations l10n) => AppSurfaceCard(
    key: const ValueKey('home-trend-card'),
    padding: const EdgeInsets.all(AppSpacing.medium),
    borderRadius: const BorderRadius.all(AppShapeTokens.extraLarge),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        LayoutBuilder(
          builder: (context, constraints) {
            final title = Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  l10n.homeConsumptionRate,
                  style: AppTypography.textTheme.headlineSmall?.copyWith(color: AppColors.primary),
                ),
                Text(
                  l10n.homeLastSevenDays,
                  style: AppTypography.textTheme.bodySmall?.copyWith(color: AppColors.outline),
                ),
              ],
            );
            final filters = _trendFilters(l10n);
            if (constraints.maxWidth < 360) {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  title,
                  const SizedBox(height: AppSpacing.small),
                  filters,
                ],
              );
            }
            return Row(
              children: [
                Expanded(child: title),
                const SizedBox(width: AppSpacing.small),
                filters,
              ],
            );
          },
        ),
        const SizedBox(height: AppSpacing.medium),
        _chart(l10n),
      ],
    ),
  );

  Widget _trendFilters(AppLocalizations l10n) => Container(
    padding: const EdgeInsets.all(AppSpacing.micro),
    decoration: BoxDecoration(
      color: AppColors.surfaceContainerHigh,
      borderRadius: const BorderRadius.all(AppShapeTokens.medium),
    ),
    child: Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        _trendFilter(0, l10n.homeDaily),
        _trendFilter(1, l10n.homeWeekly),
        _trendFilter(2, l10n.homeMonthly),
      ],
    ),
  );

  Widget _trendFilter(int index, String label) {
    final selected = _selectedTrend == index;
    return TextButton(
      key: ValueKey('home-trend-filter-$index'),
      onPressed: () => setState(() => _selectedTrend = index),
      style: TextButton.styleFrom(
        minimumSize: const Size(0, 38),
        padding: const EdgeInsets.symmetric(horizontal: AppSpacing.micro),
        foregroundColor: selected ? AppColors.primary : AppColors.onSurfaceVariant,
        backgroundColor: selected ? AppColors.surfaceContainerLowest : Colors.transparent,
        textStyle: AppTypography.textTheme.labelSmall?.copyWith(
          fontWeight: selected ? FontWeight.w700 : FontWeight.w500,
        ),
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(AppShapeTokens.standard),
        ),
      ),
      child: Text(label),
    );
  }

  Widget _chart(AppLocalizations l10n) {
    final points = HomeDashboardDemoData.trendPoints;
    final days = [
      l10n.homeSaturday,
      l10n.homeSunday,
      l10n.homeMonday,
      l10n.homeTuesday,
      l10n.homeWednesday,
      l10n.homeThursday,
      l10n.homeToday,
    ];

    return SizedBox(
      height: 132,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          for (var index = 0; index < points.length; index++)
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: AppSpacing.micro),
                child: Column(
                  children: [
                    SizedBox(
                      height: 16,
                      child: FittedBox(
                        fit: BoxFit.scaleDown,
                        child: Text(
                          points[index].value,
                          style: AppTypography.textTheme.labelSmall?.copyWith(
                            color: index == points.length - 1
                                ? AppColors.primary
                                : AppColors.outline,
                            fontWeight: index == points.length - 1 ? FontWeight.w700 : null,
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      child: Align(
                        alignment: Alignment.bottomCenter,
                        child: Container(
                          width: 22,
                          height: points[index].barHeight,
                          decoration: BoxDecoration(
                            color: index == points.length - 1
                                ? AppColors.primary
                                : AppColors.secondaryFixedDim.withValues(alpha: 0.75),
                            borderRadius: const BorderRadius.vertical(
                              top: AppShapeTokens.standard,
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 18,
                      child: FittedBox(
                        fit: BoxFit.scaleDown,
                        child: Text(
                          days[index],
                          maxLines: 1,
                          style: AppTypography.textTheme.labelSmall?.copyWith(
                            color: index == points.length - 1
                                ? AppColors.primary
                                : AppColors.onSurfaceVariant,
                            fontWeight: index == points.length - 1 ? FontWeight.w700 : null,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
        ],
      ),
    );
  }

  Widget _appliancesCard(AppLocalizations l10n) => AppSurfaceCard(
    key: const ValueKey('home-appliances-card'),
    padding: const EdgeInsets.all(AppSpacing.medium),
    borderRadius: const BorderRadius.all(AppShapeTokens.extraLarge),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Row(
          children: [
            const Icon(Icons.pie_chart_outline, color: AppColors.secondary, size: 22),
            const SizedBox(width: AppSpacing.small),
            Expanded(
              child: Text(
                l10n.homeTopAppliances,
                style: AppTypography.textTheme.headlineSmall?.copyWith(color: AppColors.primary),
              ),
            ),
            Text(
              l10n.homeDetails,
              style: AppTypography.textTheme.labelSmall?.copyWith(color: AppColors.secondary),
            ),
          ],
        ),
        const SizedBox(height: AppSpacing.small),
        _applianceRow(
          icon: Icons.ac_unit,
          name: l10n.homeAirConditioner,
          usage: l10n.homeAirConditionerUsage,
          percent: HomeDashboardDemoData.applianceMetrics[0].share,
          energy: '${HomeDashboardDemoData.applianceMetrics[0].energyKwh} ${l10n.homeEnergyUnit}',
        ),
        const SizedBox(height: AppSpacing.small),
        _applianceRow(
          icon: Icons.kitchen_outlined,
          name: l10n.homeRefrigerator,
          usage: l10n.homeRefrigeratorUsage,
          percent: HomeDashboardDemoData.applianceMetrics[1].share,
          energy: '${HomeDashboardDemoData.applianceMetrics[1].energyKwh} ${l10n.homeEnergyUnit}',
        ),
        const SizedBox(height: AppSpacing.small),
        _applianceRow(
          icon: Icons.water_drop_outlined,
          name: l10n.homeWaterHeater,
          usage: l10n.homeWaterHeaterUsage,
          percent: HomeDashboardDemoData.applianceMetrics[2].share,
          energy: '${HomeDashboardDemoData.applianceMetrics[2].energyKwh} ${l10n.homeEnergyUnit}',
        ),
      ],
    ),
  );

  Widget _applianceRow({
    required IconData icon,
    required String name,
    required String usage,
    required String percent,
    required String energy,
  }) => Container(
    padding: const EdgeInsets.all(AppSpacing.small),
    decoration: BoxDecoration(
      color: AppColors.surfaceContainer.withValues(alpha: 0.6),
      borderRadius: const BorderRadius.all(AppShapeTokens.medium),
    ),
    child: Row(
      children: [
        AppIconTile(
          icon: icon,
          size: 40,
          iconSize: 22,
          backgroundColor: AppColors.surfaceContainerLowest,
          iconColor: AppColors.primary,
          borderRadius: const BorderRadius.all(AppShapeTokens.medium),
        ),
        const SizedBox(width: AppSpacing.small),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                name,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: AppTypography.textTheme.labelLarge?.copyWith(color: AppColors.onSurface),
              ),
              Text(
                usage,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: AppTypography.textTheme.bodySmall?.copyWith(color: AppColors.outline),
              ),
            ],
          ),
        ),
        const SizedBox(width: AppSpacing.small),
        Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Text(
              percent,
              style: AppTypography.textTheme.titleLarge?.copyWith(
                color: AppColors.primary,
                fontWeight: FontWeight.w700,
              ),
            ),
            Text(
              energy,
              textAlign: TextAlign.end,
              style: AppTypography.textTheme.labelSmall?.copyWith(color: AppColors.outline),
            ),
          ],
        ),
      ],
    ),
  );

  Widget _recentReadingCard(AppLocalizations l10n) => AppSurfaceCard(
    key: const ValueKey('home-recent-reading-card'),
    padding: const EdgeInsets.all(AppSpacing.medium),
    borderRadius: const BorderRadius.all(AppShapeTokens.extraLarge),
    elevation: 1,
    child: LayoutBuilder(
      builder: (context, constraints) {
        final reading = Row(
          children: [
            AppIconTile(
              icon: Icons.push_pin_outlined,
              size: 40,
              iconSize: 20,
              backgroundColor: AppColors.secondaryContainer.withValues(alpha: 0.4),
              iconColor: AppColors.secondary,
              borderRadius: BorderRadius.all(AppShapeTokens.medium),
            ),
            const SizedBox(width: AppSpacing.small),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    l10n.homeLastReading,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: AppTypography.textTheme.labelSmall?.copyWith(
                      color: AppColors.outline,
                    ),
                  ),
                  Text(
                    '${HomeDashboardDemoData.meterReading} ${l10n.homeEnergyUnit}',
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: AppTypography.textTheme.headlineSmall?.copyWith(
                      color: AppColors.primary,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ],
              ),
            ),
          ],
        );
        final date = DecoratedBox(
          decoration: BoxDecoration(
            color: AppColors.surfaceContainer,
            borderRadius: const BorderRadius.all(AppShapeTokens.pill),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: AppSpacing.small,
              vertical: AppSpacing.micro,
            ),
            child: Text(
              l10n.homeReadingDate,
              style: AppTypography.textTheme.labelSmall?.copyWith(
                color: AppColors.onSurfaceVariant,
              ),
            ),
          ),
        );

        if (constraints.maxWidth < 320) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              reading,
              const SizedBox(height: AppSpacing.small),
              Align(alignment: AlignmentDirectional.centerEnd, child: date),
            ],
          );
        }
        return Row(
          children: [
            Expanded(child: reading),
            const SizedBox(width: AppSpacing.small),
            date,
          ],
        );
      },
    ),
  );
}
