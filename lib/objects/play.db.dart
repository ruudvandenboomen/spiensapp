class DBPlay {
  int wins;
  int plays;
  String gameType;

  DBPlay({this.wins, this.plays, this.gameType});

  factory DBPlay.fromJson(Map<String, dynamic> json) {
    return DBPlay(
      wins: int.parse(json['wins']),
      plays: json['plays'],
      gameType: json['gameType'],
    );
  }
}
