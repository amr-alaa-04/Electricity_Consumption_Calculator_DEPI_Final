import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../core/theme/app_colors.dart';
import '../../../core/theme/app_shape_tokens.dart';
import '../../../core/widgets/navigation/app_bottom_navigation_bar.dart';
import 'widgets/home_disclaimer.dart';
import 'widgets/home_header.dart';
import 'widgets/home_profile_header.dart';
import 'widgets/home_consumption_card.dart';
import 'widgets/home_budget_card.dart';
import 'widgets/home_quick_actions.dart';
import 'widgets/home_trend_card.dart';
import 'widgets/home_appliances_card.dart';
import 'widgets/home_recent_reading_card.dart';
import '../../../l10n/generated/app_localizations.dart';

class MainHomeScreen extends StatefulWidget {
  const MainHomeScreen({super.key});

  @override
  State<MainHomeScreen> createState() => _MainHomeScreenState();
}

class _MainHomeScreenState extends State<MainHomeScreen> {
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
                    HomeHeader(l10n: l10n, onNotificationsPressed: () {}),
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
                            HomeDisclaimer(l10n: l10n),
                            const SizedBox(height: AppSpacing.medium),
                            HomeProfileHeader(l10n: l10n),
                            const SizedBox(height: AppSpacing.medium),
                            HomeConsumptionCard(l10n: l10n),
                            const SizedBox(height: AppSpacing.medium),
                            HomeBudgetCard(l10n: l10n),
                            const SizedBox(height: AppSpacing.medium),
                            HomeQuickActions(
                              l10n: l10n,
                              onRecordReadingPressed: () => context.go('/readings'),
                            ),
                            const SizedBox(height: AppSpacing.medium),
                            HomeTrendCard(l10n: l10n),
                            const SizedBox(height: AppSpacing.medium),
                            HomeAppliancesCard(l10n: l10n),
                            const SizedBox(height: AppSpacing.medium),
                            HomeRecentReadingCard(l10n: l10n),
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
                      onDestinationSelected: (index) {
                        if (index == 0) {
                          context.go('/main-home');
                        } else if (index == 1) {
                          context.go('/readings');
                        }
                      },
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
}
