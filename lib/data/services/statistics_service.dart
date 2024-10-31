import '../model/statistics_model.dart';

class StatisticsService {
  int? _cachedStreak;
  Map<String, String>? _cachedPrayerTimeStatistics;
  Map<String, int>? _cachedPrayerSessionsCountStatistics;
  Map<String, int>? _cachedUsageStatistics;
  Map<PrayIntent, int>? _cachedIntentStatistics;

  Future<int>? fetchStreak() async {
    // Return cached value if it exists
    if (_cachedStreak != null) {
      return _cachedStreak!;
    }
    // Simulate fetching streak data
    _cachedStreak = 15; // Fetch from API
    return _cachedStreak!;
  }

  Future<Map<String, String>>? fetchPrayerTimeStatistics() async {
    // Return cached value if it exists
    if (_cachedPrayerTimeStatistics != null) {
      return _cachedPrayerTimeStatistics!;
    }
    await Future.delayed(Duration(milliseconds: 300));
    _cachedPrayerTimeStatistics = {
      'Morning': '15 minutes',
      'Afternoon': '10 minutes',
      'Evening': '20 minutes',
    };
    return _cachedPrayerTimeStatistics!;
  }

  Future<Map<String, int>>? fetchPrayerSessionsCountStatistics() async {
    // Return cached value if it exists
    if (_cachedPrayerSessionsCountStatistics != null) {
      return _cachedPrayerSessionsCountStatistics!;
    }
    await Future.delayed(Duration(milliseconds: 300));
    _cachedPrayerSessionsCountStatistics = {
      'Morning': 5,
      'Afternoon': 3,
      'Evening': 7,
    };
    return _cachedPrayerSessionsCountStatistics!;
  }

  Future<Map<String, int>>? fetchUsageStatistics() async {
    // Return cached value if it exists
    if (_cachedUsageStatistics != null) {
      return _cachedUsageStatistics!;
    }
    await Future.delayed(Duration(milliseconds: 300));
    _cachedUsageStatistics = {
      'App Opened': 25,
      'Prayers Completed': 15,
    };
    return _cachedUsageStatistics!;
  }

  Future<Map<PrayIntent, int>>? fetchIntentStatistics() async {
    // Return cached value if it exists
    if (_cachedIntentStatistics != null) {
      return _cachedIntentStatistics!;
    }
    await Future.delayed(Duration(milliseconds: 300));
    _cachedIntentStatistics = {
      PrayIntent(id: 1, intent: 'Health'): 10,
      PrayIntent(id: 2, intent: 'Peace'): 5,
      PrayIntent(id: 3, intent: 'Guidance'): 7,
    };
    return _cachedIntentStatistics!;
  }
}