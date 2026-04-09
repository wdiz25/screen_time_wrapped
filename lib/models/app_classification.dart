enum AppCategory { good, games, entertainment, socialMedia, shopping, neutral }

extension AppCategoryExtension on AppCategory {
  String get label {
    switch (this) {
      case AppCategory.good:
        return 'Good';
      case AppCategory.games:
        return 'Games';
      case AppCategory.entertainment:
        return 'Entertainment';
      case AppCategory.socialMedia:
        return 'Social Media';
      case AppCategory.shopping:
        return 'Shopping';
      case AppCategory.neutral:
        return 'Neutral';
    }
  }

  AppCategory get next {
    switch (this) {
      case AppCategory.good:
        return AppCategory.games;
      case AppCategory.games:
        return AppCategory.entertainment;
      case AppCategory.entertainment:
        return AppCategory.socialMedia;
      case AppCategory.socialMedia:
        return AppCategory.shopping;
      case AppCategory.shopping:
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
