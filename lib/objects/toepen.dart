import 'package:toep_app/objects/Game.dart';

import './player.dart';

class Toepen extends Game {
  Toepen(List<Player> players) : super(players);

  bool ended() {
    for (Player player in players) {
      if (player.getScore() == 10) {
        return true;
      }
    }
    return false;
  }
}
