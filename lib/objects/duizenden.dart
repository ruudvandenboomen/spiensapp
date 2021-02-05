import './game.dart';
import './player.dart';

class Duizenden extends Game {
  Duizenden(List<Player> players) : super(players);

  bool ended() {
    for (Player player in players) {
      if (player.totalDuizendenScore >= 1000) {
        return true;
      }
    }
    return false;
  }

}
