import 'package:flutter/foundation.dart';
import '../models/app_classification.dart';
import '../services/category_service.dart';
import '../services/app_info_service.dart';
import '../constants/default_categories.dart';

class InstalledApp {
  final String packageName;
  final String appName;
  final bool isHardcoded;
  AppCategory category;

  InstalledApp({
    required this.packageName,
    required this.appName,
    required this.isHardcoded,
    required this.category,
  });
}

class CategoryProvider extends ChangeNotifier {
  final CategoryService _categoryService;
  final AppInfoService _appInfoService;

  List<InstalledApp> _apps = [];
  bool _isLoading = false;

  CategoryProvider(this._categoryService, this._appInfoService);

  List<InstalledApp> get apps => _apps;
  bool get isLoading => _isLoading;

  List<InstalledApp> get goodApps => _apps.where((a) => a.category == AppCategory.good).toList();
  List<InstalledApp> get badApps => _apps.where((a) => a.category == AppCategory.bad).toList();
  List<InstalledApp> get neutralApps => _apps.where((a) => a.category == AppCategory.neutral).toList();

  AppCategory getCategory(String packageName) => _categoryService.getCategory(packageName);

  Future<void> loadInstalledApps() async {
    _isLoading = true;
    notifyListeners();

    final installedApps = await _appInfoService.getInstalledApps();
    _apps = installedApps.map((info) => InstalledApp(
      packageName: info.packageName,
      appName: info.appName,
      isHardcoded: DefaultCategories.defaults.containsKey(info.packageName),
      category: _categoryService.getCategory(info.packageName),
    )).toList();
    _apps.sort((a, b) => a.appName.toLowerCase().compareTo(b.appName.toLowerCase()));

    _isLoading = false;
    notifyListeners();
  }

  Future<void> setCategory(String packageName, AppCategory category) async {
    final idx = _apps.indexWhere((a) => a.packageName == packageName);
    if (idx != -1 && _apps[idx].isHardcoded) return;
    await _categoryService.setCategory(packageName, category);
    if (idx != -1) {
      _apps[idx].category = category;
      notifyListeners();
    }
  }

  Future<void> cycleCategory(String packageName) async {
    final current = _categoryService.getCategory(packageName);
    await setCategory(packageName, current.next);
  }
}
