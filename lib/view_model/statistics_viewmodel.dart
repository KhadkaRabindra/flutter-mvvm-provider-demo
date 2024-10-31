import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../data/model/statistics_model.dart';
import '../data/services/statistics_service.dart';

class StatisticsViewModel extends ChangeNotifier {
  final StatisticsService _statisticsService;

  int _streak = 0;
  Map<String, String> _prayerTimeStatistics = {};
  Map<String, int> _prayerSessionsCountStatistics = {};
  Map<String, int> _usageStatistics = {};
  Map<PrayIntent, int> _intentStatistics = {};
  bool _isLoading = false;
  bool _hasError = false;
  String? _errorMessage; // Optional error message for more details

  StatisticsViewModel(this._statisticsService);

  int get streak => _streak;
  Map<String, String>? get prayerTimeStatistics => _prayerTimeStatistics;
  Map<String, int>? get prayerSessionsCountStatistics => _prayerSessionsCountStatistics;
  Map<String, int>? get usageStatistics => _usageStatistics;
  Map<PrayIntent, int>? get intentStatistics => _intentStatistics;
  bool get isLoading => _isLoading;
  bool get hasError => _hasError;
  String? get errorMessage => _errorMessage; // Expose error message

  Future<void> loadStatistics() async {
    if (_isLoading) return; // Prevent re-fetching if already loading

    _isLoading = true;
    _hasError = false;
    _errorMessage = null; // Reset error message
    notifyListeners();

    try {
      await _fetchStatistics();
    } catch (e) {
      _hasError = true; // Set error state if something goes wrong
      _errorMessage = _handleError(e); // Capture the error message
    } finally {
      _isLoading = false; // Always set loading to false in finally block
      notifyListeners();
    }
  }

  Future<void> _fetchStatistics() async {
    // Fetching statistics asynchronously using Future.wait to improve performance
    final futures = [
      _statisticsService.fetchStreak(),
      _statisticsService.fetchPrayerTimeStatistics(),
      _statisticsService.fetchPrayerSessionsCountStatistics(),
      _statisticsService.fetchUsageStatistics(),
      _statisticsService.fetchIntentStatistics(),
    ].where((future) => future != null).cast<Future<dynamic>>();

    final results = await Future.wait(futures);
    // Assigning results to variables
    _streak = results[0] as int;
    _prayerTimeStatistics = results[1] as Map<String, String>;
    _prayerSessionsCountStatistics = results[2] as Map<String, int>;
    _usageStatistics = results[3] as Map<String, int>;
    _intentStatistics = results[4] as Map<PrayIntent, int>;
  }

  String _handleError(dynamic error) {
    // Implement centralized error handling logic
    // You can customize error messages based on the type of error
    return error.toString();
  }

  Future<void> retryLoading() async {
    await loadStatistics(); // Allow user to retry loading
  }
}