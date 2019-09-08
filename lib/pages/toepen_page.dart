import 'package:flutter/material.dart';
import 'package:toep_app/ui/custom_button.dart';

import '../ui/toepen_points_list_item.dart';
import '../objects/player.dart';
import '../objects/toepen.dart';

class ToepenPage extends StatefulWidget {
  final Toepen game;
  bool buttonVisible = false;
  ToepenPage(this.game);

  @override
  State<StatefulWidget> createState() => ToepenPageState();
}

class ToepenPageState extends State<ToepenPage> {
  void update(Player player, int change) {
    player.changeScoreBy(change);

    if (widget.game.ended()) {
      widget.buttonVisible = true;
    } else {
      widget.buttonVisible = false;
    }
    this.setState(() {});
  }

  void newGame() {
    for (Player player in widget.game.getPlayers()) {
      player.setScore(0);
    }
    widget.buttonVisible = false;
    this.setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomPadding: false,
        body: Stack(alignment: Alignment.center, children: <Widget>[
          Container(
              padding: EdgeInsets.fromLTRB(20.0, 100.0, 20.0, 20.0),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: <Widget>[
                    Expanded(
                        child: ListView.separated(
                            separatorBuilder:
                                (BuildContext context, int index) => Container(
                                      height: 2.0,
                                      width: 1.0,
                                      color: Colors.black,
                                      margin: const EdgeInsets.only(
                                          left: 10.0, right: 10.0),
                                    ),
                            itemCount: widget.game.getPlayers().length,
                            itemBuilder: (context, index) {
                              return ToepenPointsListItem(
                                  widget.game.getPlayers()[index], update);
                            })),
                    Visibility(
                        visible: widget.buttonVisible,
                        child: CustomButtonWidget("Nieuw potje", Colors.red,
                            Colors.white, () => this.newGame()))
                  ])),
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
              child: Text("Toepen",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 30.0,
                      fontWeight: FontWeight.bold)))
        ]));
  }
}
