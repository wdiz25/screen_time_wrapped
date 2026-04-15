import 'package:flutter/foundation.dart';
import '../models/usage_report.dart';
import '../models/death_report.dart';
import '../services/stats_service.dart';
import '../services/death_report_service.dart';
import 'user_profile_provider.dart';

enum LoadState { idle, loading, loaded, error }

class UsageDataProvider extends ChangeNotifier {
  final StatsService _statsService;
  final DeathReportService _deathReportService;
  final UserProfileProvider _profileProvider;

  UsageReport? _daily;
  UsageReport? _weekly;
  UsageReport? _monthly;
  UsageReport? _previousMonth;
  UsageReport? _yearly;
  DeathReport? _deathReport;

  LoadState _state = LoadState.idle;
  String? _error;

  UsageDataProvider(
    this._statsService,
    this._deathReportService,
    this._profileProvider,
  );

  UsageReport? get daily => _daily;
  UsageReport? get weekly => _weekly;
  UsageReport? get monthly => _monthly;
  UsageReport? get previousMonth => _previousMonth;
  UsageReport? get yearly => _yearly;
  DeathReport? get deathReport => _deathReport;
  LoadState get state => _state;
  String? get error => _error;
  bool get isLoading => _state == LoadState.loading;

  Future<void> loadAll() async {
    _state = LoadState.loading;
    _error = null;
    notifyListeners();

    try {
      final results = await Future.wait([
        _statsService.buildDailyReport(),
        _statsService.buildWeeklyReport(),
        _statsService.buildMonthlyReport(),
        _statsService.buildPreviousMonthReport(),
        _statsService.buildYearlyReport(),
      ]);

      _daily = results[0];
      _weekly = results[1];
      _monthly = results[2];
      _previousMonth = results[3];
      _yearly = results[4];

      _computeDeathReport();
      _state = LoadState.loaded;
    } catch (e) {
      _error = e.toString();
      _state = LoadState.error;
    }

    notifyListeners();
  }

  void _computeDeathReport() {
    final profile = _profileProvider.profile;
    final numDays = _previousMonth?.periodEnd.difference(_previousMonth!.periodStart).inDays ?? 30.0;
    final dailyBadHours = (_previousMonth?.badHours ?? 0.0) / numDays;
    if (profile == null) return;
    _deathReport = _deathReportService.compute(
      dailyBadHours: dailyBadHours,
      profile: profile,
    );
  }

  void invalidate() {
    _state = LoadState.idle;
    notifyListeners();
  }
}
