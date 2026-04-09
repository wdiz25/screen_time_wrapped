import '../models/usage_report.dart';
import '../models/app_classification.dart';
import '../constants/default_categories.dart';
import 'usage_stats_service.dart';
import 'app_info_service.dart';
import 'category_service.dart';

class StatsService {
  final UsageStatsService _usageStats;
  final AppInfoService _appInfo;
  final CategoryService _categories;

  StatsService(this._usageStats, this._appInfo, this._categories);

  Future<UsageReport> buildDailyReport() async {
    final now = DateTime.now();
    final from = DateTime(now.year, now.month, now.day);
    return _buildReport(from: from, to: now, usageMs: await _usageStats.queryToday());
  }

  Future<UsageReport> buildWeeklyReport() async {
    final now = DateTime.now();
    final from = now.subtract(const Duration(days: 7));
    return _buildReport(from: from, to: now, usageMs: await _usageStats.queryLastWeek());
  }

  Future<UsageReport> buildMonthlyReport() async {
    final now = DateTime.now();
    final from = now.subtract(const Duration(days: 30));
    return _buildReport(from: from, to: now, usageMs: await _usageStats.queryLastMonth());
  }

  Future<UsageReport> buildYearlyReport() async {
    final now = DateTime.now();
    final from = now.subtract(const Duration(days: 365));
    return _buildReport(from: from, to: now, usageMs: await _usageStats.queryLastYear());
  }

  Future<UsageReport> _buildReport({
    required DateTime from,
    required DateTime to,
    required Map<String, int> usageMs,
  }) async {
    // Resolve app names for all packages in the data
    final nameCache = <String, String>{};
    for (final pkg in usageMs.keys) {
      if (DefaultCategories.excluded.contains(pkg)) continue;
      nameCache[pkg] = await _appInfo.getAppName(pkg);
    }

    var totalMs = 0;
    var goodMs = 0;
    var badMs = 0;
    var neutralMs = 0;

    final badApps = <AppUsageStat>[];
    final goodApps = <AppUsageStat>[];
    final allApps = <AppUsageStat>[];

    for (final entry in usageMs.entries) {
      final pkg = entry.key;
      if (DefaultCategories.excluded.contains(pkg)) continue;
      final ms = entry.value;
      final category = _categories.getCategory(pkg);
      final name = nameCache[pkg] ?? pkg;

      totalMs += ms;
      final stat = AppUsageStat(
        packageName: pkg,
        appName: name,
        totalTime: Duration(milliseconds: ms),
        category: category,
      );
      allApps.add(stat);

      switch (category) {
        case AppCategory.good:
          goodMs += ms;
          goodApps.add(stat);
        case AppCategory.bad:
          badMs += ms;
          badApps.add(stat);
        case AppCategory.neutral:
          neutralMs += ms;
      }
    }

    badApps.sort((a, b) => b.totalTime.compareTo(a.totalTime));
    goodApps.sort((a, b) => b.totalTime.compareTo(a.totalTime));
    allApps.sort((a, b) => b.totalTime.compareTo(a.totalTime));

    final brainScore = _computeBrainScore(goodMs, badMs);

    return UsageReport(
      periodStart: from,
      periodEnd: to,
      totalScreenTime: Duration(milliseconds: totalMs),
      goodAppTime: Duration(milliseconds: goodMs),
      badAppTime: Duration(milliseconds: badMs),
      neutralAppTime: Duration(milliseconds: neutralMs),
      topBadApps: badApps.take(5).toList(),
      topGoodApps: goodApps.take(5).toList(),
      topApps: allApps.take(10).toList(),
      brainScore: brainScore,
    );
  }

  double _computeBrainScore(int goodMs, int badMs) {
    if (goodMs + badMs == 0) return 50.0;
    return (goodMs / (goodMs + badMs)) * 100.0;
  }
}
