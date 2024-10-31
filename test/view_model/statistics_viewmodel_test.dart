import 'package:flutter_test/flutter_test.dart';

import 'package:mockito/annotations.dart';
import 'package:mockito/src/mock.dart';
import 'package:mvvm_demo/data/model/statistics_model.dart';
import 'package:mvvm_demo/data/services/statistics_service.dart';
import 'package:mvvm_demo/view_model/statistics_viewmodel.dart';

// Mocking the StatisticsService
class MockStatisticsService extends Mock implements StatisticsService {}

@GenerateMocks(
  [StatisticsService],
  customMocks: [
    MockSpec<StatisticsService>(as: #MockStatisticsServiceA)
  ],
)

void main() {
  late StatisticsViewModel viewModel;
  late MockStatisticsService mockStatisticsService;

  setUp(() {
    mockStatisticsService = MockStatisticsService();
    // Set up a default return value for fetchStreak to avoid null issues
    viewModel = StatisticsViewModel(mockStatisticsService);
  });


  group('StatisticsViewModel', () {
    test('successfully loads statistics', () async {
      // Arrange: Define mock responses
      when(mockStatisticsService.fetchStreak()).thenAnswer((_) async => 5);
      when(mockStatisticsService.fetchPrayerTimeStatistics())
          .thenAnswer((_) async => {'Fajr': '05:00', 'Dhuhr': '12:30'});
      when(mockStatisticsService.fetchPrayerSessionsCountStatistics())
          .thenAnswer((_) async => {'Fajr': 30, 'Dhuhr': 40});
      when(mockStatisticsService.fetchUsageStatistics())
          .thenAnswer((_) async => {'total': 100});
      when(mockStatisticsService.fetchIntentStatistics())
          .thenAnswer((_) async => {PrayIntent.fajr: 10});

      // Act: Load statistics
      await viewModel.loadStatistics();

      // Assert: Check if the statistics were loaded correctly
      expect(viewModel.streak, 5);
      expect(viewModel.prayerTimeStatistics, {'Fajr': '05:00', 'Dhuhr': '12:30'});
      expect(viewModel.prayerSessionsCountStatistics, {'Fajr': 30, 'Dhuhr': 40});
      expect(viewModel.usageStatistics, {'total': 100});
      expect(viewModel.intentStatistics, {PrayIntent.fajr: 10});
      expect(viewModel.isLoading, false);
      expect(viewModel.hasError, false);
      expect(viewModel.errorMessage, isNull);
    });

    test('handles error when loading statistics fails', () async {
      // Arrange: Make fetchStreak throw an error
      when(mockStatisticsService.fetchStreak()).thenThrow(Exception('Failed to fetch streak'));

      // Act: Load statistics
      await viewModel.loadStatistics();

      // Assert: Check the error state
      expect(viewModel.isLoading, false);
      expect(viewModel.hasError, true);
      expect(viewModel.errorMessage, 'Exception: Failed to fetch streak');
      expect(viewModel.streak, 0); // Ensure streak is not updated
    });

    test('does not load statistics if already loading', () async {
      // Mock the service methods to return future values
      when(mockStatisticsService.fetchStreak()).thenAnswer((_) async => 3);
      when(mockStatisticsService.fetchPrayerTimeStatistics()).thenAnswer((_) async => {'Fajr': '05:00', 'Dhuhr': '12:30'});
      when(mockStatisticsService.fetchPrayerSessionsCountStatistics()).thenAnswer((_) async => {'Fajr': 30, 'Dhuhr': 40});
      when(mockStatisticsService.fetchUsageStatistics()).thenAnswer((_) async => {'total': 100});
      when(mockStatisticsService.fetchIntentStatistics()).thenAnswer((_) async {
        await Future.delayed(Duration(milliseconds: 300));
        return {PrayIntent.fajr: 10};
      });

      // Start the loading process
      viewModel.loadStatistics();
      await viewModel.loadStatistics();
      expect(viewModel.isLoading, isTrue); // Expecting true because loading has started

      // Attempt to load again while still loading
      await viewModel.loadStatistics(); // This call should not change the loading state
      expect(viewModel.isLoading, isTrue); // Still expecting true because it should not change

      // Wait for the first load to complete
      await Future.delayed(Duration(milliseconds: 300)); // Wait for the loading to finish
      expect(viewModel.isLoading, isFalse); // Expecting false after the first load completes
    });

    test('retryLoading calls loadStatistics again', () async {
      // Arrange: Define mock responses
      when(mockStatisticsService.fetchStreak()).thenAnswer((_) async => 3);
      when(mockStatisticsService.fetchPrayerTimeStatistics())
          .thenAnswer((_) async => {'Fajr': '05:00', 'Dhuhr': '12:30'});
      when(mockStatisticsService.fetchPrayerSessionsCountStatistics())
          .thenAnswer((_) async => {'Fajr': 30, 'Dhuhr': 40});
      when(mockStatisticsService.fetchUsageStatistics())
          .thenAnswer((_) async => {'total': 100});
      when(mockStatisticsService.fetchIntentStatistics())
          .thenAnswer((_) async => {PrayIntent.fajr: 10});

      // Initially load statistics
      await viewModel.loadStatistics();

      // Act: Retry loading
      await viewModel.retryLoading();

      // Assert: Check the new state after retrying
      expect(viewModel.streak, 3);
      expect(viewModel.isLoading, false);
      expect(viewModel.hasError, false);
      expect(viewModel.errorMessage, isNull);
    });
  });
}