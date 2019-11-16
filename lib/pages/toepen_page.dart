import 'package:flutter/material.dart';
import 'package:toep_app/data/repository.dart';
import 'package:toep_app/ui/custom_appbar.dart';
import 'package:toep_app/ui/custom_button.dart';
import '../ui/toepen_points_list_item.dart';
import '../objects/player.dart';
import '../objects/toepen.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sqflite/sqflite.dart';

class ToepenPage extends StatefulWidget {
  final Toepen game;
  final scoreChangedPlayers = Set();
  ToepenPage(this.game);

  @override
  State<StatefulWidget> createState() => ToepenPageState();
}

class ToepenPageState extends State<ToepenPage> {
  bool buttonVisible = false;

  void update(Player player, int change) {
    widget.game.updateScore(player, change);
    if (widget.game.ended()) {
      buttonVisible = true;
    } else {
      buttonVisible = false;
    }
    this.setState(() {});
  }

  void setDealer(Player player) {
    widget.game.setDealer(player);
    widget.scoreChangedPlayers.clear();
    this.setState(() {});
  }

  void newGame() async {
    List<Player> players = widget.game.getPlayers();
    players.sort((a, b) => a.getScore().compareTo(b.getScore()));
    for (Player player in players) {
      Repository.get().saveScore(
          player.getName(), "Toepen", players.first == player ? 1 : 0);
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
        appBar: CustomAppBar("Toepen", context, true, false),
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
