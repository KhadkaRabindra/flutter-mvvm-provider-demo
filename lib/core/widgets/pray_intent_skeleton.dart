import 'package:flutter/material.dart';
import 'package:skeleton_loader/skeleton_loader.dart';

class PrayIntentSkeleton extends StatelessWidget {
  const PrayIntentSkeleton({super.key});

  @override
  Widget build(BuildContext context) {
    return SkeletonLoader(
      builder: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: List.generate(3, (index) {
          return Container(
            height: 50,
            width: 50,
            decoration: BoxDecoration(
              color: Colors.grey[300],
              shape: BoxShape.circle,
            ),
          );
        }),
      ),
      highlightColor: Colors.grey[100]!,
      baseColor: Colors.grey[300]!,
      period: const Duration(seconds: 2),
    );
  }
}