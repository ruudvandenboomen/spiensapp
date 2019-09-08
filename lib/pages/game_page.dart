import 'package:flutter/material.dart';
import 'package:toep_app/objects/duizenden.dart';
import 'package:toep_app/objects/toepen.dart';
import 'package:toep_app/pages/duizenden_page.dart';
import 'package:toep_app/pages/toepen_page.dart';
import 'package:toep_app/ui/custom_button.dart';

import '../objects/player.dart';
import 'package:flutter/cupertino.dart';

class GamePage extends StatefulWidget {
  final List<Player> _players;
  GamePage(this._players);

  @override
  State<StatefulWidget> createState() => GamePageState();
}

class GamePageState extends State<GamePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomPadding: false,
        body: Container(
            width: double.infinity,
            color: Colors.red,
            padding: EdgeInsets.fromLTRB(0.0, 40.0, 20.0, 0.0),
            child: Stack(alignment: Alignment.center, children: <Widget>[
              Align(
                  alignment: Alignment.topLeft,
                  child: IconButton(
                      icon: Icon(Icons.arrow_back_ios),
                      tooltip: 'Back',
                      color: Colors.white,
                      onPressed: () => Navigator.of(context).pop())),
              Container(
                  width: 200,
                  alignment: Alignment.topCenter,
                  padding: EdgeInsets.all(8),
                  child: Text("Kaartspel",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 30.0,
                          fontWeight: FontWeight.bold))),
              Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Padding(
                        padding: EdgeInsets.all(10),
                        child: CustomButtonWidget(
                          "Toepen",
                          Colors.white,
                          Colors.red,
                          () => Navigator.of(context).push(CupertinoPageRoute(
                              builder: (BuildContext context) =>
                                  ToepenPage(Toepen(this.widget._players)))),
                          minWidth: 250,
                        )),
                    CustomButtonWidget(
                        "Duizenden",
                        Colors.white,
                        Colors.red,
                        () => Navigator.of(context).push(CupertinoPageRoute(
                            builder: (BuildContext context) => DuizendenPage(
                                Duizenden(this.widget._players)))),
                        minWidth: 250),
                  ])
            ])));
  }
}
