// QuoteWidget for the motivational quote
import 'package:flutter/cupertino.dart';

class QuoteWidget extends StatelessWidget {
  const QuoteWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.all(8.0),
      child: Text(
        "Let us not become weary in doing good, for at the proper time we will reap a harvest if we do not give up.",
        textAlign: TextAlign.center,
        style: TextStyle(fontStyle: FontStyle.italic),
      ),
    );
  }
}