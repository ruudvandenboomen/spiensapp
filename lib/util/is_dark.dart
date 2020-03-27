import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:toep_app/util/theme_changer.dart';

class DarkMode {
  static final DarkMode _singleton = DarkMode._internal();
  bool isEnabled;

  factory DarkMode(BuildContext context) {
    final _themeChanger = Provider.of<ThemeChanger>(context);
    final brightness = MediaQuery.of(context).platformBrightness;
    if (_themeChanger.getThemeMode() == ThemeMode.system)
      _singleton.isEnabled = brightness == Brightness.dark;
    else
      _singleton.isEnabled = _themeChanger.getThemeMode() == ThemeMode.dark;

    return _singleton;
  } 

  DarkMode._internal();
}
