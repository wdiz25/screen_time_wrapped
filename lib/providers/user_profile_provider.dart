import 'package:flutter/foundation.dart';
import '../models/user_profile.dart';
import '../services/storage_service.dart';

class UserProfileProvider extends ChangeNotifier {
  final StorageService _storage;

  UserProfile? _profile;

  UserProfileProvider(this._storage) {
    _profile = _storage.loadUserProfile();
  }

  UserProfile? get profile => _profile;

  bool get hasProfile => _profile != null;

  Future<void> saveProfile(UserProfile profile) async {
    _profile = profile;
    await _storage.saveUserProfile(profile);
    notifyListeners();
  }

  Future<void> updateHourlyRate(double rate) async {
    if (_profile == null) return;
    await saveProfile(_profile!.copyWith(hourlyRate: rate));
  }

  Future<void> updateBirthYear(int year) async {
    if (_profile == null) return;
    await saveProfile(_profile!.copyWith(birthYear: year));
  }
}
