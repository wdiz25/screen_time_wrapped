import '../models/app_classification.dart';
import '../constants/default_categories.dart';
import 'storage_service.dart';

class CategoryService {
  final StorageService _storage;
  final Map<String, AppCategory> _overrides = {};

  CategoryService(this._storage) {
    _overrides.addAll(_storage.loadAllCategoryOverrides());
  }

  AppCategory getCategory(String packageName) {
    if (_overrides.containsKey(packageName)) {
      return _overrides[packageName]!;
    }
    return DefaultCategories.defaults[packageName] ?? AppCategory.neutral;
  }

  Future<void> setCategory(String packageName, AppCategory category) async {
    // If the user is setting it back to the default, remove the override
    final defaultCategory = DefaultCategories.defaults[packageName];
    if (defaultCategory == category) {
      _overrides.remove(packageName);
      await _storage.removeAppCategory(packageName);
    } else {
      _overrides[packageName] = category;
      await _storage.saveAppCategory(packageName, category);
    }
  }

  Map<String, AppCategory> get allOverrides => Map.unmodifiable(_overrides);
}
