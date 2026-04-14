import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'services/storage_service.dart';
import 'services/usage_stats_service.dart';
import 'services/app_info_service.dart';
import 'services/category_service.dart';
import 'services/stats_service.dart';
import 'services/death_report_service.dart';
import 'providers/user_profile_provider.dart';
import 'providers/category_provider.dart';
import 'app.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Lock to portrait orientation
  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);

  // Initialize services
  final storageService = await StorageService.create();
  final usageStatsService = UsageStatsService();
  final appInfoService = AppInfoService();
  final categoryService = CategoryService(storageService);
  final statsService = StatsService(usageStatsService, appInfoService, categoryService);
  final deathReportService = DeathReportService();

  // Initialize providers
  final userProfileProvider = UserProfileProvider(storageService);
  final categoryProvider = CategoryProvider(categoryService, appInfoService);

  runApp(ScreenTimeSynopsisApp(
    storageService: storageService,
    usageStatsService: usageStatsService,
    appInfoService: appInfoService,
    categoryService: categoryService,
    statsService: statsService,
    deathReportService: deathReportService,
    userProfileProvider: userProfileProvider,
    categoryProvider: categoryProvider,
  ));
}
