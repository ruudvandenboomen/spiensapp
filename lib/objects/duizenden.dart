import 'package:toep_app/objects/Game.dart';

import './player.dart';

class Duizenden extends Game {

  Duizenden(List<Player> players) : super (players);
 
  bool ended() {
    for (Player player in players) {
      if (player.getTotalScore() >= 1000) {
        return true;
      }
    }
    return false;
  }
}
