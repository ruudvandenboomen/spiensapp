import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:toep_app/data/repository.dart';
import 'package:toep_app/objects/parsed_response.dart';
import 'package:toep_app/objects/player.db.dart';
import 'package:toep_app/ui/custom_appbar.dart';
import 'package:toep_app/ui/scoreboard_game_selector.dart';
import 'package:toep_app/ui/scoreboard_header_row.dart';
import 'package:toep_app/ui/scoreboard_row.dart';
import 'dart:async';

class ScoreBoardPage extends StatefulWidget {
  ScoreBoardPage();

  @override
  State<StatefulWidget> createState() => ScoreBoardPageState();
}

class ScoreBoardPageState extends State<ScoreBoardPage> {
  bool toepen = true;
  Future<ParsedResponse<List<DBPlayer>>> data =
      Repository.get().getGameScores("Toepen");
  List<DBPlayer> players;

  onTap(String gameType) {
    if (gameType == "Toepen") {
      toepen = true;
      data = Repository.get().getGameScores(gameType);
    } else if (gameType == "Duizenden") {
      toepen = false;
      data = Repository.get().getGameScores(gameType);
    }
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomPadding: false,
        appBar: CustomAppBar("Scores", context, true, false),
        body: Padding(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  Container(
                      padding: EdgeInsets.fromLTRB(0, 20, 0, 20),
                      child: Row(children: <Widget>[
                        ScoreBoardGameSelector(
                            toepen ? Colors.red[300] : Colors.transparent,
                            "Toepen",
                            this.onTap),
                        ScoreBoardGameSelector(
                            toepen ? Colors.transparent : Colors.red[300],
                            "Duizenden",
                            this.onTap),
                      ])),
                  Expanded(
                    child: FutureBuilder<ParsedResponse<List<DBPlayer>>>(
                      future: this.data,
                      builder: (context, snapshot) {
                        if (snapshot.hasData) {
                          players = snapshot.data.body;
                          players.sort((a, b) =>
                              b.plays[0].wins.compareTo(a.plays[0].wins));
                          return ListView.separated(
                              itemBuilder: (BuildContext context, int index) {
                                if (index == 0) {
                                  // return the header
                                  return ScoreBoardHeaderRow(
                                      ["Naam", "Gespeeld", "Gewonnen"],
                                      this.players,
                                      () => this.setState(() {}));
                                }
                                index -= 1;
                                return ScoreBoardRow([
                                  players[index].name,
                                  players[index].plays[0].plays.toString(),
                                  players[index].plays[0].wins.toString()
                                ]);
                              },
                              itemCount: players.length + 1,
                              separatorBuilder:
                                  (BuildContext context, int index) =>
                                      Container(
                                        height: 1.0,
                                        width: 2.0,
                                        color: Colors.black,
                                        margin: const EdgeInsets.only(
                                            top: 10.0, bottom: 10.0),
                                      ));
                        } else if (snapshot.hasError) {
                          return Container(
                              padding: EdgeInsets.symmetric(vertical: 80),
                              child: Text("${snapshot.error}"));
                        }
                        return Container();
                      },
                    ),
                  ),
                ])));
  }
}
