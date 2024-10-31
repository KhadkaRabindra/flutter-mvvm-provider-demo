import 'package:flutter/material.dart';

class PrayIntentsWidget extends StatelessWidget {
  const PrayIntentsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return  Card(
      child: Padding(
        padding: EdgeInsets.only(left: 25.0, top: 5.0, right: 25.0, bottom: 5.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Pray intents",
              style: Theme.of(context).textTheme.bodyLarge,
            ),
            //IntentGraph(),
          ],
        ),
      ),
    );
  }
}

