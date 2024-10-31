import 'package:flutter/material.dart';
import 'package:skeleton_loader/skeleton_loader.dart';

class StreakSkeleton extends StatelessWidget {
  const StreakSkeleton({super.key});

  @override
  Widget build(BuildContext context) {
    return SkeletonLoader(
      builder: Container(
        height: 60,
        width: 200,
        decoration: BoxDecoration(
          color: Colors.grey[300],
          borderRadius: BorderRadius.circular(10),
        ),
      ),
      highlightColor: Colors.grey[100]!,
      baseColor: Colors.grey[300]!,
      period: const Duration(seconds: 2),
    );
  }
}