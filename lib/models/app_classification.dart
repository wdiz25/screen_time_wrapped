enum AppCategory { good, bad, neutral }

extension AppCategoryExtension on AppCategory {
  String get label {
    switch (this) {
      case AppCategory.good:
        return 'Good';
      case AppCategory.bad:
        return 'Bad';
      case AppCategory.neutral:
        return 'Neutral';
    }
  }

  AppCategory get next {
    switch (this) {
      case AppCategory.good:
        return AppCategory.bad;
      case AppCategory.bad:
        return AppCategory.neutral;
      case AppCategory.neutral:
        return AppCategory.good;
    }
  }
}

class AppEntry {
  final String packageName;
  final String appName;
  final AppCategory category;

  const AppEntry({
    required this.packageName,
    required this.appName,
    required this.category,
  });

  AppEntry copyWith({String? appName, AppCategory? category}) {
    return AppEntry(
      packageName: packageName,
      appName: appName ?? this.appName,
      category: category ?? this.category,
    );
  }
}
