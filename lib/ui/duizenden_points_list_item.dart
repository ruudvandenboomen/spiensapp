import 'package:flutter/material.dart';
import 'package:toep_app/util/is_dark.dart';
import '../objects/player.dart';

class DuizendenPointsListItem extends StatelessWidget {
  final Player _player;
  final TextEditingController _textEditingController = TextEditingController();
  final void Function(Player) _updateScore;

  DuizendenPointsListItem(this._player, this._updateScore);

  int getTotalScore() {
    int total = 0;
    for (int i in _player.getScoreList()) {
      total += i;
    }
    _player.setTotalScore(total);
    return total;
  }

  addScore() {
    this._player.addToScoreList(int.parse(this._textEditingController.text));
    _updateScore(this._player);
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
        child: Column(children: <Widget>[
      GestureDetector(
          child: Container(
              width: 120.0,
              padding: EdgeInsets.all(13),
              alignment: Alignment.center,
              child: Text(_player.getName(),
                  overflow: TextOverflow.ellipsis,
                  maxLines: 1,
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.bodyText1),
              decoration: BoxDecoration(
                border: Border(
                    bottom: BorderSide(
                        width: 2.0,
                        color: DarkMode(context).isEnabled
                            ? Colors.white
                            : Colors.black)),
              ))),
      Container(
          padding: this._player.getScoreList().length > 0
              ? null
              : EdgeInsets.fromLTRB(0, 13, 0, 0),
          constraints: BoxConstraints(maxHeight: 250.0),
          width: 120.0,
          child: ListView.builder(
              shrinkWrap: true,
              scrollDirection: Axis.vertical,
              itemCount: this._player.getScoreList().length,
              itemBuilder: (context, index) {
                var scoreText = Text(
                    this._player.getScoreList()[index].toString(),
                    textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.bodyText1);
                if (index == 0 &&
                    index == this._player.getScoreList().length - 1) {
                  return Container(
                      padding: EdgeInsets.fromLTRB(0, 13, 0, 13),
                      child: scoreText);
                } else if (index == 0) {
                  return Container(
                      padding: EdgeInsets.fromLTRB(0, 13, 0, 0),
                      child: scoreText);
                } else if (index == this._player.getScoreList().length - 1) {
                  return Container(
                      padding: EdgeInsets.fromLTRB(0, 0, 0, 13),
                      child: scoreText);
                } else {
                  return scoreText;
                }
              })),
      Container(
          width: 90.0,
          padding: EdgeInsets.all(13),
          child: Text(getTotalScore().toString(),
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.bodyText1),
          decoration: BoxDecoration(
            border: Border(
              top: BorderSide(
                  width: 2.0,
                  color: DarkMode(context).isEnabled
                      ? Colors.white
                      : Colors.black),
            ),
          )),
      Container(
          width: 120,
          child: TextField(
            keyboardType: TextInputType.number,
            textAlign: TextAlign.center,
            onEditingComplete: () => addScore(),
            decoration: InputDecoration(
              hintText: 'punten',
              hintStyle: Theme.of(context).textTheme.bodyText2,
              suffixIcon: IconButton(
                icon: Icon(Icons.add, color: Theme.of(context).accentColor),
                onPressed: () => addScore(),
              ),
              border: InputBorder.none,
            ),
            controller: _textEditingController,
            textCapitalization: TextCapitalization.words,
            style: Theme.of(context).textTheme.bodyText1,
          ))
    ]));
  }
}
