import 'package:flutter/material.dart';

import './pages/players_page.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Spiens App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: Colors.red, fontFamily: 'Montserrat'),
      home: PlayersPage(),
    );
  }
}
