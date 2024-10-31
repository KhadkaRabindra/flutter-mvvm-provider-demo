import 'package:flutter/material.dart';
import 'package:mvvm_demo/view_model/statistics_viewmodel.dart';
import 'package:mvvm_demo/view_model/theme_notifier.dart';
import 'package:provider/provider.dart';
import '../../core/widgets/error_widget.dart';
import '../../core/widgets/skeleton_loading_indicator.dart';
import '../../data/services/statistics_service.dart';
import '../widgets/pray_intent_widget.dart';
import '../widgets/quote_widget.dart';
import '../widgets/statistics_card_widget.dart';
import '../widgets/streak_widget.dart';

class StatisticsPage extends StatelessWidget {
  const StatisticsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => StatisticsViewModel(StatisticsService())..loadStatistics(),
      child: Consumer<StatisticsViewModel>(
        builder: (context, viewModel, child) {
          return Scaffold(
            appBar: AppBar(
              title: const Text(''),
              actions: [
                IconButton(
                  icon: Icon(
                    Icons.brightness_6, // Toggle icon
                  ),
                  onPressed: () {
                    Provider.of<ThemeNotifier>(context, listen: false).toggleTheme();
                  },
                ),
              ],
            ),
            body: viewModel.isLoading
                ? const AdvancedSkeletonLoadingIndicator() // Show skeleton while loading
                : viewModel.hasError // Check if there's an error
                    ? RetryErrorWidget(
                        onRetry: () => viewModel
                            .retryLoading(), // Retry loading on button press
                      )
                    : StatisticsContent(
                        viewModel:
                            viewModel), // Show content if loaded successfully
          );
        },
      ),
    );
  }
}

class StatisticsContent extends StatelessWidget {
  final StatisticsViewModel viewModel;

  const StatisticsContent({super.key, required this.viewModel});

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    return Center(
      child: SingleChildScrollView(
        padding: EdgeInsets.all(screenSize.width * 0.05),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            const QuoteWidget(),
            const Divider(),
            StreakWidget(streak: viewModel.streak),
            const PrayIntentsWidget(),
            StatisticsCardWidget(
              title: 'Prayer Time',
              statistics: viewModel.prayerTimeStatistics,
            ),
            StatisticsCardWidget(
              title: 'Prayer Sessions Count',
              statistics: viewModel.prayerSessionsCountStatistics,
            ),
            StatisticsCardWidget(
              title: 'Usage',
              statistics: viewModel.usageStatistics,
            ),
          ],
        ),
      ),
    );
  }
}


