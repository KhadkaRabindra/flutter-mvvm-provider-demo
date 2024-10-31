import 'package:flutter/material.dart';

class StatisticsCardWidget extends StatelessWidget {
  final String title;
  final Map<String, dynamic>? statistics;

  const StatisticsCardWidget({
    super.key,
    required this.title,
    required this.statistics,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 8.0),
      child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  title,
                  style: (Theme.of(context).textTheme.headlineMedium ??
                      const TextStyle())
                      .copyWith(
                    fontSize: 18.0,
                    color: Colors.deepPurple,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 8.0),
                ...statistics!.entries.map((entry) => Padding(
                  padding: const EdgeInsets.symmetric(vertical: 4.0),
                  child: Row(
                    children: [
                      Expanded(
                        flex: 1,
                        child: Text(
                          entry.key,
                          style: Theme.of(context).textTheme.bodyMedium,
                        ),
                      ),
                      const Spacer(),
                      Expanded(
                        flex: 1,
                        child: Text(
                          entry.value.toString(),
                          style: Theme.of(context).textTheme.bodyMedium,
                          textAlign: TextAlign.end,
                        ),
                      ),
                    ],
                  ),
                )),
              ],
            ),
          )),
    );
  }
}