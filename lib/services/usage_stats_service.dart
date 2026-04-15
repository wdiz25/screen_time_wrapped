import 'package:usage_stats/usage_stats.dart';

class UsageStatsService {
  /// Returns true if the app has the usage access permission.
  Future<bool> hasPermission() async {
    return await UsageStats.checkUsagePermission() ?? false;
  }

  /// Opens the system "Usage Access" settings screen so the user can grant permission.
  Future<void> openPermissionSettings() async {
    await UsageStats.grantUsagePermission();
  }

  /// Queries raw app usage for a given time range.
  /// Returns a map of packageName → total foreground time in milliseconds.
  Future<Map<String, int>> queryUsageMs({
    required DateTime from,
    required DateTime to,
  }) async {
    try {
      final stats = await UsageStats.queryUsageStats(from, to);
      final result = <String, int>{};
      for (final stat in stats) {
        if (stat.packageName != null && stat.totalTimeInForeground != null) {
          final ms = int.tryParse(stat.totalTimeInForeground!) ?? 0;
          if (ms > 0) {
            result[stat.packageName!] = (result[stat.packageName!] ?? 0) + ms;
          }
        }
      }
      return result;
    } catch (_) {
      return {};
    }
  }

  Future<Map<String, int>> queryToday() {
    final now = DateTime.now();
    return queryUsageMs(from: DateTime(now.year, now.month, now.day), to: now);
  }

  Future<Map<String, int>> queryLastDays(int days) {
    final now = DateTime.now();
    return queryUsageMs(
      from: now.subtract(Duration(days: days)),
      to: now,
    );
  }

  Future<Map<String, int>> queryLastWeek() => queryLastDays(7);
  Future<Map<String, int>> queryLastMonth() => queryLastDays(30);
  Future<Map<String, int>> queryLastYear() => queryLastDays(365);
}
