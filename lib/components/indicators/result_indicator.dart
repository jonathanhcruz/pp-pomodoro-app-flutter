import 'package:flutter/material.dart';
import 'package:pomodoro_app/general/_general.dart' show TextStyleApp;

class ResultIndicator extends StatelessWidget {
  final String title;
  final int counter;

  const ResultIndicator({
    Key? key,
    required this.title,
    required this.counter,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        vertical: 10,
        horizontal: 10,
      ),
      child: SizedBox(
        width: 60,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(title, style: TextStyleApp.normalText),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 5),
              child: Text('$counter', style: TextStyleApp.bigText),
            ),
          ],
        ),
      ),
    );
  }
}
