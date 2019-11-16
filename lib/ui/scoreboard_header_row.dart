import 'package:flutter/material.dart';
import 'package:toep_app/objects/player.db.dart';

class ScoreBoardHeaderRow extends StatelessWidget {
  final List<String> _data;
  final List<DBPlayer> _players;
  final VoidCallback _onTap;

  ScoreBoardHeaderRow(this._data, this._players, this._onTap);

  @override
  Widget build(BuildContext context) {
    return Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[
          Expanded(
              flex: 1,
              child: GestureDetector(
                onTap: () {
                  _players.sort((a, b) => b.name.compareTo(a.name));
                  this._onTap();
                },
                child: Text(_data[0],
                    textAlign: TextAlign.center,
                    style: TextStyle(color: Colors.black, fontSize: 20.0)),
              )),
          Expanded(
              flex: 1,
              child: Text(_data[1],
                  textAlign: TextAlign.center,
                  style: TextStyle(color: Colors.black, fontSize: 20.0))),
          Expanded(
              flex: 1,
              child: Text(_data[2],
                  textAlign: TextAlign.center,
                  style: TextStyle(color: Colors.black, fontSize: 20.0)))
        ]);
  }
}
