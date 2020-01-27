import 'package:flutter/material.dart';
import './pages/players_page.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Spiens App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        accentColor: Colors.blue,
        textSelectionHandleColor: Colors.blue,
        brightness: Brightness.light,
        fontFamily: 'Montserrat',
        textTheme: TextTheme(
          body1: TextStyle(fontSize: 20.0, color: Colors.black),
          body2: TextStyle(
              fontSize: 18.0, color: Colors.black, fontStyle: FontStyle.italic),
        ),
      ),
      darkTheme: ThemeData(
        accentColor: Colors.blue,
        textSelectionHandleColor: Colors.blue,
        brightness: Brightness.dark,
        fontFamily: 'Montserrat',
        textTheme: TextTheme(
          body1: TextStyle(fontSize: 20.0, color: Colors.white),
          body2: TextStyle(
              fontSize: 16.0, color: Colors.white, fontStyle: FontStyle.italic),
        ),
      ),
      home: PlayersPage(),
    );
  }
}
