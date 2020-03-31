import 'package:flutter/material.dart';

class Themes {
  static final ThemeData lightTheme = ThemeData(
    accentColor: Colors.blue,
    textSelectionHandleColor: Colors.blue,
    brightness: Brightness.light,
    fontFamily: 'Montserrat',
    textTheme: TextTheme(
      headline1: TextStyle(fontSize: 28.0, color: Colors.black),
      headline2: TextStyle(
          fontStyle: FontStyle.normal, fontSize: 18.0, color: Colors.blue),
      bodyText1: TextStyle(fontSize: 20.0, color: Colors.black),
      bodyText2: TextStyle(
          fontSize: 18.0, color: Colors.black, fontStyle: FontStyle.italic),
    ),
  );
  static final ThemeData darkTheme = ThemeData(
    accentColor: Colors.blue,
    textSelectionHandleColor: Colors.blue,
    brightness: Brightness.dark,
    fontFamily: 'Montserrat',
    textTheme: TextTheme(
      headline1: TextStyle(fontSize: 28.0, color: Colors.white),
      headline2: TextStyle(
          fontStyle: FontStyle.normal, fontSize: 18.0, color: Colors.blue),
      bodyText1: TextStyle(fontSize: 20.0, color: Colors.white),
      bodyText2: TextStyle(
          fontSize: 18.0, color: Colors.white, fontStyle: FontStyle.italic),
    ),
  );
}
