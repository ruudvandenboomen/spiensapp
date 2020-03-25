import 'package:flutter/material.dart';
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
  final nameInputEditingController = TextEditingController();
  final List<Player> players = [];
  bool _readyButtonVisible = false;

  @override
  void dispose() {
    super.dispose();
    nameInputEditingController.dispose();
  }

  String checkPlayerNameValid() {
    String playerName = nameInputEditingController.text;
    if (players.indexWhere((player) =>
            player.getName().toString().toLowerCase() == playerName.toLowerCase()) >=
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
    _readyButtonVisible = players.length > 1;
    setState(() {});
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
            padding: EdgeInsets.fromLTRB(0, 20, 0, 0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                AddPlayerWidget(
                    nameInputEditingController, () => addPlayer(), () => checkPlayerNameValid()),
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
