import './game.dart';
import './player.dart';

class Toepen extends Game {
  Toepen(List<Player> players) : super(players);

  bool ended() {
    for (Player player in players) {
      if (player.toepenScore == 10) {
        return true;
      }
    }
    return false;
  }

  void updateScore(Player player, int change) {
    player.changeScoreBy(change);
  }
}
