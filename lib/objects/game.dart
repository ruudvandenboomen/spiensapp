import './player.dart';

class Game {
  List<Player> players;
  Player dealer;

  Game(this.players) {
    this.dealer = this.players[0];
  }

  List<Player> getPlayers() {
    return this.players;
  }

  Player getDealer() {
    return this.dealer;
  }

  setDealer(Player player) {
    this.dealer = player;
  }
}
