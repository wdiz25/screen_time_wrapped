import 'package:flutter/services.dart';
import '../constants/default_categories.dart';

class AppInfo {
  final String packageName;
  final String appName;

  const AppInfo({required this.packageName, required this.appName});
}

class AppInfoService {
  static const _channel = MethodChannel('com.example.screen_time_wrapped/app_info');

  /// Returns all user-installed apps as a list of [AppInfo].
  Future<List<AppInfo>> getInstalledApps() async {
    try {
      final result = await _channel.invokeMethod<List>('getInstalledApps');
      if (result == null) return [];
      return result.map((item) {
        final map = Map<String, dynamic>.from(item as Map);
        return AppInfo(
          packageName: map['packageName'] as String,
          appName: map['appName'] as String,
        );
      }).toList();
    } catch (_) {
      return [];
    }
  }

  /// Gets the human-readable name for a single package.
  /// Falls back to a known-names map, then a prettified package name.
  Future<String> getAppName(String packageName) async {
    try {
      final result = await _channel.invokeMethod<String>(
        'getAppName',
        {'packageName': packageName},
      );
      // If the native layer returned a real name (not the package name itself), use it
      if (result != null && result != packageName) return result;
    } catch (_) {
      // fall through to lookup
    }
    // Check known display names before prettifying
    return DefaultCategories.displayNames[packageName] ??
        _prettifyPackageName(packageName);
  }

  /// Gets the app icon as PNG bytes, or null if unavailable.
  Future<Uint8List?> getAppIcon(String packageName) async {
    try {
      final result = await _channel.invokeMethod<Uint8List>(
        'getAppIcon',
        {'packageName': packageName},
      );
      return result;
    } catch (_) {
      return null;
    }
  }

  String _prettifyPackageName(String packageName) {
    final parts = packageName.split('.');
    if (parts.isEmpty) return packageName;
    final last = parts.last;
    return last
        .replaceAllMapped(
          RegExp(r'([a-z])([A-Z])'),
          (m) => '${m.group(1)} ${m.group(2)}',
        )
        .split('_')
        .map((w) => w.isNotEmpty ? '${w[0].toUpperCase()}${w.substring(1)}' : w)
        .join(' ');
  }
}
