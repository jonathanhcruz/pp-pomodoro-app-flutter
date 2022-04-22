import 'package:flutter/material.dart';

class InteractionBar extends StatelessWidget {
  final Function startPomodoro;
  final Function resetPomodoro;
  final Function nextStateApp;

  const InteractionBar({
    Key? key,
    required this.startPomodoro,
    required this.resetPomodoro,
    required this.nextStateApp,
  }) : super(key: key);

  void reset() {
    resetPomodoro();
  }

  void start() {
    startPomodoro();
  }

  void next() {
    nextStateApp();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        TextButton(
          onPressed: reset,
          child: const SizedBox(
            width: 60,
            height: 60,
            child: Icon(
              Icons.restart_alt,
              color: Colors.white,
              size: 35,
            ),
          ),
        ),
        TextButton(
          onPressed: start,
          child: const SizedBox(
            width: 60,
            height: 60,
            child: Icon(
              Icons.stop,
              color: Colors.white,
              size: 60,
            ),
          ),
        ),
        TextButton(
          onPressed: next,
          child: const SizedBox(
            width: 60,
            height: 60,
            child: Icon(
              Icons.navigate_next,
              color: Colors.white,
              size: 45,
            ),
          ),
        ),
      ],
    );
  }
}
