import 'package:flutter/material.dart';

import './pages/players_page.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Spiens App',
      theme: ThemeData(primarySwatch: Colors.red, fontFamily: 'Montserrat'),
      home: PlayersPage(),
      routes: <String, WidgetBuilder>{
        // '/home': (BuildContext context) => HomePage(),
      },
    );
  }
}