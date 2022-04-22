import 'package:flutter/material.dart';
import 'package:pomodoro_app/components/_components.dart' show ResultIndicator;

class StatusBar extends StatelessWidget {
  final int jobs;
  final int breaks;
  final int jumps;

  const StatusBar({
    Key? key,
    required this.jobs,
    required this.breaks,
    required this.jumps,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(top: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ResultIndicator(
            title: 'Jobs',
            counter: jobs,
          ),
          ResultIndicator(
            title: 'Breaks',
            counter: breaks,
          ),
          ResultIndicator(
            title: 'Jumps',
            counter: jumps,
          ),
        ],
      ),
    );
  }
}
