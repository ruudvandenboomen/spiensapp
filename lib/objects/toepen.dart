import './player.dart';

class Toepen {
  List<Player> players;

  Toepen(this.players);

  List<Player> getPlayers() {
    return this.players;
  }

  bool ended() {
    for (Player player in players) {
      if (player.getScore() == 10) {
        return true;
      }
    }
    return false;
  }
}
