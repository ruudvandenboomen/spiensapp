import 'package:flutter/material.dart';
import 'package:toep_app/objects/duizenden.dart';
import 'package:toep_app/objects/player.dart';
import 'package:toep_app/ui/custom_appbar.dart';
import 'package:toep_app/ui/custom_button.dart';
import 'package:toep_app/ui/duizenden_points_list_item.dart';
import 'package:flutter/cupertino.dart';
import 'package:toep_app/util/is_dark.dart';

class DuizendenPage extends StatefulWidget {
  final Duizenden game;
  DuizendenPage(this.game);

  @override
  State<StatefulWidget> createState() => DuizendenPageState();
}

class DuizendenPageState extends State<DuizendenPage> {
  final scoreChangedPlayers = Set();

  void update(Player player) {
    widget.game.updateScore(player);
    this.setState(() {});
  }

  void newGame() {
    for (Player player in widget.game.getPlayers()) {
      player.setTotalScore(0);
      player.setScoreList([]);
    }

    this.setState(() {});
  }

  void setDealer(Player player) {
    scoreChangedPlayers.clear();
    this.setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomPadding: false,
        appBar: CustomAppBar("Duizenden", context, true),
        body: Stack(children: <Widget>[
          SingleChildScrollView(
              child: Container(
                  padding: EdgeInsets.fromLTRB(20, 20, 20, 50),
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: <Widget>[
                        Container(
                            height: 500,
                            child: ListView.separated(
                                scrollDirection: Axis.horizontal,
                                separatorBuilder:
                                    (BuildContext context, int index) =>
                                        Container(
                                          height: 1.0,
                                          width: 2.0,
                                          color: DarkMode(context).isEnabled
                                              ? Colors.white
                                              : Colors.black,
                                          margin: const EdgeInsets.only(
                                              top: 10.0, bottom: 10.0),
                                        ),
                                itemCount: widget.game.getPlayers().length,
                                itemBuilder: (context, index) {
                                  return DuizendenPointsListItem(
                                      widget.game.getPlayers()[index], update);
                                })),
                      ]))),
          Container(
              alignment: Alignment.bottomCenter,
              padding: EdgeInsets.fromLTRB(0, 0, 0, 50),
              child: Visibility(
                  visible: widget.game.ended(),
                  child: CustomButtonWidget(
                      "Nieuw potje",
                      Theme.of(context).primaryColor,
                      Colors.white,
                      () => newGame(),
                      minWidth: MediaQuery.of(context).size.width - 40)))
        ]));
  }
}
