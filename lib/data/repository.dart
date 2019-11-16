import 'package:toep_app/data/database.dart';
import 'package:toep_app/objects/parsed_response.dart';
import 'dart:async';

import 'package:toep_app/objects/player.db.dart';

class Repository {
  static final Repository _repo = new Repository._internal();

  Database database;

  static Repository get() {
    return _repo;
  }

  Future<ParsedResponse<List<DBPlayer>>> getGameScores(String gameType) async {
    return await this.database.getGameScores(gameType);
  }

  Future saveScore(
      String name, String gameType, int win) async {
    return await this.database.saveScore(name, gameType, win);
  }

  Repository._internal() {
    database = Database.init();
  }

  Future close() async {
    return database.close();
  }
}
