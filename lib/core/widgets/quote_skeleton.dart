import 'package:flutter/material.dart';
import 'package:skeleton_loader/skeleton_loader.dart';

class QuoteSkeleton extends StatelessWidget {
  const QuoteSkeleton({super.key});

  @override
  Widget build(BuildContext context) {
    return SkeletonLoader(
      builder: Container(
        height: 100,
        width: double.infinity,
        decoration: BoxDecoration(
          color: Colors.grey[300],
          borderRadius: BorderRadius.circular(8),
        ),
      ),
      highlightColor: Colors.grey[100]!,
      baseColor: Colors.grey[300]!,
      period: const Duration(seconds: 2),
    );
  }
}