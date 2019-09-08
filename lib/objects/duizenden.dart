import './player.dart';

class Duizenden {
  List<Player> players;

  Duizenden(this.players);

  List<Player> getPlayers() {
    return this.players;
  }

  bool ended() {
    for (Player player in players) {
      if (player.getTotalScore() >= 1000) {
        return true;
      }
    }
    return false;
  }
}
