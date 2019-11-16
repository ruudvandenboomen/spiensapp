import 'package:flutter/material.dart';
import 'package:flutter_toast2018/flutter_toast2018.dart';
import 'package:toep_app/animations/listview_effect.dart';
import 'package:toep_app/pages/game_page.dart';
import 'package:toep_app/ui/custom_appbar.dart';
import 'package:flutter/cupertino.dart';
import '../ui/add_player_widget.dart';
import '../ui/player_name_list_item.dart';
import '../objects/player.dart';

class PlayersPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => PlayersPageState();
}

class PlayersPageState extends State<PlayersPage> {
  final myController = TextEditingController();
  final List<Player> players = [];
  bool _readyButtonVisible = false;

  @override
  void dispose() {
    super.dispose();
    myController.dispose();
  }

  void addPlayer() {
    String name = myController.text;
    if (players.indexWhere((player) => player.getName().toString() == name) >=
        0) {
      FlutterToast2018.toast(
          'Je hebt deze naam al toegevoegd', ToastDuration.short);
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
      setState(() {});
    } else {
      _readyButtonVisible = false;
      setState(() {});
    }
  }

  Widget _buildWidgetExample(Player player) {
    return PlayerNameListItem(
        player.getName(), () => removePlayer(players.indexOf(player)));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: CustomAppBar("Spelers", context, false),
        floatingActionButton: AnimatedOpacity(
            opacity: _readyButtonVisible ? 1.0 : 0.0,
            duration: Duration(milliseconds: 250),
            child: FloatingActionButton(
                child: Icon(Icons.arrow_forward),
                onPressed: () => Navigator.of(context).push(CupertinoPageRoute(
                    builder: (BuildContext context) => GamePage(players))))),
        body: Padding(
            padding: EdgeInsets.fromLTRB(0, 20, 0, 20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                AddPlayerWidget(myController, () => addPlayer()),
                Expanded(
                  child: Container(
                      child: ListViewEffect(
                          duration: Duration(milliseconds: 150),
                          children: players
                              .map((s) => _buildWidgetExample(s))
                              .toList())),
                )
              ],
            )));
  }
}
