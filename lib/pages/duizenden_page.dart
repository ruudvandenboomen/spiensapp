import 'package:flutter/material.dart';
import 'package:toep_app/objects/duizenden.dart';
import 'package:toep_app/objects/player.dart';
import 'package:toep_app/ui/custom_button.dart';
import 'package:toep_app/ui/duizenden_points_list_item.dart';

import 'package:flutter/cupertino.dart';

class DuizendenPage extends StatefulWidget {
  final Duizenden game;
  DuizendenPage(this.game);
  @override
  State<StatefulWidget> createState() => DuizendenPageState();
}

class DuizendenPageState extends State<DuizendenPage> {
  void update() {
    this.setState(() {});
  }

  bool buttonVisible() {
    return widget.game.ended();
  }

  void newGame() {
    for (Player player in widget.game.getPlayers()) {
      player.setTotalScore(0);
      player.setScoreList([]);
    }
    this.setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomPadding: false,
        body: Stack(alignment: Alignment.center, children: <Widget>[
          SingleChildScrollView(
              child: Container(
                  padding: EdgeInsets.fromLTRB(20, 120, 20, 50),
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: <Widget>[
                        Container(
                            height: 500,
                            width: 500,
                            child: ListView.separated(
                                scrollDirection: Axis.horizontal,
                                separatorBuilder:
                                    (BuildContext context, int index) =>
                                        Container(
                                          height: 1.0,
                                          width: 2.0,
                                          color: Colors.black,
                                          margin: const EdgeInsets.only(
                                              top: 10.0, bottom: 10.0),
                                        ),
                                itemCount: widget.game.getPlayers().length,
                                itemBuilder: (context, index) {
                                  return DuizendenPointsListItem(
                                      widget.game.getPlayers()[index], update);
                                })),
                        Visibility(
                            visible: buttonVisible(),
                            child: CustomButtonWidget("Nieuw potje", Colors.red,
                                Colors.white, () => newGame()))
                      ]))),
          Align(
              alignment: Alignment.topCenter,
              child: Container(
                  color: Colors.red, width: double.infinity, height: 100)),
          Container(
              alignment: Alignment.topLeft,
              padding: EdgeInsets.fromLTRB(0, 40, 0, 0),
              child: IconButton(
                  icon: Icon(Icons.arrow_back_ios),
                  tooltip: 'Back',
                  color: Colors.white,
                  onPressed: () => Navigator.of(context).pop())),
          Container(
              width: 200,
              alignment: Alignment.topCenter,
              padding: EdgeInsets.fromLTRB(0, 48, 0, 0),
              child: Text("Duizenden",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 30.0,
                      fontWeight: FontWeight.bold)))
        ]));
  }
}
