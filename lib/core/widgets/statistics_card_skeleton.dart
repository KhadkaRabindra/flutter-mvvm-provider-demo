import 'package:flutter/material.dart';
import 'package:skeleton_loader/skeleton_loader.dart';

class StatisticsCardSkeleton extends StatelessWidget {
  final String title;

  const StatisticsCardSkeleton({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return SkeletonLoader(
      builder: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 24,
            width: 140,
            decoration: BoxDecoration(
              color: Colors.grey[300],
              borderRadius: BorderRadius.circular(4),
            ),
          ),
          const SizedBox(height: 8),
          Container(
            height: 80,
            width: double.infinity,
            decoration: BoxDecoration(
              color: Colors.grey[300],
              borderRadius: BorderRadius.circular(8),
            ),
          ),
        ],
      ),
      highlightColor: Colors.grey[100]!,
      baseColor: Colors.grey[300]!,
      period: const Duration(seconds: 2),
    );
  }
}