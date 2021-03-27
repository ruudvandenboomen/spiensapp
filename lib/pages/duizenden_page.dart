import 'package:flutter/material.dart';
import 'package:toep_app/objects/duizenden.dart';
import 'package:toep_app/objects/player.dart';
import 'package:toep_app/ui/appbar/custom_appbar.dart';
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

  void update(Player player) {
    this.setState(() {});
  }

  void newGame() {
    for (Player player in widget.game.players) {
      player.totalDuizendenScore = 0;
      player.duizendenScoreList = [];
    }

    this.setState(() {});
  }

  void setDealer(Player player) {
    this.setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: CustomAppBar("Duizenden", context, true),
        body: Stack(children: <Widget>[
          SingleChildScrollView(
              child: Container(
                  padding: EdgeInsets.fromLTRB(0, 20, 0, 50),
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
                                itemCount: widget.game.players.length,
                                itemBuilder: (context, index) {
                                  var duizendenListItem =
                                      DuizendenPointsListItem(
                                          widget.game.players[index],
                                          update);
                                  if (index == 0) {
                                    return Container(
                                        padding:
                                            EdgeInsets.fromLTRB(20, 0, 0, 0),
                                        child: duizendenListItem);
                                  } else if (index ==
                                      widget.game.players.length - 1) {
                                    return Container(
                                        padding:
                                            EdgeInsets.fromLTRB(0, 0, 20, 0),
                                        child: duizendenListItem);
                                  } else {
                                    return duizendenListItem;
                                  }
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
