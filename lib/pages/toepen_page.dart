import 'package:flutter/material.dart';
import 'package:toep_app/ui/custom_appbar.dart';
import 'package:toep_app/ui/custom_button.dart';

import '../ui/toepen_points_list_item.dart';
import '../objects/player.dart';
import '../objects/toepen.dart';

class ToepenPage extends StatefulWidget {
  final Toepen game;
  final scoreChangedPlayers = new Set();
  ToepenPage(this.game);

  @override
  State<StatefulWidget> createState() => ToepenPageState();
}

class ToepenPageState extends State<ToepenPage> {
  bool buttonVisible = false;

  void update(Player player, int change) {
    player.changeScoreBy(change);
    List<Player> players = widget.game.getPlayers();

    if (widget.game.ended()) {
      buttonVisible = true;
    } else {
      if (change > 0) widget.scoreChangedPlayers.add(player);
      if (widget.scoreChangedPlayers.length == (players.length - 1)) {
        widget.game.setDealer(players[
            (players.indexOf(widget.game.getDealer()) + 1) % players.length]);
        widget.scoreChangedPlayers.clear();
      }
      buttonVisible = false;
    }
    this.setState(() {});
  }

  void setDealer(Player player) {
    widget.game.setDealer(player);
    widget.scoreChangedPlayers.clear();
    this.setState(() {});
  }

  void newGame() {
    List<Player> players = widget.game.getPlayers();
    for (Player player in players) {
      player.setScore(0);
    }
    widget.game.setDealer(players.first);
    buttonVisible = false;
    widget.scoreChangedPlayers.clear();
    this.setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomPadding: false,
        appBar: CustomAppBar("Toepen", context, true),
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
                                  widget.game.getPlayers()[index],
                                  widget.game.getPlayers()[index] ==
                                      widget.game.getDealer(),
                                  update,
                                  setDealer);
                            })),
                    Visibility(
                        visible: buttonVisible,
                        child: CustomButtonWidget("Nieuw potje", Colors.red,
                            Colors.white, () => this.newGame()))
                  ])),
        ]));
  }
}
