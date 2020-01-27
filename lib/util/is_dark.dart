import 'package:flutter/cupertino.dart';

class DarkMode {
  static final DarkMode _singleton = DarkMode._internal();
  bool isEnabled;

  factory DarkMode(BuildContext context) {
    final Brightness brightnessValue =
        MediaQuery.of(context).platformBrightness;
    _singleton.isEnabled = brightnessValue == Brightness.dark;
    return _singleton;
  }

  DarkMode._internal();
}
