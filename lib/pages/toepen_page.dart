import 'package:flutter/material.dart';
import 'package:toep_app/ui/custom_appbar.dart';
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
        appBar: CustomAppBar("Toepen", 100, true),
        body: Stack(alignment: Alignment.center, children: <Widget>[
          Container(
              padding: EdgeInsets.fromLTRB(20.0, 20.0, 20.0, 20.0),
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
        ]));
  }
}
