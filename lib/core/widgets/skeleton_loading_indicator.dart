import 'package:flutter/material.dart';
import 'package:mvvm_demo/core/widgets/pray_intent_skeleton.dart';
import 'package:mvvm_demo/core/widgets/quote_skeleton.dart';
import 'package:mvvm_demo/core/widgets/statistics_card_skeleton.dart';
import 'package:mvvm_demo/core/widgets/streak_skeleton.dart';
import 'package:skeleton_loader/skeleton_loader.dart';

class SkeletonLoadingIndicator extends StatelessWidget {
  const SkeletonLoadingIndicator({super.key});

  @override
  Widget build(BuildContext context) {
    return SkeletonLoader(
      builder: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Container(width: 200, height: 20, color: Colors.grey[300]),
            const SizedBox(height: 10),
            Container(width: 150, height: 15, color: Colors.grey[300]),
            const Divider(),
            Container(width: 100, height: 20, color: Colors.grey[300]),
            const SizedBox(height: 10),
            Container(width: 150, height: 15, color: Colors.grey[300]),
            const Divider(),
          ],
        ),
      ),
      period: const Duration(seconds: 2),
      highlightColor: Colors.grey[100]!,
      baseColor: Colors.grey[300]!,
    );
  }
}


class AdvancedSkeletonLoadingIndicator extends StatelessWidget {
  const AdvancedSkeletonLoadingIndicator({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const QuoteSkeleton(),
            const SizedBox(height: 16),
            const StreakSkeleton(),
            const SizedBox(height: 16),
            const PrayIntentSkeleton(),
            const SizedBox(height: 16),
            const StatisticsCardSkeleton(title: 'Prayer Time'),
            const SizedBox(height: 8),
            const StatisticsCardSkeleton(title: 'Prayer Sessions Count'),
            const SizedBox(height: 8),
            const StatisticsCardSkeleton(title: 'Usage'),
          ],
        ),
      ),
    );
  }
}