import 'package:shared_preferences/shared_preferences.dart';
import '../models/user_profile.dart';
import '../models/app_classification.dart';

class StorageService {
  static const _keyOnboardingComplete = 'onboarding_complete';
  static const _keyBirthYear = 'birth_year';
  static const _keyHourlyRate = 'hourly_rate';
  static const _keyCategoryPrefix = 'category_';

  final SharedPreferences _prefs;

  StorageService(this._prefs);

  static Future<StorageService> create() async {
    final prefs = await SharedPreferences.getInstance();
    return StorageService(prefs);
  }

  bool get isOnboardingComplete => _prefs.getBool(_keyOnboardingComplete) ?? false;

  Future<void> setOnboardingComplete() =>
      _prefs.setBool(_keyOnboardingComplete, true);

  Future<void> saveUserProfile(UserProfile profile) async {
    await _prefs.setInt(_keyBirthYear, profile.birthYear);
    await _prefs.setDouble(_keyHourlyRate, profile.hourlyRate);
  }

  UserProfile? loadUserProfile() {
    final birthYear = _prefs.getInt(_keyBirthYear);
    final hourlyRate = _prefs.getDouble(_keyHourlyRate);
    if (birthYear == null) return null;
    return UserProfile(
      birthYear: birthYear,
      hourlyRate: hourlyRate ?? 35.0,
    );
  }

  Future<void> saveAppCategory(String packageName, AppCategory category) async {
    await _prefs.setString('$_keyCategoryPrefix$packageName', category.name);
  }

  Future<void> removeAppCategory(String packageName) async {
    await _prefs.remove('$_keyCategoryPrefix$packageName');
  }

  Map<String, AppCategory> loadAllCategoryOverrides() {
    final result = <String, AppCategory>{};
    for (final key in _prefs.getKeys()) {
      if (key.startsWith(_keyCategoryPrefix)) {
        final packageName = key.substring(_keyCategoryPrefix.length);
        final value = _prefs.getString(key);
        if (value != null) {
          try {
            result[packageName] = AppCategory.values.byName(value);
          } catch (_) {}
        }
      }
    }
    return result;
  }
}
