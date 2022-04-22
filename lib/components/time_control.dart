import 'package:flutter/material.dart';
import 'package:pomodoro_app/general/_general.dart' show TextStyleApp;

class TimeControl extends StatelessWidget {
  final int timeMinutes;
  final int timeSeconds;
  final String stateApp;
  const TimeControl({
    Key? key,
    required this.timeMinutes,
    required this.timeSeconds,
    required this.stateApp,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(bottom: 10),
          child: Text(
            'Time to $stateApp',
            style: TextStyleApp.bigText,
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(bottom: 20),
          child: Text(
            '${timeMinutes > 9 ? timeMinutes : '0$timeMinutes'} : ${timeSeconds > 9 ? timeSeconds : '0$timeSeconds'}',
            style: TextStyleApp.xBigText,
          ),
        ),
      ],
    );
  }
}
