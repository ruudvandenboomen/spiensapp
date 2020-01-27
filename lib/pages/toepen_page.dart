import 'package:flutter/material.dart';
import 'package:toep_app/ui/custom_appbar.dart';
import 'package:toep_app/ui/custom_button.dart';
import 'package:toep_app/util/is_dark.dart';
import '../ui/toepen_points_list_item.dart';
import '../objects/player.dart';
import '../objects/toepen.dart';

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

  void newGame() async {
    List<Player> players = widget.game.getPlayers();
    for (Player player in players) {
      player.setScore(0);
    }
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
                                      color: DarkMode(context).isEnabled ? Colors.white : Colors.black,
                                      margin: const EdgeInsets.only(
                                          left: 10.0, right: 10.0),
                                    ),
                            itemCount: widget.game.getPlayers().length,
                            itemBuilder: (context, index) {
                              return ToepenPointsListItem(
                                  widget.game.getPlayers()[index],
                                  update);
                            })),
                    Visibility(
                        visible: buttonVisible,
                        child: CustomButtonWidget("Nieuw potje", Theme.of(context).primaryColor,
                            Colors.white, () => this.newGame()))
                  ])),
        ]));
  }
}
