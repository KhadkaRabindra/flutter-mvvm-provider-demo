import 'package:flutter/material.dart';

class StreakWidget extends StatelessWidget {
  final int streak;

  const StreakWidget({
    super.key,
    required this.streak,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 8.0),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListTile(
          title: Text.rich(
            TextSpan(
              text: "You have prayed consecutively ",
              style: Theme.of(context).textTheme.bodyMedium,
              children: [
                TextSpan(
                  text: '$streak',
                  style: (Theme.of(context).textTheme.bodyMedium ?? TextStyle()).copyWith(
                    fontWeight: FontWeight.bold,
                    color: Colors.deepPurple,
                  ),
                ),
                const TextSpan(
                  text:
                  ' days in a row. Great job! You are transforming your life positively.',
                ),
              ],
            ),
            textAlign: TextAlign.center,
          ),
        ),
      ),
    );
  }
}