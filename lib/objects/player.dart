class Player {
  final String name;
  int toepenScore = 0;
  int totalDuizendenScore = 0;
  List<int> duizendenScoreList = [];

  Player(this.name);

  void changeScoreBy(int change) {
    int newScore = toepenScore + change;
    if (newScore >= -5 && newScore <= 10) {
      toepenScore = newScore;
    }
  }

  void addToScoreList(int score) {
    this.duizendenScoreList.add(score);
  }
}
