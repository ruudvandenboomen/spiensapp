import 'package:toep_app/objects/Game.dart';
import './player.dart';

class Duizenden extends Game {
  final scoreChangedPlayers = Set();
  Duizenden(List<Player> players) : super(players);

  bool ended() {
    for (Player player in players) {
      if (player.totalDuizendenScore >= 1000) {
        return true;
      }
    }
    return false;
  }

  void updateScore(Player player) {
    scoreChangedPlayers.add(player);
    if (scoreChangedPlayers.length == players.length) {
      scoreChangedPlayers.clear();
    }
  }
}
