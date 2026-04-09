import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'services/storage_service.dart';
import 'services/usage_stats_service.dart';
import 'services/app_info_service.dart';
import 'services/category_service.dart';
import 'services/stats_service.dart';
import 'services/death_report_service.dart';
import 'providers/user_profile_provider.dart';
import 'providers/category_provider.dart';
import 'providers/usage_data_provider.dart';
import 'theme/app_theme.dart';
import 'screens/onboarding/onboarding_flow.dart';
import 'screens/home/home_screen.dart';

class ScreenTimeWrappedApp extends StatelessWidget {
  final StorageService storageService;
  final UsageStatsService usageStatsService;
  final AppInfoService appInfoService;
  final CategoryService categoryService;
  final StatsService statsService;
  final DeathReportService deathReportService;
  final UserProfileProvider userProfileProvider;
  final CategoryProvider categoryProvider;

  const ScreenTimeWrappedApp({
    super.key,
    required this.storageService,
    required this.usageStatsService,
    required this.appInfoService,
    required this.categoryService,
    required this.statsService,
    required this.deathReportService,
    required this.userProfileProvider,
    required this.categoryProvider,
  });

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider<StorageService>.value(value: storageService),
        Provider<UsageStatsService>.value(value: usageStatsService),
        Provider<AppInfoService>.value(value: appInfoService),
        Provider<CategoryService>.value(value: categoryService),
        Provider<StatsService>.value(value: statsService),
        Provider<DeathReportService>.value(value: deathReportService),
        ChangeNotifierProvider<UserProfileProvider>.value(value: userProfileProvider),
        ChangeNotifierProvider<CategoryProvider>.value(value: categoryProvider),
        ChangeNotifierProxyProvider<UserProfileProvider, UsageDataProvider>(
          create: (context) => UsageDataProvider(
            statsService,
            deathReportService,
            userProfileProvider,
          ),
          update: (context, profileProvider, previous) =>
              previous ?? UsageDataProvider(statsService, deathReportService, profileProvider),
        ),
      ],
      child: MaterialApp(
        title: 'Screen Time Wrapped',
        theme: buildAppTheme(),
        debugShowCheckedModeBanner: false,
        home: _RootRouter(storageService: storageService),
      ),
    );
  }
}

class _RootRouter extends StatelessWidget {
  final StorageService storageService;
  const _RootRouter({required this.storageService});

  @override
  Widget build(BuildContext context) {
    final onboardingComplete = storageService.isOnboardingComplete;
    if (onboardingComplete) {
      return const HomeScreen();
    }
    return const OnboardingFlow();
  }
}
