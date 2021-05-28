import 'package:flutter/material.dart';
import 'package:toep_app/animations/listview_effect.dart';
import 'package:toep_app/pages/game_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:toep_app/ui/appbar/settings_appbar.dart';
import 'package:toep_app/util/is_dark.dart';
import '../ui/add_player_widget.dart';
import '../ui/player_name_list_item.dart';
import '../objects/player.dart';

class PlayersPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => PlayersPageState();
}

class PlayersPageState extends State<PlayersPage> {
  final nameInputEditingController = TextEditingController();
  final List<Player> players = [];
  bool _readyButtonVisible = false;

  @override
  void dispose() {
    nameInputEditingController.dispose();
    super.dispose();
  }

  String checkPlayerNameValid() {
    String playerName = nameInputEditingController.text;
    if (players.indexWhere((player) =>
            player.name.toString().toLowerCase() == playerName.toLowerCase()) >=
        0) {
      return "Je hebt deze speler al toegevoegd";
    } else if (playerName.isEmpty) {
      return "Je kunt geen lege naam invullen";
    }
    return null;
  }

  void addPlayer() {
    players.add(Player(nameInputEditingController.text));
    nameInputEditingController.clear();
    setButtonVisible();
  }

  void removePlayer(int index) {
    players.removeAt(index);
    setButtonVisible();
  }

  void setButtonVisible() {
    _readyButtonVisible = players.length > 0;
    setState(() {});
  }

  Widget _buildWidgetExample(Player player) {
    return Card(
        margin: EdgeInsets.fromLTRB(20, 5, 20, 5),
        child: PlayerNameListItem(
            player.name, () => removePlayer(players.indexOf(player))));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: SettingsAppBar("Spiens App", context, false),
        floatingActionButton: AnimatedOpacity(
            opacity: _readyButtonVisible ? 1.0 : 0.0,
            duration: Duration(milliseconds: 250),
            child: FloatingActionButton.extended(
                label: Row(
                  children: <Widget>[
                    Text("Beginnen"),
                    Icon(Icons.arrow_forward)
                  ],
                ),
                backgroundColor:
                    DarkMode(context).isEnabled ? Colors.grey : Colors.blue,
                icon: Container(),
                onPressed: () {
                  if (_readyButtonVisible)
                    Navigator.of(context).push(CupertinoPageRoute(
                        builder: (BuildContext context) => GamePage(players)));
                })),
        body: SingleChildScrollView(
            child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Card(
                margin: EdgeInsets.fromLTRB(20, 10, 20, 5),
                child: AddPlayerWidget(nameInputEditingController,
                    () => addPlayer(), () => checkPlayerNameValid())),
            Container(
                padding: EdgeInsets.fromLTRB(30, 0, 20, 0),
                child: Text("SPELERS",
                    style: Theme.of(context).textTheme.headline2)),
            players.length == 0
                ? Card(
                    margin: EdgeInsets.fromLTRB(20, 5, 20, 5),
                    child: Container(
                      height: 50,
                      alignment: Alignment.center,
                      child: Text("Nog geen spelers toegevoegd :(",
                          style: Theme.of(context).textTheme.bodyText1),
                    ))
                : Container(),
            ListViewEffect(
                duration: Duration(milliseconds: 150),
                children: players.map((s) => _buildWidgetExample(s)).toList()),
          ],
        )));
  }
}
