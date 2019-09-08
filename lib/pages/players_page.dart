import 'package:flutter/material.dart';
import 'package:flutter_toast2018/flutter_toast2018.dart';
import 'package:toep_app/animations/listview_effect.dart';
import 'package:toep_app/pages/game_page.dart';
import 'package:toep_app/ui/custom_button.dart';

import '../ui/add_player_widget.dart';
import '../ui/player_name_list_item.dart';
import '../objects/player.dart';
import 'package:flutter/cupertino.dart';

class PlayersPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => PlayersPageState();
}

class PlayersPageState extends State<PlayersPage> {
  final myController = TextEditingController();
  List<Player> players = [];
  bool _readyButtonVisible = false;
  Duration _duration = Duration(milliseconds: 300);

  @override
  void dispose() {
    myController.dispose();
    super.dispose();
  }

  void addPlayer() {
    String name = myController.text;
    if (players.indexWhere((player) => player.getName().toString() == name) >=
        0) {
      FlutterToast2018.toast('Name already added', ToastDuration.short);
    } else if (name != "") {
      players.add(Player(name));
      myController.text = "";
    }
    setButtonVisible();
    this.setState(() {});
  }

  void removePlayer(int index) {
    players.removeAt(index);
    setButtonVisible();
    this.setState(() {});
  }

  void setButtonVisible() {
    if (players.length > 1) {
      _readyButtonVisible = true;
    } else {
      _readyButtonVisible = false;
    }
  }

  Widget _buildWidgetExample(Player player) {
    return PlayerNameListItem(
        player.getName(), () => removePlayer(players.indexOf(player)));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomPadding: false,
        body: Stack(alignment: Alignment.center, children: <Widget>[
          Align(
              alignment: Alignment.topCenter,
              child: Container(
                  color: Colors.red, width: double.infinity, height: 100)),
          Container(
              width: 200,
              alignment: Alignment.topCenter,
              padding: EdgeInsets.fromLTRB(0, 48, 0, 0),
              child: Text("Spelers",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 30.0,
                      fontWeight: FontWeight.bold))),
          Container(
              padding: EdgeInsets.fromLTRB(0, 120, 0, 20),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  AddPlayerWidget(myController, () => addPlayer()),
                  Expanded(
                    child: Container(
                        child: ListViewEffect(
                            duration: _duration,
                            children: players
                                .map((s) => _buildWidgetExample(s))
                                .toList())),
                  ),
                  Container(
                      padding: EdgeInsets.fromLTRB(10.0, 0.0, 10.0, 10.0),
                      child: AnimatedOpacity(
                        opacity: _readyButtonVisible ? 1.0 : 0.0,
                        duration: Duration(milliseconds: 200),
                        child: CustomButtonWidget(
                            "Beginnen",
                            Colors.red,
                            Colors.white,
                            () => Navigator.of(context).push(CupertinoPageRoute(
                                builder: (BuildContext context) =>
                                    GamePage(players)))),
                      ))
                ],
              ))
        ]));
  }
}
