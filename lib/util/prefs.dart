import 'dart:async';

import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter/material.dart';
import 'package:toep_app/util/theme_changer.dart';

class Prefs {
  static const Map<ThemeMode, String> themes = {
    ThemeMode.dark: "Donker",
    ThemeMode.light: "Licht",
    ThemeMode.system: "Systeem"
  };

  factory Prefs.singleton() {
    return _instance;
  }

  static final Prefs _instance = Prefs._internal();

  SharedPreferences _prefs;
  bool _initialized = false;

  static const String THEME_PREF = "AppTheme";

  Prefs._internal() {
    _getPrefs().then((prefs) {
      _initialized = true;
    });
  }

  Future<SharedPreferences> _getPrefs() async {
    if (_prefs == null) {
      _prefs = await SharedPreferences.getInstance();
    }
    return _prefs;
  }

  ThemeMode getTheme() {
    if (_initialized) {
      String theme = _prefs.getString(THEME_PREF);
      if (theme != null) {
        return stringToThemeMode(theme);
      } else {
        _prefs.setString(THEME_PREF, themes[ThemeMode.system]);
        return ThemeMode.system;
      }
    } else {
      return ThemeMode.system;
    }
  }

  String getThemeString() {
    return themes[getTheme()];
  }

  void setTheme(String theme, context) {
    _getPrefs().then((prefs) {
      prefs.setString(THEME_PREF, theme);
    });
    ThemeChanger _themeChanger = Provider.of<ThemeChanger>(context, listen: false);
    _themeChanger.setThemeMode(stringToThemeMode(theme));
  }

  ThemeMode stringToThemeMode(String theme) {
    return themes.keys
        .firstWhere((k) => themes[k] == theme, orElse: () => null);
  }
}

typedef PrefsListener(String key, Object value);
