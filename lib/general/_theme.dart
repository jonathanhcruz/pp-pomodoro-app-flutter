import 'package:flutter/material.dart';
import 'package:pomodoro_app/general/_general.dart' show ColorsApp;

class AppTheme {
  static final ThemeData lightTheme = ThemeData.light().copyWith(
    textTheme: const TextTheme(
      bodyText1: TextStyle(
        color: ColorsApp.white,
        fontSize: 18,
      ),
    ),
  );
}
