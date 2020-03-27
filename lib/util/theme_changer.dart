import 'package:flutter/material.dart';

class ThemeChanger with ChangeNotifier {
  ThemeMode _themeMode;

  ThemeChanger(this._themeMode);

  getThemeMode() => _themeMode;
  setThemeMode(ThemeMode mode) {
    _themeMode = mode;

    notifyListeners();
  }
}
