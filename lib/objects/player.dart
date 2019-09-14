class Player {
  final String _name;
  int _toepenScore = 0;
  int _totalDuizendenScore = 0;
  List<int> _duizendenScoreList = [];

  Player(this._name);

  void changeScoreBy(int change) {
    int newScore = _toepenScore + change;
    if (newScore >= -5 && newScore <= 10) {
      _toepenScore = newScore;
    }
  }

  String getName() {
    return this._name;
  }

  int getScore() {
    return this._toepenScore;
  }

  void setScore(int score) {
    this._toepenScore = score;
  }

  int getTotalScore() {
    return this._totalDuizendenScore;
  }

  void setTotalScore(int score) {
    this._totalDuizendenScore = score;
  }

  List<int> getScoreList() {
    return this._duizendenScoreList;
  }

  void setScoreList(List<int> scoreList) {
    this._duizendenScoreList = scoreList;
  }

  void addToScoreList(int score) {
    this._duizendenScoreList.add(score);
  }
}
