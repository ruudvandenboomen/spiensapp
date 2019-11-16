import 'package:flutter/material.dart';

class ScoreBoardRow extends StatelessWidget {
  final List<String> _data;

  ScoreBoardRow(this._data);

  @override
  Widget build(BuildContext context) {
    return Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[
          Expanded(
              flex: 1,
              child: Text(this._data[0],
                  textAlign: TextAlign.center,
                  style: TextStyle(color: Colors.black, fontSize: 20.0))),
          Expanded(
              flex: 1,
              child: Text(this._data[1],
                  textAlign: TextAlign.center,
                  style: TextStyle(color: Colors.black, fontSize: 20.0))),
          Expanded(
              flex: 1,
              child: Text(this._data[2],
                  textAlign: TextAlign.center,
                  style: TextStyle(color: Colors.black, fontSize: 20.0)))
        ]);
  }
}
