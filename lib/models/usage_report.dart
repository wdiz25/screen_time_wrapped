class AppUsageStat {
  final String packageName;
  final String appName;
  final Duration totalTime;

  const AppUsageStat({
    required this.packageName,
    required this.appName,
    required this.totalTime,
  });
}

class UsageReport {
  final DateTime periodStart;
  final DateTime periodEnd;
  final Duration totalScreenTime;
  final Duration goodAppTime;
  final Duration badAppTime;
  final Duration neutralAppTime;
  final List<AppUsageStat> topBadApps;
  final List<AppUsageStat> topGoodApps;
  final List<AppUsageStat> topApps;
  final double brainScore;

  const UsageReport({
    required this.periodStart,
    required this.periodEnd,
    required this.totalScreenTime,
    required this.goodAppTime,
    required this.badAppTime,
    required this.neutralAppTime,
    required this.topBadApps,
    required this.topGoodApps,
    required this.topApps,
    required this.brainScore,
  });

  double get totalHours => totalScreenTime.inMinutes / 60.0;
  double get badHours => badAppTime.inMinutes / 60.0;
  double get goodHours => goodAppTime.inMinutes / 60.0;

  AppUsageStat? get topBadApp => topBadApps.isNotEmpty ? topBadApps.first : null;
  AppUsageStat? get topGoodApp => topGoodApps.isNotEmpty ? topGoodApps.first : null;
}
