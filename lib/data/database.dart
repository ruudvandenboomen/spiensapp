import 'package:toep_app/objects/parsed_response.dart';
import 'package:toep_app/objects/player.db.dart';
import 'package:http/http.dart';
import 'dart:convert';
import 'dart:async';

class Database {
  static final Database _database = new Database();

  static Database init() {
    return _database;
  }

  close() {}

  Future<ParsedResponse<List<DBPlayer>>> getGameScores(String gameType) async {
    final response = await get('http://192.168.178.157:3000/users/$gameType')
        .catchError((resp) {});

    if (response == null) {
      return new ParsedResponse(500, []);
    }

    //If there was an error return an empty list
    if (response.statusCode < 200 || response.statusCode >= 300) {
      return new ParsedResponse(response.statusCode, []);
    }

    List<dynamic> players = json.decode(response.body);
    List<DBPlayer> dbplayers =
        players.map((player) => DBPlayer.fromJson(player)).toList();
    return new ParsedResponse(200, []..addAll(dbplayers));
  }

  saveScore(String name, String gameType, int win) async {
    final response =
        await post('http://192.168.178.157:3000/users/$name/$gameType/$win')
            .catchError((resp) {});

    print(response.body);
    if (response == null) {
      return new ParsedResponse(500, "");
    }

    //If there was an error return an empty list
    if (response.statusCode < 200 || response.statusCode >= 300) {
      return new ParsedResponse(response.statusCode, "");
    } else
      return new ParsedResponse(200, "");
  }
}
