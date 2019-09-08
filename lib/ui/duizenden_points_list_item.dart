import 'package:flutter/material.dart';
import '../objects/player.dart';

class DuizendenPointsListItem extends StatelessWidget {
  final Player _player;
  final TextEditingController _textEditingController = TextEditingController();

  void Function() _updateScore;

  DuizendenPointsListItem(this._player, this._updateScore);

  int getTotalScore() {
    int total = 0;
    for (int i in _player.getScoreList()) {
      total += i;
    }
    _player.setTotalScore(total);
    return total;
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
        child: Column(children: <Widget>[
      Container(
          width: 120.0,
          padding: EdgeInsets.all(13.0),
          child: Text(_player.getName(),
              overflow: TextOverflow.ellipsis,
              maxLines: 1,
              textAlign: TextAlign.center,
              style: TextStyle(color: Colors.black, fontSize: 20.0)),
          decoration: const BoxDecoration(
            border: Border(
              bottom: BorderSide(width: 2.0, color: Color(0xFFFF000000)),
            ),
          )),
      Container(
          constraints: BoxConstraints(maxHeight: 250.0),
          width: 120.0,
          padding: EdgeInsets.fromLTRB(13, 0, 13, 13),
          child: ListView.builder(
              shrinkWrap: true,
              scrollDirection: Axis.vertical,
              itemCount: this._player.getScoreList().length,
              itemBuilder: (context, index) {
                return Text(this._player.getScoreList()[index].toString(),
                    textAlign: TextAlign.center,
                    style: TextStyle(color: Colors.black, fontSize: 20.0));
              })),
      Container(
          width: 90.0,
          padding: EdgeInsets.all(13.0),
          child: Text(getTotalScore().toString(),
              textAlign: TextAlign.center,
              style: TextStyle(color: Colors.black, fontSize: 20.0)),
          decoration: const BoxDecoration(
            border: Border(
              top: BorderSide(width: 2.0, color: Color(0xFFFF000000)),
            ),
          )),
      Container(
          width: 120,
          child: TextField(
            keyboardType: TextInputType.number,
            textAlign: TextAlign.center,
            decoration: InputDecoration(
              hintText: 'punten',
              hintStyle: TextStyle(
                  fontSize: 18.0,
                  color: Colors.black,
                  fontStyle: FontStyle.italic),
              suffixIcon: IconButton(
                icon: Icon(Icons.add, color: Colors.red),
                iconSize: 20.0,
                onPressed: () => {
                  this._player.addToScoreList(
                      int.parse(this._textEditingController.text)),
                  _updateScore(),
                  FocusScope.of(context).requestFocus(new FocusNode())
                },
              ),
              border: InputBorder.none,
            ),
            controller: _textEditingController,
            textCapitalization: TextCapitalization.words,
            style: TextStyle(fontSize: 20.0, color: Colors.black),
          ))
    ]));
  }
}
