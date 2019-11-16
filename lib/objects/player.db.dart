import 'package:toep_app/objects/play.db.dart';

class DBPlayer {
  String name;
  List<DBPlay> plays;

  DBPlayer({this.name, this.plays});

  factory DBPlayer.fromJson(Map<String, dynamic> json) {
    var list = json['plays'] as List;
    List<DBPlay> dbPlays = list.map((i) => DBPlay.fromJson(i)).toList();
    return DBPlayer(
      name: json['name'],
      plays: dbPlays,
    );
  }
}
