class Player {
  final String _name;
  int _score = 0;
  int _totalScore = 0;
  List<int> _scoreList = [];

  Player(this._name);

  void changeScoreBy(int change) {
    int newScore = _score + change;
    if (newScore >= -5 && newScore <= 10) {
      _score = newScore;
    }
  }

  String getName() {
    return this._name;
  }

  int getScore() {
    return this._score;
  }

  void setScore(int score) {
    this._score = score;
  }

  int getTotalScore() {
    return this._totalScore;
  }

  void setTotalScore(int score) {
    this._totalScore = score;
  }

  List<int> getScoreList() {
    return this._scoreList;
  }

  void setScoreList(List<int> scoreList) {
    this._scoreList = scoreList;
  }

  void addToScoreList(int score) {
    this._scoreList.add(score);
  }
}
