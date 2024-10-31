class PrayerTimeStatistics {
  final String timeOfDay;
  final String duration;

  PrayerTimeStatistics({required this.timeOfDay, required this.duration});
}

class PrayerSessionCount {
  final String timeOfDay;
  final int count;

  PrayerSessionCount({required this.timeOfDay, required this.count});
}

class UsageStatistic {
  final String action;
  final int count;

  UsageStatistic({required this.action, required this.count});
}

class PrayIntent {
  final int id;
  final String intent;

  PrayIntent({required this.id, required this.intent});

  static PrayIntent fajr = PrayIntent(id: 1, intent: 'Fajr');
  static PrayIntent dhuhr = PrayIntent(id: 2, intent: 'Dhuhr');
  static PrayIntent asr = PrayIntent(id: 3, intent: 'Asr');
  static PrayIntent maghrib = PrayIntent(id: 4, intent: 'Maghrib');
  static PrayIntent isha = PrayIntent(id: 5, intent: 'Isha');
}