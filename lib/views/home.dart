import 'dart:async';
import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';

import 'package:pomodoro_app/components/_components.dart'
    show StatusBar, TimeControl, InteractionBar;
import 'package:pomodoro_app/general/_general.dart' show ColorsApp;

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final Map<String, int> defaultValues = {
    'work': 25,
    'break': 5,
    'seconds': 0,
  };
  var counerTime;

  bool isActive = false;
  String stateApp = 'work';
  int minutesPomodoro = 25;
  int secondsPomodoro = 0;
  int jobs = 0;
  int breaks = 0;
  int jumps = 0;

  void playSound(String path) async {
    AudioPlayer audioPlayer = AudioPlayer();
    AudioCache audioCache = AudioCache(
      prefix: 'assets/audios/',
      fixedPlayer: audioPlayer,
    );
    audioCache.play(path);
  }

  Timer _setTiemer() {
    Duration periodic = const Duration(seconds: 1);
    return Timer.periodic(periodic, (timer) {
      if (isActive && minutesPomodoro > 0 || secondsPomodoro > 1) {
        minutesPomodoro =
            secondsPomodoro <= 0 ? minutesPomodoro - 1 : minutesPomodoro;
        secondsPomodoro = secondsPomodoro > 0 ? secondsPomodoro - 1 : 59;
        setState(() {});
      } else {
        stateApp == 'work' ? jobs++ : breaks++;
        playSound('break.mp3');

        _nextStateApp();
        timer.cancel();
      }
    });
  }

  void _startPomodoro() {
    isActive = !isActive;
    if (isActive && minutesPomodoro > 0) {
      counerTime = _setTiemer();
    } else {
      counerTime?.cancel();
    }
  }

  void _resetPomodoro() {
    counerTime?.cancel();
    isActive = false;
    minutesPomodoro = defaultValues[stateApp]!;
    secondsPomodoro = defaultValues['seconds']!;
    setState(() {});
  }

  void _nextStateApp() {
    counerTime?.cancel();
    isActive = false;
    if (stateApp == 'work') {
      stateApp = 'break';
      minutesPomodoro = defaultValues[stateApp]!;
    } else {
      stateApp = 'work';
      minutesPomodoro = defaultValues[stateApp]!;
    }

    secondsPomodoro = defaultValues['seconds']!;
    jumps++;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorsApp.primaryColor,
      body: MediaQuery.removePadding(
        context: context,
        removeTop: true,
        removeBottom: true,
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                StatusBar(
                  jobs: jobs,
                  breaks: breaks,
                  jumps: jumps,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 50),
                  child: TimeControl(
                    timeMinutes: minutesPomodoro,
                    timeSeconds: secondsPomodoro,
                    stateApp: stateApp,
                  ),
                ),
                InteractionBar(
                  resetPomodoro: _resetPomodoro,
                  startPomodoro: _startPomodoro,
                  nextStateApp: _nextStateApp,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
