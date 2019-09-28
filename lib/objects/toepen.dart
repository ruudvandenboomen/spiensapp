import 'package:toep_app/objects/Game.dart';

import './player.dart';

class Toepen extends Game {
  final scoreChangedPlayers = Set();
  Toepen(List<Player> players) : super(players);

  bool ended() {
    for (Player player in players) {
      if (player.getScore() == 10) {
        return true;
      }
    }
    return false;
  }

  void updateScore(Player player, int change) {
    player.changeScoreBy(change);
    if (change > 0 && player.getScore() < 10) scoreChangedPlayers.add(player);
    if (scoreChangedPlayers.length == (players.length - 1)) {
      dealer = players[(players.indexOf(dealer) + 1) % players.length];
      scoreChangedPlayers.clear();
    }
  }
}
